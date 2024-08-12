// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import '../main_screens/free_courses.dart';
import '../main_screens/video_lessons.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const FreeCourses(),
    const VideoCourses(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(16.0), // Margin around the BottomNavigationBar
        decoration: BoxDecoration(
          color: Colors.white, // Solid white background
          borderRadius: BorderRadius.circular(10.0), // Rounded corners for island effect
          boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.3), blurRadius: 8.0)], // Optional shadow
        ),
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.book_outlined),
              activeIcon: Icon(Icons.book),
              label: 'Free Courses',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.movie),
              activeIcon: Icon(Icons.movie),
              label: 'Video Courses',
            ),
          ],
          currentIndex: _currentIndex,
          onTap: _onItemTapped,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.white, // Ensure the BottomNavigationBar background is white
          showSelectedLabels: true,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          elevation: 0.0, // Optional: Remove elevation for flat look
        ),
      ),
      backgroundColor: Colors.grey[100], // Light background for contrast
    );
  }
}
