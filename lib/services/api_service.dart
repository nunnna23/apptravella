// // // import 'dart:convert';
// // // import 'package:http/http.dart' as http;
// // // import '../models/api_flight.dart'; // سنقوم بإنشاء هذا الملف تالياً

// // // class ApiService {
// // //   static const String _baseUrl = 'http://travella.runasp.net/api';

// // //   // دالة البحث بناءً على مواصفات API
// // //   Future<List<ApiFlight>> searchFlights({
// // //     required String from,
// // //     required String to,
// // //     required DateTime departureDate,
// // //     required String category,
// // //     required int adults,
// // //     required int children,
// // //     required DateTime returnDate,
// // //   }) async {
// // //     final url = Uri.parse('$_baseUrl/Flights/search');

// // //     // إعداد جسم الطلب (Request Body) كما هو متوقع من الـ API
// // //     final body = jsonEncode({
// // //       "fromLocation": from,
// // //       "destination": to,
// // //       // تحويل التاريخ إلى صيغة ISO 8601 String التي يقبلها الخادم
// // //       "departureTime": departureDate.toIso8601String(),
// // //       // الـ API لا يستخدم arrivalTime في البحث، لذلك لا نمرره هنا
// // //       "category": category.toLowerCase(), // تأكد من أن الفئة بأحرف صغيرة
// // //       "numberOfpersons": {
// // //         "adults": adults,
// // //         "children": children,
// // //       }
// // //     });

// // //     try {
// // //       final response = await http.post(
// // //         url,
// // //         headers: {
// // //           'Content-Type': 'application/json; charset=UTF-8',
// // //           'accept': 'text/plain', // بناءً على مواصفات Swagger
// // //         },
// // //         body: body,
// // //       );

// // //       if (response.statusCode == 200) {
// // //         // إذا كان الطلب ناجحاً
// // //         List<dynamic> jsonResponse = jsonDecode(response.body);
// // //         // تحويل قائمة الـ JSON إلى قائمة من كائنات ApiFlight
// // //         return jsonResponse
// // //             .map((flight) => ApiFlight.fromJson(flight))
// // //             .toList();
// // //       } else {
// // //         // إذا فشل الطلب، ألقي خطأ مع تفاصيل
// // //         throw Exception(
// // //             'Failed to search flights. Status code: ${response.statusCode}, Body: ${response.body}');
// // //       }
// // //     } catch (e) {
// // //       // للتعامل مع أخطاء الشبكة
// // //       throw Exception('Failed to connect to the server: $e');
// // //     }
// // //   }

// // //   // ملاحظة: منطق الفلترة (filter) الحالي في التطبيق يتم على جانب العميل (client-side)
// // //   // بعد جلب نتائج البحث. هذا يتماشى مع تصميم الواجهة الحالي.
// // //   // إذا أردت استخدام `POST /api/Flights/filter`، سيتطلب ذلك تغيير تدفق العمل.
// // // }
// // import 'dart:convert';
// // import 'package:travella/models/api_flight.dart';
// // import 'package:travella/services/api/dio_client.dart';

// // class ApiService {
// //   final DioClient _dioClient = DioClient();

// //   Future<List<ApiFlight>> searchFlights({
// //     required String from,
// //     required String to,
// //     required DateTime departureDate,
// //     required DateTime returnDate,
// //     required String category,
// //     required int adults,
// //     required int children,
// //   }) async {
// //     try {
// //       final data = {
// //         'fromLocation': from.toLowerCase(),
// //         'destination': to.toLowerCase(),
// //         'departureTime': departureDate.toIso8601String(),
// //         'arrivalTime': returnDate.toIso8601String(),
// //         'category': category.toLowerCase(),
// //         'numberOfpersons': {'adults': adults, 'children': children},
// //       };

// //       final response = await _dioClient.post(
// //         '/Flights/search', // النهاية النسبية
// //         data: data,
// //       );

// //       final List<dynamic> jsonResponse = jsonDecode(response.data);
// //       return jsonResponse.map((json) => ApiFlight.fromJson(json)).toList();
// //     } catch (e) {
// //       print('API Error: $e');
// //       throw Exception('Failed to load flights: $e');
// //     }
// //   }
// // }
// // ignore: unused_import
// import 'dart:convert';
// import 'package:dio/dio.dart';
// import 'package:travella/models/api_flight.dart';

// class ApiService {
//   final Dio _dio = Dio();

//   Future<List<ApiFlight>> searchFlights({
//     required String from,
//     required String to,
//     required DateTime departureDate,
//     required DateTime returnDate,
//     required String category,
//     required int adults,
//     required int children,
//   }) async {
//     try {
//       final token = await _getAuthToken(); // استبدل بمنطق الحصول على التوكن
//       final data = {
//         'fromLocation': from.toLowerCase(),
//         'destination': to.toLowerCase(),
//         'departureTime': departureDate.toIso8601String(),
//         'arrivalTime': returnDate.toIso8601String(),
//         'category': category.toLowerCase(),
//         'numberOfpersons': {'adults': adults, 'children': children},
//       };

//       final response = await _dio.post(
//         'http://travella.runasp.net/api/Flights/search',
//         data: jsonEncode(data),
//         options: Options(
//           headers: {
//             'Authorization': 'Bearer $token',
//             'Content-Type': 'application/json',
//             'accept': 'text/plain',
//           },
//           responseType: ResponseType.json,
//         ),
//       );

//       if (response.statusCode == 200) {
//         final List<dynamic> jsonResponse = response.data;
//         return jsonResponse.map((json) => ApiFlight.fromJson(json)).toList();
//       } else {
//         throw Exception('Failed to load flights: ${response.statusCode}');
//       }
//     } catch (e) {
//       print('API Error: $e');
//       throw Exception('Failed to load flights: $e');
//     }
//   }

//   Future<String> _getAuthToken() async {
//     // استبدل هذا بالمنطق الحقيقي لحساب التوكن (مثل SharedPreferences)
//     return 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...'; // التوكن من curl
//   }
// }
// services/api_service.dart

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
// import 'package:travella/models/CarRental.dart';
// import 'package:travella/models/Taxi.dart';
import 'package:apptravella/services/api/api_endpoints.dart';
import '../models/api_flight.dart'; // <-- استيراد نموذج الـ API

// تم تغيير اسم الكلاس ليتوافق مع الاستخدام الشائع
class ApiService {
  late Dio _dio;

  static final ApiService _instance = ApiService._internal();

  factory ApiService() => _instance;

  ApiService._internal() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiEndpoints.baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        responseType: ResponseType.json,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    const String manualToken =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9naXZlbm5hbWUiOiJuYWRhIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvZW1haWxhZGRyZXNzIjoib21hcnR3MjAwNEBnbWFpbC5jb20iLCJqdGkiOiJiN2I2ZjZiOC1hYTA2LTRjMjktYWVmMy1iMjMzZWViODA0MjkiLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6IjIiLCJleHAiOjE3NTU4OTA0OTUsImlzcyI6Imh0dHBzOi8vbG9jYWxob3N0OjcyNzEvIiwiYXVkIjoiaHR0cHM6Ly9sb2NhbGhvc3Q6NzI3MS8ifQ.-SHvGQxPq6t1XQamP9kE5SWwY1tV5zHoK8JZSTg1GaY';

    _dio.interceptors.add(PrettyDioLogger(
      requestBody: true,
      responseBody: true,
      requestHeader: true,
      responseHeader: false,
    ));

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          options.headers['Authorization'] = 'Bearer $manualToken';
          return handler.next(options);
        },
        onError: (DioException error, handler) {
          return handler.next(error);
        },
      ),
    );
  }

  Dio get dio => _dio;

  // --- Flight API Methods ---
  // ---  ***** تم تعديل هذه الدالة ***** ---
  Future<List<ApiFlight>> searchFlights({
    required String from,
    required String to,
    required DateTime departureDate,
    required DateTime returnDate,
    required int adults,
    required int children,
    required String category,
  }) async {
    try {
      final data = {
        'fromLocation': from,
        'destination': to,
        'departureTime': departureDate.toIso8601String(),
        'arrivalTime':
            returnDate.toIso8601String(), // هذا هو تاريخ العودة من الواجهة
        'category': category.toLowerCase(), // يفضل إرسالها بحروف صغيرة
        'numberOfpersons': {'adults': adults, 'children': children},
      };
      final response = await _dio.post(ApiEndpoints.flightSearch, data: data);

      // **التصحيح الرئيسي هنا**: تحويل الـ JSON إلى List<ApiFlight>
      if (response.data != null && response.data is List) {
        return (response.data as List)
            .map((json) => ApiFlight.fromJson(json))
            .toList();
      } else {
        return []; // إرجاع قائمة فارغة إذا لم تكن هناك بيانات
      }
    } on DioException catch (e) {
      print('Dio Error in searchFlights: ${e.response?.data}');
      throw _handleDioError(e);
    } catch (e) {
      print('Unexpected error in searchFlights: $e');
      throw 'An unexpected error occurred.';
    }
  }

  // --- باقي الدوال ---
  // ... (باقي دوال الخدمة التي أرسلتها تبقى كما هي)
  // ... (getTaxis, searchTaxis, etc.)

  String _handleDioError(DioException e) {
    String errorMessage;
    if (e.response != null) {
      final responseData = e.response!.data;
      final statusCode = e.response!.statusCode;
      print("Dio Error: Status $statusCode, Data: $responseData");

      if (responseData is Map && responseData.containsKey('errors')) {
        final errors = responseData['errors'] as Map;
        errorMessage = errors.entries
            .map((entry) => '${entry.key}: ${entry.value.join(", ")}')
            .join('\n');
      } else if (responseData is Map && responseData.containsKey('title')) {
        errorMessage = responseData['title'];
      } else if (responseData is Map && responseData.containsKey('detail')) {
        errorMessage = responseData['detail'];
      } else if (responseData is Map && responseData.containsKey('error')) {
        errorMessage = responseData['error'];
      } else {
        errorMessage = 'Error: $statusCode. An unexpected error occurred.';
      }
    } else {
      errorMessage = 'Network Error: Please check your connection.';
      print('Dio network error: ${e.message}');
    }
    return errorMessage;
  }
}
