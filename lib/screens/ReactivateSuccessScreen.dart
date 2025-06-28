import 'package:flutter/material.dart';
import 'dart:async';
import 'package:apptravella/screens/sign_in_screen.dart';

class ReactivateSuccessScreen extends StatefulWidget {
  const ReactivateSuccessScreen({super.key});

  @override
  State<ReactivateSuccessScreen> createState() =>
      _ReactivateSuccessScreenState();
}

class _ReactivateSuccessScreenState extends State<ReactivateSuccessScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToLogin();
  }

  void _navigateToLogin() {
    Timer(const Duration(seconds: 3), () {
      if (mounted) {
        print("Redirecting to Sign In after reactivation...");
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (context) => const SignInScreen(isEmailSignIn: true)),
          (Route<dynamic> route) => false,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    const Color successColor = Colors.green;
    const Color primaryTextColor = Colors.black87;
    const Color secondaryTextColor = Colors.grey;

    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: successColor, width: 2.5),
                  ),
                  child: const Icon(Icons.check_circle,
                      color: successColor, size: 80),
                ),
                const SizedBox(height: 32),
                const Text(
                  'Account Reactivated Successfully!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: primaryTextColor),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Your Account Has Been Successfully Reactivated',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: secondaryTextColor),
                ),
                const SizedBox(height: 50),
                const CircularProgressIndicator(color: successColor),
                const SizedBox(height: 15),
                const Text(
                  "Redirecting to Sign In...",
                  style: TextStyle(color: secondaryTextColor),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
