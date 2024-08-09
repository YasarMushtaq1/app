import 'package:flutter/material.dart';
import 'verification_screen.dart'; // Ensure correct path
import '../main_screens/home_screen.dart'; // Ensure correct path

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _form = GlobalKey<FormState>();
  var _enteredName = '';
  var _enteredPhone = '';
  var _enteredEmail = '';
  var _enteredPassword = '';
  var _confirmPassword = '';
  String? _selectedRole;

  void _submit() async {
    final isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }
    _form.currentState!.save();
    
    // Simulate registration and navigate to verification screen
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => VerificationScreen(
          verificationCode: '1234', // Simulated code
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Content
          Expanded(
            child: Stack(
              children: [
                // Background Image
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.4, // Top part of the screen
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/background.jpg'), // Replace with your image path
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                // Form Content
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Form Card
                      Card(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Form(
                            key: _form,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Margin between top of form box and 'Name' text
                                const SizedBox(height: 20), // Adjust this value to increase or decrease the margin
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16), // Horizontal margin for labels
                                  child: const Text(
                                    'Name',
                                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const SizedBox(height: 8), // Space between label and field
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16), // Horizontal margin for text fields
                                  child: SizedBox(
                                    height: 45,
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                        hintText: 'Enter your name',
                                        border: OutlineInputBorder(),
                                        hintStyle: TextStyle(fontSize: 12),
                                      ),
                                      validator: (value) {
                                        if (value == null || value.trim().isEmpty) {
                                          return 'Please enter your name';
                                        }
                                        return null;
                                      },
                                      onSaved: (value) {
                                        _enteredName = value!;
                                      },
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16), // Horizontal margin for labels
                                  child: const Text(
                                    'Phone Number',
                                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
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
                                      validator: (value) {
                                        if (value == null || value.trim().isEmpty) {
                                          return 'Please enter your phone number';
                                        }
                                        return null;
                                      },
                                      onSaved: (value) {
                                        _enteredPhone = value!;
                                      },
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16), // Horizontal margin for labels
                                  child: const Text(
                                    'Email',
                                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const SizedBox(height: 8), // Space between label and field
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16), // Horizontal margin for text fields
                                  child: SizedBox(
                                    height: 45,
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                        hintText: 'Enter your email',
                                        hintStyle: TextStyle(fontSize: 12),
                                        border: OutlineInputBorder(),
                                      ),
                                      keyboardType: TextInputType.emailAddress,
                                      validator: (value) {
                                        if (value == null || !value.contains('@')) {
                                          return 'Please enter a valid email';
                                        }
                                        return null;
                                      },
                                      onSaved: (value) {
                                        _enteredEmail = value!;
                                      },
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16), // Horizontal margin for labels
                                  child: const Text(
                                    'Role',
                                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const SizedBox(height: 8), // Space between label and field
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16), // Horizontal margin for dropdown
                                  child: SizedBox(
                                    height: 45,
                                    child: DropdownButtonFormField<String>(
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                      ),
                                      value: _selectedRole,
                                      items: const [
                                        DropdownMenuItem(value: 'User', child: Text('User')),
                                        DropdownMenuItem(value: 'Admin', child: Text('Admin')),
                                      ],
                                      onChanged: (value) {
                                        setState(() {
                                          _selectedRole = value;
                                        });
                                      },
                                      validator: (value) {
                                        if (value == null) {
                                          return 'Please select a role';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16), // Horizontal margin for labels
                                  child: const Text(
                                    'Password',
                                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
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
                                const SizedBox(height: 8),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16), // Horizontal margin for labels
                                  child: const Text(
                                    'Confirm Password',
                                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const SizedBox(height: 8), // Space between label and field
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16), // Horizontal margin for text fields
                                  child: SizedBox(
                                    height: 45,
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                        hintText: 'Confirm your password',
                                        border: OutlineInputBorder(),
                                        hintStyle: TextStyle(fontSize: 12),
                                      ),
                                      obscureText: true,
                                      validator: (value) {
                                        if (value == null || value != _enteredPassword) {
                                          return 'Passwords do not match';
                                        }
                                        return null;
                                      },
                                      onSaved: (value) {
                                        _confirmPassword = value!;
                                      },
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 16),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // Space between Form Card and Register Button
                      const SizedBox(height: 20),
                      // Register Button
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: ElevatedButton(
                          onPressed: _submit,
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 80,
                              vertical: 10,
                            ),
                            backgroundColor: const Color.fromARGB(255, 239, 238, 238), // No background color
                            elevation: 0, // Remove shadow
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                              side: BorderSide(color: const Color.fromARGB(255, 255, 255, 255)), // Border color
                            ),
                          ),
                          child: const Text(
                            'Register',
                            style: TextStyle(fontSize: 14, color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Sign In Text
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Center(
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: RichText(
                  text: TextSpan(
                    text: 'Already have an account? ',
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                        text: 'Sign in',
                        style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                      ),
                    ],
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
