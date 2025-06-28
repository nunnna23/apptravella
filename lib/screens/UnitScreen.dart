import 'package:flutter/material.dart';

class UnitScreen extends StatefulWidget {
  const UnitScreen({super.key});

  @override
  _UnitScreenState createState() => _UnitScreenState();
}

class _UnitScreenState extends State<UnitScreen> {
  String selectedUnit = 'Kilometer (km)';

  final List<String> units = [
    'Kilometer (km)',
    'Mile (mi)',
    'Meter (m)',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Unit',
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
              Navigator.pop(context, selectedUnit);
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
              'assets/unit.jpeg',
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 16),
          // القائمة
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: units.length,
              itemBuilder: (context, index) {
                final isSelected = units[index] == selectedUnit;
                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  color: isSelected
                      ? const Color(0xFF406F89)
                      : const Color(0xFFF3F3F3),
                  child: ListTile(
                    title: Text(
                      units[index],
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.black,
                        fontSize: 16,
                      ),
                    ),
                    trailing: Radio<String>(
                      value: units[index],
                      groupValue: selectedUnit,
                      onChanged: (value) {
                        setState(() {
                          selectedUnit = value!;
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
