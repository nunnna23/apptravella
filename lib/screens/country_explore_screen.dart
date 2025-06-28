// // // // import 'package:flutter/material.dart';
// // // // // --- !!! استيراد شاشة عرض معالم المدينة !!! ---
// // // // import 'city_attractions_screen.dart'; // تأكد من اسم الملف الصحيح

// // // // // --- نموذج بيانات المدينة (يبقى كما هو) ---
// // // // class CityData {
// // // //   final String name;
// // // //   final int propertyCount;
// // // //   final String imageUrl;

// // // //   CityData({
// // // //     required this.name,
// // // //     required this.propertyCount,
// // // //     required this.imageUrl,
// // // //   });
// // // // }
// // // // // --- نهاية نموذج بيانات المدينة ---

// // // // // --- !!! تغيير اسم الكلاس !!! ---
// // // // class ExploreByCityScreen extends StatefulWidget {
// // // //   final String countryName; // لا تزال تستقبل اسم البلد

// // // //   const ExploreByCityScreen({
// // // //     // --- تغيير اسم المُنشئ ---
// // // //     super.key,
// // // //     required this.countryName,
// // // //   });

// // // //   @override
// // // //   // --- !!! تغيير اسم الـ State !!! ---
// // // //   State<ExploreByCityScreen> createState() => _ExploreByCityScreenState();
// // // // }

// // // // // --- !!! تغيير اسم الـ State !!! ---
// // // // class _ExploreByCityScreenState extends State<ExploreByCityScreen> {
// // // //   List<CityData> cities = [];
// // // //   final String placeholderImageUrl = 'assets/hotel.jpeg';

// // // //   @override
// // // //   void initState() {
// // // //     super.initState();
// // // //     _loadCities();
// // // //   }

// // // //   // --- دالة تحميل بيانات المدن الوهمية (تبقى كما هي) ---
// // // //   void _loadCities() {
// // // //     List<CityData> loadedCities = [];
// // // //     // ... (نفس كود تحميل المدن الوهمية بناءً على widget.countryName)
// // // //     if (widget.countryName.toLowerCase() == 'egypt') {
// // // //       loadedCities = [
// // // //         CityData(
// // // //             name: 'Hurghada',
// // // //             propertyCount: 752,
// // // //             imageUrl: placeholderImageUrl),
// // // //         CityData(
// // // //             name: 'Giza', propertyCount: 752, imageUrl: placeholderImageUrl),
// // // //         CityData(
// // // //             name: 'Sharm El Sheikh',
// // // //             propertyCount: 608,
// // // //             imageUrl: placeholderImageUrl),
// // // //         CityData(
// // // //             name: 'Luxor', propertyCount: 410, imageUrl: placeholderImageUrl),
// // // //         CityData(
// // // //             name: 'Aswan', propertyCount: 320, imageUrl: placeholderImageUrl),
// // // //         CityData(
// // // //             name: 'Alexandria',
// // // //             propertyCount: 550,
// // // //             imageUrl: placeholderImageUrl),
// // // //         CityData(
// // // //             name: 'Hurghada (Repeat)',
// // // //             propertyCount: 752,
// // // //             imageUrl: placeholderImageUrl),
// // // //         CityData(
// // // //             name: 'Giza (Repeat)',
// // // //             propertyCount: 752,
// // // //             imageUrl: placeholderImageUrl),
// // // //       ];
// // // //     } else if (widget.countryName.toLowerCase() == 'france') {
// // // //       loadedCities = [/* ... بيانات فرنسا ... */];
// // // //     } else if (widget.countryName.toLowerCase() == 'ksa') {
// // // //       loadedCities = [/* ... بيانات السعودية ... */];
// // // //     } else {
// // // //       loadedCities = [/* ... بيانات افتراضية ... */];
// // // //     }
// // // //     setState(() {
// // // //       cities = loadedCities;
// // // //     });
// // // //   }

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Scaffold(
// // // //       backgroundColor: Colors.white,
// // // //       appBar: AppBar(
// // // //         backgroundColor: Colors.white,
// // // //         elevation: 0,
// // // //         leading: IconButton(
// // // //           icon: const Icon(Icons.arrow_back, color: Colors.black),
// // // //           onPressed: () => Navigator.of(context).pop(),
// // // //         ),
// // // //         // --- !!! تغيير العنوان ليطابق التصميم !!! ---
// // // //         title: Text(
// // // //           'Explore ${widget.countryName}',
// // // //           style: const TextStyle(
// // // //               color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
// // // //         ),
// // // //         centerTitle: true,
// // // //       ),
// // // //       body: ListView.builder(
// // // //         padding: const EdgeInsets.all(16.0),
// // // //         itemCount: cities.length,
// // // //         itemBuilder: (context, index) {
// // // //           final city = cities[index];
// // // //           // *** استدعاء بناء بطاقة المدينة ***
// // // //           return _buildCityCard(context, city);
// // // //         },
// // // //       ),
// // // //     );
// // // //   }

// // // //   // --- ويدجت مساعدة لبناء بطاقة المدينة ---
// // // //   Widget _buildCityCard(BuildContext context, CityData city) {
// // // //     const double borderRadiusValue = 12.0;

// // // //     return Card(
// // // //       margin: const EdgeInsets.only(bottom: 16.0),
// // // //       shape: RoundedRectangleBorder(
// // // //         borderRadius: BorderRadius.circular(borderRadiusValue),
// // // //       ),
// // // //       elevation: 4,
// // // //       clipBehavior: Clip.antiAlias,
// // // //       child: InkWell(
// // // //         onTap: () {
// // // //           // --- !!! الانتقال إلى شاشة معالم المدينة !!! ---
// // // //           print('Tapped on ${city.name}, navigating to CityAttractionsScreen');
// // // //           Navigator.push(
// // // //             context,
// // // //             MaterialPageRoute(
// // // //               // --- !!! تمرير اسم المدينة للشاشة الجديدة !!! ---
// // // //               builder: (context) => CityAttractionsScreen(cityName: city.name),
// // // //             ),
// // // //           );
// // // //           // --- !!! نهاية الانتقال !!! ---
// // // //         },
// // // //         child: Stack(
// // // //           /* ... (نفس كود Stack الخاص بالبطاقة) ... */
// // // //           alignment: Alignment.bottomLeft,
// // // //           children: [
// // // //             Image.asset(
// // // //               city.imageUrl,
// // // //               height: 200,
// // // //               width: double.infinity,
// // // //               fit: BoxFit.cover,
// // // //               errorBuilder: (context, error, stackTrace) => Container(
// // // //                 height: 200,
// // // //                 color: Colors.grey[300],
// // // //                 child: const Center(
// // // //                     child: Icon(Icons.image_not_supported,
// // // //                         color: Colors.grey, size: 50)),
// // // //               ),
// // // //             ),
// // // //             Positioned.fill(
// // // //               child: Container(
// // // //                 decoration: BoxDecoration(
// // // //                   borderRadius: BorderRadius.circular(borderRadiusValue),
// // // //                   gradient: LinearGradient(
// // // //                     colors: [
// // // //                       Colors.black.withOpacity(0.6),
// // // //                       Colors.black.withOpacity(0.0),
// // // //                     ],
// // // //                     begin: Alignment.bottomCenter,
// // // //                     end: Alignment.center,
// // // //                   ),
// // // //                 ),
// // // //               ),
// // // //             ),
// // // //             Padding(
// // // //               padding: const EdgeInsets.all(12.0),
// // // //               child: Column(
// // // //                 crossAxisAlignment: CrossAxisAlignment.start,
// // // //                 mainAxisSize: MainAxisSize.min,
// // // //                 children: [
// // // //                   Text(
// // // //                     city.name,
// // // //                     style: const TextStyle(
// // // //                         fontSize: 18,
// // // //                         fontWeight: FontWeight.bold,
// // // //                         color: Colors.white,
// // // //                         shadows: [
// // // //                           Shadow(
// // // //                               blurRadius: 2.0,
// // // //                               color: Colors.black54,
// // // //                               offset: Offset(1, 1))
// // // //                         ]),
// // // //                   ),
// // // //                   const SizedBox(height: 2),
// // // //                   Text(
// // // //                     '${city.propertyCount} properties',
// // // //                     style: const TextStyle(
// // // //                         fontSize: 13,
// // // //                         color: Colors.white,
// // // //                         shadows: [
// // // //                           Shadow(
// // // //                               blurRadius: 2.0,
// // // //                               color: Colors.black45,
// // // //                               offset: Offset(1, 1))
// // // //                         ]),
// // // //                   ),
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
// // // import 'city_attractions_screen.dart'; // تأكد من اسم الملف الصحيح
// // // import 'package:travella/services/api/dio_client.dart'; // استيراد DioClient

// // // // --- نموذج بيانات المدينة (يبقى كما هو) ---
// // // class CityData {
// // //   final String name;
// // //   final int propertyCount;
// // //   final String imageUrl;

// // //   CityData({
// // //     required this.name,
// // //     required this.propertyCount,
// // //     required this.imageUrl,
// // //   });
// // // }
// // // // --- نهاية نموذج بيانات المدينة ---

// // // class ExploreByCityScreen extends StatefulWidget {
// // //   final String countryName; // لا تزال تستقبل اسم البلد

// // //   const ExploreByCityScreen({
// // //     super.key,
// // //     required this.countryName,
// // //   });

// // //   @override
// // //   State<ExploreByCityScreen> createState() => _ExploreByCityScreenState();
// // // }

// // // class _ExploreByCityScreenState extends State<ExploreByCityScreen> {
// // //   late Future<List<CityData>> _citiesFuture; // استخدام Future لجلب البيانات
// // //   final String placeholderImageUrl = 'assets/hotel.jpeg';

// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     _citiesFuture = _fetchCities();
// // //   }

// // //   // --- دالة جلب بيانات المدن من الـ API ---
// // //   Future<List<CityData>> _fetchCities() async {
// // //     try {
// // //       final dioClient = DioClient();
// // //       // افتراض أن هناك نهاية مثل /api/Cities/ByCountry/{countryName}
// // //       final response = await dioClient.getCitiesByCountry(widget.countryName);
// // //       return response.map((json) => CityData(
// // //             name: json['name'] as String? ?? 'Unknown City',
// // //             propertyCount: json['propertyCount'] as int? ?? 0,
// // //             imageUrl: json['imageUrl'] as String? ?? placeholderImageUrl,
// // //           )).toList();
// // //     } catch (e) {
// // //       print('Error fetching cities: $e');
// // //       // إرجاع بيانات وهمية كبديل في حالة الخطأ
// // //       if (widget.countryName.toLowerCase() == 'egypt') {
// // //         return [
// // //           CityData(name: 'Hurghada', propertyCount: 752, imageUrl: placeholderImageUrl),
// // //           CityData(name: 'Giza', propertyCount: 752, imageUrl: placeholderImageUrl),
// // //           CityData(name: 'Sharm El Sheikh', propertyCount: 608, imageUrl: placeholderImageUrl),
// // //           CityData(name: 'Luxor', propertyCount: 410, imageUrl: placeholderImageUrl),
// // //           CityData(name: 'Aswan', propertyCount: 320, imageUrl: placeholderImageUrl),
// // //           CityData(name: 'Alexandria', propertyCount: 550, imageUrl: placeholderImageUrl),
// // //           CityData(name: 'Hurghada (Repeat)', propertyCount: 752, imageUrl: placeholderImageUrl),
// // //           CityData(name: 'Giza (Repeat)', propertyCount: 752, imageUrl: placeholderImageUrl),
// // //         ];
// // //       } else if (widget.countryName.toLowerCase() == 'france') {
// // //         return [/* ... بيانات فرنسا ... */];
// // //       } else if (widget.countryName.toLowerCase() == 'ksa') {
// // //         return [/* ... بيانات السعودية ... */];
// // //       } else {
// // //         return [/* ... بيانات افتراضية ... */];
// // //       }
// // //     }
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       backgroundColor: Colors.white,
// // //       appBar: AppBar(
// // //         backgroundColor: Colors.white,
// // //         elevation: 0,
// // //         leading: IconButton(
// // //           icon: const Icon(Icons.arrow_back, color: Colors.black),
// // //           onPressed: () => Navigator.of(context).pop(),
// // //         ),
// // //         title: Text(
// // //           'Explore ${widget.countryName}',
// // //           style: const TextStyle(
// // //             color: Colors.black,
// // //             fontSize: 18,
// // //             fontWeight: FontWeight.bold,
// // //           ),
// // //         ),
// // //         centerTitle: true,
// // //       ),
// // //       body: FutureBuilder<List<CityData>>(
// // //         future: _citiesFuture,
// // //         builder: (context, snapshot) {
// // //           if (snapshot.connectionState == ConnectionState.waiting) {
// // //             return const Center(child: CircularProgressIndicator());
// // //           }
// // //           if (snapshot.hasError || snapshot.data == null || snapshot.data!.isEmpty) {
// // //             return const Center(child: Text('No cities found for this country.'));
// // //           }
// // //           final cities = snapshot.data!;
// // //           return ListView.builder(
// // //             padding: const EdgeInsets.all(16.0),
// // //             itemCount: cities.length,
// // //             itemBuilder: (context, index) {
// // //               final city = cities[index];
// // //               return _buildCityCard(context, city);
// // //             },
// // //           );
// // //         },
// // //       ),
// // //     );
// // //   }

// // //   // --- ويدجت مساعدة لبناء بطاقة المدينة ---
// // //   Widget _buildCityCard(BuildContext context, CityData city) {
// // //     const double borderRadiusValue = 12.0;

// // //     return Card(
// // //       margin: const EdgeInsets.only(bottom: 16.0),
// // //       shape: RoundedRectangleBorder(
// // //         borderRadius: BorderRadius.circular(borderRadiusValue),
// // //       ),
// // //       elevation: 4,
// // //       clipBehavior: Clip.antiAlias,
// // //       child: InkWell(
// // //         onTap: () {
// // //           print('Tapped on ${city.name}, navigating to CityAttractionsScreen');
// // //           Navigator.push(
// // //             context,
// // //             MaterialPageRoute(
// // //               builder: (context) => CityAttractionsScreen(cityName: city.name),
// // //             ),
// // //           );
// // //         },
// // //         child: Stack(
// // //           alignment: Alignment.bottomLeft,
// // //           children: [
// // //             Image.asset(
// // //               city.imageUrl,
// // //               height: 200,
// // //               width: double.infinity,
// // //               fit: BoxFit.cover,
// // //               errorBuilder: (context, error, stackTrace) => Container(
// // //                 height: 200,
// // //                 color: Colors.grey[300],
// // //                 child: const Center(
// // //                   child: Icon(Icons.image_not_supported, color: Colors.grey, size: 50),
// // //                 ),
// // //               ),
// // //             ),
// // //             Positioned.fill(
// // //               child: Container(
// // //                 decoration: BoxDecoration(
// // //                   borderRadius: BorderRadius.circular(borderRadiusValue),
// // //                   gradient: LinearGradient(
// // //                     colors: [
// // //                       Colors.black.withOpacity(0.6),
// // //                       Colors.black.withOpacity(0.0),
// // //                     ],
// // //                     begin: Alignment.bottomCenter,
// // //                     end: Alignment.center,
// // //                   ),
// // //                 ),
// // //               ),
// // //             ),
// // //             Padding(
// // //               padding: const EdgeInsets.all(12.0),
// // //               child: Column(
// // //                 crossAxisAlignment: CrossAxisAlignment.start,
// // //                 mainAxisSize: MainAxisSize.min,
// // //                 children: [
// // //                   Text(
// // //                     city.name,
// // //                     style: const TextStyle(
// // //                       fontSize: 18,
// // //                       fontWeight: FontWeight.bold,
// // //                       color: Colors.white,
// // //                       shadows: [
// // //                         Shadow(
// // //                           blurRadius: 2.0,
// // //                           color: Colors.black54,
// // //                           offset: Offset(1, 1),
// // //                         )
// // //                       ],
// // //                     ),
// // //                   ),
// // //                   const SizedBox(height: 2),
// // //                   Text(
// // //                     '${city.propertyCount} properties',
// // //                     style: const TextStyle(
// // //                       fontSize: 13,
// // //                       color: Colors.white,
// // //                       shadows: [
// // //                         Shadow(
// // //                           blurRadius: 2.0,
// // //                           color: Colors.black45,
// // //                           offset: Offset(1, 1),
// // //                         )
// // //                       ],
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
// // import 'city_attractions_screen.dart';
// // import 'package:travella/models/city_data.dart';

// // class ExploreByCityScreen extends StatefulWidget {
// //   final String countryName;

// //   const ExploreByCityScreen({super.key, required this.countryName});

// //   @override
// //   State<ExploreByCityScreen> createState() => _ExploreByCityScreenState();
// // }

// // class _ExploreByCityScreenState extends State<ExploreByCityScreen> {
// //   late Future<List<CityData>> _citiesFuture;
// //   final String placeholderImageUrl = 'assets/hotel.jpeg';

// //   @override
// //   void initState() {
// //     super.initState();
// //     _citiesFuture = _fetchCities();
// //   }

// //   Future<List<CityData>> _fetchCities() async {
// //     try {
// //       final dioClient = DioClient();
// //       final response =
// //           await dioClient.getExploreEgypt(); // استخدام ExploreEgypt كبديل مؤقت
// //       return response.map((json) => CityData.fromJson(json)).toList();
// //     } catch (e) {
// //       print('Error fetching cities: $e');
// //       if (widget.countryName.toLowerCase() == 'egypt') {
// //         return [
// //           CityData(
// //               name: 'Hurghada',
// //               propertyCount: 18,
// //               imageUrl: placeholderImageUrl),
// //           CityData(
// //               name: 'Giza', propertyCount: 20, imageUrl: placeholderImageUrl),
// //           CityData(
// //               name: 'Sharm El Sheikh',
// //               propertyCount: 20,
// //               imageUrl: placeholderImageUrl),
// //           CityData(
// //               name: 'Luxor', propertyCount: 6, imageUrl: placeholderImageUrl),
// //           CityData(
// //               name: 'Aswan', propertyCount: 7, imageUrl: placeholderImageUrl),
// //           CityData(
// //               name: 'Alexandria',
// //               propertyCount: 3,
// //               imageUrl: placeholderImageUrl),
// //         ];
// //       }
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
// //           onPressed: () => Navigator.of(context).pop(),
// //         ),
// //         title: Text(
// //           'Explore ${widget.countryName}',
// //           style: const TextStyle(
// //             color: Colors.black,
// //             fontSize: 18,
// //             fontWeight: FontWeight.bold,
// //           ),
// //         ),
// //         centerTitle: true,
// //       ),
// //       body: FutureBuilder<List<CityData>>(
// //         future: _citiesFuture,
// //         builder: (context, snapshot) {
// //           if (snapshot.connectionState == ConnectionState.waiting) {
// //             return const Center(child: CircularProgressIndicator());
// //           }
// //           if (snapshot.hasError ||
// //               snapshot.data == null ||
// //               snapshot.data!.isEmpty) {
// //             return const Center(
// //                 child: Text('No cities found for this country.'));
// //           }
// //           final cities = snapshot.data!;
// //           return ListView.builder(
// //             padding: const EdgeInsets.all(16.0),
// //             itemCount: cities.length,
// //             itemBuilder: (context, index) {
// //               final city = cities[index];
// //               return _buildCityCard(context, city);
// //             },
// //           );
// //         },
// //       ),
// //     );
// //   }

// //   Widget _buildCityCard(BuildContext context, CityData city) {
// //     const double borderRadiusValue = 12.0;

// //     return Card(
// //       margin: const EdgeInsets.only(bottom: 16.0),
// //       shape: RoundedRectangleBorder(
// //           borderRadius: BorderRadius.circular(borderRadiusValue)),
// //       elevation: 4,
// //       clipBehavior: Clip.antiAlias,
// //       child: InkWell(
// //         onTap: () {
// //           print('Tapped on ${city.name}, navigating to CityAttractionsScreen');
// //           Navigator.push(
// //             context,
// //             MaterialPageRoute(
// //               builder: (context) => CityAttractionsScreen(cityName: city.name),
// //             ),
// //           );
// //         },
// //         child: Stack(
// //           alignment: Alignment.bottomLeft,
// //           children: [
// //             Image.asset(
// //               city.imageUrl,
// //               height: 200,
// //               width: double.infinity,
// //               fit: BoxFit.cover,
// //               errorBuilder: (context, error, stackTrace) => Container(
// //                 height: 200,
// //                 color: Colors.grey[300],
// //                 child: const Center(
// //                   child: Icon(Icons.image_not_supported,
// //                       color: Colors.grey, size: 50),
// //                 ),
// //               ),
// //             ),
// //             Positioned.fill(
// //               child: Container(
// //                 decoration: BoxDecoration(
// //                   borderRadius: BorderRadius.circular(borderRadiusValue),
// //                   gradient: LinearGradient(
// //                     colors: [
// //                       Colors.black.withOpacity(0.6),
// //                       Colors.black.withOpacity(0.0)
// //                     ],
// //                     begin: Alignment.bottomCenter,
// //                     end: Alignment.center,
// //                   ),
// //                 ),
// //               ),
// //             ),
// //             Padding(
// //               padding: const EdgeInsets.all(12.0),
// //               child: Column(
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 mainAxisSize: MainAxisSize.min,
// //                 children: [
// //                   Text(
// //                     city.name,
// //                     style: const TextStyle(
// //                       fontSize: 18,
// //                       fontWeight: FontWeight.bold,
// //                       color: Colors.white,
// //                       shadows: [
// //                         Shadow(
// //                             blurRadius: 2.0,
// //                             color: Colors.black54,
// //                             offset: Offset(1, 1))
// //                       ],
// //                     ),
// //                   ),
// //                   const SizedBox(height: 2),
// //                   Text(
// //                     '${city.propertyCount} activities',
// //                     style: const TextStyle(
// //                       fontSize: 13,
// //                       color: Colors.white,
// //                       shadows: [
// //                         Shadow(
// //                             blurRadius: 2.0,
// //                             color: Colors.black45,
// //                             offset: Offset(1, 1))
// //                       ],
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
// import 'package:travella/models/explore_city.dart'; // <--- 1. تم تغيير الموديل إلى الصحيح
// import 'package:travella/services/api/api_endpoints.dart';
// import 'package:travella/services/api/dio_client.dart';
// import 'city_attractions_screen.dart';

// class ExploreByCityScreen extends StatefulWidget {
//   final String countryName;

//   const ExploreByCityScreen({super.key, required this.countryName});

//   @override
//   State<ExploreByCityScreen> createState() => _ExploreByCityScreenState();
// }

// class _ExploreByCityScreenState extends State<ExploreByCityScreen> {
//   // <--- 2. تم تحديث نوع المتغير ليطابق الموديل الجديد
//   late Future<List<ExploreCity>> _citiesFuture;

//   @override
//   void initState() {
//     super.initState();
//     _citiesFuture = _fetchCities();
//   }

//   // <--- 3. تم تحديث نوع البيانات التي ترجعها الدالة
//   Future<List<ExploreCity>> _fetchCities() async {
//     try {
//       final dioClient = DioClient();
//       final responseData = await dioClient.getExploreEgypt();

//       // ignore: unnecessary_type_check
//       if (responseData is List) {
//         // <--- 4. تم استخدام ExploreCity.fromJson لتحويل البيانات بشكل صحيح
//         return responseData.map((json) => ExploreCity.fromJson(json)).toList();
//       }
//       throw Exception('Invalid data format received from server');
//     } catch (e) {
//       print('Error fetching cities: $e');
//       if (mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Failed to load cities: $e')),
//         );
//       }
//       // في حالة الخطأ، نرجع قائمة فارغة والواجهة ستعرض رسالة للمستخدم
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
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//         title: Text(
//           'Explore ${widget.countryName}',
//           style: const TextStyle(
//             color: Colors.black,
//             fontSize: 18,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         centerTitle: true,
//       ),
//       // <--- 5. تم تحديث نوع FutureBuilder
//       body: FutureBuilder<List<ExploreCity>>(
//         future: _citiesFuture,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           }
//           if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           }
//           if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return const Center(
//                 child: Text('No cities found for this country.'));
//           }
//           final cities = snapshot.data!;
//           return ListView.builder(
//             padding: const EdgeInsets.all(16.0),
//             itemCount: cities.length,
//             itemBuilder: (context, index) {
//               final city = cities[index];
//               return _buildCityCard(context, city);
//             },
//           );
//         },
//       ),
//     );
//   }

//   // <--- 6. تم تحديث نوع city إلى ExploreCity
//   Widget _buildCityCard(BuildContext context, ExploreCity city) {
//     const double borderRadiusValue = 12.0;

//     // --- 7. منطق بناء رابط الصورة الصحيح ---
//     String networkImageUrl = '';
//     if (city.imageUrls.isNotEmpty) {
//       String relativePath = city.imageUrls.first;
//       if (relativePath.startsWith('/')) {
//         relativePath = relativePath.substring(1);
//       }
//       networkImageUrl = '${ApiEndpoints.imageUrlBase}/$relativePath';
//     }

//     return Card(
//       margin: const EdgeInsets.only(bottom: 16.0),
//       shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(borderRadiusValue)),
//       elevation: 4,
//       clipBehavior: Clip.antiAlias,
//       child: InkWell(
//         onTap: () {
//           // استخلاص اسم المدينة فقط (مثال: Giza بدلاً من Giza, Egypt)
//           final cityNameOnly = city.cityName.split(',').first.trim();
//           print('Tapped on $cityNameOnly, navigating to CityAttractionsScreen');
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) =>
//                   CityAttractionsScreen(cityName: cityNameOnly),
//             ),
//           );
//         },
//         child: Stack(
//           alignment: Alignment.bottomLeft,
//           children: [
//             // --- 8. استخدام Image.network بدلاً من Image.asset ---
//             if (networkImageUrl.isNotEmpty)
//               Image.network(
//                 networkImageUrl,
//                 height: 200,
//                 width: double.infinity,
//                 fit: BoxFit.cover,
//                 loadingBuilder: (context, child, progress) {
//                   if (progress == null) return child;
//                   return _buildImagePlaceholder();
//                 },
//                 errorBuilder: (context, error, stackTrace) {
//                   print('Error loading image for ${city.cityName}: $error');
//                   return _buildImagePlaceholder();
//                 },
//               )
//             else
//               _buildImagePlaceholder(), // عرض placeholder إذا لم تكن هناك صورة

//             Positioned.fill(
//               child: Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(borderRadiusValue),
//                   gradient: LinearGradient(
//                     colors: [
//                       Colors.black.withOpacity(0.6),
//                       Colors.black.withOpacity(0.0)
//                     ],
//                     begin: Alignment.bottomCenter,
//                     end: Alignment.center,
//                   ),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(12.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Text(
//                     city.cityName,
//                     style: const TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                       shadows: [
//                         Shadow(
//                             blurRadius: 2.0,
//                             color: Colors.black54,
//                             offset: Offset(1, 1))
//                       ],
//                     ),
//                   ),
//                   const SizedBox(height: 2),
//                   Text(
//                     '${city.activityCount} activities',
//                     style: const TextStyle(
//                       fontSize: 13,
//                       color: Colors.white,
//                       shadows: [
//                         Shadow(
//                             blurRadius: 2.0,
//                             color: Colors.black45,
//                             offset: Offset(1, 1))
//                       ],
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

//   /// ويدجت لعرضها أثناء تحميل الصورة أو في حالة الخطأ
//   Widget _buildImagePlaceholder() {
//     return Container(
//       height: 200,
//       width: double.infinity,
//       color: Colors.grey[300],
//       child: const Center(
//         child: Icon(Icons.image_search, color: Colors.grey, size: 50),
//       ),
//     );
//   }
// }

// // ==========================================================
// // ملاحظة: تأكد من أن ملف `models/explore_city.dart` يحتوي على الكود التالي:
// /*
// class ExploreCity {
//   final String cityName;
//   final int activityCount;
//   final List<String> imageUrls;

//   ExploreCity({
//     required this.cityName,
//     required this.activityCount,
//     required this.imageUrls,
//   });

//   factory ExploreCity.fromJson(Map<String, dynamic> json) {
//     return ExploreCity(
//       cityName: json['cityName'] ?? 'Unknown City',
//       activityCount: json['activityCount'] ?? 0,
//       imageUrls: (json['imageUrls'] as List<dynamic>?)
//               ?.map((e) => e.toString())
//               .toList() ??
//           [],
//     );
//   }
// }
// */
import 'package:flutter/material.dart';
import 'package:apptravella/models/explore_city.dart';
import 'package:apptravella/services/api/api_endpoints.dart';
import 'package:apptravella/services/api/dio_client.dart';
import 'city_attractions_screen.dart';

class ExploreByCityScreen extends StatefulWidget {
  final String countryName;

  const ExploreByCityScreen({super.key, required this.countryName});

  @override
  State<ExploreByCityScreen> createState() => _ExploreByCityScreenState();
}

class _ExploreByCityScreenState extends State<ExploreByCityScreen> {
  late Future<List<ExploreCity>> _citiesFuture;

  @override
  void initState() {
    super.initState();
    _citiesFuture = _fetchCities();
  }

  Future<List<ExploreCity>> _fetchCities() async {
    try {
      final dioClient = DioClient();
      final responseData = await dioClient.getExploreEgypt();

      // ignore: unnecessary_type_check
      if (responseData is List) {
        return responseData.map((json) => ExploreCity.fromJson(json)).toList();
      }
      throw Exception('Invalid data format received from server');
    } catch (e) {
      print('Error fetching cities: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to load cities: $e')),
        );
      }
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Explore ${widget.countryName}',
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<List<ExploreCity>>(
        future: _citiesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
                child: Text('No cities found for this country.'));
          }
          final cities = snapshot.data!;
          return ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: cities.length,
            itemBuilder: (context, index) {
              final city = cities[index];
              return _buildCityCard(context, city);
            },
          );
        },
      ),
    );
  }

  Widget _buildCityCard(BuildContext context, ExploreCity city) {
    const double borderRadiusValue = 12.0;

    String networkImageUrl = '';
    if (city.imageUrls.isNotEmpty) {
      String relativePath = city.imageUrls.first;
      if (relativePath.startsWith('/')) {
        relativePath = relativePath.substring(1);
      }
      networkImageUrl = '${ApiEndpoints.imageUrlBase}/$relativePath';
    }

    return Card(
      margin: const EdgeInsets.only(bottom: 16.0),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadiusValue)),
      elevation: 4,
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          // =================== التعديل هنا ===================
          // تم إزالة قص اسم المدينة. الآن يتم إرسال الاسم الكامل.
          final String fullCityName = city.cityName;

          print('Tapped on $fullCityName, navigating to CityAttractionsScreen');
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  CityAttractionsScreen(cityName: fullCityName),
            ),
          );
          // ======================================================
        },
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            if (networkImageUrl.isNotEmpty)
              Image.network(
                networkImageUrl,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, progress) {
                  if (progress == null) return child;
                  return _buildImagePlaceholder();
                },
                errorBuilder: (context, error, stackTrace) {
                  print('Error loading image for ${city.cityName}: $error');
                  return _buildImagePlaceholder();
                },
              )
            else
              _buildImagePlaceholder(),
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(borderRadiusValue),
                  gradient: LinearGradient(
                    colors: [
                      Colors.black.withOpacity(0.6),
                      Colors.black.withOpacity(0.0)
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.center,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    city.cityName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                            blurRadius: 2.0,
                            color: Colors.black54,
                            offset: Offset(1, 1))
                      ],
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '${city.activityCount} activities',
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                            blurRadius: 2.0,
                            color: Colors.black45,
                            offset: Offset(1, 1))
                      ],
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
      height: 200,
      width: double.infinity,
      color: Colors.grey[300],
      child: const Center(
        child: Icon(Icons.image_search, color: Colors.grey, size: 50),
      ),
    );
  }
}
