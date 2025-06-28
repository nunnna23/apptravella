// import 'package:dio/dio.dart';
// import 'package:pretty_dio_logger/pretty_dio_logger.dart';
// import 'package:travella/models/CarRental.dart';
// import 'package:travella/models/Taxi.dart';
// import 'package:travella/models/api_flight.dart';
// import 'api_endpoints.dart';

// class DioClient {
//   late Dio _dio;

//   static final DioClient _instance = DioClient._internal();

//   factory DioClient() => _instance;

//   DioClient._internal() {
//     _dio = Dio(
//       BaseOptions(
//         baseUrl: ApiEndpoints.baseUrl,
//         connectTimeout: const Duration(seconds: 30),
//         receiveTimeout: const Duration(seconds: 30),
//         responseType: ResponseType.json,
//         headers: {
//           'Content-Type': 'application/json',
//           'Accept': 'application/json',
//         },
//       ),
//     );

//     const String manualToken =
//         'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9naXZlbm5hbWUiOiJuYWRhIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvZW1haWxhZGRyZXNzIjoib21hcnR3MjAwNEBnbWFpbC5jb20iLCJqdGkiOiJiN2I2ZjZiOC1hYTA2LTRjMjktYWVmMy1iMjMzZWViODA0MjkiLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6IjIiLCJleHAiOjE3NTU4OTA0OTUsImlzcyI6Imh0dHBzOi8vbG9jYWxob3N0OjcyNzEvIiwiYXVkIjoiaHR0cHM6Ly9sb2NhbGhvc3Q6NzI3MS8ifQ.-SHvGQxPq6t1XQamP9kE5SWwY1tV5zHoK8JZSTg1GaY';

//     _dio.interceptors.add(PrettyDioLogger(
//       requestBody: true,
//       responseBody: true,
//       requestHeader: true,
//       responseHeader: false,
//     ));

//     _dio.interceptors.add(
//       InterceptorsWrapper(
//         onRequest: (options, handler) async {
//           options.headers['Authorization'] = 'Bearer $manualToken';
//           return handler.next(options);
//         },
//         onError: (DioException error, handler) async {
//           print('Dio Error: ${error.message} - ${error.response?.data}');
//           return handler.next(error);
//         },
//       ),
//     );
//   }

//   Dio get dio => _dio;

//   Future<Response> get(String path,
//       {Map<String, dynamic>? queryParameters, Options? options}) async {
//     try {
//       return await _dio.get(path,
//           queryParameters: queryParameters, options: options);
//     } on DioException catch (e) {
//       throw _handleDioError(e);
//     }
//   }

//   Future<Response> post(String path,
//       {dynamic data,
//       Map<String, dynamic>? queryParameters,
//       Options? options}) async {
//     try {
//       return await _dio.post(path,
//           data: data, queryParameters: queryParameters, options: options);
//     } on DioException catch (e) {
//       throw _handleDioError(e);
//     }
//   }

//   Future<Response> put(String path,
//       {dynamic data,
//       Map<String, dynamic>? queryParameters,
//       Options? options}) async {
//     try {
//       return await _dio.put(path,
//           data: data, queryParameters: queryParameters, options: options);
//     } on DioException catch (e) {
//       throw _handleDioError(e);
//     }
//   }

//   Future<Response> delete(String path,
//       {dynamic data,
//       Map<String, dynamic>? queryParameters,
//       Options? options}) async {
//     try {
//       return await _dio.delete(path,
//           data: data, queryParameters: queryParameters, options: options);
//     } on DioException catch (e) {
//       throw _handleDioError(e);
//     }
//   }

//   Future<String> createCarRentalCheckoutSession({
//     required double amount,
//     required String serviceName,
//     required int carRentalId,
//     String? pickUpLocation,
//     DateTime? date,
//   }) async {
//     try {
//       final data = {
//         'amount': amount.toInt(),
//         'serviceName': serviceName,
//         'carRentalId': carRentalId,
//         if (pickUpLocation != null) 'pickUpLocation': pickUpLocation,
//         if (date != null) 'date': date.toIso8601String(),
//       };
//       final response = await _dio.post(
//         ApiEndpoints.createCarRentalCheckoutSession,
//         data: data,
//       );
//       if (response.statusCode == 200 && response.data['url'] != null) {
//         return response.data['url'] as String;
//       } else {
//         throw Exception(
//             'Failed to create checkout session: ${response.statusCode} - ${response.data.toString()}');
//       }
//     } on DioException catch (e) {
//       throw _handleDioError(e);
//     }
//   }

//   Future<List<ApiFlight>> searchFlights({
//     required String from,
//     required String to,
//     required DateTime departureDate,
//     required DateTime returnDate,
//     required int adults,
//     required int children,
//     required String category,
//   }) async {
//     try {
//       final data = {
//         'fromLocation': from,
//         'destination': to,
//         'departureTime': departureDate.toIso8601String(),
//         'arrivalTime': returnDate.toIso8601String(),
//         'category': category,
//         'numberOfpersons': {'adults': adults, 'children': children},
//       };
//       final response = await _dio.post(ApiEndpoints.flightSearch, data: data);
//       return (response.data as List)
//           .map((json) => ApiFlight.fromJson(json))
//           .toList();
//     } on DioException catch (e) {
//       print('Dio Error: ${e.response?.data}');
//       throw _handleDioError(e);
//     }
//   }

//   Future<List<Taxi>> getTaxis() async {
//     try {
//       final response = await _dio.get(ApiEndpoints.taxiList);
//       return (response.data as List)
//           .map((json) => Taxi.fromJson(json))
//           .toList();
//     } on DioException catch (e) {
//       throw _handleDioError(e);
//     }
//   }

//   Future<Taxi> getTaxiById(int id) async {
//     try {
//       final response = await _dio.get(ApiEndpoints.taxiById(id));
//       return Taxi.fromJson(response.data);
//     } on DioException catch (e) {
//       throw _handleDioError(e);
//     }
//   }

//   Future<List<Taxi>> searchTaxis({
//     required String pickUpLocation,
//     required DateTime date,
//     required Map<String, int> passengers,
//   }) async {
//     try {
//       final data = {
//         'pickUpLocation': pickUpLocation,
//         'date': date.toIso8601String(),
//         'passengers': passengers,
//       };
//       final response = await _dio.post(ApiEndpoints.searchTaxis, data: data);
//       return (response.data as List)
//           .map((json) => Taxi.fromJson(json))
//           .toList();
//     } on DioException catch (e) {
//       throw _handleDioError(e);
//     }
//   }

//   Future<List<Taxi>> filterTaxis({
//     double minPrice = 0,
//     double maxPrice = 2000,
//     int minTime = 0,
//     int maxTime = 999,
//     int driverAgeMin = 0,
//     int driverAgeMax = 99,
//     int minDistance = 0,
//     int maxDistance = 999,
//     double minRating = 0.0,
//     String? pickUpLocation,
//   }) async {
//     try {
//       final data = {
//         'minPrice': minPrice,
//         'maxPrice': maxPrice,
//         'minTime': minTime,
//         'maxTime': maxTime,
//         'driverAgeMin': driverAgeMin,
//         'driverAgeMax': driverAgeMax,
//         'minDistance': minDistance,
//         'maxDistance': maxDistance,
//         'minRating': minRating,
//         if (pickUpLocation != null) 'pickUpLocation': pickUpLocation,
//       };
//       final response = await _dio.post(ApiEndpoints.filterTaxis, data: data);
//       return (response.data as List)
//           .map((json) => Taxi.fromJson(json))
//           .toList();
//     } on DioException catch (e) {
//       throw _handleDioError(e);
//     }
//   }

//   Future<List<Taxi>> getAvailableTaxis({
//     required String pickUpLocation,
//     required DateTime date,
//     required int adults,
//     required int children,
//   }) async {
//     try {
//       final url =
//           ApiEndpoints.availableTaxis(pickUpLocation, date, adults, children);
//       final response = await _dio.get(url);
//       return (response.data as List)
//           .map((json) => Taxi.fromJson(json))
//           .toList();
//     } on DioException catch (e) {
//       throw _handleDioError(e);
//     }
//   }

//   Future<List<CarRental>> getCarRentals() async {
//     try {
//       final response = await _dio.get(ApiEndpoints.carRentalList);
//       return (response.data as List)
//           .map((json) => CarRental.fromJson(json))
//           .toList();
//     } on DioException catch (e) {
//       throw _handleDioError(e);
//     }
//   }

//   Future<CarRental> getCarRentalById(int id) async {
//     try {
//       final response = await _dio.get(ApiEndpoints.carRentalById(id));
//       return CarRental.fromJson(response.data);
//     } on DioException catch (e) {
//       throw _handleDioError(e);
//     }
//   }

//   Future<List<CarRental>> searchCarRentals({
//     required String pickUpLocation,
//     required DateTime date,
//     required String rentType,
//   }) async {
//     try {
//       final data = {
//         'pickUpLocation': pickUpLocation,
//         'date': date.toIso8601String(),
//         'rentType': rentType,
//       };
//       final response =
//           await _dio.post(ApiEndpoints.searchCarRentals, data: data);
//       return (response.data as List)
//           .map((json) => CarRental.fromJson(json))
//           .toList();
//     } on DioException catch (e) {
//       throw _handleDioError(e);
//     }
//   }

//   Future<List<CarRental>> getAvailableCarRentals({
//     required String pickUpLocation,
//     required DateTime date,
//   }) async {
//     try {
//       final queryParams = {
//         'pickupLocation': pickUpLocation,
//         'date': date.toIso8601String(),
//       };
//       final response = await _dio.get(ApiEndpoints.availableCarRentals,
//           queryParameters: queryParams);
//       return (response.data as List)
//           .map((json) => CarRental.fromJson(json))
//           .toList();
//     } on DioException catch (e) {
//       throw _handleDioError(e);
//     }
//   }

//   Future<void> deleteCarRental(int id) async {
//     try {
//       await _dio.delete(ApiEndpoints.deleteCarRental(id));
//     } on DioException catch (e) {
//       throw _handleDioError(e);
//     }
//   }

//   Future<void> sendNotification({
//     required String userId,
//     required String message,
//   }) async {
//     try {
//       final data = {'userId': userId, 'message': message};
//       await _dio.post(ApiEndpoints.sendNotification, data: data);
//     } on DioException catch (e) {
//       throw _handleDioError(e);
//     }
//   }

//   Future<List<Map<String, dynamic>>> getNotifications() async {
//     try {
//       final response = await _dio.get(ApiEndpoints.getNotifications);
//       return List<Map<String, dynamic>>.from(response.data);
//     } on DioException catch (e) {
//       throw _handleDioError(e);
//     }
//   }

//   Future<void> markNotificationAsRead(int id) async {
//     try {
//       await _dio.put('${ApiEndpoints.getNotifications}/$id/read');
//     } on DioException catch (e) {
//       throw _handleDioError(e);
//     }
//   }

//   Future<void> deleteNotification(int id) async {
//     try {
//       await _dio.delete('${ApiEndpoints.getNotifications}/$id');
//     } on DioException catch (e) {
//       throw _handleDioError(e);
//     }
//   }

//   Future<void> updateNotificationSettings({
//     required bool enableEmailNotifications,
//     required bool enablePushNotifications,
//     required bool enableSmsNotifications,
//   }) async {
//     try {
//       final data = {
//         'enableEmailNotifications': enableEmailNotifications,
//         'enablePushNotifications': enablePushNotifications,
//         'enableSmsNotifications': enableSmsNotifications,
//       };
//       await _dio.put(ApiEndpoints.updateNotificationSettings, data: data);
//     } on DioException catch (e) {
//       throw _handleDioError(e);
//     }
//   }

//   Future<List<dynamic>> getAllActivities() async {
//     try {
//       final response = await _dio.get(ApiEndpoints.activityList);
//       return response.data as List<dynamic>;
//     } on DioException catch (e) {
//       throw _handleDioError(e);
//     }
//   }

//   Future<Map<String, dynamic>> getActivityById(int id) async {
//     try {
//       final response = await _dio.get('${ApiEndpoints.activityList}/$id');
//       return response.data as Map<String, dynamic>;
//     } on DioException catch (e) {
//       throw _handleDioError(e);
//     }
//   }

//   Future<void> deleteActivityById(int id) async {
//     try {
//       await _dio.delete('${ApiEndpoints.activityList}/$id');
//     } on DioException catch (e) {
//       throw _handleDioError(e);
//     }
//   }

//   Future<List<Map<String, dynamic>>> getExploreEgypt() async {
//     try {
//       final response = await _dio.get(ApiEndpoints.exploreEgypt);
//       if (response.statusCode == 200) {
//         return List<Map<String, dynamic>>.from(response.data);
//       } else {
//         throw Exception(
//             'Failed to fetch Explore Egypt: ${response.statusCode}');
//       }
//     } on DioException catch (e) {
//       throw _handleDioError(e);
//     }
//   }

//   Future<List<Map<String, dynamic>>> getActivitiesByLocation(
//       String location) async {
//     try {
//       final response =
//           await _dio.get('${ApiEndpoints.activityByLocation}/$location');
//       return List<Map<String, dynamic>>.from(response.data);
//     } on DioException catch (e) {
//       throw _handleDioError(e);
//     }
//   }

//   Future<List<Map<String, dynamic>>> getCitiesByCountry(
//       String countryName) async {
//     try {
//       final response =
//           await _dio.get('${ApiEndpoints.citiesByCountry}/$countryName');
//       return List<Map<String, dynamic>>.from(response.data);
//     } on DioException catch (e) {
//       throw _handleDioError(e);
//     }
//   }

//   String _handleDioError(DioException e) {
//     String errorMessage;
//     if (e.response != null) {
//       final responseData = e.response!.data;
//       final statusCode = e.response!.statusCode;
//       print("Dio Error: Status $statusCode, Data: $responseData");

//       if (responseData is Map && responseData.containsKey('errors')) {
//         final errors = responseData['errors'] as Map;
//         errorMessage = errors.entries
//             .map((entry) => '${entry.key}: ${entry.value.join(", ")}')
//             .join('\n');
//       } else if (responseData is Map && responseData.containsKey('title')) {
//         errorMessage = responseData['title'];
//       } else if (responseData is Map && responseData.containsKey('detail')) {
//         errorMessage = responseData['detail'];
//       } else if (responseData is Map && responseData.containsKey('error')) {
//         errorMessage = responseData['error'];
//       } else {
//         errorMessage = 'Error: $statusCode. An unexpected error occurred.';
//       }
//     } else {
//       errorMessage =
//           'Network Error: Please check your connection. ${e.message}';
//     }
//     return errorMessage;
//   }
// }
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:apptravella/models/CarRental.dart';
import 'package:apptravella/models/Taxi.dart';
import 'package:apptravella/models/api_flight.dart';
import 'api_endpoints.dart';

class DioClient {
  late Dio _dio;

  static final DioClient _instance = DioClient._internal();

  factory DioClient() => _instance;

  DioClient._internal() {
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

    // const String manualToken =
    //     'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9naXZlbm5hbWUiOiJuYWRhIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvZW1haWxhZGRyZXNzIjoib21hcnR3MjAwNEBnbWFpbC5jb20iLCJqdGkiOiJiN2I2ZjZiOC1hYTA2LTRjMjktYWVmMy1iMjMzZWViODA0MjkiLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6IjIiLCJleHAiOjE3NTU4OTA0OTUsImlzcyI6Imh0dHBzOi8vbG9jYWxob3N0OjcyNzEvIiwiYXVkIjoiaHR0cHM6Ly9sb2NhbGhvc3Q6NzI3MS8ifQ.-SHvGQxPq6t1XQamP9kE5SWwY1tV5zHoK8JZSTg1GaY';
    const String manualToken =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9naXZlbm5hbWUiOiJuYWRhYSIsImh0dHA6Ly9zY2hlbWFzLnhtbHNvYXAub3JnL3dzLzIwMDUvMDUvaWRlbnRpdHkvY2xhaW1zL2VtYWlsYWRkcmVzcyI6Im9tYXJ0dzIwMDRAZ21haWwuY29tIiwianRpIjoiOTMxZTQzMTQtZGY0OS00M2YzLWFkZTMtM2ExZDEwM2MyM2ViIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvbmFtZWlkZW50aWZpZXIiOiI3NyIsImV4cCI6MTc1NjIzOTY3OCwiaXNzIjoiaHR0cHM6Ly9sb2NhbGhvc3Q6NzI3MS8iLCJhdWQiOiJodHRwczovL2xvY2FsaG9zdDo3MjcxLyJ9.a9tOnRAMXwOF-6sArcDHYQTFypVoquuBXsM0OtcjMtE';
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
        onError: (DioException error, handler) async {
          print('Dio Error: ${error.message} - ${error.response?.data}');
          return handler.next(error);
        },
      ),
    );
  }

  Dio get dio => _dio;

  Future<Response> get(String path,
      {Map<String, dynamic>? queryParameters, Options? options}) async {
    try {
      return await _dio.get(path,
          queryParameters: queryParameters, options: options);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<Response> post(String path,
      {dynamic data,
      Map<String, dynamic>? queryParameters,
      Options? options}) async {
    try {
      return await _dio.post(path,
          data: data, queryParameters: queryParameters, options: options);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<Response> put(String path,
      {dynamic data,
      Map<String, dynamic>? queryParameters,
      Options? options}) async {
    try {
      return await _dio.put(path,
          data: data, queryParameters: queryParameters, options: options);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<Response> delete(String path,
      {dynamic data,
      Map<String, dynamic>? queryParameters,
      Options? options}) async {
    try {
      return await _dio.delete(path,
          data: data, queryParameters: queryParameters, options: options);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<void> updatePreferences({
    required Map<String, dynamic> preferences,
  }) async {
    try {
      final response = await _dio.post(
        ApiEndpoints.updatePreferences,
        data: preferences,
        options: Options(headers: {'Accept': '*/*'}),
      );
      if (response.statusCode != 200) {
        throw Exception(
            'Failed to update preferences: ${response.statusMessage}');
      }
    } on DioException catch (e) {
      final errorMessage =
          'Update preferences failed: ${e.response?.data['detail'] ?? e.response?.statusMessage ?? e.message}';
      print('DioError on Update Preferences: $errorMessage');
      throw Exception(errorMessage);
    } catch (e) {
      throw Exception('An unexpected error occurred in update preferences: $e');
    }
  }

  Future<String> createCarRentalCheckoutSession({
    required double amount,
    required String serviceName,
    required int carRentalId,
    String? pickUpLocation,
    DateTime? date,
  }) async {
    try {
      final data = {
        'amount': amount.toInt(),
        'serviceName': serviceName,
        'carRentalId': carRentalId,
        if (pickUpLocation != null) 'pickUpLocation': pickUpLocation,
        if (date != null) 'date': date.toIso8601String(),
      };
      final response = await _dio.post(
        ApiEndpoints.createCarRentalCheckoutSession,
        data: data,
      );
      if (response.statusCode == 200 && response.data['url'] != null) {
        return response.data['url'] as String;
      } else {
        throw Exception(
            'Failed to create checkout session: ${response.statusCode} - ${response.data.toString()}');
      }
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

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
        'arrivalTime': returnDate.toIso8601String(),
        'category': category,
        'numberOfpersons': {'adults': adults, 'children': children},
      };
      final response = await _dio.post(ApiEndpoints.flightSearch, data: data);
      return (response.data as List)
          .map((json) => ApiFlight.fromJson(json))
          .toList();
    } on DioException catch (e) {
      print('Dio Error: ${e.response?.data}');
      throw _handleDioError(e);
    }
  }

  Future<List<Taxi>> getTaxis() async {
    try {
      final response = await _dio.get(ApiEndpoints.taxiList);
      return (response.data as List)
          .map((json) => Taxi.fromJson(json))
          .toList();
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<Taxi> getTaxiById(int id) async {
    try {
      final response = await _dio.get(ApiEndpoints.taxiById(id));
      return Taxi.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<List<Taxi>> searchTaxis({
    required String pickUpLocation,
    required DateTime date,
    required Map<String, int> passengers,
  }) async {
    try {
      final data = {
        'pickUpLocation': pickUpLocation,
        'date': date.toIso8601String(),
        'passengers': passengers,
      };
      final response = await _dio.post(ApiEndpoints.searchTaxis, data: data);
      return (response.data as List)
          .map((json) => Taxi.fromJson(json))
          .toList();
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<List<Taxi>> filterTaxis({
    double minPrice = 0,
    double maxPrice = 2000,
    int minTime = 0,
    int maxTime = 999,
    int driverAgeMin = 0,
    int driverAgeMax = 99,
    int minDistance = 0,
    int maxDistance = 999,
    double minRating = 0.0,
    String? pickUpLocation,
  }) async {
    try {
      final data = {
        'minPrice': minPrice,
        'maxPrice': maxPrice,
        'minTime': minTime,
        'maxTime': maxTime,
        'driverAgeMin': driverAgeMin,
        'driverAgeMax': driverAgeMax,
        'minDistance': minDistance,
        'maxDistance': maxDistance,
        'minRating': minRating,
        if (pickUpLocation != null) 'pickUpLocation': pickUpLocation,
      };
      final response = await _dio.post(ApiEndpoints.filterTaxis, data: data);
      return (response.data as List)
          .map((json) => Taxi.fromJson(json))
          .toList();
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<List<Taxi>> getAvailableTaxis({
    required String pickUpLocation,
    required DateTime date,
    required int adults,
    required int children,
  }) async {
    try {
      final url =
          ApiEndpoints.availableTaxis(pickUpLocation, date, adults, children);
      final response = await _dio.get(url);
      return (response.data as List)
          .map((json) => Taxi.fromJson(json))
          .toList();
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<List<CarRental>> getCarRentals() async {
    try {
      final response = await _dio.get(ApiEndpoints.carRentalList);
      return (response.data as List)
          .map((json) => CarRental.fromJson(json))
          .toList();
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<CarRental> getCarRentalById(int id) async {
    try {
      final response = await _dio.get(ApiEndpoints.carRentalById(id));
      return CarRental.fromJson(response.data);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<List<CarRental>> searchCarRentals({
    required String pickUpLocation,
    required DateTime date,
    required String rentType,
  }) async {
    try {
      final data = {
        'pickUpLocation': pickUpLocation,
        'date': date.toIso8601String(),
        'rentType': rentType,
      };
      final response =
          await _dio.post(ApiEndpoints.searchCarRentals, data: data);
      return (response.data as List)
          .map((json) => CarRental.fromJson(json))
          .toList();
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<List<CarRental>> getAvailableCarRentals({
    required String pickUpLocation,
    required DateTime date,
  }) async {
    try {
      final queryParams = {
        'pickupLocation': pickUpLocation,
        'date': date.toIso8601String(),
      };
      final response = await _dio.get(ApiEndpoints.availableCarRentals,
          queryParameters: queryParams);
      return (response.data as List)
          .map((json) => CarRental.fromJson(json))
          .toList();
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<void> deleteCarRental(int id) async {
    try {
      await _dio.delete(ApiEndpoints.deleteCarRental(id));
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<void> sendNotification({
    required String userId,
    required String message,
  }) async {
    try {
      final data = {'userId': userId, 'message': message};
      await _dio.post(ApiEndpoints.sendNotification, data: data);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<List<Map<String, dynamic>>> getNotifications() async {
    try {
      final response = await _dio.get(ApiEndpoints.getNotifications);
      return List<Map<String, dynamic>>.from(response.data);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<void> markNotificationAsRead(int id) async {
    try {
      await _dio.put('${ApiEndpoints.getNotifications}/$id/read');
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<void> deleteNotification(int id) async {
    try {
      await _dio.delete('${ApiEndpoints.getNotifications}/$id');
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<void> updateNotificationSettings({
    required bool enableEmailNotifications,
    required bool enablePushNotifications,
    required bool enableSmsNotifications,
  }) async {
    try {
      final data = {
        'enableEmailNotifications': enableEmailNotifications,
        'enablePushNotifications': enablePushNotifications,
        'enableSmsNotifications': enableSmsNotifications,
      };
      await _dio.put(ApiEndpoints.updateNotificationSettings, data: data);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<List<dynamic>> getAllActivities() async {
    try {
      final response = await _dio.get(ApiEndpoints.activityList);
      return response.data as List<dynamic>;
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<Map<String, dynamic>> getActivityById(int id) async {
    try {
      final response = await _dio.get('${ApiEndpoints.activityList}/$id');
      return response.data as Map<String, dynamic>;
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<void> deleteActivity(int id) async {
    try {
      await _dio.delete('${ApiEndpoints.activityList}/$id');
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<List<Map<String, dynamic>>> getExploreEgypt() async {
    try {
      final response = await _dio.get(ApiEndpoints.exploreEgypt);
      if (response.statusCode == 200) {
        return List<Map<String, dynamic>>.from(response.data);
      } else {
        throw Exception(
            'Failed to fetch Explore Egypt: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<List<Map<String, dynamic>>> getActivitiesByLocation(
      String location) async {
    try {
      final response =
          await _dio.get('${ApiEndpoints.activityByLocation}/$location');
      return List<Map<String, dynamic>>.from(response.data);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

  Future<List<Map<String, dynamic>>> getCitiesByCountry(
      String countryName) async {
    try {
      final response =
          await _dio.get('${ApiEndpoints.citiesByCountry}/$countryName');
      return List<Map<String, dynamic>>.from(response.data);
    } on DioException catch (e) {
      throw _handleDioError(e);
    }
  }

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
      errorMessage =
          'Network Error: Please check your connection. ${e.message}';
    }
    return errorMessage;
  }
}
