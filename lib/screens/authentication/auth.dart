import 'dart:io';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _form = GlobalKey<FormState>();
  var _isLogin = true;
  var _enteredPhone = '';
  var _enteredPassword = '';
  var _enteredEmail = '';
  var _enteredName = '';
  var _confirmPassword = '';
  String? _selectedRole;
  File? _selectedImage;
  var _isAuthenticating = false;

  void _storeUserData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', _enteredName);
    await prefs.setString('phone', _enteredPhone);
    await prefs.setString('email', _enteredEmail);
    await prefs.setString('role', _selectedRole ?? '');
  }

  void _submit() async {
    final isValid = _form.currentState!.validate();

    if (!isValid) {
      return;
    }

    _form.currentState!.save(); // Save form fields here

    setState(() {
      _isAuthenticating = true;
    });

    if (_isLogin) {
      // Simulate login
      await Future.delayed(const Duration(seconds: 2));
      Navigator.of(context).pushReplacementNamed('/home');
    } else {
      // Simulate registration
      await Future.delayed(const Duration(seconds: 2));
      _storeUserData(); // Store user data locally
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (ctx) => VerificationScreen(
            verificationCode: '1234', // Simulated code
          ),
        ),
      );
    }

    setState(() {
      _isAuthenticating = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Stack(
        children: [
          Positioned.fill(
            child: Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                'assets/images/background.jpg',
                fit: BoxFit.cover,
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.5,
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Card(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: 400, // Smaller form width
                        ),
                        child: Form(
                          key: _form,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (_isLogin)
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('Phone Number', style: TextStyle(fontSize: 12)),
                                    SizedBox(
                                      height: 45, // Smaller height for text fields
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
                                          _enteredPhone = value!;
                                        },
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    const Text('Password', style: TextStyle(fontSize: 12)),
                                    SizedBox(
                                      height: 45, // Smaller height for text fields
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
                                    const SizedBox(height: 16),
                                    if (!_isAuthenticating)
                                      ElevatedButton(
                                        onPressed: _submit,
                                        style: ElevatedButton.styleFrom(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 30,
                                            vertical: 10,
                                          ),
                                          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(15),
                                          ),
                                        ),
                                        child: Text(
                                          'Login',
                                          style: const TextStyle(fontSize: 14, color: Colors.black),
                                        ),
                                      ),
                                    const SizedBox(height: 8),
                                    TextButton(
                                      onPressed: () {
                                        setState(() {
                                          _isLogin = !_isLogin;
                                        });
                                      },
                                      child: Text.rich(
                                        TextSpan(
                                          text: _isLogin
                                              ? 'Not registered yet? '
                                              : 'Already have an account? ',
                                          style: const TextStyle(color: Colors.black, fontSize: 12),
                                          children: [
                                            TextSpan(
                                              text: _isLogin ? 'Register' : 'Sign in',
                                              style: const TextStyle(color: Colors.red, fontSize: 12),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              else
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text('Name', style: TextStyle(fontSize: 12)),
                                    SizedBox(
                                      height: 45, // Smaller height for text fields
                                      child: TextFormField(
                                        decoration: const InputDecoration(
                                          hintText: 'Enter your name',
                                          border: OutlineInputBorder(),
                                          hintStyle: TextStyle(fontSize: 12),
                                        ),
                                        keyboardType: TextInputType.name,
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
                                    const SizedBox(height: 8),
                                    const Text('Phone Number', style: TextStyle(fontSize: 12)),
                                    SizedBox(
                                      height: 45, // Smaller height for text fields
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
                                          _enteredPhone = value!;
                                        },
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    const Text('Email', style: TextStyle(fontSize: 12)),
                                    SizedBox(
                                      height: 45, // Smaller height for text fields
                                      child: TextFormField(
                                        decoration: const InputDecoration(
                                          hintText: 'Enter your email',
                                          hintStyle: TextStyle(fontSize: 12),
                                          border: OutlineInputBorder(),
                                        ),
                                        keyboardType: TextInputType.emailAddress,
                                        validator: (value) {
                                          if (value == null ||
                                              !value.contains('@') ||
                                              value.trim().isEmpty) {
                                            return 'Please enter a valid email';
                                          }
                                          return null;
                                        },
                                        onSaved: (value) {
                                          _enteredEmail = value!;
                                        },
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    const Text('Role', style: TextStyle(fontSize: 12)),
                                    SizedBox(
                                      height: 45, // Smaller height for dropdown
                                      child: DropdownButtonFormField<String>(
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                        ),
                                        items: ['Student', 'Parent', 'Teacher']
                                            .map((role) => DropdownMenuItem(
                                                  value: role,
                                                  child: Text(role),
                                                ))
                                            .toList(),
                                        onChanged: (value) {
                                          _selectedRole = value!;
                                        },
                                        validator: (value) => value == null
                                            ? 'Please select a role'
                                            : null,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    const Text('Password', style: TextStyle(fontSize: 12)),
                                    SizedBox(
                                      height: 45, // Smaller height for text fields
                                      child: TextFormField(
                                        decoration: const InputDecoration(
                                          hintStyle: TextStyle(fontSize: 12),
                                          hintText: 'Enter your password',
                                          border: OutlineInputBorder(),
                                        ),
                                        obscureText: true,
                                        validator: (value) {
                                          if (value == null ||
                                              value.trim().length < 6) {
                                            return 'Password must be at least 6 characters long.';
                                          }
                                          return null;
                                        },
                                        onChanged: (value) {
                                          setState(() {
                                            _enteredPassword = value!;
                                          });
                                        },
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    const Text('Confirm Password', style: TextStyle(fontSize: 12)),
                                    SizedBox(
                                      height: 45, // Smaller height for text fields
                                      child: TextFormField(
                                        decoration: const InputDecoration(
                                          hintText: 'Confirm your password',
                                          border: OutlineInputBorder(),
                                          hintStyle: TextStyle(fontSize: 12),
                                        ),
                                        obscureText: true,
                                        validator: (value) {
                                          if (value != _enteredPassword) {
                                            return 'Passwords do not match';
                                          }
                                          return null;
                                        },
                                        onSaved: (value) {
                                          _confirmPassword = value!;
                                        },
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    if (!_isAuthenticating)
                                      ElevatedButton(
                                        onPressed: _submit,
                                        style: ElevatedButton.styleFrom(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 30,
                                            vertical: 10,
                                          ),
                                          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(15),
                                          ),
                                        ),
                                        child: Text(
                                          'Register',
                                          style: const TextStyle(fontSize: 14, color: Colors.black),
                                          
                                        ),
                                      ),
                                    const SizedBox(height: 8),
                                    TextButton(
                                      onPressed: () {
                                        setState(() {
                                          _isLogin = !_isLogin;
                                        });
                                      },
                                      child: Text.rich(
                                        TextSpan(
                                          text: _isLogin
                                              ? 'Not registered yet? '
                                              : 'Already have an account? ',
                                          style: const TextStyle(color: Colors.black, fontSize: 12),
                                          children: [
                                            TextSpan(
                                              text: _isLogin ? 'Register' : 'Sign in',
                                              style: const TextStyle(color: Colors.red, fontSize: 12),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (_isLogin)
                    Positioned(
                      bottom: 20,
                      left: 0,
                      right: 0,
                      child: Container(
                        alignment: Alignment.center,
                        child: TextButton(
                          onPressed: () {
                            // Handle forgot password
                          },
                          child: Text.rich(
                            TextSpan(
                              text: 'Forget password?',
                              style: const TextStyle(color: Colors.black, fontSize: 12),
                              children: [
                                TextSpan(
                                  text: ' Restore',
                                  style: const TextStyle(color: Colors.red, fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class VerificationScreen extends StatelessWidget {
  final String verificationCode;

  const VerificationScreen({Key? key, required this.verificationCode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Stack(
        children: [
          Positioned.fill(
            child: Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                'assets/images/background.jpg',
                fit: BoxFit.cover,
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.5,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Enter the verification code', style: TextStyle(fontSize: 16)),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: List.generate(4, (index) {
                            return SizedBox(
                              width: 40, // Smaller input boxes
                              height: 45, // Smaller height for input boxes
                              child: TextField(
                                textAlign: TextAlign.center,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                ),
                                keyboardType: TextInputType.number,
                                maxLength: 1,
                                onChanged: (value) {
                                  // Handle code entry
                                },
                              ),
                            );
                          }),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacementNamed('/home');
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 40,
                              vertical: 12,
                            ),
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          child: const Text(
                            'Verify',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
