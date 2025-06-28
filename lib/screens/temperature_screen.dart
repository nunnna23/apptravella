import 'package:flutter/material.dart';

class TemperatureScreen extends StatefulWidget {
  const TemperatureScreen({super.key});

  @override
  _TemperatureScreenState createState() => _TemperatureScreenState();
}

class _TemperatureScreenState extends State<TemperatureScreen> {
  String selectedTemp = 'Fahrenheit (°F)';

  final List<String> temps = [
    'Fahrenheit (°F)',
    'Celsius (°C)',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Temperature',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context, selectedTemp);
            },
            child: const Text(
              'Apply',
              style: TextStyle(color: Color(0xFF406F89)),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          // صورة التوضيح
          SizedBox(
            height: 450,
            child: Image.asset(
              'assets/temperature.jpeg', // تأكد إن الصورة في assets
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 16),
          // قائمة الخيارات
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: temps.length,
              itemBuilder: (context, index) {
                final isSelected = temps[index] == selectedTemp;
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  color: isSelected
                      ? const Color(0xFF406F89)
                      : const Color(0xFFF3F3F3),
                  child: ListTile(
                    title: Text(
                      temps[index],
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.black,
                        fontSize: 16,
                      ),
                    ),
                    trailing: Radio<String>(
                      value: temps[index],
                      groupValue: selectedTemp,
                      onChanged: (value) {
                        setState(() {
                          selectedTemp = value!;
                        });
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
