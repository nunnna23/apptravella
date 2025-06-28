import 'package:flutter/material.dart';

class EmptyNotificationsScreen extends StatelessWidget {
  const EmptyNotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Notifications'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.notifications_off, size: 100, color: Color(0xFF406F89)),
            SizedBox(height: 20),
            Text(
              "You Don't Have any Notifications",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              "Notifications Let You Quickly Take Actions\nOn Upcoming Or Current Bookings",
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
