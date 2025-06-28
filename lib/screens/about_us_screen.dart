import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'About Us',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  'assets/aboutas.jpeg',
                  height: 300,
                  width: double.infinity,
                  fit: BoxFit.contain,
                ),
              ),
              // const SizedBox(height: 24),
              // const Center(
              //   child: Text(
              //     "ABOUT US",
              //     style: TextStyle(
              //       fontSize: 22,
              //       fontWeight: FontWeight.bold,
              //       color: Color(0xFF406F89),
              //     ),
              //   ),
              // ),
              const SizedBox(height: 16),
              const Text(
                'Founded in 2024 in Egypt, Travella has grown from a small Egyptian start-up to one of the world\'s leading digital travel companies. Travella Inc. (NASDAQ: BKNG). Travella\'s mission is to make it easier for everyone to experience the world.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'By investing in technology that takes the friction out of travel, Travella seamlessly connects millions of travelers to memorable experiences, a variety of transportation options, and incredible places to stay – from homes to hotels, and much more. As one of the world\'s largest travel marketplaces for both established brands and entrepreneurs of all sizes, Travella.com enables properties around the world to reach a global audience and grow their businesses.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF406F89),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Our Values',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 12),
                    Text(
                      '• Customer First: We put travelers at the heart of everything we do',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        height: 1.5,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '• Innovation: We continuously explore new technologies and solutions',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        height: 1.5,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '• Inclusivity: We strive to make travel accessible to everyone',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        height: 1.5,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      '• Sustainability: We\'re committed to responsible travel practices',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
