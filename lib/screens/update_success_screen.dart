import 'dart:async'; // لاستخدام Future.delayed
import 'package:flutter/material.dart';

// --- !!! تأكد من استيراد PointsScreen ---
//import 'points_screen.dart'; // استبدل 'points_screen.dart' بالمسار الصحيح إذا كان مختلفًا

class UpdateSuccessScreen extends StatefulWidget {
  const UpdateSuccessScreen({super.key});

  @override
  State<UpdateSuccessScreen> createState() => _UpdateSuccessScreenState();
}

class _UpdateSuccessScreenState extends State<UpdateSuccessScreen> {
  // --- ثوابت التصميم ---
  static const Color successColor = Colors.green;
  static const Color primaryTextColor = Colors.black87;
  static const Color secondaryTextColor = Colors.grey;

  @override
  void initState() {
    super.initState();
    // --- بدء مؤقت للعودة بعد فترة ---
    _navigateToPreviousScreenAfterDelay();
  }

  // --- دالة لتأخير الانتقال ---
  void _navigateToPreviousScreenAfterDelay() {
    // تحديد مدة التأخير (مثلاً 3 ثواني)
    const delay = Duration(seconds: 3);

    Future.delayed(delay, () {
      // --- التحقق مما إذا كانت الويدجت لا تزال موجودة قبل الانتقال ---
      // هذا مهم لتجنب الأخطاء إذا أغلق المستخدم الشاشة يدويًا قبل انتهاء المؤقت
      if (mounted) {
        // --- العودة إلى الشاشة السابقة (نفترض أنها PointsScreen) ---
        Navigator.of(context).pop();

        // --- بدائل أخرى للانتقال (إذا لم تكن pop كافية) ---
        // إذا أردت *استبدال* شاشة النجاح بشاشة النقاط:
        // Navigator.of(context).pushReplacement(
        //   MaterialPageRoute(builder: (context) => const PointsScreen()),
        // );

        // إذا أردت العودة إلى الشاشة *الأولى* ثم فتح شاشة النقاط:
        // Navigator.of(context).pushAndRemoveUntil(
        //   MaterialPageRoute(builder: (context) => const PointsScreen()),
        //   (Route<dynamic> route) => route.isFirst, // إزالة كل الشاشات حتى الأولى
        // );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // AppBar للسماح بالرجوع اليدوي إذا أراد المستخدم
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // --- أيقونة علامة الصح ---
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: successColor, width: 2.5),
                ),
                child: const Icon(
                  Icons.check_circle,
                  color: successColor,
                  size: 80,
                ),
              ),
              const SizedBox(height: 32),

              // --- النص الرئيسي ---
              const Text(
                'Personal Details Changed!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: primaryTextColor,
                ),
              ),
              const SizedBox(height: 12),

              // --- النص الفرعي ---
              const Text(
                'Your Personal Detail Has Been Successfully Changed',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: secondaryTextColor,
                ),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
