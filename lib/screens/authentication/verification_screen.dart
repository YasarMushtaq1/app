import 'package:flutter/material.dart';
import '../Navigations/navigation_bar.dart';

class VerificationScreen extends StatelessWidget {
  final String verificationCode;

  // ignore: use_super_parameters
  const VerificationScreen({Key? key, required this.verificationCode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Stack(
        children: [
          // Background image at the top
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
          // Main content
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.35), // Margin from the top
              child: SingleChildScrollView(
                // ignore: sized_box_for_whitespace
                child: Container(
                  width: MediaQuery.of(context).size.width - 40, // Width of the card
                  child: Card(
                    margin: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text('Enter the verification code',
                              style: TextStyle(fontSize: 16)),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: List.generate(4, (index) {
                              return SizedBox(
                                width: 70, // Smaller input boxes
                                height: 85, // Smaller height for input boxes
                                child: TextField(
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.grey[300], // Gray background
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    counterText: '', // Remove the 0/1 character count
                                  ),
                                  keyboardType: TextInputType.number,
                                  maxLength: 1,
                                  onChanged: (value) {
                                    if (value.length == 1) {
                                      FocusScope.of(context).nextFocus();
                                    }
                                  },
                                ),
                              );
                            }),
                          ),
                          const SizedBox(height: 20),
                          Center(
                            child: Text(
                              'Resend code available in 00:58 seconds',
                              style: TextStyle(
                                  fontSize: 14, color: Colors.grey[600]),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Center(
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      // ignore: prefer_const_constructors
                                      builder: (context) => NavigationPage()),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 40,
                                  vertical: 12,
                                ),
                                backgroundColor:
                                    Colors.transparent, // Remove background color
                                elevation: 0, // Remove shadow
                                side: BorderSide.none, // Remove border
                              ),
                              child: const Text(
                                'Verify',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color.fromARGB(255, 0, 71, 129)),
                              ),
                            ),
                          ),
                        ],
                      ),
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
