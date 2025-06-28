import 'package:flutter/material.dart';
import 'dart:async';
import 'package:apptravella/screens/onboarding_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Start a timer to navigate to the OnboardingScreen after 3 seconds
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnboardingScreen()),
      );
    });

    return Scaffold(
      body: Center(
        child: Image.asset('assets/logooo.jpeg'),
      ),
    );
  }
}
