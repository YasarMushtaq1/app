import 'package:flutter/material.dart';
import './screens/authentication/registration_screen.dart';
import './screens/authentication/signin_screen.dart';
import './screens/authentication/verification_screen.dart';
import './screens/main_screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const VerificationScreen(verificationCode: '1234',),
    );
  }
}