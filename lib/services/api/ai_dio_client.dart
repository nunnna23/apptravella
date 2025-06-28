// // // // import 'package:dio/dio.dart';
// // // // import 'package:pretty_dio_logger/pretty_dio_logger.dart';
// // // // import 'ai_api_endpoints.dart';

// // // // class AiDioClient {
// // // //   late Dio _flightAiDio;
// // // //   late Dio _hotelAiDio;
// // // //   late Dio _carAiDio;

// // // //   static final AiDioClient _instance = AiDioClient._internal();
// // // //   factory AiDioClient() => _instance;

// // // //   AiDioClient._internal() {
// // // //     _flightAiDio = _createDioInstance(AiApiEndpoints.flightApiBaseUrl);
// // // //     _hotelAiDio = _createDioInstance(AiApiEndpoints.hotelApiBaseUrl);
// // // //     _carAiDio = _createDioInstance(AiApiEndpoints.carRentalApiBaseUrl);
// // // //   }

// // // //   Dio _createDioInstance(String baseUrl) {
// // // //     final dio = Dio(BaseOptions(
// // // //       baseUrl: baseUrl,
// // // //       connectTimeout: const Duration(seconds: 60),
// // // //       receiveTimeout: const Duration(seconds: 60),
// // // //       headers: {
// // // //         'Content-Type': 'application/json',
// // // //         'Accept': 'application/json',
// // // //       },
// // // //     ));

// // // //     dio.interceptors.add(PrettyDioLogger(
// // // //       requestHeader: true,
// // // //       requestBody: true,
// // // //       responseBody: true,
// // // //       responseHeader: false,
// // // //       error: true,
// // // //       compact: true,
// // // //       maxWidth: 90,
// // // //     ));

// // // //     return dio;
// // // //   }

// // // //   Future<Map<String, dynamic>> predictFlightPrice({
// // // //     required String from,
// // // //     required String to,
// // // //     required int adults,
// // // //     required int children,
// // // //     required String flightClass,
// // // //     required String numStops,
// // // //     required String airline,
// // // //     required String date,
// // // //   }) async {
// // // //     try {
// // // //       int stops;
// // // //       switch (numStops) {
// // // //         case 'Non-stop':
// // // //           stops = 0;
// // // //           break;
// // // //         case '1 Stop':
// // // //           stops = 1;
// // // //           break;
// // // //         case '2 Stops':
// // // //           stops = 2;
// // // //           break;
// // // //         case 'Any':
// // // //           stops = 1;
// // // //           break;
// // // //         default:
// // // //           stops = 1;
// // // //       }

// // // //       final data = {
// // // //         "from_": [from],
// // // //         "to": [to],
// // // //         "adults": [adults],
// // // //         "child": [children],
// // // //         "class_": [flightClass.toLowerCase()],
// // // //         "num_stops": [stops],
// // // //         "Airline_new": [airline],
// // // //         "date": [date],
// // // //       };

// // // //       final response = await _flightAiDio.post(
// // // //         AiApiEndpoints.flightPrediction,
// // // //         data: data,
// // // //       );
// // // //       return response.data as Map<String, dynamic>;
// // // //     } on DioException catch (e) {
// // // //       final errorMessage =
// // // //           'Flight prediction failed: ${e.response?.data['error'] ?? e.response?.statusMessage ?? e.message}';
// // // //       print('DioError on Flight Prediction: $errorMessage');
// // // //       throw Exception(errorMessage);
// // // //     } catch (e) {
// // // //       throw Exception('An unexpected error occurred in flight prediction: $e');
// // // //     }
// // // //   }

// // // //   Future<Map<String, dynamic>> predictHotelPrice({
// // // //     required String city,
// // // //     required int adults,
// // // //     required int children,
// // // //     required int rooms,
// // // //     required String category,
// // // //     required String roomType,
// // // //     required String checkinDate,
// // // //     required String checkoutDate,
// // // //   }) async {
// // // //     try {
// // // //       final data = {
// // // //         "city": city,
// // // //         "adults": adults,
// // // //         "children": children,
// // // //         "rooms": rooms,
// // // //         "category": category.toLowerCase(),
// // // //         "room_type": roomType.toLowerCase(),
// // // //         "checkin_date": checkinDate,
// // // //         "checkout_date": checkoutDate,
// // // //       };

// // // //       final response = await _hotelAiDio.post(
// // // //         AiApiEndpoints.hotelPrediction,
// // // //         data: data,
// // // //         options: Options(contentType: 'application/json'),
// // // //       );
// // // //       return response.data as Map<String, dynamic>;
// // // //     } on DioException catch (e) {
// // // //       final errorMessage =
// // // //           'Hotel prediction failed: ${e.response?.data['error'] ?? e.response?.statusMessage ?? e.message}';
// // // //       print('DioError on Hotel Prediction: $errorMessage');
// // // //       throw Exception(errorMessage);
// // // //     } catch (e) {
// // // //       throw Exception('An unexpected error occurred in hotel prediction: $e');
// // // //     }
// // // //   }

// // // //   Future<Map<String, dynamic>> predictCarRentalPrice({
// // // //     required String carModel,
// // // //     required int seats,
// // // //     required String transmission,
// // // //     required int capacity,
// // // //     required String city,
// // // //     required String startDate,
// // // //     required String endDate,
// // // //   }) async {
// // // //     try {
// // // //       final data = {
// // // //         "car_model": [carModel],
// // // //         "seats": [seats],
// // // //         "transmisson": [transmission], // تأكيد استخدام transmisson
// // // //         "capacity": [capacity],
// // // //         "city": [city],
// // // //         "start_date": [startDate],
// // // //         "end_date": [endDate],
// // // //       };

// // // //       final response = await _carAiDio.post(
// // // //         AiApiEndpoints.carRentalPrediction,
// // // //         data: data,
// // // //         options: Options(contentType: 'application/json'),
// // // //       );
// // // //       return response.data as Map<String, dynamic>;
// // // //     } on DioException catch (e) {
// // // //       final errorMessage =
// // // //           'Car rental prediction failed: ${e.response?.data['error'] ?? e.response?.statusMessage ?? e.message}';
// // // //       print('DioError on Car Rental Prediction: $errorMessage');
// // // //       throw Exception(errorMessage);
// // // //     } catch (e) {
// // // //       throw Exception(
// // // //           'An unexpected error occurred in car rental prediction: $e');
// // // //     }
// // // //   }
// // // // }
// // // // lib/services/api/ai_dio_client.dart

// // // import 'package:dio/dio.dart';
// // // import 'package:pretty_dio_logger/pretty_dio_logger.dart';
// // // import 'ai_api_endpoints.dart';

// // // class AiDioClient {
// // //   late Dio _flightAiDio;
// // //   late Dio _hotelAiDio;
// // //   late Dio _carAiDio;
// // //   late Dio _recommendationDio; // Dio instance for the recommendation API

// // //   static final AiDioClient _instance = AiDioClient._internal();
// // //   factory AiDioClient() => _instance;

// // //   AiDioClient._internal() {
// // //     _flightAiDio = _createDioInstance(AiApiEndpoints.flightApiBaseUrl);
// // //     _hotelAiDio = _createDioInstance(AiApiEndpoints.hotelApiBaseUrl);
// // //     _carAiDio = _createDioInstance(AiApiEndpoints.carRentalApiBaseUrl);
// // //     // Initialize the new Dio instance with the recommendation API base URL
// // //     _recommendationDio =
// // //         _createDioInstance(AiApiEndpoints.recommendationApiBaseUrl);
// // //   }

// // //   Dio _createDioInstance(String baseUrl) {
// // //     final dio = Dio(BaseOptions(
// // //       baseUrl: baseUrl,
// // //       connectTimeout: const Duration(seconds: 60),
// // //       receiveTimeout: const Duration(seconds: 60),
// // //       headers: {
// // //         'Content-Type': 'application/json',
// // //         'Accept': 'application/json',
// // //       },
// // //     ));

// // //     dio.interceptors.add(PrettyDioLogger(
// // //       requestHeader: true,
// // //       requestBody: true,
// // //       responseBody: true,
// // //       responseHeader: false,
// // //       error: true,
// // //       compact: true,
// // //       maxWidth: 90,
// // //     ));

// // //     return dio;
// // //   }

// // //   /// Fetches hotel recommendations based on user tags.
// // //   Future<List<dynamic>> getHotelRecommendations({
// // //     required int userId,
// // //     required String userTags,
// // //   }) async {
// // //     try {
// // //       final data = {
// // //         "user_id": userId,
// // //         "user_tags": userTags,
// // //       };

// // //       final response = await _recommendationDio.post(
// // //         AiApiEndpoints.hotelRecommendation,
// // //         data: data,
// // //       );

// // //       if (response.statusCode == 200 && response.data is List) {
// // //         return response.data as List<dynamic>;
// // //       } else {
// // //         throw Exception(
// // //             'Failed to get recommendations: Invalid response format');
// // //       }
// // //     } on DioException catch (e) {
// // //       final errorMessage =
// // //           'Recommendation failed: ${e.response?.data?['detail'] ?? e.response?.statusMessage ?? e.message}';
// // //       print('DioError on Hotel Recommendation: $errorMessage');
// // //       throw Exception(errorMessage);
// // //     } catch (e) {
// // //       throw Exception(
// // //           'An unexpected error occurred in hotel recommendation: $e');
// // //     }
// // //   }

// // //   // --- Existing Prediction Methods ---

// // //   Future<Map<String, dynamic>> predictFlightPrice({
// // //     required String from,
// // //     required String to,
// // //     required int adults,
// // //     required int children,
// // //     required String flightClass,
// // //     required String numStops,
// // //     required String airline,
// // //     required String date,
// // //   }) async {
// // //     // ... implementation remains the same
// // //     try {
// // //       int stops;
// // //       switch (numStops) {
// // //         case 'Non-stop':
// // //           stops = 0;
// // //           break;
// // //         case '1 Stop':
// // //           stops = 1;
// // //           break;
// // //         case '2 Stops':
// // //           stops = 2;
// // //           break;
// // //         case 'Any':
// // //           stops = 1;
// // //           break;
// // //         default:
// // //           stops = 1;
// // //       }

// // //       final data = {
// // //         "from_": [from],
// // //         "to": [to],
// // //         "adults": [adults],
// // //         "child": [children],
// // //         "class_": [flightClass.toLowerCase()],
// // //         "num_stops": [stops],
// // //         "Airline_new": [airline],
// // //         "date": [date],
// // //       };

// // //       final response = await _flightAiDio.post(
// // //         AiApiEndpoints.flightPrediction,
// // //         data: data,
// // //       );
// // //       return response.data as Map<String, dynamic>;
// // //     } on DioException catch (e) {
// // //       final errorMessage =
// // //           'Flight prediction failed: ${e.response?.data['error'] ?? e.response?.statusMessage ?? e.message}';
// // //       print('DioError on Flight Prediction: $errorMessage');
// // //       throw Exception(errorMessage);
// // //     } catch (e) {
// // //       throw Exception('An unexpected error occurred in flight prediction: $e');
// // //     }
// // //   }

// // //   Future<Map<String, dynamic>> predictHotelPrice({
// // //     required String city,
// // //     required int adults,
// // //     required int children,
// // //     required int rooms,
// // //     required String category,
// // //     required String roomType,
// // //     required String checkinDate,
// // //     required String checkoutDate,
// // //   }) async {
// // //     // ... implementation remains the same
// // //     try {
// // //       final data = {
// // //         "city": city,
// // //         "adults": adults,
// // //         "children": children,
// // //         "rooms": rooms,
// // //         "category": category.toLowerCase(),
// // //         "room_type": roomType.toLowerCase(),
// // //         "checkin_date": checkinDate,
// // //         "checkout_date": checkoutDate,
// // //       };

// // //       final response = await _hotelAiDio.post(
// // //         AiApiEndpoints.hotelPrediction,
// // //         data: data,
// // //         options: Options(contentType: 'application/json'),
// // //       );
// // //       return response.data as Map<String, dynamic>;
// // //     } on DioException catch (e) {
// // //       final errorMessage =
// // //           'Hotel prediction failed: ${e.response?.data['error'] ?? e.response?.statusMessage ?? e.message}';
// // //       print('DioError on Hotel Prediction: $errorMessage');
// // //       throw Exception(errorMessage);
// // //     } catch (e) {
// // //       throw Exception('An unexpected error occurred in hotel prediction: $e');
// // //     }
// // //   }

// // //   Future<Map<String, dynamic>> predictCarRentalPrice({
// // //     required String carModel,
// // //     required int seats,
// // //     required String transmission,
// // //     required int capacity,
// // //     required String city,
// // //     required String startDate,
// // //     required String endDate,
// // //   }) async {
// // //     // ... implementation remains the same
// // //     try {
// // //       final data = {
// // //         "car_model": [carModel],
// // //         "seats": [seats],
// // //         "transmisson": [transmission],
// // //         "capacity": [capacity],
// // //         "city": [city],
// // //         "start_date": [startDate],
// // //         "end_date": [endDate],
// // //       };

// // //       final response = await _carAiDio.post(
// // //         AiApiEndpoints.carRentalPrediction,
// // //         data: data,
// // //         options: Options(contentType: 'application/json'),
// // //       );
// // //       return response.data as Map<String, dynamic>;
// // //     } on DioException catch (e) {
// // //       final errorMessage =
// // //           'Car rental prediction failed: ${e.response?.data['error'] ?? e.response?.statusMessage ?? e.message}';
// // //       print('DioError on Car Rental Prediction: $errorMessage');
// // //       throw Exception(errorMessage);
// // //     } catch (e) {
// // //       throw Exception(
// // //           'An unexpected error occurred in car rental prediction: $e');
// // //     }
// // //   }
// // // // }
// // // import 'package:dio/dio.dart';
// // // import 'package:pretty_dio_logger/pretty_dio_logger.dart';
// // // import 'ai_api_endpoints.dart';

// // // class AiDioClient {
// // //   late Dio _flightAiDio;
// // //   late Dio _hotelAiDio;
// // //   late Dio _carAiDio;
// // //   late Dio _recommendationDio;

// // //   static final AiDioClient _instance = AiDioClient._internal();
// // //   factory AiDioClient() => _instance;

// // //   AiDioClient._internal() {
// // //     _flightAiDio = _createDioInstance(AiApiEndpoints.flightApiBaseUrl);
// // //     _hotelAiDio = _createDioInstance(AiApiEndpoints.hotelApiBaseUrl);
// // //     _carAiDio = _createDioInstance(AiApiEndpoints.carRentalApiBaseUrl);
// // //     _recommendationDio =
// // //         _createDioInstance(AiApiEndpoints.recommendationApiBaseUrl);
// // //   }

// // //   Dio _createDioInstance(String baseUrl) {
// // //     final dio = Dio(BaseOptions(
// // //       baseUrl: baseUrl,
// // //       connectTimeout: const Duration(seconds: 60),
// // //       receiveTimeout: const Duration(seconds: 60),
// // //       headers: {
// // //         'Content-Type': 'application/json',
// // //         'Accept': 'application/json',
// // //       },
// // //     ));
// // //     dio.interceptors.add(PrettyDioLogger(
// // //       requestHeader: true,
// // //       requestBody: true,
// // //       responseBody: true,
// // //       responseHeader: false,
// // //       error: true,
// // //       compact: true,
// // //       maxWidth: 90,
// // //     ));
// // //     return dio;
// // //   }

// // //   /// جلب التوصيات الخاصة بالفنادق بناءً على معرف المستخدم ووسومه.
// // //   Future<List<dynamic>> getHotelRecommendations({
// // //     required int userId,
// // //     required String userTags,
// // //   }) async {
// // //     try {
// // //       final data = {"user_id": userId, "user_tags": userTags};
// // //       final response = await _recommendationDio.post(
// // //         AiApiEndpoints.hotelRecommendation,
// // //         data: data,
// // //       );
// // //       if (response.statusCode == 200 && response.data is List) {
// // //         return response.data as List<dynamic>;
// // //       } else {
// // //         throw Exception('فشل في جلب التوصيات: تنسيق الرد غير صحيح');
// // //       }
// // //     } on DioException catch (e) {
// // //       final errorMessage =
// // //           'فشل التوصية: ${e.response?.data?['detail'] ?? e.response?.statusMessage ?? e.message}';
// // //       print('DioError on Hotel Recommendation: $errorMessage');
// // //       throw Exception(errorMessage);
// // //     } catch (e) {
// // //       throw Exception('خطأ غير متوقع في التوصية: $e');
// // //     }
// // //   }

// // //   /// توقع سعر الرحلة الجوية بناءً على المعطيات.
// // //   Future<Map<String, dynamic>> predictFlightPrice({
// // //     required String from,
// // //     required String to,
// // //     required int adults,
// // //     required int children,
// // //     required String flightClass,
// // //     required String numStops,
// // //     required String airline,
// // //     required String date,
// // //   }) async {
// // //     try {
// // //       int stops;
// // //       switch (numStops) {
// // //         case 'Non-stop':
// // //           stops = 0;
// // //           break;
// // //         case '1 Stop':
// // //           stops = 1;
// // //           break;
// // //         case '2 Stops':
// // //           stops = 2;
// // //           break;
// // //         case 'Any':
// // //           stops = 1;
// // //           break;
// // //         default:
// // //           stops = 1;
// // //       }

// // //       final data = {
// // //         "from_": [from],
// // //         "to": [to],
// // //         "adults": [adults],
// // //         "child": [children],
// // //         "class_": [flightClass.toLowerCase()],
// // //         "num_stops": [stops],
// // //         "Airline_new": [airline],
// // //         "date": [date],
// // //       };

// // //       final response = await _flightAiDio.post(
// // //         AiApiEndpoints.flightPrediction,
// // //         data: data,
// // //       );
// // //       return response.data as Map<String, dynamic>;
// // //     } on DioException catch (e) {
// // //       final errorMessage =
// // //           'فشل توقع الرحلة الجوية: ${e.response?.data['error'] ?? e.response?.statusMessage ?? e.message}';
// // //       print('DioError on Flight Prediction: $errorMessage');
// // //       throw Exception(errorMessage);
// // //     } catch (e) {
// // //       throw Exception('خطأ غير متوقع في توقع الرحلة الجوية: $e');
// // //     }
// // //   }

// // //   /// توقع سعر الفندق بناءً على المعطيات.
// // //   Future<Map<String, dynamic>> predictHotelPrice({
// // //     required String city,
// // //     required int adults,
// // //     required int children,
// // //     required int rooms,
// // //     required String category,
// // //     required String roomType,
// // //     required String checkinDate,
// // //     required String checkoutDate,
// // //   }) async {
// // //     try {
// // //       final data = {
// // //         "city": city,
// // //         "adults": adults,
// // //         "children": children,
// // //         "rooms": rooms,
// // //         "category": category.toLowerCase(),
// // //         "room_type": roomType.toLowerCase(),
// // //         "checkin_date": checkinDate,
// // //         "checkout_date": checkoutDate,
// // //       };

// // //       final response = await _hotelAiDio.post(
// // //         AiApiEndpoints.hotelPrediction,
// // //         data: data,
// // //         options: Options(contentType: 'application/json'),
// // //       );
// // //       return response.data as Map<String, dynamic>;
// // //     } on DioException catch (e) {
// // //       final errorMessage =
// // //           'فشل توقع سعر الفندق: ${e.response?.data['error'] ?? e.response?.statusMessage ?? e.message}';
// // //       print('DioError on Hotel Prediction: $errorMessage');
// // //       throw Exception(errorMessage);
// // //     } catch (e) {
// // //       throw Exception('خطأ غير متوقع في توقع سعر الفندق: $e');
// // //     }
// // //   }

// // //   /// توقع سعر تأجير السيارة بناءً على المعطيات.
// // //   Future<Map<String, dynamic>> predictCarRentalPrice({
// // //     required String carModel,
// // //     required int seats,
// // //     required String transmission,
// // //     required int capacity,
// // //     required String city,
// // //     required String startDate,
// // //     required String endDate,
// // //   }) async {
// // //     try {
// // //       final data = {
// // //         "car_model": [carModel],
// // //         "seats": [seats],
// // //         "transmisson": [transmission],
// // //         "capacity": [capacity],
// // //         "city": [city],
// // //         "start_date": [startDate],
// // //         "end_date": [endDate],
// // //       };

// // //       final response = await _carAiDio.post(
// // //         AiApiEndpoints.carRentalPrediction,
// // //         data: data,
// // //         options: Options(contentType: 'application/json'),
// // //       );
// // //       return response.data as Map<String, dynamic>;
// // //     } on DioException catch (e) {
// // //       final errorMessage =
// // //           'فشل توقع سعر تأجير السيارة: ${e.response?.data['error'] ?? e.response?.statusMessage ?? e.message}';
// // //       print('DioError on Car Rental Prediction: $errorMessage');
// // //       throw Exception(errorMessage);
// // //     } catch (e) {
// // //       throw Exception('خطأ غير متوقع في توقع سعر تأجير السيارة: $e');
// // //     }
// // //   }
// // // }
// // import 'package:dio/dio.dart';
// // import 'package:pretty_dio_logger/pretty_dio_logger.dart';
// // import 'ai_api_endpoints.dart';

// // class AiDioClient {
// //   late Dio _flightAiDio;
// //   late Dio _hotelAiDio;
// //   late Dio _carAiDio;
// //   late Dio _recommendationDio;

// //   static final AiDioClient _instance = AiDioClient._internal();
// //   factory AiDioClient() => _instance;

// //   AiDioClient._internal() {
// //     _flightAiDio = _createDioInstance(AiApiEndpoints.flightApiBaseUrl);
// //     _hotelAiDio = _createDioInstance(AiApiEndpoints.hotelApiBaseUrl);
// //     _carAiDio = _createDioInstance(AiApiEndpoints.carRentalApiBaseUrl);
// //     _recommendationDio =
// //         _createDioInstance(AiApiEndpoints.recommendationApiBaseUrl);
// //   }

// //   Dio _createDioInstance(String baseUrl) {
// //     final dio = Dio(BaseOptions(
// //       baseUrl: baseUrl,
// //       connectTimeout: const Duration(seconds: 60),
// //       receiveTimeout: const Duration(seconds: 60),
// //       headers: {
// //         'Content-Type': 'application/json',
// //         'Accept': 'application/json',
// //         // Add authentication if required (example):
// //         // 'Authorization': 'Bearer YOUR_TOKEN',
// //       },
// //     ));
// //     dio.interceptors.add(PrettyDioLogger(
// //       requestHeader: true,
// //       requestBody: true,
// //       responseBody: true,
// //       responseHeader: false,
// //       error: true,
// //       compact: true,
// //       maxWidth: 90,
// //     ));
// //     return dio;
// //   }

// //   /// Fetch hotel recommendations based on user ID and tags.
// //   Future<List<dynamic>> getHotelRecommendations({
// //     required int userId,
// //     required String userTags,
// //     double alpha = 0.5, // Default value
// //     int topN = 10,      // Default value
// //   }) async {
// //     try {
// //       final data = {
// //         "user_id": userId,
// //         "user_tags": userTags,
// //         "alpha": alpha,
// //         "top_n": topN,
// //       };
// //       final response = await _recommendationDio.post(
// //         AiApiEndpoints.hotelRecommendation,
// //         data: data,
// //       );
// //       if (response.statusCode == 200 && response.data is List) {
// //         return response.data as List<dynamic>;
// //       } else {
// //         throw Exception('Failed to fetch recommendations: Invalid response format');
// //       }
// //     } on DioException catch (e) {
// //       final errorMessage =
// //           'Recommendation failed: ${e.response?.data?['detail'] ?? e.response?.statusMessage ?? e.message}';
// //       print('DioError on Hotel Recommendation: $errorMessage');
// //       throw Exception(errorMessage);
// //     } catch (e) {
// //       throw Exception('Unexpected error in recommendation: $e');
// //     }
// //   }

// //   /// Predict flight price based on input data.
// //   Future<Map<String, dynamic>> predictFlightPrice({
// //     required String from,
// //     required String to,
// //     required int adults,
// //     required int children,
// //     required String flightClass,
// //     required String numStops,
// //     required String airline,
// //     required String date,
// //   }) async {
// //     try {
// //       int stops;
// //       switch (numStops) {
// //         case 'Non-stop':
// //           stops = 0;
// //           break;
// //         case '1 Stop':
// //           stops = 1;
// //           break;
// //         case '2 Stops':
// //           stops = 2;
// //           break;
// //         case 'Any':
// //           stops = 1;
// //           break;
// //         default:
// //           stops = 1;
// //       }

// //       final data = {
// //         "from_": [from],
// //         "to": [to],
// //         "adults": [adults],
// //         "child": [children],
// //         "class_": [flightClass.toLowerCase()],
// //         "num_stops": [stops],
// //         "Airline_new": [airline],
// //         "date": [date],
// //       };

// //       final response = await _flightAiDio.post(
// //         AiApiEndpoints.flightPrediction,
// //         data: data,
// //       );
// //       return response.data as Map<String, dynamic>;
// //     } on DioException catch (e) {
// //       final errorMessage =
// //           'Flight price prediction failed: ${e.response?.data['error'] ?? e.response?.statusMessage ?? e.message}';
// //       print('DioError on Flight Prediction: $errorMessage');
// //       throw Exception(errorMessage);
// //     } catch (e) {
// //       throw Exception('Unexpected error in flight price prediction: $e');
// //     }
// //   }

// //   /// Predict hotel price based on input data.
// //   Future<Map<String, dynamic>> predictHotelPrice({
// //     required String city,
// //     required int adults,
// //     required int children,
// //     required int rooms,
// //     required String category,
// //     required String roomType,
// //     required String checkinDate,
// //     required String checkoutDate,
// //   }) async {
// //     try {
// //       final data = {
// //         "city": city,
// //         "adults": adults,
// //         "children": children,
// //         "rooms": rooms,
// //         "category": category.toLowerCase(),
// //         "room_type": roomType.toLowerCase(),
// //         "checkin_date": checkinDate,
// //         "checkout_date": checkoutDate,
// //       };

// //       final response = await _hotelAiDio.post(
// //         AiApiEndpoints.hotelPrediction,
// //         data: data,
// //         options: Options(contentType: 'application/json'),
// //       );
// //       return response.data as Map<String, dynamic>;
// //     } on DioException catch (e) {
// //       final errorMessage =
// //           'Hotel price prediction failed: ${e.response?.data['error'] ?? e.response?.statusMessage ?? e.message}';
// //       print('DioError on Hotel Prediction: $errorMessage');
// //       throw Exception(errorMessage);
// //     } catch (e) {
// //       throw Exception('Unexpected error in hotel price prediction: $e');
// //     }
// //   }

// //   /// Predict car rental price based on input data.
// //   Future<Map<String, dynamic>> predictCarRentalPrice({
// //     required String carModel,
// //     required int seats,
// //     required String transmission,
// //     required int capacity,
// //     required String city,
// //     required String startDate,
// //     required String endDate,
// //   }) async {
// //     try {
// //       final data = {
// //         "car_model": [carModel],
// //         "seats": [seats],
// //         "transmisson": [transmission],
// //         "capacity": [capacity],
// //         "city": [city],
// //         "start_date": [startDate],
// //         "end_date": [endDate],
// //       };

// //       final response = await _carAiDio.post(
// //         AiApiEndpoints.carRentalPrediction,
// //         data: data,
// //         options: Options(contentType: 'application/json'),
// //       );
// //       return response.data as Map<String, dynamic>;
// //     } on DioException catch (e) {
// //       final errorMessage =
// //           'Car rental price prediction failed: ${e.response?.data['error'] ?? e.response?.statusMessage ?? e.message}';
// //       print('DioError on Car Rental Prediction: $errorMessage');
// //       throw Exception(errorMessage);
// //     } catch (e) {
// //       throw Exception('Unexpected error in car rental price prediction: $e');
// //     }
// //   }
// // }
// import 'package:dio/dio.dart';
// import 'package:pretty_dio_logger/pretty_dio_logger.dart';
// import 'ai_api_endpoints.dart';

// class AiDioClient {
//   late Dio _flightAiDio;
//   late Dio _hotelAiDio;
//   late Dio _carAiDio;
//   late Dio _recommendationDio;

//   static final AiDioClient _instance = AiDioClient._internal();
//   factory AiDioClient() => _instance;

//   AiDioClient._internal() {
//     _flightAiDio = _createDioInstance(AiApiEndpoints.flightApiBaseUrl);
//     _hotelAiDio = _createDioInstance(AiApiEndpoints.hotelApiBaseUrl);
//     _carAiDio = _createDioInstance(AiApiEndpoints.carRentalApiBaseUrl);
//     _recommendationDio =
//         _createDioInstance(AiApiEndpoints.recommendationApiBaseUrl);
//   }

//   Dio _createDioInstance(String baseUrl) {
//     final dio = Dio(BaseOptions(
//       baseUrl: baseUrl,
//       connectTimeout: const Duration(seconds: 60),
//       receiveTimeout: const Duration(seconds: 60),
//       headers: {
//         'Content-Type': 'application/json',
//         'Accept': 'application/json',
//         'Authorization':
//             'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9naXZlbm5hbWUiOiJuYWRhIGFobWVkIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvZW1haWxhZGRyZXNzIjoib21hcnR3MjAwNEBnbWFpbC5jb20iLCJqdGkiOiIyYzUzOTYwYS0yMGQyLTRhMTgtOTYzYS1iMmU4YmU5ZTkzMTYiLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6IjYyIiwiZXhwIjoxNzU2MDYwNDIyLCJpc3MiOiJodHRwczovL2xvY2FsaG9zdDo3MjcxLyIsImF1ZCI6Imh0dHBzOi8vbG9jYWxob3N0OjcyNzEvIn0.JlnZK_jb3pJ0uktcKUk8HI6bXOK9xBtYC6eipvrP5n8', // Added token
//       },
//     ));
//     dio.interceptors.add(PrettyDioLogger(
//       requestHeader: true,
//       requestBody: true,
//       responseBody: true,
//       responseHeader: false,
//       error: true,
//       compact: true,
//       maxWidth: 90,
//     ));
//     return dio;
//   }

//   /// Fetch hotel recommendations based on user ID and tags.
//   Future<List<dynamic>> getHotelRecommendations({
//     required int userId,
//     required String userTags,
//     double alpha = 0.5, // Default value
//     int topN = 10, // Default value
//   }) async {
//     try {
//       final data = {
//         "user_id": userId,
//         "user_tags": userTags,
//         "alpha": alpha,
//         "top_n": topN,
//       };
//       final response = await _recommendationDio.post(
//         AiApiEndpoints.hotelRecommendation,
//         data: data,
//       );
//       if (response.statusCode == 200 && response.data is List) {
//         return response.data as List<dynamic>;
//       } else {
//         throw Exception(
//             'Failed to fetch recommendations: Invalid response format');
//       }
//     } on DioException catch (e) {
//       final errorMessage =
//           'Recommendation failed: ${e.response?.data?['detail'] ?? e.response?.statusMessage ?? e.message}';
//       print('DioError on Hotel Recommendation: $errorMessage');
//       throw Exception(errorMessage);
//     } catch (e) {
//       throw Exception('Unexpected error in recommendation: $e');
//     }
//   }

//   /// Predict flight price based on input data.
//   Future<Map<String, dynamic>> predictFlightPrice({
//     required String from,
//     required String to,
//     required int adults,
//     required int children,
//     required String flightClass,
//     required String numStops,
//     required String airline,
//     required String date,
//   }) async {
//     try {
//       int stops;
//       switch (numStops) {
//         case 'Non-stop':
//           stops = 0;
//           break;
//         case '1 Stop':
//           stops = 1;
//           break;
//         case '2 Stops':
//           stops = 2;
//           break;
//         case 'Any':
//           stops = 1;
//           break;
//         default:
//           stops = 1;
//       }

//       final data = {
//         "from_": [from],
//         "to": [to],
//         "adults": [adults],
//         "child": [children],
//         "class_": [flightClass.toLowerCase()],
//         "num_stops": [stops],
//         "Airline_new": [airline],
//         "date": [date],
//       };

//       final response = await _flightAiDio.post(
//         AiApiEndpoints.flightPrediction,
//         data: data,
//       );
//       return response.data as Map<String, dynamic>;
//     } on DioException catch (e) {
//       final errorMessage =
//           'Flight price prediction failed: ${e.response?.data['error'] ?? e.response?.statusMessage ?? e.message}';
//       print('DioError on Flight Prediction: $errorMessage');
//       throw Exception(errorMessage);
//     } catch (e) {
//       throw Exception('Unexpected error in flight price prediction: $e');
//     }
//   }

//   /// Predict hotel price based on input data.
//   Future<Map<String, dynamic>> predictHotelPrice({
//     required String city,
//     required int adults,
//     required int children,
//     required int rooms,
//     required String category,
//     required String roomType,
//     required String checkinDate,
//     required String checkoutDate,
//   }) async {
//     try {
//       final data = {
//         "city": city,
//         "adults": adults,
//         "children": children,
//         "rooms": rooms,
//         "category": category.toLowerCase(),
//         "room_type": roomType.toLowerCase(),
//         "checkin_date": checkinDate,
//         "checkout_date": checkoutDate,
//       };

//       final response = await _hotelAiDio.post(
//         AiApiEndpoints.hotelPrediction,
//         data: data,
//         options: Options(contentType: 'application/json'),
//       );
//       return response.data as Map<String, dynamic>;
//     } on DioException catch (e) {
//       final errorMessage =
//           'Hotel price prediction failed: ${e.response?.data['error'] ?? e.response?.statusMessage ?? e.message}';
//       print('DioError on Hotel Prediction: $errorMessage');
//       throw Exception(errorMessage);
//     } catch (e) {
//       throw Exception('Unexpected error in hotel price prediction: $e');
//     }
//   }

//   /// Predict car rental price based on input data.
//   Future<Map<String, dynamic>> predictCarRentalPrice({
//     required String carModel,
//     required int seats,
//     required String transmission,
//     required int capacity,
//     required String city,
//     required String startDate,
//     required String endDate,
//   }) async {
//     try {
//       final data = {
//         "car_model": [carModel],
//         "seats": [seats],
//         "transmisson": [transmission],
//         "capacity": [capacity],
//         "city": [city],
//         "start_date": [startDate],
//         "end_date": [endDate],
//       };

//       final response = await _carAiDio.post(
//         AiApiEndpoints.carRentalPrediction,
//         data: data,
//         options: Options(contentType: 'application/json'),
//       );
//       return response.data as Map<String, dynamic>;
//     } on DioException catch (e) {
//       final errorMessage =
//           'Car rental price prediction failed: ${e.response?.data['error'] ?? e.response?.statusMessage ?? e.message}';
//       print('DioError on Car Rental Prediction: $errorMessage');
//       throw Exception(errorMessage);
//     } catch (e) {
//       throw Exception('Unexpected error in car rental price prediction: $e');
//     }
//   }
// }
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'ai_api_endpoints.dart'; // تأكد من أن هذا الملف موجود

class AiDioClient {
  late Dio _flightAiDio;
  late Dio _hotelAiDio;
  late Dio _carAiDio;
  late Dio _recommendationDio;

  static final AiDioClient _instance = AiDioClient._internal();
  factory AiDioClient() => _instance;

  AiDioClient._internal() {
    // تم إنشاء Dio instance لكل خدمة بشكل منفصل
    _flightAiDio = _createDioInstance(AiApiEndpoints.flightApiBaseUrl);
    _hotelAiDio = _createDioInstance(AiApiEndpoints.hotelApiBaseUrl);
    _carAiDio = _createDioInstance(AiApiEndpoints.carRentalApiBaseUrl);
    _recommendationDio =
        _createDioInstance(AiApiEndpoints.recommendationApiBaseUrl);
  }

  Dio _createDioInstance(String baseUrl) {
    final dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        // تم حذف الـ Token الثابت من هنا، يجب إضافته للطلبات التي تحتاجه فقط
      },
    ));
    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90,
    ));
    return dio;
  }

  /// جلب التوصيات الخاصة بالفنادق بناءً على معرف المستخدم.
  /// تم تصحيح هذه الدالة لتطابق مواصفات الـ API.
  Future<List<dynamic>> getHotelRecommendations({
    required int userId,
    // تم حذف userTags لأن الـ API لا يستخدمها
    double alpha = 0.5,
    int topN = 10,
  }) async {
    try {
      // CORRECT: The request body should only contain 'user_id'
      final data = {"user_id": userId};

      // CORRECT: 'alpha' and 'top_n' should be passed as query parameters
      final queryParameters = {
        'alpha': alpha,
        'top_n': topN,
      };

      final response = await _recommendationDio.post(
        AiApiEndpoints.hotelRecommendation,
        data: data,
        queryParameters: queryParameters, // استخدام queryParameters هنا
      );
      if (response.statusCode == 200 && response.data is List) {
        return response.data as List<dynamic>;
      } else {
        throw Exception('فشل في جلب التوصيات: تنسيق الرد غير صحيح');
      }
    } on DioException catch (e) {
      // هذا الخطأ سيستمر بالظهور حتى يتم حل مشكلة CORS في الـ Backend
      final errorMessage =
          'فشل التوصية: ${e.response?.data?['detail'] ?? e.response?.statusMessage ?? e.message}';
      print('DioError on Hotel Recommendation: $errorMessage');
      throw Exception(errorMessage);
    } catch (e) {
      print('Unexpected error in getHotelRecommendations: $e');
      throw Exception('خطأ غير متوقع في التوصية: $e');
    }
  }

  // ... باقي الدوال تبقى كما هي بدون تغيير ...

  /// Predict flight price based on input data.
  Future<Map<String, dynamic>> predictFlightPrice({
    required String from,
    required String to,
    required int adults,
    required int children,
    required String flightClass,
    required String numStops,
    required String airline,
    required String date,
  }) async {
    try {
      int stops;
      switch (numStops) {
        case 'Non-stop':
          stops = 0;
          break;
        case '1 Stop':
          stops = 1;
          break;
        case '2 Stops':
          stops = 2;
          break;
        case 'Any':
          stops = 1;
          break;
        default:
          stops = 1;
      }

      final data = {
        "from_": [from],
        "to": [to],
        "adults": [adults],
        "child": [children],
        "class_": [flightClass.toLowerCase()],
        "num_stops": [stops],
        "Airline_new": [airline],
        "date": [date],
      };

      final response = await _flightAiDio.post(
        AiApiEndpoints.flightPrediction,
        data: data,
      );
      return response.data as Map<String, dynamic>;
    } on DioException catch (e) {
      final errorMessage =
          'Flight price prediction failed: ${e.response?.data['error'] ?? e.response?.statusMessage ?? e.message}';
      print('DioError on Flight Prediction: $errorMessage');
      throw Exception(errorMessage);
    } catch (e) {
      throw Exception('Unexpected error in flight price prediction: $e');
    }
  }

  /// Predict hotel price based on input data.
  Future<Map<String, dynamic>> predictHotelPrice({
    required String city,
    required int adults,
    required int children,
    required int rooms,
    required String category,
    required String roomType,
    required String checkinDate,
    required String checkoutDate,
  }) async {
    try {
      final data = {
        "city": city,
        "adults": adults,
        "children": children,
        "rooms": rooms,
        "category": category.toLowerCase(),
        "room_type": roomType.toLowerCase(),
        "checkin_date": checkinDate,
        "checkout_date": checkoutDate,
      };

      final response = await _hotelAiDio.post(
        AiApiEndpoints.hotelPrediction,
        data: data,
        options: Options(contentType: 'application/json'),
      );
      return response.data as Map<String, dynamic>;
    } on DioException catch (e) {
      final errorMessage =
          'Hotel price prediction failed: ${e.response?.data['error'] ?? e.response?.statusMessage ?? e.message}';
      print('DioError on Hotel Prediction: $errorMessage');
      throw Exception(errorMessage);
    } catch (e) {
      throw Exception('Unexpected error in hotel price prediction: $e');
    }
  }

  /// Predict car rental price based on input data.
  Future<Map<String, dynamic>> predictCarRentalPrice({
    required String carModel,
    required int seats,
    required String transmission,
    required int capacity,
    required String city,
    required String startDate,
    required String endDate,
  }) async {
    try {
      final data = {
        "car_model": [carModel],
        "seats": [seats],
        "transmisson": [transmission],
        "capacity": [capacity],
        "city": [city],
        "start_date": [startDate],
        "end_date": [endDate],
      };

      final response = await _carAiDio.post(
        AiApiEndpoints.carRentalPrediction,
        data: data,
        options: Options(contentType: 'application/json'),
      );
      return response.data as Map<String, dynamic>;
    } on DioException catch (e) {
      final errorMessage =
          'Car rental price prediction failed: ${e.response?.data['error'] ?? e.response?.statusMessage ?? e.message}';
      print('DioError on Car Rental Prediction: $errorMessage');
      throw Exception(errorMessage);
    } catch (e) {
      throw Exception('Unexpected error in car rental price prediction: $e');
    }
  }
}
