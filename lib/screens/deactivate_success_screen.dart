import 'package:flutter/material.dart';
import 'dart:async'; // لاستخدام Timer أو Future.delayed
import 'package:apptravella/screens/sign_in_screen.dart'; // <-- استيراد شاشة تسجيل الدخول

class DeactivateSuccessScreen extends StatefulWidget {
  const DeactivateSuccessScreen({super.key});

  @override
  State<DeactivateSuccessScreen> createState() =>
      _DeactivateSuccessScreenState();
}

class _DeactivateSuccessScreenState extends State<DeactivateSuccessScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToLogin(); // استدعاء دالة الانتقال عند بناء الشاشة
  }

  void _navigateToLogin() {
    // الانتظار لمدة 3 ثواني ثم الانتقال
    Timer(const Duration(seconds: 3), () {
      // التحقق مما إذا كانت الويدجت لا تزال جزءًا من شجرة الويدجتس
      // هذا مهم لتجنب الأخطاء إذا أغلق المستخدم الشاشة قبل انتهاء المؤقت
      if (mounted) {
        // --- TODO: إضافة منطق تسجيل الخروج الفعلي هنا ---
        // على سبيل المثال، إذا كنت تستخدم Provider أو Bloc:
        // context.read<AuthService>().signOut();
        // أو استدعاء دالة مباشرة:
        // AuthService.instance.signOut();
        print("Signing out user after deactivation...");

        // الانتقال إلى شاشة تسجيل الدخول وإزالة كل الشاشات السابقة من المكدس
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (context) => const SignInScreen(
                    // تأكدي من القيمة الصحيحة لـ isEmailSignIn
                    isEmailSignIn: true,
                  )),
          (Route<dynamic> route) =>
              false, // الشرط false يزيل كل المسارات السابقة
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
      // استخدام PopScope لمنع الرجوع بزر الـ back الافتراضي أثناء الانتظار
      canPop: false, // يمنع الرجوع
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
                  'Account Deactivated Successfully!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: primaryTextColor),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Your Account Has Been Successfully Deactivated',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: secondaryTextColor),
                ),
                const SizedBox(height: 50),
                // يمكن إضافة مؤشر تحميل دائري إذا أردتِ إظهار أن شيئاً ما يحدث
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
