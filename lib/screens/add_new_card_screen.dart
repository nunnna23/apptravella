import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // لاستخدام InputFormatters
import 'card_added_success_screen.dart'; // لاستيراد شاشة النجاح

class AddNewCardScreen extends StatefulWidget {
  const AddNewCardScreen({super.key});

  @override
  State<AddNewCardScreen> createState() => _AddNewCardScreenState();
}

class _AddNewCardScreenState extends State<AddNewCardScreen> {
  final _cardNumberController = TextEditingController();
  final _expiryDateController = TextEditingController();
  final _cvvController = TextEditingController();
  bool _agreeToTerms = false;

  @override
  void dispose() {
    _cardNumberController.dispose();
    _expiryDateController.dispose();
    _cvvController.dispose();
    super.dispose();
  }

  // Helper لإنشاء حقول النص
  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    required String hintText,
    TextInputType keyboardType = TextInputType.number, // افتراضي رقمي
    List<TextInputFormatter>? inputFormatters,
    int? maxLength,
    IconData? prefixIcon,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        maxLength: maxLength,
        decoration: InputDecoration(
          labelText: labelText, // استخدام labelText بدلاً من عنصر Text منفصل
          hintText: hintText,
          counterText: "", // لإخفاء عداد الأحرف
          hintStyle: const TextStyle(color: Colors.grey),
          prefixIcon: prefixIcon != null
              ? Icon(prefixIcon, color: Colors.grey, size: 20)
              : null,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 14.0, horizontal: 12.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(color: Color(0xFF406F89), width: 1.5),
          ),
        ),
      ),
    );
  }

  void _handleLinkCard() {
    if (!_agreeToTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Please agree to the terms and conditions.')),
      );
      return;
    }
    // TODO: إضافة تحقق من صحة بيانات البطاقة هنا (Card number, expiry, CVV)
    if (_cardNumberController.text.isEmpty ||
        _expiryDateController.text.isEmpty ||
        _cvvController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all card details.')),
      );
      return;
    }

    // TODO: إضافة منطق ربط البطاقة الفعلي (API call, etc.)
    print('Linking Card...');
    print('Card Number: ${_cardNumberController.text}');
    print('Expiry: ${_expiryDateController.text}');
    print('CVV: ${_cvvController.text}');

    // الانتقال لشاشة النجاح واستبدال الشاشة الحالية
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const CardAddedSuccessScreen()),
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
        title: const Text(
          'Add New Card',
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        // للسماح بالتمرير إذا ظهرت لوحة المفاتيح
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildTextField(
              controller: _cardNumberController,
              labelText: 'Card Number',
              hintText: 'Enter Card Number',
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              maxLength: 19, // عادة أرقام البطاقات حتى 19 (مع المسافات)
              prefixIcon: Icons.credit_card,
            ),
            Row(
              // صف لتاريخ الانتهاء و CVV
              children: [
                Expanded(
                  child: _buildTextField(
                    controller: _expiryDateController,
                    labelText: 'Expiry Date',
                    hintText: 'MM/YY',
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(4), // MMYY
                      // يمكنك إضافة CardExpiryInputFormatter مخصص لتنسيق MM/YY
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildTextField(
                    controller: _cvvController,
                    labelText: 'CVV',
                    hintText: 'Enter Your CVV',
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    maxLength: 3, // CVV عادة 3 أرقام
                  ),
                ),
              ],
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
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: _handleLinkCard,
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                textStyle:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              child: const Text('Link Card'),
            ),
            const SizedBox(height: 20),
            // يمكنك إضافة لوحة المفاتيح الرقمية المخصصة هنا إذا أردت
            // CustomNumberKeyboard(),
          ],
        ),
      ),
    );
  }
}
