import 'package:flutter/material.dart';

class NavigationPage extends StatefulWidget {
  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    OnlineCoursesPage(),
    CourseDetailsPage(),
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
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Courses',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Details',
          ),
        ],
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.red,  // Customize selected item color
        unselectedItemColor: Colors.grey,  // Customize unselected item color
        backgroundColor: Colors.white,  // Customize background color
        showSelectedLabels: true,
        showUnselectedLabels: true,
      ),
    );
  }
}

class OnlineCoursesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Online Courses Page',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}

class CourseDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Course Details Page',
        style: TextStyle(fontSize: 24),
      ),
    );
  }
}
