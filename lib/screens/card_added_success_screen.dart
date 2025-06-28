import 'package:flutter/material.dart';

class CardAddedSuccessScreen extends StatelessWidget {
  const CardAddedSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color successColor = Colors.green;
    const Color primaryTextColor = Colors.black87;
    const Color secondaryTextColor = Colors.grey;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // إضافة AppBar للسماح بالرجوع (قد ترغب بتغيير سلوكه لاحقاً)
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
            // العودة خطوتين للوصول لشاشة PaymentMethodsScreen
            onPressed: () {
              int count = 0;
              Navigator.of(context).popUntil((_) => count++ >= 2);
            }),
      ),
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
                'Card Added Successfully!', // تغيير النص
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: primaryTextColor),
              ),
              const SizedBox(height: 12),
              const Text(
                'Your Card Has Been Successfully Added', // تغيير النص
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: secondaryTextColor),
              ),
              const SizedBox(height: 50),
              // يمكنك إضافة زر للعودة إلى PaymentMethods مباشرة إذا أردت
              // ElevatedButton(
              //   onPressed: () {
              //     int count = 0;
              //     Navigator.of(context).popUntil((_) => count++ >= 2);
              //   },
              //   child: Text('Done'),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
