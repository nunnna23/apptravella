import 'package:flutter/material.dart';
import 'card_deleted_success_screen.dart';

// ... (كلاس CreditCardInfo يبقى كما هو)
class CreditCardInfo {
  final String id;
  final String lastDigits;
  final String cardType; // Visa, Mastercard, etc.
  bool isSelected;

  CreditCardInfo({
    required this.id,
    required this.lastDigits,
    required this.cardType,
    this.isSelected = false,
  });
}

class DeleteCardScreen extends StatefulWidget {
  const DeleteCardScreen({super.key});

  @override
  State<DeleteCardScreen> createState() => _DeleteCardScreenState();
}

class _DeleteCardScreenState extends State<DeleteCardScreen> {
  final List<CreditCardInfo> _cards = [
    // بيانات افتراضية
    CreditCardInfo(id: '1', lastDigits: '7835', cardType: 'Visa'),
    CreditCardInfo(id: '2', lastDigits: '5612', cardType: 'Mastercard'),
  ];
  bool _agreeToTerms = false;

  void _handleDeleteCard() {
    if (!_agreeToTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Please agree to the terms and conditions.')),
      );
      return;
    }
    final selectedCards = _cards.where((card) => card.isSelected).toList();
    if (selectedCards.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Please select at least one card to delete.')),
      );
      return;
    }
    print('Deleting Cards: ${selectedCards.map((c) => c.id).join(', ')}');
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => const CardDeletedSuccessScreen()));
  }

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFF406F89);
    const Color errorColor = Colors.red; // للزر والحذف

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Delete Card',
            style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ******** التعديل هنا: استخدام Image.asset **********
            Container(
              height: 180, // تعديل الارتفاع ليناسب الصورة (يمكن تعديله)
              alignment: Alignment.center, // يضمن توسط الصورة
              child: Image.asset(
                'assets/deletecard.jpeg', // <-- تأكد من صحة المسار للصورة
                fit: BoxFit.contain, // يجعل الصورة تتناسب داخل الحاوية
                errorBuilder: (context, error, stackTrace) {
                  // للتعامل مع خطأ تحميل الصورة
                  print("Error loading deletecard.jpeg: $error");
                  return const Icon(Icons.delete_sweep_outlined,
                      size: 100,
                      color: errorColor); // عرض أيقونة بديلة عند الخطأ
                },
              ),
            ),
            // ******** نهاية التعديل **********
            const SizedBox(height: 24),

            const Text('Select Card :',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            const SizedBox(height: 16),

            Expanded(
              child: ListView.builder(
                itemCount: _cards.length,
                itemBuilder: (context, index) {
                  final card = _cards[index];
                  return CheckboxListTile(
                    title: Text('${card.cardType} **** ${card.lastDigits}'),
                    value: card.isSelected,
                    onChanged: (bool? value) => setState(() {
                      card.isSelected = value ?? false;
                    }),
                    controlAffinity: ListTileControlAffinity.leading,
                    activeColor: primaryColor,
                    secondary: Icon(card.cardType.toLowerCase() == 'visa'
                        ? Icons.credit_card
                        : Icons.credit_card), // يمكن تحسين الأيقونات
                  );
                },
              ),
            ),

            CheckboxListTile(
              title: const Text("Agree on terms and conditions",
                  style: TextStyle(fontSize: 14)),
              value: _agreeToTerms,
              onChanged: (newValue) => setState(() {
                _agreeToTerms = newValue!;
              }),
              controlAffinity: ListTileControlAffinity.leading,
              contentPadding: EdgeInsets.zero,
              activeColor: primaryColor,
            ),
            const SizedBox(height: 16),

            ElevatedButton(
              onPressed: _handleDeleteCard,
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                textStyle:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              child: const Text('Delete Card'),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
