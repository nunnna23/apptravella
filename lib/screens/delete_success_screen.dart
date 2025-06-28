import 'package:flutter/material.dart';
import 'dart:async'; // لاستخدام Timer
import 'package:apptravella/screens/sign_in_screen.dart'; // <-- استيراد شاشة تسجيل الدخول

class DeleteSuccessScreen extends StatefulWidget {
  const DeleteSuccessScreen({super.key});

  @override
  State<DeleteSuccessScreen> createState() => _DeleteSuccessScreenState();
}

class _DeleteSuccessScreenState extends State<DeleteSuccessScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToLogin(); // استدعاء دالة الانتقال عند بناء الشاشة
  }

  void _navigateToLogin() {
    // الانتظار لمدة 3 ثواني ثم الانتقال
    Timer(const Duration(seconds: 3), () {
      if (mounted) {
        // التحقق إذا كانت الويدجت لا تزال موجودة
        // --- TODO: إضافة منطق تسجيل الخروج الفعلي هنا ---
        // (نفس المنطق كما في شاشة نجاح التعطيل)
        print("Signing out user after deletion...");

        // الانتقال إلى شاشة تسجيل الدخول وإزالة كل الشاشات السابقة
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (context) => const SignInScreen(
                    // تأكدي من القيمة الصحيحة لـ isEmailSignIn
                    isEmailSignIn: true,
                  )),
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
      // لمنع الرجوع بزر الـ back أثناء الانتظار
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
                  'Account Deleted Successfully!', // تغيير النص
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: primaryTextColor),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Your Account Has Been Successfully Deleted', // تغيير النص
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: secondaryTextColor),
                ),
                const SizedBox(height: 50),
                // مؤشر تحميل اختياري
                const CircularProgressIndicator(color: successColor),
                const SizedBox(height: 15),
                const Text("Redirecting to Sign In...",
                    style: TextStyle(color: secondaryTextColor)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
