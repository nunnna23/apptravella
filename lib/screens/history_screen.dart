import 'package:flutter/material.dart';

// نموذج بسيط لبيانات سجل الدخول (استبدليه بالنموذج الفعلي)
class LoginHistoryEntry {
  final String device;
  final String status; // e.g., "Success"
  final String ipAddress;
  final DateTime dateTime;

  LoginHistoryEntry({
    required this.device,
    required this.status,
    required this.ipAddress,
    required this.dateTime,
  });
}

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  // بيانات سجل دخول افتراضية (استبدليها بالبيانات الحقيقية)
  static final List<LoginHistoryEntry> _historyData = [
    LoginHistoryEntry(
        device: 'iPhone 13 Mini',
        status: 'Success',
        ipAddress: '128.54.112.66',
        dateTime: DateTime.now()),
    LoginHistoryEntry(
        device: 'iPhone 13 Mini',
        status: 'Success',
        ipAddress: '128.54.112.66',
        dateTime: DateTime(2025, 6, 4)),
    LoginHistoryEntry(
        device: 'iPhone 13 Mini',
        status: 'Success',
        ipAddress: '128.54.112.66',
        dateTime: DateTime(2024, 12, 1)), // خطأ في تاريخ التصميم؟
  ];

  // Helper widget لعرض مجموعة سجل حسب التاريخ
  Widget _buildHistoryGroup(
      BuildContext context, String dateLabel, List<LoginHistoryEntry> entries) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
              top: 24.0, bottom: 8.0, left: 16, right: 16),
          child: Text(
            dateLabel,
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87),
          ),
        ),
        ListView.builder(
          shrinkWrap: true, // لمنع ListView من أخذ ارتفاع لانهائي داخل Column
          physics:
              const NeverScrollableScrollPhysics(), // لتعطيل التمرير الخاص بهذا الـ ListView
          itemCount: entries.length,
          itemBuilder: (context, index) =>
              _buildHistoryEntry(context, entries[index]),
        ),
      ],
    );
  }

  // Helper widget لعرض عنصر سجل دخول واحد
  Widget _buildHistoryEntry(BuildContext context, LoginHistoryEntry entry) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(entry.device,
              style: const TextStyle(fontSize: 14, color: Colors.black54)),
          Row(
            // لتجميع الحالة والـ IP
            children: [
              const Icon(Icons.check_circle,
                  color: Colors.green, size: 16), // أيقونة النجاح
              const SizedBox(width: 4),
              Text(entry.status,
                  style: const TextStyle(fontSize: 14, color: Colors.green)),
              const SizedBox(width: 12),
              Text(entry.ipAddress,
                  style: const TextStyle(fontSize: 14, color: Colors.black54)),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // تجميع البيانات حسب التاريخ (منطق مبسط)
    // في تطبيق حقيقي، قد يأتي هذا التجميع من الـ backend أو يتم حسابه بشكل أكثر تعقيداً
    final todayEntries = _historyData
        .where((e) => DateUtils.isSameDay(e.dateTime, DateTime.now()))
        .toList();
    final otherEntries = _historyData
        .where((e) => !DateUtils.isSameDay(e.dateTime, DateTime.now()))
        .toList();
    // TODO: تقسيم otherEntries حسب التواريخ المختلفة

    return Scaffold(
      backgroundColor: Colors.grey[100], // خلفية رمادية فاتحة قليلاً
      appBar: AppBar(
        backgroundColor: Colors.white, // خلفية بيضاء للـ AppBar
        elevation: 1, // ظل خفيف للـ AppBar
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Log in History',
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: ListView(
        // استخدام ListView رئيسي للسماح بتمرير كل المحتوى
        children: [
          // الصورة في الأعلى
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Image.asset(
              'assets/history.jpeg', // <-- تأكدي من صحة المسار
              height: 200, // يمكنك تعديل الارتفاع
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                print("Error loading history.jpeg: $error");
                return const Icon(Icons.history_edu_outlined,
                    size: 100, color: Colors.grey); // أيقونة بديلة
              },
            ),
          ),

          // عرض سجل اليوم
          if (todayEntries.isNotEmpty)
            _buildHistoryGroup(context, 'Today', todayEntries),

          // عرض سجل باقي الأيام (يحتاج لتحسين منطق التجميع حسب التاريخ)
          // كمثال، سنعرضهم تحت تاريخ أول عنصر في القائمة المتبقية
          if (otherEntries.isNotEmpty)
            _buildHistoryGroup(
                context,
                '${otherEntries[0].dateTime.day}/${otherEntries[0].dateTime.month}/${otherEntries[0].dateTime.year}',
                otherEntries),
          // يمكنك تكرار _buildHistoryGroup لتواريخ أخرى

          const SizedBox(height: 20), // مسافة في نهاية القائمة
        ],
      ),
    );
  }
}

// // import 'package:flutter/material.dart';
// // import 'package:dio/dio.dart';
// // import 'package:shared_preferences/shared_preferences.dart';
// // import 'package:travella/services/api/api_endpoints.dart';
// // import 'package:travella/services/api/dio_client.dart';

// // class LoginHistoryData {
// //   final DateTime? lastLogin;

// //   LoginHistoryData({this.lastLogin});

// //   factory LoginHistoryData.fromJson(Map<String, dynamic> json) {
// //     print("Parsing JSON: $json"); // Logging
// //     return LoginHistoryData(
// //       lastLogin: json['lastLogin'] != null
// //           ? DateTime.tryParse(json['lastLogin'])
// //           : null,
// //     );
// //   }
// // }

// // class HistoryScreen extends StatefulWidget {
// //   const HistoryScreen({super.key});

// //   @override
// //   State<HistoryScreen> createState() => _HistoryScreenState();
// // }

// // class _HistoryScreenState extends State<HistoryScreen> {
// //   late Future<LoginHistoryData> _historyFuture;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _historyFuture = _fetchHistory();
// //   }

// //   Future<String?> _getToken() async {
// //     final prefs = await SharedPreferences.getInstance();
// //     return prefs.getString('authToken');
// //   }

// //   Future<LoginHistoryData> _fetchHistory() async {
// //     try {
// //       final dio = DioClient().dio;
// //       final token = await _getToken();
// //       if (token == null) {
// //         throw Exception('No authentication token found. Please sign in.');
// //       }

// //       final response = await dio.get(
// //         ApiEndpoints.history,
// //         options: Options(
// //           headers: {
// //             'Authorization': 'Bearer $token',
// //           },
// //         ),
// //       );

// //       print("API Response: ${response.data}"); // Logging

// //       if (response.statusCode == 200) {
// //         return LoginHistoryData.fromJson(response.data);
// //       } else {
// //         throw Exception(
// //             'Failed to load history: ${response.statusCode} - ${response.data}');
// //       }
// //     } catch (e) {
// //       print("Error fetching history: $e"); // Logging
// //       throw Exception('Error fetching history: $e');
// //     }
// //   }

// //   Widget _buildHistoryEntry(BuildContext context, LoginHistoryData history) {
// //     return Container(
// //       margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
// //       padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
// //       decoration: BoxDecoration(
// //         color: Colors.white,
// //         borderRadius: BorderRadius.circular(8.0),
// //         border: Border.all(color: Colors.grey.shade300),
// //         boxShadow: [
// //           BoxShadow(
// //             color: Colors.grey.withOpacity(0.1),
// //             spreadRadius: 1,
// //             blurRadius: 3,
// //             offset: const Offset(0, 2),
// //           ),
// //         ],
// //       ),
// //       child: Row(
// //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //         children: [
// //           const Text('Last Login',
// //               style: TextStyle(fontSize: 14, color: Colors.black54)),
// //           Text(
// //             history.lastLogin != null
// //                 ? '${history.lastLogin!.day}/${history.lastLogin!.month}/${history.lastLogin!.year} ${history.lastLogin!.hour}:${history.lastLogin!.minute}'
// //                 : 'Not available',
// //             style: const TextStyle(fontSize: 14, color: Colors.black87),
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.grey[100],
// //       appBar: AppBar(
// //         backgroundColor: Colors.white,
// //         elevation: 1,
// //         leading: IconButton(
// //           icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
// //           onPressed: () => Navigator.of(context).pop(),
// //         ),
// //         title: const Text(
// //           'Log in History',
// //           style: TextStyle(
// //               color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
// //         ),
// //         centerTitle: true,
// //       ),
// //       body: FutureBuilder<LoginHistoryData>(
// //         future: _historyFuture,
// //         builder: (context, snapshot) {
// //           print(
// //               "Snapshot state: ${snapshot.connectionState}, hasData: ${snapshot.hasData}, error: ${snapshot.error}"); // Logging

// //           if (snapshot.connectionState == ConnectionState.waiting) {
// //             return const Center(child: CircularProgressIndicator());
// //           } else if (snapshot.hasError) {
// //             return Center(child: Text('Error: ${snapshot.error}'));
// //           }

// //           // التأكد من وجود البيانات
// //           final historyData = snapshot.data;
// //           if (historyData == null || historyData.lastLogin == null) {
// //             return const Center(child: Text('No login history available.'));
// //           }

// //           return ListView(
// //             children: [
// //               Padding(
// //                 padding: const EdgeInsets.symmetric(vertical: 20.0),
// //                 child: Image.asset(
// //                   'assets/history.jpeg',
// //                   height: 200,
// //                   fit: BoxFit.contain,
// //                   errorBuilder: (context, error, stackTrace) {
// //                     print("Error loading history.jpeg: $error");
// //                     return const Icon(Icons.history_edu_outlined,
// //                         size: 100, color: Colors.grey);
// //                   },
// //                 ),
// //               ),
// //               _buildHistoryEntry(context, historyData),
// //               const SizedBox(height: 20),
// //             ],
// //           );
// //         },
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:dio/dio.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:apptravella/services/api/api_endpoints.dart';
// import 'package:apptravella/services/api/dio_client.dart';

// class LoginHistoryData {
//   final DateTime? lastLogin;

//   LoginHistoryData({this.lastLogin});

//   factory LoginHistoryData.fromJson(Map<String, dynamic> json) {
//     print("Parsing JSON: $json"); // Logging
//     return LoginHistoryData(
//       lastLogin: json['lastLogin'] != null
//           ? DateTime.tryParse(json['lastLogin'])
//           : null,
//     );
//   }
// }

// class HistoryScreen extends StatefulWidget {
//   const HistoryScreen({super.key});

//   @override
//   State<HistoryScreen> createState() => _HistoryScreenState();
// }

// class _HistoryScreenState extends State<HistoryScreen> {
//   late Future<LoginHistoryData> _historyFuture;

//   @override
//   void initState() {
//     super.initState();
//     _historyFuture = _fetchHistory();
//   }

//   Future<String?> _getToken() async {
//     final prefs = await SharedPreferences.getInstance();
//     return prefs.getString('authToken');
//   }

//   Future<LoginHistoryData> _fetchHistory() async {
//     try {
//       final dio = DioClient().dio;
//       final token = await _getToken();
//       if (token == null) {
//         throw Exception('No authentication token found. Please sign in.');
//       }

//       final response = await dio.get(
//         ApiEndpoints.history,
//         options: Options(
//           headers: {
//             'Authorization': 'Bearer $token',
//           },
//         ),
//       );

//       print("API Response: ${response.data}"); // Logging

//       if (response.statusCode == 200) {
//         return LoginHistoryData.fromJson(response.data);
//       } else {
//         throw Exception(
//             'Failed to load history: ${response.statusCode} - ${response.data}');
//       }
//     } catch (e) {
//       print("Error fetching history: $e"); // Logging
//       throw Exception('Error fetching history: $e');
//     }
//   }

//   Widget _buildHistoryEntry(BuildContext context, LoginHistoryData history) {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
//       padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(8.0),
//         border: Border.all(color: Colors.grey.shade300),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.1),
//             spreadRadius: 1,
//             blurRadius: 3,
//             offset: const Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Row(
//             children: [
//               const Icon(Icons.check_circle, color: Colors.green, size: 16),
//               const SizedBox(width: 4),
//               const Text(
//                 'Last Login',
//                 style: TextStyle(fontSize: 14, color: Colors.black54),
//               ),
//             ],
//           ),
//           Text(
//             history.lastLogin != null
//                 ? '${history.lastLogin!.day}/${history.lastLogin!.month}/${history.lastLogin!.year} ${history.lastLogin!.hour}:${history.lastLogin!.minute}'
//                 : 'Not available',
//             style: const TextStyle(fontSize: 14, color: Colors.black54),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[100],
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 1,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//         title: const Text(
//           'Log in History',
//           style: TextStyle(
//               color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
//         ),
//         centerTitle: true,
//       ),
//       body: FutureBuilder<LoginHistoryData>(
//         future: _historyFuture,
//         builder: (context, snapshot) {
//           print(
//               "Snapshot state: ${snapshot.connectionState}, hasData: ${snapshot.hasData}, error: ${snapshot.error}"); // Logging

//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           }

//           final historyData = snapshot.data;
//           if (historyData == null || historyData.lastLogin == null) {
//             return const Center(child: Text('No login history available.'));
//           }

//           return ListView(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 20.0),
//                 child: Image.asset(
//                   'assets/history.jpeg',
//                   height: 200,
//                   fit: BoxFit.contain,
//                   errorBuilder: (context, error, stackTrace) {
//                     print("Error loading history.jpeg: $error");
//                     return const Icon(Icons.history_edu_outlined,
//                         size: 100, color: Colors.grey);
//                   },
//                 ),
//               ),
//               _buildHistoryEntry(context, historyData),
//               const SizedBox(height: 20),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
