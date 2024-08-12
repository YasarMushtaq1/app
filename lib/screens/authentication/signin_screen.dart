import 'package:flutter/material.dart';
import 'registration_screen.dart'; // Ensure correct path
import '../Navigations/navigation_bar.dart'; // Ensure correct path

class SignInScreen extends StatefulWidget {
  // ignore: use_super_parameters
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  // ignore: unused_field
  final _form = GlobalKey<FormState>();
  // ignore: unused_field
  var _enteredPassword = '';

  void _submit() {
   
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        // ignore: prefer_const_constructors
        builder: (ctx) =>  NavigationPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.5, // Top half of the screen
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/background.jpg'), // Replace with your image path
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          // Content
          Align(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Adding a margin to the top of the form box
                  const SizedBox(height: 20), // Adjust as needed for margin above the form box
                  Card(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Margin between top of form box and 'Phone Number' text
                          const SizedBox(height: 40), // Adjust this value to increase or decrease the margin
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16), // Horizontal margin for labels
                            child: Text(
                              'Phone Number',
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(height: 8), // Space between label and field
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16), // Horizontal margin for text fields
                            child: SizedBox(
                              height: 45,
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  hintText: 'Enter your phone number',
                                  hintStyle: TextStyle(fontSize: 12),
                                  border: OutlineInputBorder(),
                                ),
                                keyboardType: TextInputType.phone,
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'Please enter your phone number';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                },
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16), // Horizontal margin for labels
                            child: Text(
                              'Password',
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(height: 8), // Space between label and field
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16), // Horizontal margin for text fields
                            child: SizedBox(
                              height: 45,
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  hintText: 'Enter your password',
                                  border: OutlineInputBorder(),
                                  hintStyle: TextStyle(fontSize: 12),
                                ),
                                obscureText: true,
                                validator: (value) {
                                  if (value == null || value.trim().length < 6) {
                                    return 'Password must be at least 6 characters long.';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  _enteredPassword = value!;
                                },
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Center(
                            child: ElevatedButton(
                              onPressed: _submit,
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 30,
                                  vertical: 10,
                                ),
                                backgroundColor: Colors.transparent, // No background color
                                elevation: 0, // Remove shadow
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              child: const Text(
                                'Login',
                                style: TextStyle(fontSize: 14, color: Colors.black),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Center(
                            child: TextButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (ctx) => const RegistrationScreen(),
                                  ),
                                );
                              },
                              child: RichText(
                                text: const TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Not registered yet? ',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    TextSpan(
                                      text: 'Register',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 60), // Spacer to push 'Forgot password?' to the bottom
                ],
              ),
            ),
          ),
          // 'Forgot password?' text at the bottom
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.white, // Background color for the container
              padding: const EdgeInsets.all(20),
              child: Align(
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: () {
                    // Handle password recovery
                  },
                  child: RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: 'Forgot password? ',
                          style: TextStyle(color: Colors.black),
                        ),
                        TextSpan(
                          text: 'Restore',
                          style: TextStyle(color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
