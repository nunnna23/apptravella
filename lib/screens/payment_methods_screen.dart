import 'package:flutter/material.dart';
import 'add_new_card_screen.dart';
import 'delete_card_screen.dart';

class PaymentMethodsScreen extends StatelessWidget {
  const PaymentMethodsScreen({super.key});

  Widget _buildCardItem(String lastDigits, String cardType) {
    // ... (كود عرض البطاقة يبقى كما هو)
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF406F89),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Text(
              cardType.toUpperCase(),
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          ),
          const SizedBox(height: 25),
          Text('**** **** **** $lastDigits',
              style: const TextStyle(
                  color: Colors.white, fontSize: 18, letterSpacing: 2)),
          const SizedBox(height: 15),
          const Text('CARD HOLDER NAME',
              style: TextStyle(color: Colors.white70, fontSize: 12)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFF406F89);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Payment Methods',
            style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_outline, color: Colors.red),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DeleteCardScreen()));
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // ******** التعديل هنا: استخدام Image.asset **********
            Container(
              height:
                  180, // تعديل الارتفاع ليناسب الصورة بشكل أفضل (يمكن تعديله)
              alignment: Alignment.center, // يضمن توسط الصورة داخل الحاوية
              child: Image.asset(
                'assets/payment.jpeg', // <-- تأكد من صحة المسار للصورة
                fit: BoxFit.contain, // يجعل الصورة تتناسب داخل الحاوية
                errorBuilder: (context, error, stackTrace) {
                  // للتعامل مع خطأ تحميل الصورة
                  print("Error loading payment.jpeg: $error");
                  return const Icon(Icons.credit_card_rounded,
                      size: 100,
                      color: primaryColor); // عرض أيقونة بديلة عند الخطأ
                },
              ),
            ),
            // ******** نهاية التعديل **********
            const SizedBox(height: 24),

            Expanded(
              child: ListView(
                children: [
                  // TODO: استبدل هذه ببيانات البطاقات الحقيقية
                  _buildCardItem('7835', 'Visa'),
                ],
              ),
            ),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddNewCardScreen()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  textStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600),
                ),
                child: const Text('Add New Card'),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
