import 'package:flutter/material.dart';
import 'package:apptravella/screens/ChangeLanguageScreen.dart';
import 'package:apptravella/screens/CurrencyScreen.dart';
import 'package:apptravella/screens/UnitScreen.dart';
import 'package:apptravella/screens/temperature_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool notificationsEnabled = true;
  bool darkModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: const Color(0xFF406F89),
      ),
      body: Container(
        color: const Color(0xFFF5F5F5),
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildSettingItem(
              icon: Icons.language,
              title: 'Change Language',
              subtitle: 'English',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ChangeLanguageScreen()),
                );
              },
            ),
            _buildSettingItem(
              icon: Icons.dark_mode,
              title: 'Dark Mode',
              isSwitch: true,
              isSwitchValue: darkModeEnabled,
              onChanged: (value) {
                setState(() {
                  darkModeEnabled = value;
                });
              },
            ),
            _buildSettingItem(
              icon: Icons.monetization_on,
              title: 'Currency',
              subtitle: 'Egyptian Pound',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CurrencyScreen()),
                );
              },
            ),
            _buildSettingItem(
              icon: Icons.straighten,
              title: 'Unit',
              subtitle: 'Kilometer',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const UnitScreen()),
                );
              },
            ),
            _buildSettingItem(
              icon: Icons.thermostat,
              title: 'Temperature',
              subtitle: 'Celsius',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const TemperatureScreen()),
                );
              },
            ),
            _buildSettingItem(
              icon: Icons.notifications,
              title: 'Notifications',
              isSwitch: true,
              isSwitchValue: notificationsEnabled,
              onChanged: (value) {
                setState(() {
                  notificationsEnabled = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingItem({
    required IconData icon,
    required String title,
    String? subtitle,
    bool isSwitch = false,
    bool? isSwitchValue,
    ValueChanged<bool>? onChanged,
    VoidCallback? onTap,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      color: const Color(0xFFE0E0E0),
      child: ListTile(
        leading: Icon(icon, color: const Color(0xFF406F89)),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: subtitle != null ? Text(subtitle) : null,
        trailing: isSwitch
            ? Switch(
                value: isSwitchValue ?? false,
                onChanged: onChanged,
                activeColor: Colors.blue,
                inactiveThumbColor: Colors.orange,
                inactiveTrackColor: Colors.grey,
              )
            : const Icon(Icons.arrow_forward_ios),
        onTap: onTap,
      ),
    );
  }
}
