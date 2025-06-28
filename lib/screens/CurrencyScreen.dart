import 'package:flutter/material.dart';

class CurrencyScreen extends StatefulWidget {
  const CurrencyScreen({super.key});

  @override
  _CurrencyScreenState createState() => _CurrencyScreenState();
}

class _CurrencyScreenState extends State<CurrencyScreen> {
  String selectedCurrency = 'Egyptian Pound (E£)'; // العملة الافتراضية

  final List<String> currencies = [
    'Egyptian Pound (E£)',
    'United States Dollar (\$)',
    'Euro (€)',
    'British Pound (£)',
    'Chinese Yuan (¥)',
    'Japanese Yen (¥)',
    'Swiss Franc (CHF)',
    'Australian Dollar (AU\$)',
    'Canadian Dollar (CA\$)',
    'Indian Rupee (₹)',
    'Russian Ruble (₽)',
    'Brazilian Real (R\$)',
    'Mexican Peso (Mex\$)',
    'Saudi Riyal (﷼)',
    'UAE Dirham (AED)', // الأفضل تستبدل العربية لو حصل مشاكل ترميز
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Currency'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // الرجوع بدون اختيار
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              // ترجيع العملة المختارة للشاشة السابقة
              Navigator.pop(context, selectedCurrency);
            },
            child: const Text('Apply', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: currencies.length,
          itemBuilder: (context, index) {
            return Card(
              margin: const EdgeInsets.only(bottom: 12),
              color: const Color(0xFF406F89), // لون البطاقة
              child: ListTile(
                title: Text(
                  currencies[index],
                  style: const TextStyle(
                      color: Colors.white), // تغيير لون النص إلى الأبيض
                ),
                trailing: Radio<String>(
                  value: currencies[index],
                  groupValue: selectedCurrency,
                  onChanged: (value) {
                    setState(() {
                      selectedCurrency = value!; // تحديث العملة المختارة
                    });
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
