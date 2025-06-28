// // // // // lib/services/payment_service.dart
// // // // import 'package:dio/dio.dart';
// // // // import 'package:travella/services/api/dio_client.dart';

// // // // class PaymentService {
// // // //   final DioClient _dioClient = DioClient();

// // // //   Future<String> createCheckoutSession({
// // // //     required String token,
// // // //     required double amount,
// // // //     required String serviceName,
// // // //   }) async {
// // // //     try {
// // // //       final response = await _dioClient.post(
// // // //         'http://travella.runasp.net/api/Payment/create-checkout-session',
// // // //         data: {
// // // //           'amount': amount,
// // // //           'serviceName': serviceName,
// // // //         },
// // // //         options: Options(
// // // //           headers: {
// // // //             'Authorization': 'Bearer $token',
// // // //             'accept': '*/*',
// // // //             'Content-Type': 'application/json',
// // // //           },
// // // //         ),
// // // //       );

// // // //       if (response.statusCode == 200) {
// // // //         return response.data['sessionId'] as String;
// // // //       } else {
// // // //         throw Exception(
// // // //             'Failed to create checkout session: ${response.statusMessage}');
// // // //       }
// // // //     } catch (e) {
// // // //       throw Exception('Error creating checkout session: $e');
// // // //     }
// // // //   }
// // // // }
// // // import 'package:dio/dio.dart';
// // // import 'package:travella/services/api/dio_client.dart';
// // // import 'package:travella/services/api/api_endpoints.dart';

// // // class PaymentService {
// // //   final DioClient _dioClient = DioClient();

// // //   Future<String> createCheckoutSession({
// // //     required double amount,
// // //     required String serviceName,
// // //     required int hotelId, // أو أي معرف آخر حسب احتياجاتك
// // //   }) async {
// // //     try {
// // //       final response = await _dioClient.post(
// // //         ApiEndpoints.createCheckoutSession,
// // //         data: {
// // //           'amount': amount,
// // //           'serviceName': serviceName,
// // //           'hotelId': hotelId,
// // //         },
// // //       );

// // //       if (response.statusCode == 200 && response.data['url'] != null) {
// // //         return response.data['url']
// // //             as String; // أو 'sessionId' حسب الاستجابة الفعلية
// // //       } else {
// // //         throw Exception(
// // //             'Failed to create checkout session: ${response.statusCode} - ${response.statusMessage}');
// // //       }
// // //     } on DioException catch (e) {
// // //       print("Dio Error in createCheckoutSession: ${e.response?.data}");
// // //       throw Exception('Error creating checkout session: ${e.message}');
// // //     } catch (e) {
// // //       print("Error in createCheckoutSession: $e");
// // //       throw Exception('Failed to create checkout session: $e');
// // //     }
// // //   }
// // // }
// // import 'package:dio/dio.dart';
// // import 'package:travella/services/api/dio_client.dart';
// // import 'package:travella/services/api/api_endpoints.dart';

// // class PaymentService {
// //   final DioClient _dioClient = DioClient();

// //   Future<String> createCheckoutSession({
// //     required double amount,
// //     required String serviceName,
// //     required int hotelId,
// //   }) async {
// //     try {
// //       final response = await _dioClient.post(
// //         ApiEndpoints.createCheckoutSession,
// //         data: {
// //           'amount': amount.toInt(), // تحويل إلى عدد صحيح
// //           'serviceName': serviceName,
// //           'hotelId': hotelId,
// //         },
// //       );

// //       if (response.statusCode == 200 && response.data['url'] != null) {
// //         return response.data['url'] as String;
// //       } else {
// //         throw Exception(
// //             'Failed to create checkout session: ${response.statusCode} - ${response.statusMessage}');
// //       }
// //     } on DioException catch (e) {
// //       print("Dio Error in createCheckoutSession: ${e.response?.data}");
// //       throw Exception('Error creating checkout session: ${e.message}');
// //     } catch (e) {
// //       print("Error in createCheckoutSession: $e");
// //       throw Exception('Failed to create checkout session: $e');
// //     }
// //   }

// //   Future<String> createTaxiCheckoutSession({
// //     required double amount,
// //     required String serviceName,
// //     required int taxiId,
// //   }) async {
// //     try {
// //       final data = {
// //         'request': { // إضافة حقل request ككائن يحتوي على البيانات
// //           'amount': amount.toInt(), // تحويل amount إلى عدد صحيح
// //           'serviceName': serviceName,
// //           'taxiId': taxiId,
// //         },
// //       };
// //       final response = await _dioClient.post(
// //         ApiEndpoints.createTaxiCheckoutSession,
// //         data: data,
// //       );

// //       if (response.statusCode == 200 && response.data['url'] != null) {
// //         return response.data['url'] as String;
// //       } else {
// //         throw Exception(
// //             'Failed to create taxi checkout session: ${response.statusCode} - ${response.statusMessage}');
// //       }
// //     } on DioException catch (e) {
// //       print("Dio Error in createTaxiCheckoutSession: ${e.response?.data}");
// //       throw Exception('Error creating taxi checkout session: ${e.message}');
// //     } catch (e) {
// //       print("Error in createTaxiCheckoutSession: $e");
// //       throw Exception('Failed to create taxi checkout session: $e');
// //     }
// //   }
// // }
// import 'package:dio/dio.dart';
// import 'package:travella/services/api/dio_client.dart';
// import 'package:travella/services/api/api_endpoints.dart';

// class PaymentService {
//   final DioClient _dioClient = DioClient();

//   Future<String> createCheckoutSession({
//     required double amount,
//     required String serviceName,
//     required int hotelId,
//   }) async {
//     try {
//       final response = await _dioClient.post(
//         ApiEndpoints.createCheckoutSession,
//         data: {
//           'amount': amount.toInt(),
//           'serviceName': serviceName,
//           'hotelId': hotelId,
//         },
//       );

//       if (response.statusCode == 200 && response.data['url'] != null) {
//         return response.data['url'] as String;
//       } else {
//         throw Exception(
//             'Failed to create checkout session: ${response.statusCode} - ${response.statusMessage}');
//       }
//     } on DioException catch (e) {
//       print("Dio Error in createCheckoutSession: ${e.response?.data}");
//       throw Exception('Error creating checkout session: ${e.message}');
//     } catch (e) {
//       print("Error in createCheckoutSession: $e");
//       throw Exception('Failed to create checkout session: $e');
//     }
//   }

//   Future<String> createTaxiCheckoutSession({
//     required double amount,
//     required String serviceName,
//     required int taxiId,
//   }) async {
//     try {
//       final data = {
//         'request': {
//           'amount': amount.toInt(),
//           'serviceName': serviceName,
//           'taxiId': taxiId,
//         },
//       };
//       final response = await _dioClient.post(
//         ApiEndpoints.createTaxiCheckoutSession,
//         data: data,
//       );

//       if (response.statusCode == 200 && response.data['url'] != null) {
//         return response.data['url'] as String;
//       } else {
//         throw Exception(
//             'Failed to create taxi checkout session: ${response.statusCode} - ${response.statusMessage}');
//       }
//     } on DioException catch (e) {
//       print("Dio Error in createTaxiCheckoutSession: ${e.response?.data}");
//       throw Exception('Error creating taxi checkout session: ${e.message}');
//     } catch (e) {
//       print("Error in createTaxiCheckoutSession: $e");
//       throw Exception('Failed to create taxi checkout session: $e');
//     }
//   }

//   Future<String> createCarRentalCheckoutSession({
//     required double amount,
//     required String serviceName,
//     required int carRentalId,
//   }) async {
//     try {
//       final data = {
//         'amount': amount.toInt(),
//         'serviceName': serviceName,
//         'carRentalId': carRentalId,
//       };
//       final response = await _dioClient.post(
//         ApiEndpoints.createCarRentalCheckoutSession,
//         data: data,
//       );

//       if (response.statusCode == 200 && response.data['url'] != null) {
//         return response.data['url'] as String;
//       } else {
//         throw Exception(
//             'Failed to create car rental checkout session: ${response.statusCode} - ${response.statusMessage}');
//       }
//     } on DioException catch (e) {
//       print("Dio Error in createCarRentalCheckoutSession: ${e.response?.data}");
//       throw Exception(
//           'Error creating car rental checkout session: ${e.message}');
//     } catch (e) {
//       print("Error in createCarRentalCheckoutSession: $e");
//       throw Exception('Failed to create car rental checkout session: $e');
//     }
//   }
// }
// services/payment_service.dart

import 'package:dio/dio.dart';
import 'package:apptravella/services/api/dio_client.dart';
import 'package:apptravella/services/api/api_endpoints.dart';

class PaymentService {
  final DioClient _dioClient = DioClient();

  Future<String> createCheckoutSession({
    required double amount,
    required String serviceName,
    required int hotelId,
  }) async {
    try {
      final response = await _dioClient.post(
        ApiEndpoints.createCheckoutSession,
        data: {
          'amount': amount.toInt(),
          'serviceName': serviceName,
          'hotelId': hotelId,
        },
      );

      if (response.statusCode == 200 && response.data['url'] != null) {
        return response.data['url'] as String;
      } else {
        throw Exception(
            'Failed to create checkout session: ${response.statusCode} - ${response.statusMessage}');
      }
    } on DioException catch (e) {
      print("Dio Error in createCheckoutSession: ${e.response?.data}");
      throw Exception('Error creating checkout session: ${e.message}');
    } catch (e) {
      print("Error in createCheckoutSession: $e");
      throw Exception('Failed to create checkout session: $e');
    }
  }

  Future<String> createFlightCheckoutSession({
    required double amount,
    required String serviceName,
    required int flightId,
  }) async {
    try {
      final data = {
        'amount': amount.toInt(),
        'serviceName': serviceName,
        'flightId': flightId,
      };

      final response = await _dioClient.post(
        ApiEndpoints.createFlightCheckoutSession,
        data: data,
      );

      if (response.statusCode == 200 && response.data['url'] != null) {
        return response.data['url'] as String;
      } else {
        throw Exception(
            'Failed to create flight checkout session: ${response.statusCode} - ${response.statusMessage}');
      }
    } on DioException catch (e) {
      print("Dio Error in createFlightCheckoutSession: ${e.response?.data}");
      throw Exception('Error creating flight checkout session: ${e.message}');
    } catch (e) {
      print("Error in createFlightCheckoutSession: $e");
      throw Exception('Failed to create flight checkout session: $e');
    }
  }

  Future<String> createTaxiCheckoutSession({
    required double amount,
    required String serviceName,
    required int taxiId,
  }) async {
    try {
      final data = {
        'amount': amount.toInt(),
        'serviceName': serviceName,
        'taxiId': taxiId,
      };
      final response = await _dioClient.post(
        ApiEndpoints.createTaxiCheckoutSession,
        data: data,
      );

      if (response.statusCode == 200 && response.data['url'] != null) {
        return response.data['url'] as String;
      } else {
        throw Exception(
            'Failed to create taxi checkout session: ${response.statusCode} - ${response.statusMessage}');
      }
    } on DioException catch (e) {
      print("Dio Error in createTaxiCheckoutSession: ${e.response?.data}");
      throw Exception('Error creating taxi checkout session: ${e.message}');
    } catch (e) {
      print("Error in createTaxiCheckoutSession: $e");
      throw Exception('Failed to create taxi checkout session: $e');
    }
  }

  Future<String> createCarRentalCheckoutSession({
    required double amount,
    required String serviceName,
    required int carRentalId,
  }) async {
    try {
      final data = {
        'amount': amount.toInt(),
        'serviceName': serviceName,
        'carRentalId': carRentalId,
      };
      final response = await _dioClient.post(
        ApiEndpoints.createCarRentalCheckoutSession,
        data: data,
      );

      if (response.statusCode == 200 && response.data['url'] != null) {
        return response.data['url'] as String;
      } else {
        throw Exception(
            'Failed to create car rental checkout session: ${response.statusCode} - ${response.statusMessage}');
      }
    } on DioException catch (e) {
      print("Dio Error in createCarRentalCheckoutSession: ${e.response?.data}");
      throw Exception(
          'Error creating car rental checkout session: ${e.message}');
    } catch (e) {
      print("Error in createCarRentalCheckoutSession: $e");
      throw Exception('Failed to create car rental checkout session: $e');
    }
  }
}
