import 'package:flutter/material.dart';
// --- !!! تأكد من أن المسار واسم الملف صحيحين !!! ---
import 'home_screen.dart'; // أو اسم الشاشة الرئيسية الفعلي

class BookingConfirmationScreen extends StatelessWidget {
  // يمكنك إضافة باراميتر هنا لتغيير الرسالة إذا أردت
  // final String confirmationMessage;
  const BookingConfirmationScreen({
    super.key,
    // this.confirmationMessage = 'Booking is Done Successfully!',
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // --- أيقونة النجاح ---
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.green, width: 3)),
                child: const Icon(Icons.check, color: Colors.green, size: 60),
              ),
              const SizedBox(height: 30),

              // --- رسالة النجاح (يمكن تخصيصها) ---
              const Text(
                // confirmationMessage, // استخدام الرسالة الممررة
                'Booked Successfully!', // أو رسالة مخصصة للتاكسي
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 50),

              // --- زر العودة إلى الشاشة الرئيسية ---
              ElevatedButton(
                onPressed: () {
                  // الانتقال إلى الشاشة الرئيسية وإزالة كل الشاشات السابقة
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const HomeScreen()), // <-- تأكد من اسم الشاشة الرئيسية
                    (Route<dynamic> route) => false, // إزالة كل المسارات
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF406F89), // استخدام لون الثيم
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 14),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                // --- تغيير نص الزر قليلاً ---
                child: const Text('Done',
                    style: TextStyle(fontSize: 16, color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
