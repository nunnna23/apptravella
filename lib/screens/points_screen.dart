import 'package:flutter/material.dart';

class PointsScreen extends StatelessWidget {
  const PointsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryTextColor = Colors.black87;
    const int userPoints = 0; // قيمة النقاط (اجلبيها من بيانات المستخدم)

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Points',
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Center(
        // لتوسيط المحتوى عمودياً وأفقياً
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center, // توسيط العناصر في العمود
            children: [
              // ----- هذا الجزء هو المسؤول عن عرض الصورة -----
              Image.asset(
                'assets/points.jpeg', // <-- المسار المستخدم للصورة
                height: 250,
                fit: BoxFit.contain,
                // errorBuilder: يُنفذ فقط عند فشل تحميل الصورة أعلاه
                errorBuilder: (context, error, stackTrace) {
                  print("Error loading points.jpeg: $error");
                  // هذه الأيقونة هي البديل في حالة الخطأ
                  return const Icon(Icons.card_giftcard,
                      size: 150, color: Colors.grey);
                },
              ),
              // ----- نهاية جزء الصورة -----

              const SizedBox(height: 40), // مسافة بين الصورة والنص

              const Text(
                // نص النقاط
                'You Have $userPoints Point',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: primaryTextColor,
                ),
              ),
              const SizedBox(height: 50), // مسافة إضافية أسفل النص
            ],
          ),
        ),
      ),
    );
  }
}






// import 'package:flutter/material.dart';
// import 'package:dio/dio.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:travella/services/api/api_endpoints.dart';
// import 'package:travella/services/api/dio_client.dart';

// class PointsScreen extends StatefulWidget {
//   const PointsScreen({super.key});

//   @override
//   State<PointsScreen> createState() => _PointsScreenState();
// }

// class _PointsScreenState extends State<PointsScreen> {
//   late Future<int> _pointsFuture;

//   @override
//   void initState() {
//     super.initState();
//     _pointsFuture = _fetchPoints();
//   }

//   Future<String?> _getToken() async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.getString('authToken');
//   }

//   Future<int> _fetchPoints() async {
//     try {
//       final dio = DioClient().dio;
//       final token = await _getToken();
//       if (token == null) {
//         throw Exception('No authentication token found. Please sign in.');
//       }

//       final response = await dio.get(
//         '${ApiEndpoints.baseUrl}${ApiEndpoints.points}', // استخدام baseUrl مع points
//         options: Options(
//           headers: {
//             'Authorization': 'Bearer $token',
//           },
//         ),
//       );

//       print("API Response: ${response.data}"); // Logging

//       if (response.statusCode == 200) {
//         return response.data as int;
//       } else {
//         throw Exception(
//             'Failed to load points: ${response.statusCode} - ${response.data}');
//       }
//     } catch (e) {
//       print("Error fetching points: $e"); // Logging
//       if (e is DioException && e.response?.statusCode == 404) {
//         throw Exception('Endpoint /Accounts/Points not found on the server.');
//       }
//       throw Exception('Error fetching points: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     const Color primaryTextColor = Colors.black87;

//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//         title: const Text(
//           'Points',
//           style: TextStyle(
//               color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
//         ),
//         centerTitle: true,
//       ),
//       body: FutureBuilder<int>(
//         future: _pointsFuture,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (!snapshot.hasData) {
//             return const Center(child: Text('No points available.'));
//           }

//           final userPoints = snapshot.data!;

//           return Center(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Image.asset(
//                     'assets/points.jpeg',
//                     height: 250,
//                     fit: BoxFit.contain,
//                     errorBuilder: (context, error, stackTrace) {
//                       print("Error loading points.jpeg: $error");
//                       return const Icon(Icons.card_giftcard,
//                           size: 150, color: Colors.grey);
//                     },
//                   ),
//                   const SizedBox(height: 40),
//                   Text(
//                     'You Have $userPoints Point${userPoints == 1 ? '' : 's'}',
//                     textAlign: TextAlign.center,
//                     style: const TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                       color: primaryTextColor,
//                     ),
//                   ),
//                   const SizedBox(height: 50),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
//  }



// // import 'package:flutter/material.dart';
// // import 'package:dio/dio.dart';
// // import 'package:shared_preferences/shared_preferences.dart';
// // import 'package:apptravella/services/api/api_endpoints.dart';
// // import 'package:apptravella/services/api/dio_client.dart';

// // class PointsScreen extends StatefulWidget {
// //   const PointsScreen({super.key});

// //   @override
// //   State<PointsScreen> createState() => _PointsScreenState();
// // }

// // class _PointsScreenState extends State<PointsScreen> {
// //   late Future<int> _pointsFuture;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _pointsFuture = _fetchPoints();
// //   }

// //   Future<String?> _getToken() async {
// //     final prefs = await SharedPreferences.getInstance();
//     return prefs.getString('authToken');
//   }

//   Future<int> _fetchPoints() async {
//     try {
//       final dio = DioClient().dio;
//       final token = await _getToken();
//       if (token == null) {
//         throw Exception('No authentication token found. Please sign in.');
//       }

//       final response = await dio.get(
//         '${ApiEndpoints.baseUrl}${ApiEndpoints.points}',
//         options: Options(
//           headers: {
//             'Authorization': 'Bearer $token',
//           },
//         ),
//       );

//       print("API Response: ${response.data}"); // Logging

//       if (response.statusCode == 200) {
//         final points = response.data as int;
//         print("Points fetched: $points"); // Logging
//         return points;
//       } else {
//         throw Exception(
//             'Failed to load points: ${response.statusCode} - ${response.data}');
//       }
//     } catch (e) {
//       print("Error fetching points: $e");
//       if (e is DioException && e.response?.statusCode == 404) {
//         throw Exception(
//             'Endpoint ${ApiEndpoints.points} not found on the server (${ApiEndpoints.baseUrl}). Verify the endpoint or server configuration.');
//       }
//       throw Exception('Error fetching points: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     const Color primaryTextColor = Colors.black87;

//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//         title: const Text(
//           'Points',
//           style: TextStyle(
//               color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
//         ),
//         centerTitle: true,
//       ),
//       body: FutureBuilder<int>(
//         future: _pointsFuture,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (!snapshot.hasData) {
//             return const Center(child: Text('No points available.'));
//           }

//           final userPoints = snapshot.data!;

//           return Center(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Image.asset(
//                     'assets/points.jpeg',
//                     height: 250,
//                     fit: BoxFit.contain,
//                     errorBuilder: (context, error, stackTrace) {
//                       print("Error loading points.jpeg: $error");
//                       return const Icon(Icons.card_giftcard,
//                           size: 150, color: Colors.grey);
//                     },
//                   ),
//                   const SizedBox(height: 40),
//                   Text(
//                     'You Have $userPoints Point${userPoints == 1 ? '' : 's'}',
//                     textAlign: TextAlign.center,
//                     style: const TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                       color: primaryTextColor,
//                     ),
//                   ),
//                   const SizedBox(height: 50),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
