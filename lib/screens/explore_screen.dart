// // // // explore_screen.dart
// // // import 'package:flutter/material.dart';
// // // import 'place_details_screen.dart';
// // // // استيراد نموذج بيانات المكان بالكامل (بما في ذلك الإحداثيات)

// // // class ExploreScreen extends StatelessWidget {
// // //   final String country;

// // //   const ExploreScreen({super.key, required this.country});

// // //   // --- بيانات وهمية للأماكن (مع الإحداثيات) ---
// // //   List<PlaceData> get _dummyPlaces {
// // //     // --- !!! إضافة قيم خطوط الطول والعرض هنا !!! ---
// // //     if (country.toLowerCase().contains('hurghada')) {
// // //       return [
// // //         PlaceData(
// // //             name: 'Grand Aquarium',
// // //             location: 'Hurghada',
// // //             imageUrl: 'assets/hurghada/aquarium.jpg',
// // //             rating: 4.5,
// // //             reviewCount: 315,
// // //             description: 'Explore marine life...',
// // //             facilities: ['Tickets', 'Cafe'],
// // //             price: 500,
// // //             latitude: 27.1793,
// // //             longitude: 33.8014), // Example Coords
// // //         PlaceData(
// // //             name: 'Makadi Water World',
// // //             location: 'Hurghada',
// // //             imageUrl: 'assets/hurghada/makadi.jpg',
// // //             rating: 4.9,
// // //             reviewCount: 450,
// // //             description: 'Exciting water slides...',
// // //             facilities: ['Tickets', 'Food', 'Pool'],
// // //             price: 800,
// // //             latitude: 26.9911,
// // //             longitude: 33.9032), // Example Coords
// // //         PlaceData(
// // //             name: 'Mini Egypt Park',
// // //             location: 'Hurghada',
// // //             imageUrl: 'assets/hurghada/miniegypt.jpg',
// // //             rating: 4.8,
// // //             reviewCount: 290,
// // //             description: 'See Egypt in miniature...',
// // //             facilities: ['Tickets', 'Guide'],
// // //             price: 400,
// // //             latitude: 26.9887,
// // //             longitude: 33.8962), // Example Coords
// // //         PlaceData(
// // //             name: 'Orange Bay',
// // //             location: 'Hurghada',
// // //             imageUrl: 'assets/hurghada/orangebay.jpg',
// // //             rating: 4.9,
// // //             reviewCount: 510,
// // //             description: 'Relax on the beautiful beach...',
// // //             facilities: ['Boat Trip', 'Food', 'Snorkeling'],
// // //             price: 1200,
// // //             latitude: 27.2000,
// // //             longitude: 33.8500), // Approx Coords
// // //       ];
// // //     } else if (country.toLowerCase().contains('giza')) {
// // //       return [
// // //         PlaceData(
// // //             name: 'Grand Museum',
// // //             location: 'Giza',
// // //             imageUrl: 'assets/giza/gem.jpg',
// // //             rating: 4.8,
// // //             reviewCount: 1020,
// // //             description: 'The Grand Egyptian Museum...',
// // //             facilities: ['Tickets', 'Guide', 'Cafe'],
// // //             price: 900,
// // //             latitude: 29.9934,
// // //             longitude: 31.1313), // Example Coords
// // //         PlaceData(
// // //             name: 'Pyramids',
// // //             location: 'Giza',
// // //             imageUrl: 'assets/giza/pyramids.jpg',
// // //             rating: 4.5,
// // //             reviewCount: 5500,
// // //             description: 'The iconic Pyramids of Giza...',
// // //             facilities: ['Tickets', 'Camel Ride', 'Guide'],
// // //             price: 750,
// // //             latitude: 29.9792,
// // //             longitude: 31.1342), // Example Coords
// // //         PlaceData(
// // //             name: 'Pyramid of Djoser',
// // //             location: 'Saqqara',
// // //             imageUrl: 'assets/giza/djoser.jpg',
// // //             rating: 4.5,
// // //             reviewCount: 1500,
// // //             description: 'The Step Pyramid...',
// // //             facilities: ['Tickets', 'Guide'],
// // //             price: 600,
// // //             latitude: 29.8711,
// // //             longitude: 31.2165), // Example Coords
// // //         PlaceData(
// // //             name: 'The Giza Zoo',
// // //             location: 'Giza',
// // //             imageUrl: 'assets/giza/zoo.jpg',
// // //             rating: 4.0,
// // //             reviewCount: 800,
// // //             description: 'One of the oldest zoos...',
// // //             facilities: ['Tickets', 'Food'],
// // //             price: 100,
// // //             latitude: 30.0181,
// // //             longitude: 31.2083), // Example Coords
// // //       ];
// // //     } else if (country.toLowerCase().contains('sharm')) {
// // //       return [
// // //         PlaceData(
// // //             name: 'Ras Muhammad',
// // //             location: 'Sharm',
// // //             imageUrl: 'assets/sharm/ras_muhammad.jpg',
// // //             rating: 4.9,
// // //             reviewCount: 1100,
// // //             description: 'National park known for diving...',
// // //             facilities: ['Snorkeling', 'Diving', 'Boat Trip'],
// // //             price: 1500,
// // //             latitude: 27.7278,
// // //             longitude: 34.2475), // Example Coords
// // //         PlaceData(
// // //             name: 'Naama Bay',
// // //             location: 'Sharm',
// // //             imageUrl: 'assets/sharm/naama_bay.jpg',
// // //             rating: 4.0,
// // //             reviewCount: 950,
// // //             description: 'Vibrant bay with shops and cafes...',
// // //             facilities: ['Cafe', 'Shops', 'Beach'],
// // //             price: 0,
// // //             latitude: 27.9127,
// // //             longitude: 34.3276), // Example Coords
// // //         PlaceData(
// // //             name: 'Ras Nasrani',
// // //             location: 'Sharm',
// // //             imageUrl: 'assets/sharm/ras_nasrani.jpg',
// // //             rating: 4.7,
// // //             reviewCount: 600,
// // //             description: 'Popular diving spot...',
// // //             facilities: ['Diving', 'Beach'],
// // //             price: 300,
// // //             latitude: 28.0276,
// // //             longitude: 34.4429), // Example Coords
// // //         PlaceData(
// // //             name: 'Saint Catherine',
// // //             location: 'Sinai',
// // //             imageUrl: 'assets/sharm/st_catherine.jpg',
// // //             rating: 4.7,
// // //             reviewCount: 750,
// // //             description: 'Historic monastery...',
// // //             facilities: ['Guide', 'Tickets'],
// // //             price: 500,
// // //             latitude: 28.5559,
// // //             longitude: 33.9761), // Example Coords
// // //       ];
// // //     }
// // //     // Fallback with default coordinates
// // //     return [
// // //       PlaceData(
// // //           name: 'Default Place',
// // //           location: country,
// // //           imageUrl: 'assets/images/placeholder.jpg',
// // //           rating: 4.0,
// // //           reviewCount: 10,
// // //           description: 'Default Description',
// // //           facilities: [],
// // //           price: 0,
// // //           latitude: 0.0,
// // //           longitude: 0.0)
// // //     ];
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     final List<PlaceData> places = _dummyPlaces;

// // //     return Scaffold(
// // //       backgroundColor: Colors.white,
// // //       appBar: AppBar(
// // //         backgroundColor: Colors.white,
// // //         elevation: 0,
// // //         leading: IconButton(
// // //           icon: const Icon(Icons.arrow_back, color: Colors.black),
// // //           onPressed: () => Navigator.pop(context),
// // //         ),
// // //         title: Text(
// // //           country,
// // //           style:
// // //               const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
// // //         ),
// // //         centerTitle: true,
// // //       ),
// // //       body: places.isEmpty
// // //           ? const Center(child: Text('No places found for this country.'))
// // //           : ListView.builder(
// // //               itemCount: places.length,
// // //               padding: const EdgeInsets.all(12.0),
// // //               itemBuilder: (context, index) {
// // //                 final place = places[index];
// // //                 return _buildPlaceCard(context, place); // تمرير بيانات المكان
// // //               },
// // //             ),
// // //     );
// // //   }

// // //   // --- ويدجت بناء بطاقة المكان ---
// // //   Widget _buildPlaceCard(BuildContext context, PlaceData place) {
// // //     const double borderRadiusValue = 12.0;

// // //     return Card(
// // //       margin: const EdgeInsets.only(bottom: 16.0),
// // //       shape: RoundedRectangleBorder(
// // //         borderRadius: BorderRadius.circular(borderRadiusValue),
// // //       ),
// // //       elevation: 3,
// // //       clipBehavior: Clip.antiAlias,
// // //       child: InkWell(
// // //         onTap: () {
// // //           // --- الانتقال إلى شاشة التفاصيل مع تمرير بيانات PlaceData بالكامل ---
// // //           Navigator.push(
// // //             context,
// // //             MaterialPageRoute(
// // //               builder: (context) =>
// // //                   PlaceDetailsScreen(place: place), // تمرير الكائن بالكامل
// // //             ),
// // //           );
// // //         },
// // //         child: Column(
// // //           // Changed from Stack to Column to match Explore Egypt design
// // //           crossAxisAlignment: CrossAxisAlignment.start,
// // //           children: [
// // //             // --- صورة المكان مع النص المتراكب ---
// // //             Stack(
// // //               alignment: Alignment.bottomLeft,
// // //               children: [
// // //                 ClipRRect(
// // //                   // Keep ClipRRect for rounded corners if needed for image only
// // //                   borderRadius: BorderRadius.circular(
// // //                       borderRadiusValue), // Apply to image container
// // //                   child: Image.asset(
// // //                     place.imageUrl, // Use the actual image URL
// // //                     height: 200, // Adjust height as needed
// // //                     width: double.infinity,
// // //                     fit: BoxFit.cover,
// // //                     errorBuilder: (context, error, stackTrace) => Container(
// // //                       height: 200,
// // //                       color: Colors.grey[200],
// // //                       child: const Center(
// // //                           child: Icon(Icons.image_not_supported,
// // //                               color: Colors.grey, size: 40)),
// // //                     ),
// // //                   ),
// // //                 ),
// // //                 // Gradient Overlay
// // //                 Positioned.fill(
// // //                   child: Container(
// // //                     decoration: BoxDecoration(
// // //                       borderRadius: BorderRadius.circular(borderRadiusValue),
// // //                       gradient: LinearGradient(
// // //                         colors: [
// // //                           Colors.black.withOpacity(0.6),
// // //                           Colors.transparent
// // //                         ],
// // //                         begin: Alignment.bottomCenter,
// // //                         end: Alignment.center,
// // //                       ),
// // //                     ),
// // //                   ),
// // //                 ),
// // //                 // Text Overlay
// // //                 Padding(
// // //                   padding: const EdgeInsets.all(12.0),
// // //                   child: Column(
// // //                     crossAxisAlignment: CrossAxisAlignment.start,
// // //                     mainAxisSize: MainAxisSize.min,
// // //                     children: [
// // //                       Text(
// // //                         place.name,
// // //                         style: const TextStyle(
// // //                             fontSize: 18,
// // //                             fontWeight: FontWeight.bold,
// // //                             color: Colors.white,
// // //                             shadows: [
// // //                               Shadow(
// // //                                   blurRadius: 2.0,
// // //                                   color: Colors.black54,
// // //                                   offset: Offset(1, 1))
// // //                             ]),
// // //                       ),
// // //                       const SizedBox(height: 2),
// // //                       // Assuming 'propertyCount' exists in your PlaceData model, if not adjust accordingly
// // //                       // Text( '${place.propertyCount} properties', style: const TextStyle( fontSize: 13, color: Colors.white, shadows: [ Shadow(blurRadius: 2.0, color: Colors.black45, offset: Offset(1, 1)) ] ), ),
// // //                     ],
// // //                   ),
// // //                 ),
// // //               ],
// // //             ),
// // //             // --- الجزء السفلي (كان موجودًا في _buildPlaceCard الأصلي، تم حذفه لمطابقة التصميم الجديد) ---
// // //             // Padding(...)
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }

// // // // import 'package:flutter/material.dart';

// // // // class ExploreScreen extends StatelessWidget {
// // // //   final String country;

// // // //   const ExploreScreen({super.key, required this.country});

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return MaterialApp(
// // // //       home: Scaffold(
// // // //         backgroundColor: Colors.white,
// // // //         appBar: AppBar(
// // // //           backgroundColor: Colors.white,
// // // //           elevation: 0,
// // // //           leading: IconButton(
// // // //             icon: const Icon(Icons.arrow_back, color: Colors.black),
// // // //             onPressed: () => Navigator.pop(context),
// // // //           ),
// // // //           title: Text(
// // // //             country,
// // // //             style: const TextStyle(color: Colors.black),
// // // //           ),
// // // //         ),
// // // //         body: SingleChildScrollView(
// // // //           child: Column(
// // // //             children: [
// // // //               Container(
// // // //                 width: 375,
// // // //                 height: 812,
// // // //                 clipBehavior: Clip.antiAlias,
// // // //                 decoration: const BoxDecoration(color: Colors.white),
// // // //                 child: const Stack(
// // // //                   children: [
// // // //                     // Your provided widget tree here
// // // //                     // ... (copy all the Positioned widgets from your code)
// // // //                   ],
// // // //                 ),
// // // //               ),
// // // //             ],
// // // //           ),
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }
// // // // }
// // import 'package:flutter/material.dart';
// // import 'package:travella/services/api/api_endpoints.dart';
// // import 'package:travella/services/api/dio_client.dart';
// // import 'place_details_screen.dart';

// // class ExploreScreen extends StatefulWidget {
// //   final String country;

// //   const ExploreScreen({super.key, required this.country});

// //   @override
// //   State<ExploreScreen> createState() => _ExploreScreenState();
// // }

// // class _ExploreScreenState extends State<ExploreScreen> {
// //   late Future<List<Activity>> _placesFuture;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _placesFuture = _fetchPlaces();
// //   }

// //   Future<List<Activity>> _fetchPlaces() async {
// //     try {
// //       final dioClient = DioClient();
// //       final response = await dioClient.getActivitiesByLocation(widget.country);
// //       return response.map((json) => Activity.fromJson(json)).toList();
// //     } catch (e) {
// //       print('Error fetching places: $e');
// //       return [];
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.white,
// //       appBar: AppBar(
// //         backgroundColor: Colors.white,
// //         elevation: 0,
// //         leading: IconButton(
// //           icon: const Icon(Icons.arrow_back, color: Colors.black),
// //           onPressed: () => Navigator.pop(context),
// //         ),
// //         title: Text(
// //           widget.country,
// //           style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
// //         ),
// //         centerTitle: true,
// //       ),
// //       body: FutureBuilder<List<Activity>>(
// //         future: _placesFuture,
// //         builder: (context, snapshot) {
// //           if (snapshot.connectionState == ConnectionState.waiting) {
// //             return const Center(child: CircularProgressIndicator());
// //           }
// //           if (snapshot.hasError || snapshot.data == null || snapshot.data!.isEmpty) {
// //             return const Center(child: Text('No places found for this country.'));
// //           }
// //           final places = snapshot.data!;
// //           return ListView.builder(
// //             itemCount: places.length,
// //             padding: const EdgeInsets.all(12.0),
// //             itemBuilder: (context, index) {
// //               final place = places[index];
// //               return _buildPlaceCard(context, place);
// //             },
// //           );
// //         },
// //       ),
// //     );
// //   }

// //   // --- ويدجت بناء بطاقة المكان ---
// //   Widget _buildPlaceCard(BuildContext context, Activity place) {
// //     const double borderRadiusValue = 12.0;

// //     return Card(
// //       margin: const EdgeInsets.only(bottom: 16.0),
// //       shape: RoundedRectangleBorder(
// //         borderRadius: BorderRadius.circular(borderRadiusValue),
// //       ),
// //       elevation: 3,
// //       clipBehavior: Clip.antiAlias,
// //       child: InkWell(
// //         onTap: () {
// //           Navigator.push(
// //             context,
// //             MaterialPageRoute(
// //               builder: (context) => PlaceDetailsScreen(place: place),
// //             ),
// //           );
// //         },
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             Stack(
// //               alignment: Alignment.bottomLeft,
// //               children: [
// //                 ClipRRect(
// //                   borderRadius: BorderRadius.circular(borderRadiusValue),
// //                   child: Image.network(
// //                     '${ApiEndpoints.imageUrlBase}/${place.imageUrls.isNotEmpty ? place.imageUrls[0] : 'assets/images/placeholder.jpg'}',
// //                     height: 200,
// //                     width: double.infinity,
// //                     fit: BoxFit.cover,
// //                     errorBuilder: (context, error, stackTrace) => Container(
// //                       height: 200,
// //                       color: Colors.grey[200],
// //                       child: const Center(
// //                           child: Icon(Icons.image_not_supported,
// //                               color: Colors.grey, size: 40)),
// //                     ),
// //                   ),
// //                 ),
// //                 Positioned.fill(
// //                   child: Container(
// //                     decoration: BoxDecoration(
// //                       borderRadius: BorderRadius.circular(borderRadiusValue),
// //                       gradient: LinearGradient(
// //                         colors: [
// //                           Colors.black.withOpacity(0.6),
// //                           Colors.transparent
// //                         ],
// //                         begin: Alignment.bottomCenter,
// //                         end: Alignment.center,
// //                       ),
// //                     ),
// //                   ),
// //                 ),
// //                 Padding(
// //                   padding: const EdgeInsets.all(12.0),
// //                   child: Column(
// //                     crossAxisAlignment: CrossAxisAlignment.start,
// //                     mainAxisSize: MainAxisSize.min,
// //                     children: [
// //                       Text(
// //                         place.name,
// //                         style: const TextStyle(
// //                             fontSize: 18,
// //                             fontWeight: FontWeight.bold,
// //                             color: Colors.white,
// //                             shadows: [
// //                               Shadow(
// //                                   blurRadius: 2.0,
// //                                   color: Colors.black54,
// //                                   offset: Offset(1, 1))
// //                             ]),
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// // // نموذج افتراضي لـ Activity (قم بتعديله حسب الحاجة)
// // class Activity {
// //   final int id;
// //   final String name;
// //   final String location;
// //   final String description;
// //   final double rate;
// //   final int duration;
// //   final List<String> imageUrls;

// //   Activity({
// //     required this.id,
// //     required this.name,
// //     required this.location,
// //     required this.description,
// //     required this.rate,
// //     required this.duration,
// //     required this.imageUrls,
// //   });

// //   factory Activity.fromJson(Map<String, dynamic> json) {
// //     return Activity(
// //       id: json['id'],
// //       name: json['name'],
// //       location: json['location'],
// //       description: json['description'],
// //       rate: (json['rate'] as num).toDouble(),
// //       duration: json['duration'],
// //       imageUrls: List<String>.from(json['imageUrls'] ?? []),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:travella/services/api/dio_client.dart';
// import 'place_details_screen.dart';
// import 'package:travella/models/activity.dart';

// class ExploreScreen extends StatefulWidget {
//   final String country;

//   const ExploreScreen({super.key, required this.country});

//   @override
//   State<ExploreScreen> createState() => _ExploreScreenState();
// }

// class _ExploreScreenState extends State<ExploreScreen> {
//   late Future<List<Activity>> _placesFuture;

//   @override
//   void initState() {
//     super.initState();
//     _placesFuture = _fetchPlaces();
//   }

//   Future<List<Activity>> _fetchPlaces() async {
//     try {
//       final dioClient = DioClient();
//       final response = await dioClient.getActivitiesByLocation(widget.country);
//       return response.map((json) => Activity.fromJson(json)).toList();
//     } catch (e) {
//       print('Error fetching places: $e');
//       return [];
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () => Navigator.pop(context),
//         ),
//         title: Text(
//           widget.country,
//           style:
//               const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
//         ),
//         centerTitle: true,
//       ),
//       body: FutureBuilder<List<Activity>>(
//         future: _placesFuture,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           }
//           if (snapshot.hasError ||
//               snapshot.data == null ||
//               snapshot.data!.isEmpty) {
//             return const Center(
//                 child: Text('No places found for this country.'));
//           }
//           final places = snapshot.data!;
//           return ListView.builder(
//             itemCount: places.length,
//             padding: const EdgeInsets.all(12.0),
//             itemBuilder: (context, index) {
//               final place = places[index];
//               return _buildPlaceCard(context, place);
//             },
//           );
//         },
//       ),
//     );
//   }

//   Widget _buildPlaceCard(BuildContext context, Activity place) {
//     const double borderRadiusValue = 12.0;

//     return Card(
//       margin: const EdgeInsets.only(bottom: 16.0),
//       shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(borderRadiusValue)),
//       elevation: 3,
//       clipBehavior: Clip.antiAlias,
//       child: InkWell(
//         onTap: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => PlaceDetailsScreen(place: place),
//             ),
//           );
//         },
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Stack(
//               alignment: Alignment.bottomLeft,
//               children: [
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(borderRadiusValue),
//                   child: Image.asset(
//                     place.imageUrls.isNotEmpty
//                         ? place.imageUrls[0]
//                         : 'assets/images/placeholder.jpg',
//                     height: 200,
//                     width: double.infinity,
//                     fit: BoxFit.cover,
//                     errorBuilder: (context, error, stackTrace) => Container(
//                       height: 200,
//                       color: Colors.grey[200],
//                       child: const Center(
//                         child: Icon(Icons.image_not_supported,
//                             color: Colors.grey, size: 40),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Positioned.fill(
//                   child: Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(borderRadiusValue),
//                       gradient: LinearGradient(
//                         colors: [
//                           Colors.black.withOpacity(0.6),
//                           Colors.transparent
//                         ],
//                         begin: Alignment.bottomCenter,
//                         end: Alignment.center,
//                       ),
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(12.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Text(
//                         place.name,
//                         style: const TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                           shadows: [
//                             Shadow(
//                                 blurRadius: 2.0,
//                                 color: Colors.black54,
//                                 offset: Offset(1, 1))
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:apptravella/models/explore_city.dart'; // Updated model
import 'package:apptravella/services/api/api_endpoints.dart';
import 'package:apptravella/services/api/dio_client.dart';
import 'package:apptravella/screens/city_attractions_screen.dart';

class ExploreEgyptScreen extends StatefulWidget {
  const ExploreEgyptScreen({super.key});

  @override
  State<ExploreEgyptScreen> createState() => _ExploreEgyptScreenState();
}

class _ExploreEgyptScreenState extends State<ExploreEgyptScreen> {
  late Future<List<ExploreCity>> _citiesFuture;

  @override
  void initState() {
    super.initState();
    _citiesFuture = _fetchExploreEgyptData();
  }

  Future<List<ExploreCity>> _fetchExploreEgyptData() async {
    try {
      final dioClient = DioClient();
      final responseData = await dioClient.getExploreEgypt();
      return responseData.map((json) => ExploreCity.fromJson(json)).toList();
    } catch (e) {
      print('Error fetching Explore Egypt data: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to load data: $e')),
        );
      }
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title:
            const Text('Explore Egypt', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {
            _citiesFuture = _fetchExploreEgyptData();
          });
        },
        child: FutureBuilder<List<ExploreCity>>(
          future: _citiesFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(
                  child: Text('An error occurred: ${snapshot.error}'));
            }
            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No cities found to explore.'));
            }

            final cities = snapshot.data!;
            return ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: cities.length,
              itemBuilder: (context, index) {
                return _buildCityCard(context, cities[index]);
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildCityCard(BuildContext context, ExploreCity city) {
    final String imageUrl = city.imageUrls.isNotEmpty
        ? '${ApiEndpoints.imageUrlBase}/${city.imageUrls.first}'
        : '';

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      clipBehavior: Clip.antiAlias,
      elevation: 4,
      shadowColor: Colors.black.withOpacity(0.2),
      child: InkWell(
        onTap: () {
          final justCityName = city.cityName.split(',').first;
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  CityAttractionsScreen(cityName: justCityName),
            ),
          );
        },
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            if (imageUrl.isNotEmpty)
              Image.network(
                imageUrl,
                height: 220,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    _buildImagePlaceholder(),
                loadingBuilder: (context, child, progress) {
                  if (progress == null) return child;
                  return _buildImagePlaceholder();
                },
              )
            else
              _buildImagePlaceholder(),
            Container(
              height: 220,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Colors.black.withOpacity(0.7), Colors.transparent],
                  stops: const [0.0, 0.5],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    city.cityName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      shadows: [Shadow(blurRadius: 2, color: Colors.black54)],
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${city.activityCount} activities',
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImagePlaceholder() {
    return Container(
      height: 220,
      width: double.infinity,
      color: Colors.grey[300],
      child: const Center(
        child: Icon(
          Icons.image_not_supported_outlined,
          color: Colors.grey,
          size: 50,
        ),
      ),
    );
  }
}
