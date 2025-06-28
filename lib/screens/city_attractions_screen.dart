// // // // import 'package:flutter/material.dart';
// // // // // استيراد شاشة تفاصيل المكان الفعلي
// // // // import 'place_details_screen.dart';
// // // // // استيراد نموذج PlaceData من ملف التفاصيل

// // // // // --- نموذج بيانات المعلم (مع إضافة الإحداثيات) ---
// // // // class Attraction {
// // // //   final String name;
// // // //   final String location;
// // // //   final String imageUrl;
// // // //   final double rating;
// // // //   final int reviewCount;
// // // //   final String description;
// // // //   final List<String> facilities;
// // // //   final double price;
// // // //   // --- !!! إضافة خطوط الطول والعرض هنا أيضًا !!! ---
// // // //   final double latitude;
// // // //   final double longitude;

// // // //   Attraction({
// // // //     required this.name,
// // // //     required this.location,
// // // //     required this.imageUrl,
// // // //     required this.rating,
// // // //     required this.reviewCount,
// // // //     required this.description,
// // // //     required this.facilities,
// // // //     required this.price,
// // // //     // --- !!! يجب توفير الإحداثيات عند إنشاء كائن Attraction !!! ---
// // // //     required this.latitude,
// // // //     required this.longitude,
// // // //   });

// // // //   // --- دالة التحويل الآن ستعمل بشكل صحيح ---
// // // //   //PlaceData toPlaceData() {
// // // //     return PlaceData(
// // // //       name: name,
// // // //       location: location,
// // // //       imageUrl: imageUrl,
// // // //       rating: rating,
// // // //       reviewCount: reviewCount,
// // // //       description: description,
// // // //       facilities: facilities,
// // // //       price: price,
// // // //       latitude: latitude, // <-- تمرير خط العرض
// // // //       longitude: longitude, // <-- تمرير خط الطول
// // // //     );
// // // //   }
// // // // }
// // // // // --- نهاية تعريف Attraction ---

// // // // class CityAttractionsScreen extends StatefulWidget {
// // // //   final String cityName;

// // // //   const CityAttractionsScreen({
// // // //     super.key,
// // // //     required this.cityName,
// // // //   });

// // // //   @override
// // // //   State<CityAttractionsScreen> createState() => _CityAttractionsScreenState();
// // // // }

// // // // class _CityAttractionsScreenState extends State<CityAttractionsScreen> {
// // // //   List<Attraction> attractions = [];
// // // //   final String placeholderAttractionImage = 'assets/hotel.jpeg';

// // // //   @override
// // // //   void initState() {
// // // //     super.initState();
// // // //     _loadAttractions();
// // // //   }

// // // //   // --- تحميل بيانات وهمية للمعالم (مع إضافة الإحداثيات) ---
// // // //   void _loadAttractions() {
// // // //     print("Loading attractions for city: ${widget.cityName}");
// // // //     // --- !!! إضافة قيم وهمية لـ latitude و longitude !!! ---
// // // //     // (احصل على إحداثيات تقريبية من خرائط جوجل لهذه الأماكن)
// // // //     if (widget.cityName.toLowerCase() == 'giza') {
// // // //       attractions = [
// // // //         Attraction(
// // // //             name: 'Pyramids of Giza',
// // // //             location: 'Giza, Egypt',
// // // //             imageUrl: placeholderAttractionImage,
// // // //             rating: 4.9,
// // // //             reviewCount: 5500,
// // // //             description:
// // // //                 'The iconic Pyramids of Giza and the Sphinx, ancient wonders of the world.',
// // // //             facilities: ['Tickets', 'Camel Ride', 'Guide', 'Souvenirs'],
// // // //             price: 750,
// // // //             latitude: 29.9792,
// // // //             longitude: 31.1342), // <-- Example Coords
// // // //         Attraction(
// // // //             name: 'The Sphinx',
// // // //             location: 'Giza, Egypt',
// // // //             imageUrl: placeholderAttractionImage,
// // // //             rating: 4.8,
// // // //             reviewCount: 4800,
// // // //             description:
// // // //                 'The colossal limestone statue with the body of a lion and the head of a human.',
// // // //             facilities: ['Viewing Area', 'Guide'],
// // // //             price: 100,
// // // //             latitude: 29.9753,
// // // //             longitude: 31.1376), // <-- Example Coords
// // // //         Attraction(
// // // //             name: 'Solar Boat Museum',
// // // //             location: 'Giza, Egypt',
// // // //             imageUrl: placeholderAttractionImage,
// // // //             rating: 4.5,
// // // //             reviewCount: 1200,
// // // //             description:
// // // //                 'Houses the remarkably preserved Khufu ship, an ancient Egyptian vessel.',
// // // //             facilities: ['Tickets', 'Museum Shop'],
// // // //             price: 200,
// // // //             latitude: 29.9779,
// // // //             longitude: 31.1338), // <-- Example Coords
// // // //         Attraction(
// // // //             name: 'Sound and Light Show',
// // // //             location: 'Giza, Egypt',
// // // //             imageUrl: placeholderAttractionImage,
// // // //             rating: 4.3,
// // // //             reviewCount: 950,
// // // //             description:
// // // //                 'Experience the history of the pyramids narrated against the backdrop of the illuminated monuments.',
// // // //             facilities: ['Tickets', 'Seating'],
// // // //             price: 400,
// // // //             latitude: 29.9764,
// // // //             longitude: 31.1313), // <-- Example Coords (near pyramids)
// // // //       ];
// // // //     } else if (widget.cityName.toLowerCase() == 'hurghada') {
// // // //       attractions = [
// // // //         Attraction(
// // // //             name: 'Grand Aquarium',
// // // //             location: 'Hurghada, Egypt',
// // // //             imageUrl: placeholderAttractionImage,
// // // //             rating: 4.5,
// // // //             reviewCount: 315,
// // // //             description: 'Explore marine life...',
// // // //             facilities: ['Tickets', 'Cafe', 'Gift Shop'],
// // // //             price: 500,
// // // //             latitude: 27.1793,
// // // //             longitude: 33.8014), // <-- Example Coords
// // // //         Attraction(
// // // //             name: 'Makadi Water World',
// // // //             location: 'Hurghada, Egypt',
// // // //             imageUrl: placeholderAttractionImage,
// // // //             rating: 4.9,
// // // //             reviewCount: 450,
// // // //             description: 'Exciting water slides...',
// // // //             facilities: ['Tickets', 'Food', 'Pool', 'Lockers'],
// // // //             price: 800,
// // // //             latitude: 26.9911,
// // // //             longitude: 33.9032), // <-- Example Coords
// // // //         Attraction(
// // // //             name: 'Mini Egypt Park',
// // // //             location: 'Hurghada, Egypt',
// // // //             imageUrl: placeholderAttractionImage,
// // // //             rating: 4.8,
// // // //             reviewCount: 290,
// // // //             description: 'See Egypt in miniature...',
// // // //             facilities: ['Tickets', 'Guide'],
// // // //             price: 400,
// // // //             latitude: 26.9887,
// // // //             longitude: 33.8962), // <-- Example Coords
// // // //         Attraction(
// // // //             name: 'Orange Bay Island',
// // // //             location: 'Hurghada, Egypt',
// // // //             imageUrl: placeholderAttractionImage,
// // // //             rating: 4.9,
// // // //             reviewCount: 510,
// // // //             description: 'Relax on the beautiful beach...',
// // // //             facilities: ['Boat Trip', 'Food', 'Snorkeling'],
// // // //             price: 1200,
// // // //             latitude: 27.2000,
// // // //             longitude: 33.8500), // <-- Approx Coords for an island
// // // //         Attraction(
// // // //             name: 'Dolphin World',
// // // //             location: 'Hurghada, Egypt',
// // // //             imageUrl: placeholderAttractionImage,
// // // //             rating: 4.2,
// // // //             reviewCount: 400,
// // // //             description: 'Enjoy dolphin shows and interactions.',
// // // //             facilities: ['Tickets', 'Shows'],
// // // //             price: 600,
// // // //             latitude: 27.0017,
// // // //             longitude: 33.8960), // <-- Example Coords
// // // //       ];
// // // //     } else if (widget.cityName.toLowerCase() == 'sharm el sheikh') {
// // // //       attractions = [
// // // //         Attraction(
// // // //             name: 'Ras Muhammad National Park',
// // // //             location: 'Sharm El Sheikh, Egypt',
// // // //             imageUrl: placeholderAttractionImage,
// // // //             rating: 4.9,
// // // //             reviewCount: 1100,
// // // //             description:
// // // //                 'A protected area renowned for its stunning coral reefs, diverse marine life, and diving spots.',
// // // //             facilities: ['Snorkeling', 'Diving', 'Boat Trip', 'Visitor Center'],
// // // //             price: 1500,
// // // //             latitude: 27.7278,
// // // //             longitude: 34.2475), // <-- Example Coords
// // // //         Attraction(
// // // //             name: 'Naama Bay',
// // // //             location: 'Sharm El Sheikh, Egypt',
// // // //             imageUrl: placeholderAttractionImage,
// // // //             rating: 4.0,
// // // //             reviewCount: 950,
// // // //             description:
// // // //                 'A lively hub with numerous cafes, restaurants, shops, and a vibrant nightlife along the promenade.',
// // // //             facilities: ['Cafe', 'Shops', 'Beach', 'Nightlife'],
// // // //             price: 0,
// // // //             latitude: 27.9127,
// // // //             longitude: 34.3276), // <-- Example Coords
// // // //         Attraction(
// // // //             name: 'Tiran Island',
// // // //             location: 'Sharm El Sheikh, Egypt',
// // // //             imageUrl: placeholderAttractionImage,
// // // //             rating: 4.8,
// // // //             reviewCount: 800,
// // // //             description: 'Famous for its pristine dive sites...',
// // // //             facilities: ['Boat Trip', 'Diving', 'Snorkeling'],
// // // //             price: 1300,
// // // //             latitude: 27.9500,
// // // //             longitude: 34.5667), // <-- Approx Coords
// // // //         Attraction(
// // // //             name: 'Old Market (Sharm Old Town)',
// // // //             location: 'Sharm El Sheikh, Egypt',
// // // //             imageUrl: placeholderAttractionImage,
// // // //             rating: 4.2,
// // // //             reviewCount: 650,
// // // //             description:
// // // //                 'A traditional market offering local crafts, souvenirs, spices, and authentic Egyptian food.',
// // // //             facilities: ['Shops', 'Food Stalls', 'Cafe'],
// // // //             price: 0,
// // // //             latitude: 27.8657,
// // // //             longitude: 34.3018), // <-- Example Coords
// // // //       ];
// // // //     } else {
// // // //       // Default fallback
// // // //       attractions = [
// // // //         Attraction(
// // // //             name: 'Attraction in ${widget.cityName} 1',
// // // //             location: widget.cityName,
// // // //             imageUrl: placeholderAttractionImage,
// // // //             rating: 4.0,
// // // //             reviewCount: 10,
// // // //             description: 'Default description 1',
// // // //             facilities: ['Default'],
// // // //             price: 100,
// // // //             latitude: 0.0,
// // // //             longitude: 0.0),
// // // //         Attraction(
// // // //             name: 'Attraction in ${widget.cityName} 2',
// // // //             location: widget.cityName,
// // // //             imageUrl: placeholderAttractionImage,
// // // //             rating: 4.2,
// // // //             reviewCount: 15,
// // // //             description: 'Default description 2',
// // // //             facilities: ['Default'],
// // // //             price: 150,
// // // //             latitude: 0.0,
// // // //             longitude: 0.0),
// // // //       ];
// // // //     }
// // // //     setState(() {});
// // // //   }

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Scaffold(
// // // //       appBar: AppBar(
// // // //         title: Text(widget.cityName),
// // // //         leading: IconButton(
// // // //           icon: const Icon(Icons.arrow_back),
// // // //           onPressed: () => Navigator.of(context).pop(),
// // // //         ),
// // // //         backgroundColor: Colors.white,
// // // //         foregroundColor: Colors.black,
// // // //         elevation: 1,
// // // //       ),
// // // //       backgroundColor: Colors.grey[100],
// // // //       body: ListView.builder(
// // // //         padding: const EdgeInsets.all(16.0),
// // // //         itemCount: attractions.length,
// // // //         itemBuilder: (context, index) {
// // // //           final attraction = attractions[index];
// // // //           return _buildAttractionCard(context, attraction); // تمرير context
// // // //         },
// // // //       ),
// // // //     );
// // // //   }

// // // //   // --- ويدجت بناء بطاقة المعلم ---
// // // //   Widget _buildAttractionCard(BuildContext context, Attraction attraction) {
// // // //     return Card(
// // // //       margin: const EdgeInsets.only(bottom: 16.0),
// // // //       elevation: 2.0,
// // // //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
// // // //       clipBehavior: Clip.antiAlias,
// // // //       child: InkWell(
// // // //         borderRadius: BorderRadius.circular(15.0),
// // // //         onTap: () {
// // // //           print("Tapped on attraction: ${attraction.name}");
// // // //           Navigator.push(
// // // //             context,
// // // //             MaterialPageRoute(
// // // //               // تمرير PlaceData بعد تحويله
// // // //               builder: (context) =>
// // // //                   PlaceDetailsScreen(place: attraction.toPlaceData()),
// // // //             ),
// // // //           );
// // // //         },
// // // //         child: Column(
// // // //           /* ... (نفس كود تصميم البطاقة) ... */
// // // //           crossAxisAlignment: CrossAxisAlignment.start,
// // // //           children: [
// // // //             ClipRRect(
// // // //               borderRadius:
// // // //                   const BorderRadius.vertical(top: Radius.circular(15.0)),
// // // //               child: Image.asset(
// // // //                 attraction.imageUrl,
// // // //                 height: 180,
// // // //                 width: double.infinity,
// // // //                 fit: BoxFit.cover,
// // // //                 errorBuilder: (ctx, err, st) => Container(
// // // //                   height: 180,
// // // //                   width: double.infinity,
// // // //                   color: Colors.grey[300],
// // // //                   child:
// // // //                       const Icon(Icons.landscape, color: Colors.grey, size: 50),
// // // //                 ),
// // // //               ),
// // // //             ),
// // // //             Padding(
// // // //               padding: const EdgeInsets.all(12.0),
// // // //               child: Column(
// // // //                 crossAxisAlignment: CrossAxisAlignment.start,
// // // //                 children: [
// // // //                   Row(
// // // //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // //                     children: [
// // // //                       Expanded(
// // // //                         child: Text(
// // // //                           attraction.name,
// // // //                           style: const TextStyle(
// // // //                             fontSize: 18,
// // // //                             fontWeight: FontWeight.bold,
// // // //                           ),
// // // //                           maxLines: 1,
// // // //                           overflow: TextOverflow.ellipsis,
// // // //                         ),
// // // //                       ),
// // // //                       Row(
// // // //                         children: [
// // // //                           Icon(Icons.star, color: Colors.amber[600], size: 18),
// // // //                           const SizedBox(width: 4),
// // // //                           Text(
// // // //                             attraction.rating.toString(),
// // // //                             style: const TextStyle(
// // // //                               fontSize: 14,
// // // //                               fontWeight: FontWeight.bold,
// // // //                             ),
// // // //                           ),
// // // //                         ],
// // // //                       ),
// // // //                     ],
// // // //                   ),
// // // //                   const SizedBox(height: 4),
// // // //                   Row(
// // // //                     children: [
// // // //                       Icon(Icons.location_on_outlined,
// // // //                           color: Colors.grey[600], size: 16),
// // // //                       const SizedBox(width: 4),
// // // //                       Expanded(
// // // //                         child: Text(
// // // //                           attraction.location,
// // // //                           style: TextStyle(
// // // //                             fontSize: 13,
// // // //                             color: Colors.grey[700],
// // // //                           ),
// // // //                           maxLines: 1,
// // // //                           overflow: TextOverflow.ellipsis,
// // // //                         ),
// // // //                       ),
// // // //                     ],
// // // //                   ),
// // // //                   const SizedBox(height: 12),
// // // //                   Align(
// // // //                     alignment: Alignment.centerRight,
// // // //                     child: Text(
// // // //                       'See details +',
// // // //                       style: TextStyle(
// // // //                           fontSize: 12,
// // // //                           color: Theme.of(context).primaryColor,
// // // //                           fontWeight: FontWeight.w500),
// // // //                     ),
// // // //                   )
// // // //                 ],
// // // //               ),
// // // //             ),
// // // //           ],
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }
// // // // // }
// // // // import 'package:flutter/material.dart';
// // // // import 'package:travella/services/api/dio_client.dart';
// // // // import 'place_details_screen.dart';
// // // // import 'package:travella/models/attraction.dart'; // استيراد Attraction

// // // // class CityAttractionsScreen extends StatefulWidget {
// // // //   final String cityName;

// // // //   const CityAttractionsScreen({
// // // //     super.key,
// // // //     required this.cityName,
// // // //   });

// // // //   @override
// // // //   State<CityAttractionsScreen> createState() => _CityAttractionsScreenState();
// // // // }

// // // // class _CityAttractionsScreenState extends State<CityAttractionsScreen> {
// // // //   late Future<List<Attraction>> _attractionsFuture;
// // // //   final String placeholderAttractionImage = 'assets/hotel.jpeg';

// // // //   @override
// // // //   void initState() {
// // // //     super.initState();
// // // //     _attractionsFuture = _fetchAttractions();
// // // //   }

// // // //   Future<List<Attraction>> _fetchAttractions() async {
// // // //     try {
// // // //       final dioClient = DioClient();
// // // //       final response = await dioClient.getActivitiesByLocation(widget.cityName);
// // // //       return response.map((json) => Attraction.fromJson(json)).toList();
// // // //     } catch (e) {
// // // //       print('Error fetching attractions: $e');
// // // //       return [];
// // // //     }
// // // //   }

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Scaffold(
// // // //       appBar: AppBar(
// // // //         title: Text(widget.cityName),
// // // //         leading: IconButton(
// // // //           icon: const Icon(Icons.arrow_back),
// // // //           onPressed: () => Navigator.of(context).pop(),
// // // //         ),
// // // //         backgroundColor: Colors.white,
// // // //         foregroundColor: Colors.black,
// // // //         elevation: 1,
// // // //       ),
// // // //       backgroundColor: Colors.grey[100],
// // // //       body: FutureBuilder<List<Attraction>>(
// // // //         future: _attractionsFuture,
// // // //         builder: (context, snapshot) {
// // // //           if (snapshot.connectionState == ConnectionState.waiting) {
// // // //             return const Center(child: CircularProgressIndicator());
// // // //           }
// // // //           if (snapshot.hasError || snapshot.data == null || snapshot.data!.isEmpty) {
// // // //             return const Center(child: Text('No attractions found for this city.'));
// // // //           }
// // // //           final attractions = snapshot.data!;
// // // //           return ListView.builder(
// // // //             padding: const EdgeInsets.all(16.0),
// // // //             itemCount: attractions.length,
// // // //             itemBuilder: (context, index) {
// // // //               final attraction = attractions[index];
// // // //               return _buildAttractionCard(context, attraction);
// // // //             },
// // // //           );
// // // //         },
// // // //       ),
// // // //     );
// // // //   }

// // // //   Widget _buildAttractionCard(BuildContext context, Attraction attraction) {
// // // //     return Card(
// // // //       margin: const EdgeInsets.only(bottom: 16.0),
// // // //       elevation: 2.0,
// // // //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
// // // //       clipBehavior: Clip.antiAlias,
// // // //       child: InkWell(
// // // //         borderRadius: BorderRadius.circular(15.0),
// // // //         onTap: () {
// // // //           print("Tapped on attraction: ${attraction.name}");
// // // //           Navigator.push(
// // // //             context,
// // // //             MaterialPageRoute(
// // // //               builder: (context) => PlaceDetailsScreen(place: attraction.toPlaceData()),
// // // //             ),
// // // //           );
// // // //         },
// // // //         child: Column(
// // // //           crossAxisAlignment: CrossAxisAlignment.start,
// // // //           children: [
// // // //             ClipRRect(
// // // //               borderRadius: const BorderRadius.vertical(top: Radius.circular(15.0)),
// // // //               child: Image.asset(
// // // //                 attraction.imageUrl,
// // // //                 height: 180,
// // // //                 width: double.infinity,
// // // //                 fit: BoxFit.cover,
// // // //                 errorBuilder: (ctx, err, st) => Container(
// // // //                   height: 180,
// // // //                   width: double.infinity,
// // // //                   color: Colors.grey[300],
// // // //                   child: const Icon(Icons.landscape, color: Colors.grey, size: 50),
// // // //                 ),
// // // //               ),
// // // //             ),
// // // //             Padding(
// // // //               padding: const EdgeInsets.all(12.0),
// // // //               child: Column(
// // // //                 crossAxisAlignment: CrossAxisAlignment.start,
// // // //                 children: [
// // // //                   Row(
// // // //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // //                     children: [
// // // //                       Expanded(
// // // //                         child: Text(
// // // //                           attraction.name,
// // // //                           style: const TextStyle(
// // // //                             fontSize: 18,
// // // //                             fontWeight: FontWeight.bold,
// // // //                           ),
// // // //                           maxLines: 1,
// // // //                           overflow: TextOverflow.ellipsis,
// // // //                         ),
// // // //                       ),
// // // //                       Row(
// // // //                         children: [
// // // //                           Icon(Icons.star, color: Colors.amber[600], size: 18),
// // // //                           const SizedBox(width: 4),
// // // //                           Text(
// // // //                             attraction.rating.toString(),
// // // //                             style: const TextStyle(
// // // //                               fontSize: 14,
// // // //                               fontWeight: FontWeight.bold,
// // // //                             ),
// // // //                           ),
// // // //                         ],
// // // //                       ),
// // // //                     ],
// // // //                   ),
// // // //                   const SizedBox(height: 4),
// // // //                   Row(
// // // //                     children: [
// // // //                       Icon(Icons.location_on_outlined, color: Colors.grey[600], size: 16),
// // // //                       const SizedBox(width: 4),
// // // //                       Expanded(
// // // //                         child: Text(
// // // //                           attraction.location,
// // // //                           style: TextStyle(
// // // //                             fontSize: 13,
// // // //                             color: Colors.grey[700],
// // // //                           ),
// // // //                           maxLines: 1,
// // // //                           overflow: TextOverflow.ellipsis,
// // // //                         ),
// // // //                       ),
// // // //                     ],
// // // //                   ),
// // // //                   const SizedBox(height: 12),
// // // //                   Align(
// // // //                     alignment: Alignment.centerRight,
// // // //                     child: Text(
// // // //                       'See details +',
// // // //                       style: TextStyle(
// // // //                         fontSize: 12,
// // // //                         color: Theme.of(context).primaryColor,
// // // //                         fontWeight: FontWeight.w500,
// // // //                       ),
// // // //                     ),
// // // //                   )
// // // //                 ],
// // // //               ),
// // // //             ),
// // // //           ],
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }
// // // // }
// // // import 'package:flutter/material.dart';
// // // import 'package:travella/services/api/dio_client.dart';
// // // import 'place_details_screen.dart';
// // // import 'package:travella/models/attraction.dart';

// // // class CityAttractionsScreen extends StatefulWidget {
// // //   final String cityName;

// // //   const CityAttractionsScreen({super.key, required this.cityName});

// // //   @override
// // //   State<CityAttractionsScreen> createState() => _CityAttractionsScreenState();
// // // }

// // // class _CityAttractionsScreenState extends State<CityAttractionsScreen> {
// // //   late Future<List<Attraction>> _attractionsFuture;
// // //   final String placeholderAttractionImage = 'assets/hotel.jpeg';

// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     _attractionsFuture = _fetchAttractions();
// // //   }

// // //   Future<List<Attraction>> _fetchAttractions() async {
// // //     try {
// // //       final dioClient = DioClient();
// // //       final response = await dioClient.getActivitiesByLocation(widget.cityName);
// // //       return response.map((json) => Attraction.fromJson(json)).toList();
// // //     } catch (e) {
// // //       print('Error fetching attractions: $e');
// // //       return [];
// // //     }
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: Text(widget.cityName),
// // //         leading: IconButton(
// // //           icon: const Icon(Icons.arrow_back),
// // //           onPressed: () => Navigator.of(context).pop(),
// // //         ),
// // //         backgroundColor: Colors.white,
// // //         foregroundColor: Colors.black,
// // //         elevation: 1,
// // //       ),
// // //       backgroundColor: Colors.grey[100],
// // //       body: FutureBuilder<List<Attraction>>(
// // //         future: _attractionsFuture,
// // //         builder: (context, snapshot) {
// // //           if (snapshot.connectionState == ConnectionState.waiting) {
// // //             return const Center(child: CircularProgressIndicator());
// // //           }
// // //           if (snapshot.hasError ||
// // //               snapshot.data == null ||
// // //               snapshot.data!.isEmpty) {
// // //             return const Center(
// // //                 child: Text('No attractions found for this city.'));
// // //           }
// // //           final attractions = snapshot.data!;
// // //           return ListView.builder(
// // //             padding: const EdgeInsets.all(16.0),
// // //             itemCount: attractions.length,
// // //             itemBuilder: (context, index) {
// // //               final attraction = attractions[index];
// // //               return _buildAttractionCard(context, attraction);
// // //             },
// // //           );
// // //         },
// // //       ),
// // //     );
// // //   }

// // //   Widget _buildAttractionCard(BuildContext context, Attraction attraction) {
// // //     return Card(
// // //       margin: const EdgeInsets.only(bottom: 16.0),
// // //       elevation: 2.0,
// // //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
// // //       clipBehavior: Clip.antiAlias,
// // //       child: InkWell(
// // //         borderRadius: BorderRadius.circular(15.0),
// // //         onTap: () {
// // //           print("Tapped on attraction: ${attraction.name}");
// // //           Navigator.push(
// // //             context,
// // //             MaterialPageRoute(
// // //               builder: (context) =>
// // //                   PlaceDetailsScreen(place: attraction.toActivity()),
// // //             ),
// // //           );
// // //         },
// // //         child: Column(
// // //           crossAxisAlignment: CrossAxisAlignment.start,
// // //           children: [
// // //             ClipRRect(
// // //               borderRadius:
// // //                   const BorderRadius.vertical(top: Radius.circular(15.0)),
// // //               child: Image.asset(
// // //                 attraction.imageUrl,
// // //                 height: 180,
// // //                 width: double.infinity,
// // //                 fit: BoxFit.cover,
// // //                 errorBuilder: (ctx, err, st) => Container(
// // //                   height: 180,
// // //                   width: double.infinity,
// // //                   color: Colors.grey[300],
// // //                   child:
// // //                       const Icon(Icons.landscape, color: Colors.grey, size: 50),
// // //                 ),
// // //               ),
// // //             ),
// // //             Padding(
// // //               padding: const EdgeInsets.all(12.0),
// // //               child: Column(
// // //                 crossAxisAlignment: CrossAxisAlignment.start,
// // //                 children: [
// // //                   Row(
// // //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // //                     children: [
// // //                       Expanded(
// // //                         child: Text(
// // //                           attraction.name,
// // //                           style: const TextStyle(
// // //                             fontSize: 18,
// // //                             fontWeight: FontWeight.bold,
// // //                           ),
// // //                           maxLines: 1,
// // //                           overflow: TextOverflow.ellipsis,
// // //                         ),
// // //                       ),
// // //                       Row(
// // //                         children: [
// // //                           Icon(Icons.star, color: Colors.amber[600], size: 18),
// // //                           const SizedBox(width: 4),
// // //                           Text(
// // //                             attraction.rating.toString(),
// // //                             style: const TextStyle(
// // //                               fontSize: 14,
// // //                               fontWeight: FontWeight.bold,
// // //                             ),
// // //                           ),
// // //                         ],
// // //                       ),
// // //                     ],
// // //                   ),
// // //                   const SizedBox(height: 4),
// // //                   Row(
// // //                     children: [
// // //                       Icon(Icons.location_on_outlined,
// // //                           color: Colors.grey[600], size: 16),
// // //                       const SizedBox(width: 4),
// // //                       Expanded(
// // //                         child: Text(
// // //                           attraction.location,
// // //                           style: TextStyle(
// // //                             fontSize: 13,
// // //                             color: Colors.grey[700],
// // //                           ),
// // //                           maxLines: 1,
// // //                           overflow: TextOverflow.ellipsis,
// // //                         ),
// // //                       ),
// // //                     ],
// // //                   ),
// // //                   const SizedBox(height: 12),
// // //                   Align(
// // //                     alignment: Alignment.centerRight,
// // //                     child: Text(
// // //                       'See details +',
// // //                       style: TextStyle(
// // //                         fontSize: 12,
// // //                         color: Theme.of(context).primaryColor,
// // //                         fontWeight: FontWeight.w500,
// // //                       ),
// // //                     ),
// // //                   ),
// // //                 ],
// // //               ),
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }
// // import 'package:flutter/material.dart';
// // import 'package:travella/services/api/dio_client.dart';
// // import 'place_details_screen.dart';
// // import 'package:travella/models/attraction.dart';

// // class CityAttractionsScreen extends StatefulWidget {
// //   final String cityName;

// //   const CityAttractionsScreen({super.key, required this.cityName});

// //   @override
// //   State<CityAttractionsScreen> createState() => _CityAttractionsScreenState();
// // }

// // class _CityAttractionsScreenState extends State<CityAttractionsScreen> {
// //   late Future<List<Attraction>> _attractionsFuture;
// //   final String baseImageUrl = 'http://travella.runasp.net';

// //   @override
// //   void initState() {
// //     super.initState();
// //     _attractionsFuture = _fetchAttractions();
// //   }

// //   Future<List<Attraction>> _fetchAttractions() async {
// //     try {
// //       final dioClient = DioClient();
// //       final response = await dioClient.getActivitiesByLocation(widget.cityName);
// //       return response.map((json) => Attraction.fromJson(json)).toList();
// //     } catch (e) {
// //       print('Error fetching attractions: $e');
// //       return [];
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text(widget.cityName),
// //         leading: IconButton(
// //           icon: const Icon(Icons.arrow_back),
// //           onPressed: () => Navigator.of(context).pop(),
// //         ),
// //         backgroundColor: Colors.white,
// //         foregroundColor: Colors.black,
// //         elevation: 1,
// //       ),
// //       backgroundColor: Colors.grey[100],
// //       body: FutureBuilder<List<Attraction>>(
// //         future: _attractionsFuture,
// //         builder: (context, snapshot) {
// //           if (snapshot.connectionState == ConnectionState.waiting) {
// //             return const Center(child: CircularProgressIndicator());
// //           }
// //           if (snapshot.hasError ||
// //               snapshot.data == null ||
// //               snapshot.data!.isEmpty) {
// //             return const Center(
// //                 child: Text('No attractions found for this city.'));
// //           }
// //           final attractions = snapshot.data!;
// //           return ListView.builder(
// //             padding: const EdgeInsets.all(16.0),
// //             itemCount: attractions.length,
// //             itemBuilder: (context, index) {
// //               final attraction = attractions[index];
// //               return _buildAttractionCard(context, attraction);
// //             },
// //           );
// //         },
// //       ),
// //     );
// //   }

// //   Widget _buildAttractionCard(BuildContext context, Attraction attraction) {
// //     // Use the first image URL if available, prepend base URL
// //     final String imageUrl;
// //     if (attraction.imageUrl.isNotEmpty) {
// //       imageUrl = '$baseImageUrl/${attraction.imageUrl}';
// //     } else {
// //       imageUrl = 'assets/hotel.jpeg';
// //     } // Fallback to placeholder

// //     return Card(
// //       margin: const EdgeInsets.only(bottom: 16.0),
// //       elevation: 2.0,
// //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
// //       clipBehavior: Clip.antiAlias,
// //       child: InkWell(
// //         borderRadius: BorderRadius.circular(15.0),
// //         onTap: () {
// //           print("Tapped on attraction: ${attraction.name}");
// //           Navigator.push(
// //             context,
// //             MaterialPageRoute(
// //               builder: (context) =>
// //                   PlaceDetailsScreen(place: attraction.toActivity()),
// //             ),
// //           );
// //         },
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             ClipRRect(
// //               borderRadius:
// //                   const BorderRadius.vertical(top: Radius.circular(15.0)),
// //               child: imageUrl.startsWith('http')
// //                   ? Image.network(
// //                       imageUrl,
// //                       height: 180,
// //                       width: double.infinity,
// //                       fit: BoxFit.cover,
// //                       errorBuilder: (ctx, err, st) => Container(
// //                         height: 180,
// //                         width: double.infinity,
// //                         color: Colors.grey[300],
// //                         child: const Icon(Icons.landscape,
// //                             color: Colors.grey, size: 50),
// //                       ),
// //                       loadingBuilder: (ctx, child, progress) {
// //                         if (progress == null) return child;
// //                         return const Center(child: CircularProgressIndicator());
// //                       },
// //                     )
// //                   : Image.asset(
// //                       imageUrl,
// //                       height: 180,
// //                       width: double.infinity,
// //                       fit: BoxFit.cover,
// //                       errorBuilder: (ctx, err, st) => Container(
// //                         height: 180,
// //                         width: double.infinity,
// //                         color: Colors.grey[300],
// //                         child: const Icon(Icons.landscape,
// //                             color: Colors.grey, size: 50),
// //                       ),
// //                     ),
// //             ),
// //             Padding(
// //               padding: const EdgeInsets.all(12.0),
// //               child: Column(
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 children: [
// //                   Row(
// //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                     children: [
// //                       Expanded(
// //                         child: Text(
// //                           attraction.name,
// //                           style: const TextStyle(
// //                             fontSize: 18,
// //                             fontWeight: FontWeight.bold,
// //                           ),
// //                           maxLines: 1,
// //                           overflow: TextOverflow.ellipsis,
// //                         ),
// //                       ),
// //                       Row(
// //                         children: [
// //                           Icon(Icons.star, color: Colors.amber[600], size: 18),
// //                           const SizedBox(width: 4),
// //                           Text(
// //                             attraction.name.toString(),
// //                             style: const TextStyle(
// //                               fontSize: 14,
// //                               fontWeight: FontWeight.bold,
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //                     ],
// //                   ),
// //                   const SizedBox(height: 4),
// //                   Row(
// //                     children: [
// //                       Icon(Icons.location_on_outlined,
// //                           color: Colors.grey[600], size: 16),
// //                       const SizedBox(width: 4),
// //                       Expanded(
// //                         child: Text(
// //                           attraction.location,
// //                           style: TextStyle(
// //                             fontSize: 13,
// //                             color: Colors.grey[700],
// //                           ),
// //                           maxLines: 1,
// //                           overflow: TextOverflow.ellipsis,
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                   const SizedBox(height: 12),
// //                   Align(
// //                     alignment: Alignment.centerRight,
// //                     child: Text(
// //                       'See details +',
// //                       style: TextStyle(
// //                         fontSize: 12,
// //                         color: Theme.of(context).primaryColor,
// //                         fontWeight: FontWeight.w500,
// //                       ),
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:travella/services/api/dio_client.dart';
// import 'place_details_screen.dart';
// import 'package:travella/models/attraction.dart';

// class CityAttractionsScreen extends StatefulWidget {
//   final String cityName;

//   const CityAttractionsScreen({super.key, required this.cityName});

//   @override
//   State<CityAttractionsScreen> createState() => _CityAttractionsScreenState();
// }

// class _CityAttractionsScreenState extends State<CityAttractionsScreen> {
//   late Future<List<Attraction>> _attractionsFuture;
//   final String baseImageUrl = 'http://travella.runasp.net';

//   @override
//   void initState() {
//     super.initState();
//     _attractionsFuture = _fetchAttractions();
//   }

//   Future<List<Attraction>> _fetchAttractions() async {
//     try {
//       final dioClient = DioClient();
//       final response = await dioClient.getActivitiesByLocation(widget.cityName);
//       return response.map((json) => Attraction.fromJson(json)).toList();
//     } catch (e) {
//       print('Error fetching attractions: $e');
//       return [];
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.cityName),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//         backgroundColor: Colors.white,
//         foregroundColor: Colors.black,
//         elevation: 1,
//       ),
//       backgroundColor: Colors.grey[100],
//       body: FutureBuilder<List<Attraction>>(
//         future: _attractionsFuture,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           }
//           if (snapshot.hasError ||
//               snapshot.data == null ||
//               snapshot.data!.isEmpty) {
//             return const Center(
//                 child: Text('No attractions found for this city.'));
//           }
//           final attractions = snapshot.data!;
//           return ListView.builder(
//             padding: const EdgeInsets.all(16.0),
//             itemCount: attractions.length,
//             itemBuilder: (context, index) {
//               final attraction = attractions[index];
//               return _buildAttractionCard(context, attraction);
//             },
//           );
//         },
//       ),
//     );
//   }

//   Widget _buildAttractionCard(BuildContext context, Attraction attraction) {
//     // استخدام أول صورة من قائمة imageUrls إذا كانت موجودة، مع إضافة الـ URL الأساسي
//     final String imageUrl = attraction.imageUrls.isNotEmpty
//         ? '$baseImageUrl/${attraction.imageUrls.first.replaceAll(' ', '')}'
//         : 'assets/hotel.jpeg'; // صورة افتراضية إذا لم تكن هناك صور

//     return Card(
//       margin: const EdgeInsets.only(bottom: 16.0),
//       elevation: 2.0,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
//       clipBehavior: Clip.antiAlias,
//       child: InkWell(
//         borderRadius: BorderRadius.circular(15.0),
//         onTap: () {
//           print("Tapped on attraction: ${attraction.name}");
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) =>
//                   PlaceDetailsScreen(place: attraction.toActivity()),
//             ),
//           );
//         },
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             ClipRRect(
//               borderRadius:
//                   const BorderRadius.vertical(top: Radius.circular(15.0)),
//               child: imageUrl.startsWith('http')
//                   ? Image.network(
//                       imageUrl,
//                       height: 180,
//                       width: double.infinity,
//                       fit: BoxFit.cover,
//                       errorBuilder: (ctx, err, st) => Container(
//                         height: 180,
//                         width: double.infinity,
//                         color: Colors.grey[300],
//                         child: const Icon(Icons.landscape,
//                             color: Colors.grey, size: 50),
//                       ),
//                       loadingBuilder: (ctx, child, progress) {
//                         if (progress == null) return child;
//                         return const Center(child: CircularProgressIndicator());
//                       },
//                     )
//                   : Image.asset(
//                       imageUrl,
//                       height: 180,
//                       width: double.infinity,
//                       fit: BoxFit.cover,
//                       errorBuilder: (ctx, err, st) => Container(
//                         height: 180,
//                         width: double.infinity,
//                         color: Colors.grey[300],
//                         child: const Icon(Icons.landscape,
//                             color: Colors.grey, size: 50),
//                       ),
//                     ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(12.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Expanded(
//                         child: Text(
//                           attraction.name,
//                           style: const TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                           ),
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ),
//                       Row(
//                         children: [
//                           Icon(Icons.star, color: Colors.amber[600], size: 18),
//                           const SizedBox(width: 4),
//                           Text(
//                             attraction.name
//                                 .toString(), // تصحيح لعرض التقييم الصحيح
//                             style: const TextStyle(
//                               fontSize: 14,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 4),
//                   Row(
//                     children: [
//                       Icon(Icons.location_on_outlined,
//                           color: Colors.grey[600], size: 16),
//                       const SizedBox(width: 4),
//                       Expanded(
//                         child: Text(
//                           attraction.location,
//                           style: TextStyle(
//                             fontSize: 13,
//                             color: Colors.grey[700],
//                           ),
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 12),
//                   Align(
//                     alignment: Alignment.centerRight,
//                     child: Text(
//                       'See details +',
//                       style: TextStyle(
//                         fontSize: 12,
//                         color: Theme.of(context).primaryColor,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:apptravella/models/attraction.dart';
import 'package:apptravella/services/api/api_endpoints.dart'; // استيراد للوصول إلى الرابط الأساسي
import 'package:apptravella/services/api/dio_client.dart';
import 'place_details_screen.dart';

class CityAttractionsScreen extends StatefulWidget {
  final String cityName;

  const CityAttractionsScreen({super.key, required this.cityName});

  @override
  State<CityAttractionsScreen> createState() => _CityAttractionsScreenState();
}

class _CityAttractionsScreenState extends State<CityAttractionsScreen> {
  late Future<List<Attraction>> _attractionsFuture;

  @override
  void initState() {
    super.initState();
    _attractionsFuture = _fetchAttractions();
  }

  Future<List<Attraction>> _fetchAttractions() async {
    try {
      final dioClient = DioClient();
      final response = await dioClient.getActivitiesByLocation(widget.cityName);
      return response.map((json) => Attraction.fromJson(json)).toList();
    } catch (e) {
      print('Error fetching attractions: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to load attractions: $e')),
        );
      }
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.cityName),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      backgroundColor: Colors.grey[100],
      body: FutureBuilder<List<Attraction>>(
        future: _attractionsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError ||
              !snapshot.hasData ||
              snapshot.data!.isEmpty) {
            return const Center(
                child: Text('No attractions found for this city.'));
          }
          final attractions = snapshot.data!;
          return ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: attractions.length,
            itemBuilder: (context, index) {
              final attraction = attractions[index];
              return _buildAttractionCard(context, attraction);
            },
          );
        },
      ),
    );
  }

  Widget _buildAttractionCard(BuildContext context, Attraction attraction) {
    // =================== التعديل الأول: تصحيح رابط الصورة ===================
    String networkImageUrl = '';
    if (attraction.imageUrls.isNotEmpty) {
      String relativePath = attraction.imageUrls.first;
      // إزالة الشرطة المائلة من بداية المسار إذا كانت موجودة لمنع الـ double slash
      if (relativePath.startsWith('/')) {
        relativePath = relativePath.substring(1);
      }
      networkImageUrl = '${ApiEndpoints.imageUrlBase}/$relativePath';
    }
    // =======================================================================

    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      elevation: 2.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        borderRadius: BorderRadius.circular(15.0),
        onTap: () {
          print("Tapped on attraction: ${attraction.name}");
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  PlaceDetailsScreen(place: attraction.toActivity()),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // استخدام الصورة من الشبكة فقط إذا كان الرابط موجوداً
            if (networkImageUrl.isNotEmpty)
              Image.network(
                networkImageUrl,
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (ctx, err, st) => _buildImagePlaceholder(),
                loadingBuilder: (ctx, child, progress) {
                  if (progress == null) return child;
                  // يمكنك إظهار placeholder أثناء التحميل أيضاً
                  return _buildImagePlaceholder();
                },
              )
            else
              // إظهار placeholder إذا لم تكن هناك صورة
              _buildImagePlaceholder(),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          attraction.name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.amber[600], size: 18),
                          const SizedBox(width: 4),
                          // ============ التعديل الثاني: تصحيح عرض التقييم ============
                          Text(
                            attraction.name.toString(), // تم التصحيح هنا
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          // ==========================================================
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.location_on_outlined,
                          color: Colors.grey[600], size: 16),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          attraction.location,
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey[700],
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'See details +',
                      style: TextStyle(
                        fontSize: 12,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w500,
                      ),
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

  // ويدجت لعرضها في حالة الخطأ أو أثناء التحميل
  Widget _buildImagePlaceholder() {
    return Container(
      height: 180,
      width: double.infinity,
      color: Colors.grey[300],
      child: Icon(Icons.image_search, color: Colors.grey[600], size: 50),
    );
  }
}
