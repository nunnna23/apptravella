import 'package:flutter/material.dart';

class CardDeletedSuccessScreen extends StatelessWidget {
  const CardDeletedSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color successColor = Colors.green;
    const Color primaryTextColor = Colors.black87;
    const Color secondaryTextColor = Colors.grey;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // إضافة AppBar للسماح بالرجوع
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
                'Card Deleted Successfully!', // تغيير النص
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: primaryTextColor),
              ),
              const SizedBox(height: 12),
              const Text(
                'Your Card Has Been Successfully Deleted', // تغيير النص
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: secondaryTextColor),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
