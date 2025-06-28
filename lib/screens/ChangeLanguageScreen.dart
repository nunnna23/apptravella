import 'package:flutter/material.dart';

class ChangeLanguageScreen extends StatefulWidget {
  const ChangeLanguageScreen({super.key});

  @override
  _ChangeLanguageScreenState createState() => _ChangeLanguageScreenState();
}

class _ChangeLanguageScreenState extends State<ChangeLanguageScreen> {
  String selectedLanguage = 'Device language';

  final List<String> languages = [
    'Device language',
    'العربية',
    'English (UK)',
    'English (US)',
    '普通话',
    'Española',
    'Français',
    '日本語',
    'Русский',
    'Türkçe',
    'বাংলা',
    'Português',
    'Deutsch',
    'Finish',
    'Italiano',
    'Nederlands',
    'Svenska',
    'Dansk',
    'Suomi',
    'Česky',
    'Magyar',
    'Română',
    'Slovenčina',
    'Slovenščina',
    'Hrvatski',
    'Български',
    'Ελληνικά',
    'עברית',
    'Filipino',
    'ไทย',
    'Tiếng Việt',
    'Malay',
    'Swahili',
    'Norsk',
    'Català',
    'Latviešu',
    'Lietuvių',
    'Estonian',
    'Kiswahili',
    'Serbian',
    'Ukrainian',
    'Persian',
    'Tamil',
    'Telugu',
    'Kannada',
    'Gujarati',
    'Marathi',
    'Punjabi',
    'Burmese',
    'Khmer',
    'Sinhalese',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Language',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context, selectedLanguage);
            },
            child:
                const Text('Apply', style: TextStyle(color: Color(0xFF406F89))),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: languages.length,
          itemBuilder: (context, index) {
            return Card(
              margin: const EdgeInsets.only(bottom: 12),
              color: const Color(0xFF406F89),
              child: ListTile(
                title: Text(
                  languages[index],
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ),
                trailing: Radio<String>(
                  value: languages[index],
                  groupValue: selectedLanguage,
                  onChanged: (value) {
                    setState(() {
                      selectedLanguage = value!;
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
