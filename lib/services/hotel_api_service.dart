// // // import 'package:travella/services/api/api_endpoints.dart';
// // // import 'package:travella/services/api/dio_client.dart';
// // // import '../models/hotel_model.dart';

// // // class HotelApiService {
// // //   final DioClient _dioClient = DioClient();

// // //   Future<List<Hotel>> getAllHotels() async {
// // //     try {
// // //       final response = await _dioClient.get(ApiEndpoints.getAllHotels);
// // //       if (response.data is List) {
// // //         final List<dynamic> data = response.data;
// // //         return data.map((json) => Hotel.fromJson(json)).toList();
// // //       } else {
// // //         throw Exception('API did not return a list of hotels');
// // //       }
// // //     } catch (e) {
// // //       print("Error in getAllHotels: $e");
// // //       throw Exception('Failed to load hotels: $e');
// // //     }
// // //   }

// // //   Future<List<Hotel>> getDeals() async {
// // //     try {
// // //       final response = await _dioClient.get(ApiEndpoints.hotelDeals);
// // //       if (response.data is List) {
// // //         final List<dynamic> data = response.data;
// // //         return data.map((json) => Hotel.fromJson(json)).toList();
// // //       } else {
// // //         throw Exception('API did not return a list of deals');
// // //       }
// // //     } catch (e) {
// // //       print("Error in getDeals: $e");
// // //       throw Exception('Failed to load deals: $e');
// // //     }
// // //   }

// // //   Future<List<Hotel>> searchHotels({
// // //     required String city,
// // //     required DateTime checkInDate,
// // //     required DateTime checkOutDate,
// // //     required int adults,
// // //     required int children,
// // //   }) async {
// // //     try {
// // //       final response = await _dioClient.post(
// // //         ApiEndpoints.hotelSearch,
// // //         data: {
// // //           'city': city,
// // //           'checkInDate': checkInDate.toIso8601String(),
// // //           'checkOutDate': checkOutDate.toIso8601String(),
// // //           'numberofPersons': {'adults': adults, 'children': children},
// // //         },
// // //       );
// // //       final List<dynamic> data = response.data;
// // //       return data.map((json) => Hotel.fromJson(json)).toList();
// // //     } catch (e) {
// // //       print("Error in searchHotels: $e");
// // //       throw Exception('Failed to search hotels: $e');
// // //     }
// // //   }

// // //   Future<List<Hotel>> filterHotels({
// // //     double? minPrice,
// // //     double? maxPrice,
// // //     String? roomType,
// // //     bool? hasPool,
// // //     bool? hasGym,
// // //     bool? hasSpa,
// // //     bool? hasRestaurant,
// // //     bool? hasParking,
// // //     bool? hasWifi,
// // //     String? cancellationPolicy,
// // //     double? minRating,
// // //   }) async {
// // //     try {
// // //       final Map<String, dynamic> queryParams = {};

// // //       if (minPrice != null) queryParams['MinPrice'] = minPrice;
// // //       if (maxPrice != null) queryParams['MaxPrice'] = maxPrice;
// // //       queryParams['RoomType'] = roomType ?? 'All';
// // //       if (hasPool != null) queryParams['HasPool'] = hasPool;
// // //       if (hasGym != null) queryParams['HasGym'] = hasGym;
// // //       if (hasSpa != null) queryParams['HasSpa'] = hasSpa;
// // //       if (hasRestaurant != null) queryParams['HasRestaurant'] = hasRestaurant;
// // //       if (hasParking != null) queryParams['HasParking'] = hasParking;
// // //       if (hasWifi != null) queryParams['HasWifi'] = hasWifi;
// // //       if (cancellationPolicy != null &&
// // //           cancellationPolicy.toLowerCase() != 'all') {
// // //         queryParams['CancellationPolicy'] = cancellationPolicy;
// // //       }
// // //       if (minRating != null && minRating > 0) {
// // //         queryParams['MinRating'] = minRating;
// // //       }

// // //       final response = await _dioClient.get(ApiEndpoints.hotelFilter,
// // //           queryParameters: queryParams);
// // //       final List<dynamic> data = response.data;
// // //       return data.map((json) => Hotel.fromJson(json)).toList();
// // //     } catch (e) {
// // //       print("Error in filterHotels: $e");
// // //       throw Exception('Failed to filter hotels: $e');
// // //     }
// // //   }

// // //   Future<Hotel> getHotelById(int id) async {
// // //     try {
// // //       final response = await _dioClient.get(ApiEndpoints.hotelById(id));
// // //       return Hotel.fromJson(response.data);
// // //     } catch (e) {
// // //       print("Error in getHotelById: $e");
// // //       throw Exception('Failed to load hotel details: $e');
// // //     }
// // //   }

// // //   Future<void> toggleFavorite(int hotelId) async {
// // //     try {
// // //       await _dioClient.post(ApiEndpoints.toggleFavorite(hotelId));
// // //     } catch (e) {
// // //       print("Error in toggleFavorite: $e");
// // //       throw Exception('Failed to update favorite status: $e');
// // //     }
// // //   }

// // //   Future<HotelComparison> compareHotels(int hotelId1, int hotelId2) async {
// // //     try {
// // //       final response =
// // //           await _dioClient.get(ApiEndpoints.compareHotels(hotelId1, hotelId2));
// // //       return HotelComparison.fromJson(response.data);
// // //     } catch (e) {
// // //       print("Error in compareHotels: $e");
// // //       throw Exception('Failed to compare hotels: $e');
// // //     }
// // //   }

// // //   Future<List<Hotel>> getFavoriteHotels() async {
// // //     try {
// // //       final response = await _dioClient.get(ApiEndpoints.userFavorites);
// // //       if (response.data is List) {
// // //         final List<dynamic> data = response.data;
// // //         return data.map((json) => Hotel.fromJson(json)).toList();
// // //       } else {
// // //         throw Exception('API did not return a list of favorite hotels');
// // //       }
// // //     } catch (e) {
// // //       print("Error in getFavoriteHotels: $e");
// // //       throw Exception('Failed to load favorite hotels: $e');
// // //     }
// // //   }

// // //   Future<List<Hotel>> getSuggestions() async {
// // //     try {
// // //       final response = await _dioClient.get(ApiEndpoints.suggestions);
// // //       if (response.data is List) {
// // //         final List<dynamic> data = response.data;
// // //         return data.map((json) => Hotel.fromJson(json)).toList();
// // //       } else {
// // //         throw Exception('API did not return a list of suggestions');
// // //       }
// // //     } catch (e) {
// // //       print("Error in getSuggestions: $e");
// // //       throw Exception('Failed to load suggestions: $e');
// // //     }
// // //   }

// // //   Future<List<Hotel>> getTopRated() async {
// // //     try {
// // //       final response = await _dioClient.get(ApiEndpoints.topRated);
// // //       if (response.data is List) {
// // //         final List<dynamic> data = response.data;
// // //         return data.map((json) => Hotel.fromJson(json)).toList();
// // //       } else {
// // //         throw Exception('API did not return a list of top rated hotels');
// // //       }
// // //     } catch (e) {
// // //       print("Error in getTopRated: $e");
// // //       throw Exception('Failed to load top rated hotels: $e');
// // //     }
// // //   }

// // //   Future<List<Hotel>> getNearbyByLocation(String location) async {
// // //     try {
// // //       final response = await _dioClient
// // //           .get('${ApiEndpoints.nearbyByLocation}?location=$location');
// // //       if (response.data is List) {
// // //         final List<dynamic> data = response.data;
// // //         return data.map((json) => Hotel.fromJson(json)).toList();
// // //       } else {
// // //         throw Exception('API did not return a list of nearby hotels');
// // //       }
// // //     } catch (e) {
// // //       print("Error in getNearbyByLocation: $e");
// // //       throw Exception('Failed to load nearby hotels: $e');
// // //     }
// // //   }
// // // }
// // // import 'package:dio/dio.dart';
// // import 'package:dio/dio.dart';
// // import 'package:shared_preferences/shared_preferences.dart';
// // import 'package:travella/services/api/api_endpoints.dart';
// // import 'package:travella/services/api/dio_client.dart';
// // import '../models/hotel_model.dart';

// // class HotelApiService {
// //   final DioClient _dioClient = DioClient();

// //   // Future<List<Hotel>> getAllHotels() async {
// //   //   try {
// //   //     final response = await _dioClient.get(ApiEndpoints.getAllHotels);
// //   //     if (response.data is List) {
// //   //       final List<dynamic> data = response.data;
// //   //       return data.map((json) => Hotel.fromJson(json)).toList();
// //   //     } else {
// //   //       throw Exception('API did not return a list of hotels');
// //   //     }
// //   //   } catch (e) {
// //   //     print("Error in getAllHotels: $e");
// //   //     throw Exception('Failed to load hotels: $e');
// //   //   }
// //   // }
// //   Future<List<Hotel>> getAllHotels() async {
// //     try {
// //       final prefs = await SharedPreferences.getInstance();
// //       final token = prefs.getString('auth_token');
// //       final options = Options(
// //           headers: token != null ? {'Authorization': 'Bearer $token'} : {});
// //       final response =
// //           await _dioClient.get(ApiEndpoints.getAllHotels, options: options);
// //       if (response.data is List) {
// //         final List<dynamic> data = response.data;
// //         return data.map((json) => Hotel.fromJson(json)).toList();
// //       } else {
// //         throw Exception('API did not return a list of hotels');
// //       }
// //     } catch (e) {
// //       print("Error in getAllHotels: $e");
// //       throw Exception('Failed to load hotels: $e');
// //     }
// //   }

// //   Future<List<Hotel>> getDeals() async {
// //     try {
// //       final response = await _dioClient.get(ApiEndpoints.hotelDeals);
// //       if (response.data is List) {
// //         final List<dynamic> data = response.data;
// //         return data.map((json) => Hotel.fromJson(json)).toList();
// //       } else {
// //         throw Exception('API did not return a list of deals');
// //       }
// //     } catch (e) {
// //       print("Error in getDeals: $e");
// //       throw Exception('Failed to load deals: $e');
// //     }
// //   }

// //   Future<List<Hotel>> searchHotels({
// //     required String city,
// //     required DateTime checkInDate,
// //     required DateTime checkOutDate,
// //     required int adults,
// //     required int children,
// //   }) async {
// //     try {
// //       final response = await _dioClient.post(
// //         ApiEndpoints.hotelSearch,
// //         data: {
// //           'city': city,
// //           'checkInDate': checkInDate.toIso8601String(),
// //           'checkOutDate': checkOutDate.toIso8601String(),
// //           'numberofPersons': {'adults': adults, 'children': children},
// //         },
// //       );
// //       final List<dynamic> data = response.data;
// //       return data.map((json) => Hotel.fromJson(json)).toList();
// //     } catch (e) {
// //       print("Error in searchHotels: $e");
// //       throw Exception('Failed to search hotels: $e');
// //     }
// //   }

// //   Future<List<Hotel>> filterHotels({
// //     double? minPrice,
// //     double? maxPrice,
// //     String? roomType,
// //     bool? hasPool,
// //     bool? hasGym,
// //     bool? hasSpa,
// //     bool? hasRestaurant,
// //     bool? hasParking,
// //     bool? hasWifi,
// //     String? cancellationPolicy,
// //     double? minRating,
// //   }) async {
// //     try {
// //       final Map<String, dynamic> queryParams = {};

// //       if (minPrice != null) queryParams['MinPrice'] = minPrice;
// //       if (maxPrice != null) queryParams['MaxPrice'] = maxPrice;
// //       queryParams['RoomType'] = roomType ?? 'All';
// //       if (hasPool != null) queryParams['HasPool'] = hasPool;
// //       if (hasGym != null) queryParams['HasGym'] = hasGym;
// //       if (hasSpa != null) queryParams['HasSpa'] = hasSpa;
// //       if (hasRestaurant != null) queryParams['HasRestaurant'] = hasRestaurant;
// //       if (hasParking != null) queryParams['HasParking'] = hasParking;
// //       if (hasWifi != null) queryParams['HasWifi'] = hasWifi;
// //       if (cancellationPolicy != null &&
// //           cancellationPolicy.toLowerCase() != 'all') {
// //         queryParams['CancellationPolicy'] = cancellationPolicy;
// //       }
// //       if (minRating != null && minRating > 0) {
// //         queryParams['MinRating'] = minRating;
// //       }

// //       final response = await _dioClient.get(ApiEndpoints.hotelFilter,
// //           queryParameters: queryParams);
// //       final List<dynamic> data = response.data;
// //       return data.map((json) => Hotel.fromJson(json)).toList();
// //     } catch (e) {
// //       print("Error in filterHotels: $e");
// //       throw Exception('Failed to filter hotels: $e');
// //     }
// //   }

// //   Future<Hotel> getHotelById(int id) async {
// //     try {
// //       final response = await _dioClient.get(ApiEndpoints.hotelById(id));
// //       return Hotel.fromJson(response.data);
// //     } catch (e) {
// //       print("Error in getHotelById: $e");
// //       throw Exception('Failed to load hotel details: $e');
// //     }
// //   }

// //   Future<void> toggleFavorite(int hotelId) async {
// //     try {
// //       await _dioClient.post(ApiEndpoints.toggleFavorite(hotelId));
// //     } catch (e) {
// //       print("Error in toggleFavorite: $e");
// //       throw Exception('Failed to update favorite status: $e');
// //     }
// //   }

// //   Future<HotelComparison> compareHotels(int hotelId1, int hotelId2) async {
// //     try {
// //       final response =
// //           await _dioClient.get(ApiEndpoints.compareHotels(hotelId1, hotelId2));
// //       return HotelComparison.fromJson(response.data);
// //     } catch (e) {
// //       print("Error in compareHotels: $e");
// //       throw Exception('Failed to compare hotels: $e');
// //     }
// //   }

// //   Future<List<Hotel>> getFavoriteHotels() async {
// //     try {
// //       final response = await _dioClient.get(ApiEndpoints.userFavorites);
// //       if (response.data is List) {
// //         final List<dynamic> data = response.data;
// //         return data.map((json) => Hotel.fromJson(json)).toList();
// //       } else {
// //         throw Exception('API did not return a list of favorite hotels');
// //       }
// //     } catch (e) {
// //       print("Error in getFavoriteHotels: $e");
// //       throw Exception('Failed to load favorite hotels: $e');
// //     }
// //   }

// //   Future<List<Hotel>> getSuggestions() async {
// //     try {
// //       final response = await _dioClient.get(ApiEndpoints.suggestions);
// //       if (response.data is List) {
// //         final List<dynamic> data = response.data;
// //         return data.map((json) => Hotel.fromJson(json)).toList();
// //       } else {
// //         throw Exception('API did not return a list of suggestions');
// //       }
// //     } catch (e) {
// //       print("Error in getSuggestions: $e");
// //       throw Exception('Failed to load suggestions: $e');
// //     }
// //   }

// //   Future<List<Hotel>> getTopRated() async {
// //     try {
// //       final response = await _dioClient.get(ApiEndpoints.topRated);
// //       if (response.data is List) {
// //         final List<dynamic> data = response.data;
// //         return data.map((json) => Hotel.fromJson(json)).toList();
// //       } else {
// //         throw Exception('API did not return a list of top rated hotels');
// //       }
// //     } catch (e) {
// //       print("Error in getTopRated: $e");
// //       throw Exception('Failed to load top rated hotels: $e');
// //     }
// //   }

// //   Future<List<Hotel>> getNearbyByLocation(String location) async {
// //     try {
// //       final response = await _dioClient
// //           .get('${ApiEndpoints.nearbyByLocation}?location=$location');
// //       if (response.data is List) {
// //         final List<dynamic> data = response.data;
// //         return data.map((json) => Hotel.fromJson(json)).toList();
// //       } else {
// //         throw Exception('API did not return a list of nearby hotels');
// //       }
// //     } catch (e) {
// //       print("Error in getNearbyByLocation: $e");
// //       throw Exception('Failed to load nearby hotels: $e');
// //     }
// //   }

// //   // دالة إنشاء جلسة الدفع عبر Stripe
// //   Future<String> createCheckoutSession({
// //     required int amount,
// //     required String serviceName,
// //     required int hotelId,
// //   }) async {
// //     try {
// //       final response = await _dioClient.post(
// //         'http://travella.runasp.net/api/Payment/create-checkout-session', // URL البك-إند
// //         data: {
// //           'amount': amount,
// //           'serviceName': serviceName,
// //           'hotelId': hotelId,
// //         },
// //       );
// //       if (response.statusCode == 200 && response.data['url'] != null) {
// //         return response.data['url'] as String;
// //       } else {
// //         throw Exception(
// //             'Failed to create checkout session: ${response.statusCode}');
// //       }
// //     } catch (e) {
// //       print("Error in createCheckoutSession: $e");
// //       throw Exception('Failed to create checkout session: $e');
// //     }
// //   }
// // }
// // // import 'package:travella/services/api/api_endpoints.dart';
// // // import 'package:travella/services/api/dio_client.dart';
// // // import '../models/hotel_model.dart';

// // // class HotelApiService {
// // //   final DioClient _dioClient = DioClient();

// // //   Future<List<Hotel>> getAllHotels() async {
// // //     try {
// // //       final response = await _dioClient.get(ApiEndpoints.getAllHotels);
// // //       final List<dynamic> data = response.data;
// // //       return data.map((json) => Hotel.fromJson(json)).toList();
// // //     } catch (e) {
// // //       print("Error in getAllHotels: $e");
// // //       throw Exception('Failed to load hotels: $e');
// // //     }
// // //   }

// // //   Future<List<Hotel>> getDeals() async {
// // //     try {
// // //       final response = await _dioClient.get(ApiEndpoints.hotelDeals);
// // //       final List<dynamic> data = response.data;
// // //       return data.map((json) => Hotel.fromJson(json)).toList();
// // //     } catch (e) {
// // //       print("Error in getDeals: $e");
// // //       throw Exception('Failed to load deals: $e');
// // //     }
// // //   }

// // //   Future<List<Hotel>> searchHotels({
// // //     required String city,
// // //     required DateTime checkInDate,
// // //     required DateTime checkOutDate,
// // //     required int adults,
// // //     required int children,
// // //   }) async {
// // //     try {
// // //       final response = await _dioClient.post(
// // //         ApiEndpoints.hotelSearch,
// // //         data: {
// // //           'city': city,
// // //           'checkInDate': checkInDate.toIso8601String(),
// // //           'checkOutDate': checkOutDate.toIso8601String(),
// // //           'numberofPersons': {'adults': adults, 'children': children},
// // //         },
// // //       );
// // //       final List<dynamic> data = response.data;
// // //       return data.map((json) => Hotel.fromJson(json)).toList();
// // //     } catch (e) {
// // //       print("Error in searchHotels: $e");
// // //       throw Exception('Failed to search hotels: $e');
// // //     }
// // //   }

// // //   Future<List<Hotel>> filterHotels({
// // //     double? minPrice,
// // //     double? maxPrice,
// // //     String? roomType,
// // //     bool? hasPool,
// // //     bool? hasGym,
// // //     bool? hasSpa,
// // //     bool? hasRestaurant,
// // //     bool? hasParking,
// // //     bool? hasWifi,
// // //     String? cancellationPolicy,
// // //     double? minRating,
// // //   }) async {
// // //     try {
// // //       final Map<String, dynamic> queryParams = {};
// // //       if (minPrice != null) queryParams['MinPrice'] = minPrice;
// // //       if (maxPrice != null) queryParams['MaxPrice'] = maxPrice;
// // //       queryParams['RoomType'] = roomType ?? 'All';
// // //       if (hasPool != null) queryParams['HasPool'] = hasPool;
// // //       if (hasGym != null) queryParams['HasGym'] = hasGym;
// // //       if (hasSpa != null) queryParams['HasSpa'] = hasSpa;
// // //       if (hasRestaurant != null) queryParams['HasRestaurant'] = hasRestaurant;
// // //       if (hasParking != null) queryParams['HasParking'] = hasParking;
// // //       if (hasWifi != null) queryParams['HasWifi'] = hasWifi;
// // //       if (cancellationPolicy != null &&
// // //           cancellationPolicy.toLowerCase() != 'all') {
// // //         queryParams['CancellationPolicy'] = cancellationPolicy;
// // //       }
// // //       if (minRating != null && minRating > 0) {
// // //         queryParams['MinRating'] = minRating;
// // //       }

// // //       final response = await _dioClient.get(ApiEndpoints.hotelFilter,
// // //           queryParameters: queryParams);
// // //       final List<dynamic> data = response.data;
// // //       return data.map((json) => Hotel.fromJson(json)).toList();
// // //     } catch (e) {
// // //       print("Error in filterHotels: $e");
// // //       throw Exception('Failed to filter hotels: $e');
// // //     }
// // //   }

// // //   Future<Hotel> getHotelById(int id) async {
// // //     try {
// // //       final response = await _dioClient.get(ApiEndpoints.hotelById(id));
// // //       return Hotel.fromJson(response.data);
// // //     } catch (e) {
// // //       print("Error in getHotelById: $e");
// // //       throw Exception('Failed to load hotel details: $e');
// // //     }
// // //   }

// // //   Future<void> toggleFavorite(int hotelId) async {
// // //     try {
// // //       await _dioClient.post(ApiEndpoints.toggleFavorite(hotelId));
// // //     } catch (e) {
// // //       print("Error in toggleFavorite: $e");
// // //       throw Exception('Failed to update favorite status: $e');
// // //     }
// // //   }

// // //   Future<HotelComparison> compareHotels(int hotelId1, int hotelId2) async {
// // //     try {
// // //       final response =
// // //           await _dioClient.get(ApiEndpoints.compareHotels(hotelId1, hotelId2));
// // //       return HotelComparison.fromJson(response.data);
// // //     } catch (e) {
// // //       print("Error in compareHotels: $e");
// // //       throw Exception('Failed to compare hotels: $e');
// // //     }
// // //   }

// // //   Future<List<Hotel>> getFavoriteHotels() async {
// // //     try {
// // //       final response = await _dioClient.get(ApiEndpoints.userFavorites);
// // //       final List<dynamic> data = response.data;
// // //       return data.map((json) => Hotel.fromJson(json)).toList();
// // //     } catch (e) {
// // //       print("Error in getFavoriteHotels: $e");
// // //       throw Exception('Failed to load favorite hotels: $e');
// // //     }
// // //   }

// // //   Future<List<Hotel>> getSuggestions() async {
// // //     try {
// // //       final response = await _dioClient.get(ApiEndpoints.suggestions);
// // //       final List<dynamic> data = response.data;
// // //       return data.map((json) => Hotel.fromJson(json)).toList();
// // //     } catch (e) {
// // //       print("Error in getSuggestions: $e");
// // //       throw Exception('Failed to load suggestions: $e');
// // //     }
// // //   }

// // //   Future<List<Hotel>> getTopRated() async {
// // //     try {
// // //       final response = await _dioClient.get(ApiEndpoints.topRated);
// // //       final List<dynamic> data = response.data;
// // //       return data.map((json) => Hotel.fromJson(json)).toList();
// // //     } catch (e) {
// // //       print("Error in getTopRated: $e");
// // //       throw Exception('Failed to load top rated hotels: $e');
// // //     }
// // //   }

// // //   Future<List<Hotel>> getNearbyByLocation(String location) async {
// // //     try {
// // //       final response = await _dioClient
// // //           .get('${ApiEndpoints.nearbyByLocation}?location=$location');
// // //       final List<dynamic> data = response.data;
// // //       return data.map((json) => Hotel.fromJson(json)).toList();
// // //     } catch (e) {
// // //       print("Error in getNearbyByLocation: $e");
// // //       throw Exception('Failed to load nearby hotels: $e');
// // //     }
// // //   }

// // //   Future<String> createCheckoutSession({
// // //     required int amount,
// // //     required String serviceName,
// // //     required int hotelId,
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
// // //         return response.data['url'] as String;
// // //       } else {
// // //         throw Exception(
// // //             'API did not return a valid checkout URL. Status: ${response.statusCode}');
// // //       }
// // //     } catch (e) {
// // //       print("Error in createCheckoutSession: $e");
// // //       throw Exception('Failed to create checkout session: $e');
// // //     }
// // //   }
// // // }
// import 'package:dio/dio.dart';
// // ignore: unused_import
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:travella/services/api/api_endpoints.dart';
// import 'package:travella/services/api/dio_client.dart';
// import '../models/hotel_model.dart';

// class HotelApiService {
//   final DioClient _dioClient = DioClient();

//   Future<List<Hotel>> getAllHotels() async {
//     try {
//       final response = await _dioClient.get(ApiEndpoints.getAllHotels);
//       if (response.data is List) {
//         final List<dynamic> data = response.data;
//         return data.map((json) => Hotel.fromJson(json)).toList();
//       } else {
//         throw Exception('API did not return a list of hotels');
//       }
//     } catch (e) {
//       print("Error in getAllHotels: $e");
//       throw Exception('Failed to load hotels: $e');
//     }
//   }

//   Future<List<Hotel>> getDeals() async {
//     try {
//       final response = await _dioClient.get(ApiEndpoints.hotelDeals);
//       if (response.data is List) {
//         final List<dynamic> data = response.data;
//         return data.map((json) => Hotel.fromJson(json)).toList();
//       } else {
//         throw Exception('API did not return a list of deals');
//       }
//     } catch (e) {
//       print("Error in getDeals: $e");
//       throw Exception('Failed to load deals: $e');
//     }
//   }

//   Future<List<Hotel>> searchHotels({
//     required String city,
//     required DateTime checkInDate,
//     required DateTime checkOutDate,
//     required int adults,
//     required int children,
//   }) async {
//     try {
//       final response = await _dioClient.post(
//         ApiEndpoints.hotelSearch,
//         data: {
//           'city': city,
//           'checkInDate': checkInDate.toIso8601String(),
//           'checkOutDate': checkOutDate.toIso8601String(),
//           'numberofPersons': {'adults': adults, 'children': children},
//         },
//       );
//       if (response.data is List) {
//         final List<dynamic> data = response.data;
//         return data.map((json) => Hotel.fromJson(json)).toList();
//       } else {
//         throw Exception('API did not return a list of hotels');
//       }
//     } catch (e) {
//       print("Error in searchHotels: $e");
//       throw Exception('Failed to search hotels: $e');
//     }
//   }

//   Future<List<Hotel>> filterHotels({
//     double? minPrice,
//     double? maxPrice,
//     String? roomType,
//     bool? hasPool,
//     bool? hasGym,
//     bool? hasSpa,
//     bool? hasRestaurant,
//     bool? hasParking,
//     bool? hasWifi,
//     String? cancellationPolicy,
//     double? minRating,
//   }) async {
//     try {
//       final Map<String, dynamic> queryParams = {};
//       if (minPrice != null) queryParams['MinPrice'] = minPrice;
//       if (maxPrice != null) queryParams['MaxPrice'] = maxPrice;
//       queryParams['RoomType'] = roomType ?? 'All';
//       if (hasPool != null) queryParams['HasPool'] = hasPool;
//       if (hasGym != null) queryParams['HasGym'] = hasGym;
//       if (hasSpa != null) queryParams['HasSpa'] = hasSpa;
//       if (hasRestaurant != null) queryParams['HasRestaurant'] = hasRestaurant;
//       if (hasParking != null) queryParams['HasParking'] = hasParking;
//       if (hasWifi != null) queryParams['HasWifi'] = hasWifi;
//       if (cancellationPolicy != null &&
//           cancellationPolicy.toLowerCase() != 'all') {
//         queryParams['CancellationPolicy'] = cancellationPolicy;
//       }
//       if (minRating != null && minRating > 0) {
//         queryParams['MinRating'] = minRating;
//       }

//       final response = await _dioClient.get(ApiEndpoints.hotelFilter,
//           queryParameters: queryParams);
//       if (response.data is List) {
//         final List<dynamic> data = response.data;
//         return data.map((json) => Hotel.fromJson(json)).toList();
//       } else {
//         throw Exception('API did not return a list of hotels');
//       }
//     } catch (e) {
//       print("Error in filterHotels: $e");
//       throw Exception('Failed to filter hotels: $e');
//     }
//   }

//   Future<Hotel> getHotelById(int id) async {
//     try {
//       final response = await _dioClient.get(ApiEndpoints.hotelById(id));
//       return Hotel.fromJson(response.data);
//     } catch (e) {
//       print("Error in getHotelById: $e");
//       throw Exception('Failed to load hotel details: $e');
//     }
//   }

//   Future<void> toggleFavorite(int hotelId) async {
//     try {
//       await _dioClient.post(ApiEndpoints.toggleFavorite(hotelId));
//     } catch (e) {
//       print("Error in toggleFavorite: $e");
//       throw Exception('Failed to update favorite status: $e');
//     }
//   }

//   Future<HotelComparison> compareHotels(int hotelId1, int hotelId2) async {
//     try {
//       final response =
//           await _dioClient.get(ApiEndpoints.compareHotels(hotelId1, hotelId2));
//       return HotelComparison.fromJson(response.data);
//     } catch (e) {
//       print("Error in compareHotels: $e");
//       throw Exception('Failed to compare hotels: $e');
//     }
//   }

//   Future<List<Hotel>> getFavoriteHotels() async {
//     try {
//       final response = await _dioClient.get(ApiEndpoints.userFavorites);
//       if (response.data is List) {
//         final List<dynamic> data = response.data;
//         return data.map((json) => Hotel.fromJson(json)).toList();
//       } else {
//         throw Exception('API did not return a list of favorite hotels');
//       }
//     } catch (e) {
//       print("Error in getFavoriteHotels: $e");
//       throw Exception('Failed to load favorite hotels: $e');
//     }
//   }

//   Future<List<Hotel>> getSuggestions() async {
//     try {
//       final response = await _dioClient.get(ApiEndpoints.suggestions);
//       if (response.data is List) {
//         final List<dynamic> data = response.data;
//         return data.map((json) => Hotel.fromJson(json)).toList();
//       } else {
//         throw Exception('API did not return a list of suggestions');
//       }
//     } catch (e) {
//       print("Error in getSuggestions: $e");
//       throw Exception('Failed to load suggestions: $e');
//     }
//   }

//   Future<List<Hotel>> getTopRated() async {
//     try {
//       final response = await _dioClient.get(ApiEndpoints.topRated);
//       if (response.data is List) {
//         final List<dynamic> data = response.data;
//         return data.map((json) => Hotel.fromJson(json)).toList();
//       } else {
//         throw Exception('API did not return a list of top rated hotels');
//       }
//     } catch (e) {
//       print("Error in getTopRated: $e");
//       throw Exception('Failed to load top rated hotels: $e');
//     }
//   }

//   Future<List<Hotel>> getNearbyByLocation(String location) async {
//     try {
//       final response = await _dioClient
//           .get('${ApiEndpoints.nearbyByLocation}?location=$location');
//       if (response.data is List) {
//         final List<dynamic> data = response.data;
//         return data.map((json) => Hotel.fromJson(json)).toList();
//       } else {
//         throw Exception('API did not return a list of nearby hotels');
//       }
//     } catch (e) {
//       print("Error in getNearbyByLocation: $e");
//       throw Exception('Failed to load nearby hotels: $e');
//     }
//   }

//   Future<String> createCheckoutSession({
//     required int amount,
//     required String serviceName,
//     required int hotelId,
//   }) async {
//     try {
//       final response = await _dioClient.post(
//         ApiEndpoints.createCheckoutSession,
//         data: {
//           'amount': amount,
//           'serviceName': serviceName,
//           'hotelId': hotelId,
//         },
//       );
//       if (response.statusCode == 200 && response.data['url'] != null) {
//         return response.data['url'] as String;
//       } else {
//         throw Exception(
//             'API did not return a valid checkout URL. Status: ${response.statusCode}');
//       }
//     } on DioException catch (e) {
//       print("Dio Error in createCheckoutSession: ${e.response?.data}");
//       throw Exception('Failed to create checkout session: ${e.message}');
//     } catch (e) {
//       print("Error in createCheckoutSession: $e");
//       throw Exception('Failed to create checkout session: $e');
//     }
//   }
// }
import 'package:dio/dio.dart';
import 'package:apptravella/services/api/api_endpoints.dart';
import 'package:apptravella/services/api/dio_client.dart';
import 'package:apptravella/services/api/ai_dio_client.dart';
import '../models/hotel_model.dart';
// --- الخطوة 1: أضف استيراد النموذج الجديد ---
import '../models/recommendation_hotel_model.dart';

class HotelApiService {
  final DioClient _dioClient = DioClient();
  final AiDioClient _aiDioClient = AiDioClient();

  Future<List<Hotel>> getAllHotels() async {
    try {
      final response = await _dioClient.get(ApiEndpoints.getAllHotels);
      if (response.data is List) {
        final List<dynamic> data = response.data;
        return data.map((json) => Hotel.fromJson(json)).toList();
      } else {
        throw Exception('API did not return a list of hotels');
      }
    } catch (e) {
      print("Error in getAllHotels: $e");
      throw Exception('Failed to load hotels: $e');
    }
  }

  Future<List<Hotel>> getDeals() async {
    try {
      final response = await _dioClient.get(ApiEndpoints.hotelDeals);
      if (response.data is List) {
        final List<dynamic> data = response.data;
        return data.map((json) => Hotel.fromJson(json)).toList();
      } else {
        throw Exception('API did not return a list of deals');
      }
    } catch (e) {
      print("Error in getDeals: $e");
      throw Exception('Failed to load deals: $e');
    }
  }

  Future<List<Hotel>> searchHotels({
    required String city,
    required DateTime checkInDate,
    required DateTime checkOutDate,
    required int adults,
    required int children,
  }) async {
    try {
      final response = await _dioClient.post(
        ApiEndpoints.hotelSearch,
        data: {
          'city': city,
          'checkInDate': checkInDate.toIso8601String(),
          'checkOutDate': checkOutDate.toIso8601String(),
          'numberofPersons': {'adults': adults, 'children': children},
        },
      );
      if (response.data is List) {
        final List<dynamic> data = response.data;
        return data.map((json) => Hotel.fromJson(json)).toList();
      } else {
        throw Exception('API did not return a list of hotels');
      }
    } catch (e) {
      print("Error in searchHotels: $e");
      throw Exception('Failed to search hotels: $e');
    }
  }

  Future<List<Hotel>> filterHotels({
    double? minPrice,
    double? maxPrice,
    String? roomType,
    bool? hasPool,
    bool? hasGym,
    bool? hasSpa,
    bool? hasRestaurant,
    bool? hasParking,
    bool? hasWifi,
    String? cancellationPolicy,
    double? minRating,
  }) async {
    try {
      final Map<String, dynamic> queryParams = {};
      if (minPrice != null) queryParams['MinPrice'] = minPrice;
      if (maxPrice != null) queryParams['MaxPrice'] = maxPrice;
      queryParams['RoomType'] = roomType ?? 'All';
      if (hasPool != null) queryParams['HasPool'] = hasPool;
      if (hasGym != null) queryParams['HasGym'] = hasGym;
      if (hasSpa != null) queryParams['HasSpa'] = hasSpa;
      if (hasRestaurant != null) queryParams['HasRestaurant'] = hasRestaurant;
      if (hasParking != null) queryParams['HasParking'] = hasParking;
      if (hasWifi != null) queryParams['HasWifi'] = hasWifi;
      if (cancellationPolicy != null &&
          cancellationPolicy.toLowerCase() != 'all') {
        queryParams['CancellationPolicy'] = cancellationPolicy;
      }
      if (minRating != null && minRating > 0) {
        queryParams['MinRating'] = minRating;
      }

      final response = await _dioClient.get(ApiEndpoints.hotelFilter,
          queryParameters: queryParams);
      if (response.data is List) {
        final List<dynamic> data = response.data;
        return data.map((json) => Hotel.fromJson(json)).toList();
      } else {
        throw Exception('API did not return a list of hotels');
      }
    } catch (e) {
      print("Error in filterHotels: $e");
      throw Exception('Failed to filter hotels: $e');
    }
  }

  Future<Hotel> getHotelById(int id) async {
    try {
      final response = await _dioClient.get(ApiEndpoints.hotelById(id));
      return Hotel.fromJson(response.data);
    } catch (e) {
      print("Error in getHotelById: $e");
      throw Exception('Failed to load hotel details: $e');
    }
  }

  Future<void> toggleFavorite(int hotelId) async {
    try {
      await _dioClient.post(ApiEndpoints.toggleFavorite(hotelId));
    } catch (e) {
      print("Error in toggleFavorite: $e");
      throw Exception('Failed to update favorite status: $e');
    }
  }

  Future<HotelComparison> compareHotels(int hotelId1, int hotelId2) async {
    try {
      final response =
          await _dioClient.get(ApiEndpoints.compareHotels(hotelId1, hotelId2));
      return HotelComparison.fromJson(response.data);
    } catch (e) {
      print("Error in compareHotels: $e");
      throw Exception('Failed to compare hotels: $e');
    }
  }

  Future<List<Hotel>> getFavoriteHotels() async {
    try {
      final response = await _dioClient.get(ApiEndpoints.userFavorites);
      if (response.data is List) {
        final List<dynamic> data = response.data;
        return data.map((json) => Hotel.fromJson(json)).toList();
      } else {
        throw Exception('API did not return a list of favorite hotels');
      }
    } catch (e) {
      print("Error in getFavoriteHotels: $e");
      throw Exception('Failed to load favorite hotels: $e');
    }
  }

  // --- الخطوة 2: عدّل هذه الدالة لتعيد قائمة من النموذج الجديد ---
  Future<List<RecommendationHotel>> getHotelRecommendations({
    required int userId,
  }) async {
    try {
      final response = await _aiDioClient.getHotelRecommendations(
        userId: userId,
      );
      // ignore: unnecessary_type_check
      if (response is List) {
        // نستخدم النموذج الجديد RecommendationHotel للتحويل
        return response
            .map((json) => RecommendationHotel.fromJson(json))
            .toList();
      } else {
        throw Exception('API did not return a list of recommendations');
      }
    } catch (e) {
      print("Error in getHotelRecommendations: $e");
      throw Exception('Failed to load hotel recommendations: $e');
    }
  }

  Future<List<Hotel>> getTopRated() async {
    try {
      final response = await _dioClient.get(ApiEndpoints.topRated);
      if (response.data is List) {
        final List<dynamic> data = response.data;
        return data.map((json) => Hotel.fromJson(json)).toList();
      } else {
        throw Exception('API did not return a list of top rated hotels');
      }
    } catch (e) {
      print("Error in getTopRated: $e");
      throw Exception('Failed to load top rated hotels: $e');
    }
  }

  Future<List<Hotel>> getNearbyByLocation(String location) async {
    try {
      final response = await _dioClient
          .get('${ApiEndpoints.nearbyByLocation}?location=$location');
      if (response.data is List) {
        final List<dynamic> data = response.data;
        return data.map((json) => Hotel.fromJson(json)).toList();
      } else {
        throw Exception('API did not return a list of nearby hotels');
      }
    } catch (e) {
      print("Error in getNearbyByLocation: $e");
      throw Exception('Failed to load nearby hotels: $e');
    }
  }

  Future<String> createCheckoutSession({
    required int amount,
    required String serviceName,
    required int hotelId,
  }) async {
    try {
      final response = await _dioClient.post(
        ApiEndpoints.createCheckoutSession,
        data: {
          'amount': amount,
          'serviceName': serviceName,
          'hotelId': hotelId,
        },
      );
      if (response.statusCode == 200 && response.data['url'] != null) {
        return response.data['url'] as String;
      } else {
        throw Exception(
            'API did not return a valid checkout URL. Status: ${response.statusCode}');
      }
    } on DioException catch (e) {
      print("Dio Error in createCheckoutSession: ${e.response?.data}");
      throw Exception('Failed to create checkout session: ${e.message}');
    } catch (e) {
      print("Error in createCheckoutSession: $e");
      throw Exception('Failed to create checkout session: $e');
    }
  }
}
