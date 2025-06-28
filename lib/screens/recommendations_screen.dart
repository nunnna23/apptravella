// import 'package:flutter/material.dart';

// class RecommendationsScreen extends StatelessWidget {
//   final List<dynamic> recommendations;

//   const RecommendationsScreen({super.key, required this.recommendations});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Recommended Hotels'),
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () => Navigator.pop(context),
//         ),
//       ),
//       body: recommendations.isEmpty
//           ? const Center(
//               child: Text(
//                 'No recommendations available.',
//                 style: TextStyle(fontSize: 16, color: Colors.grey),
//               ),
//             )
//           : ListView.builder(
//               padding: const EdgeInsets.all(16),
//               itemCount: recommendations.length,
//               itemBuilder: (context, index) {
//                 final hotel = recommendations[index];
//                 return Card(
//                   elevation: 2,
//                   margin: const EdgeInsets.only(bottom: 16),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.all(16),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           '${hotel['city']}',
//                           style: const TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         const SizedBox(height: 8),
//                         Text(
//                           'Price: ${hotel['price']} EGP',
//                           style: const TextStyle(fontSize: 16),
//                         ),
//                         const SizedBox(height: 4),
//                         Text(
//                           'Rating: ${hotel['rating']}',
//                           style: const TextStyle(fontSize: 16),
//                         ),
//                         const SizedBox(height: 4),
//                         Text(
//                           'Travel Style: ${hotel['Travelstyle']}',
//                           style: const TextStyle(fontSize: 16),
//                         ),
//                         const SizedBox(height: 4),
//                         Text(
//                           'Food Preference: ${hotel['Food_Preference']}',
//                           style: const TextStyle(fontSize: 16),
//                         ),
//                         const SizedBox(height: 4),
//                         Text(
//                           'Preferred Season: ${hotel['Preferred_Season']}',
//                           style: const TextStyle(fontSize: 16),
//                         ),
//                         const SizedBox(height: 4),
//                         Text(
//                           'Eco-Friendly: ${hotel['Eco_Friendly'] ? 'Yes' : 'No'}',
//                           style: const TextStyle(fontSize: 16),
//                         ),
//                         const SizedBox(height: 4),
//                         Text(
//                           'Gym: ${hotel['Gym'] ? 'Yes' : 'No'}',
//                           style: const TextStyle(fontSize: 16),
//                         ),
//                         const SizedBox(height: 4),
//                         Text(
//                           'Spa: ${hotel['Spa'] ? 'Yes' : 'No'}',
//                           style: const TextStyle(fontSize: 16),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//     );
//   }
// }
// lib/screens/recommendations_screen.dart

import 'package:flutter/material.dart';

class RecommendationsScreen extends StatelessWidget {
  final List<dynamic> recommendations;

  const RecommendationsScreen({super.key, required this.recommendations});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recommended Hotels'),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: recommendations.isEmpty
          ? const Center(
              child: Text(
                'No recommendations available based on your preferences.',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: recommendations.length,
              itemBuilder: (context, index) {
                final hotel = recommendations[index];
                return Card(
                  elevation: 2,
                  margin: const EdgeInsets.only(bottom: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${hotel['city']}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Price: ${hotel['price']} EGP',
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Rating: ${hotel['rating']}',
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Travel Style: ${hotel['Travelstyle']}',
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Food Preference: ${hotel['Food_Preference']}',
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Preferred Season: ${hotel['Preferred_Season']}',
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          // Correctly display the string "Yes" or "No" from the API
                          'Eco-Friendly: ${hotel['Eco_Friendly']}',
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          // Correctly display the string "Yes" or "No" from the API
                          'Gym: ${hotel['Gym']}',
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          // Correctly display the string "Yes" or "No" from the API
                          'Spa: ${hotel['Spa']}',
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
