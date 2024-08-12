import 'package:flutter/material.dart';
import '../authentication/signin_screen.dart';

class FreeCourses extends StatelessWidget {
  const FreeCourses({super.key});

  @override
  Widget build(BuildContext context) {
    // Updated list of course titles
    final List<String> courseTitles = [
      'Introduction',
      'Machine Learning Basics',
      'Application of AI in Life and Business',
      'Creating a Simple AI Project',
      'AI Tools and Platforms',
      'Ethical Considerations and Future of AI',
    ];

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0), // Set the height of the AppBar
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          margin: const EdgeInsets.only(
            top: 32.0, // Distance from the top of the screen
            left: 16.0,
            right: 16.0,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.vertical(bottom: Radius.circular(10)),
            boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.3), blurRadius: 10)],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Free Courses',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: const Icon(Icons.exit_to_app),
                color: Colors.blue,
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const SignInScreen()));
                },
              ),
            ],
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: courseTitles.length, // Number of courses
        itemBuilder: (context, index) {
          final courseTitle = courseTitles[index]; // Get the title from the list
          return CourseCard(title: courseTitle, index: index);
        },
      ),
    );
  }
}

class CourseCard extends StatelessWidget {
  final int index;
  final String title;

  const CourseCard({super.key, required this.index, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      decoration: BoxDecoration(
        color: Colors.white, // Ensure the container background is white
        borderRadius: BorderRadius.circular(15),
        boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.3), blurRadius: 5)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
            child: Image.asset(
              'assets/images/free_courses/course_image_$index.jpg', // Ensure images are named course_image_0.jpg, course_image_1.jpg, etc.
              fit: BoxFit.cover,
              height: 250,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title, // Display the course title
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center, // Center-align the text
            ),
          ),
        ],
      ),
    );
  }
}
