// // import 'package:dartz/dartz.dart';
// // import '../api/api_endpoints.dart';
// // import 'base_repository.dart';

// // class FlightRepository extends BaseRepository {
// //   Future<Either<String, Map<String, dynamic>>> searchFlights({
// //     required String fromCity,
// //     required String toCity,
// //     required String date,
// //     required int adults,
// //     required int children,
// //     required String category,
// //   }) async {
// //     return handleApiCall(
// //       apiCall: () async {
// //         final response = await dioClient.post(
// //           ApiEndpoints.flightSearch,
// //           data: {
// //             'from_city': fromCity,
// //             'to_city': toCity,
// //             'date': date,
// //             'adults': adults,
// //             'children': children,
// //             'category': category,
// //           },
// //         );
// //         return response.data;
// //       },
// //     );
// //   }

// //   Future<Either<String, Map<String, dynamic>>> bookFlight({
// //     required String flightId,
// //     required int passengers,
// //     required String category,
// //     required Map<String, dynamic> passengerDetails,
// //   }) async {
// //     return handleApiCall(
// //       apiCall: () async {
// //         final response = await dioClient.post(
// //           ApiEndpoints.flightBooking,
// //           data: {
// //             'flight_id': flightId,
// //             'passengers': passengers,
// //             'category': category,
// //             'passenger_details': passengerDetails,
// //           },
// //         );
// //         return response.data;
// //       },
// //     );
// //   }

// //   Future<Either<String, Map<String, dynamic>>> getFlightDetails(String flightId) async {
// //     return handleApiCall(
// //       apiCall: () async {
// //         final response = await dioClient.get(
// //           '${ApiEndpoints.flights}/$flightId',
// //         );
// //         return response.data;
// //       },
// //     );
// //   }

// //   Future<Either<String, List<Map<String, dynamic>>>> getUserFlightBookings() async {
// //     return handleApiCall(
// //       apiCall: () async {
// //         final response = await dioClient.get(
// //           ApiEndpoints.userBookings,
// //           queryParameters: {'type': 'flight'},
// //         );
// //         return List<Map<String, dynamic>>.from(response.data['bookings']);
// //       },
// //     );
// //   }
// // }
// // lib/services/repositories/flight_repository.dart

// import 'package:dartz/dartz.dart';
// import 'package:travella/models/FlightData.dart';
// import 'package:travella/services/api/api_endpoints.dart';
// import 'package:travella/widgets/filter_screen.dart';
// import 'base_repository.dart';

// class FlightRepository extends BaseRepository {

//   Future<Either<String, List<FlightData>>> searchFlights({
//     required String fromLocation,
//     required String destination,
//     required DateTime departureTime,
//     required DateTime arrivalTime,
//     required int adults,
//     required int children,
//     required String category,
//   }) async {
//     return handleApiCall<List<FlightData>>(
//       apiCall: () async {
//         final requestBody = {
//           "fromLocation": fromLocation,
//           "destination": destination,
//           "departureTime": departureTime.toIso8601String(),
//           "arrivalTime": arrivalTime.toIso8601String(),
//           "category": category.toLowerCase(),
//           "numberOfpersons": {"adults": adults, "children": children}
//         };
//         final response = await dioClient.post(ApiEndpoints.flightSearch, data: requestBody);
//         final List<dynamic> responseData = response.data;
//         return responseData.map((json) => FlightData.fromJson(json)).toList();
//       },
//     );
//   }

//   Future<Either<String, List<FlightData>>> filterFlights({
//     required FilterSettings settings,
//     required String from,
//     required String to,
//     required DateTime departureDate,
//     required DateTime arrivalDate,
//     required int adults,
//     required int children,
//   }) async {
//     return handleApiCall<List<FlightData>>(
//       apiCall: () async {
//         String? singleAirline = settings.selectedAirlines.isNotEmpty ? settings.selectedAirlines.first : null;

//         final filterRequestBody = {
//           "fromLocation": from,
//           "destination": to,
//           "departureTime": departureDate.toIso8601String(),
//           "arrivalTime": arrivalDate.toIso8601String(),
//           "numberOfpersons": {"adults": adults, "children": children},
//           "minPrice": settings.priceRange.start.toInt(),
//           "maxPrice": settings.priceRange.end.toInt(),
//           "stops": settings.selectedStops,
//           "airline": singleAirline,
//         };

//         // إزالة المفاتيح ذات القيمة null من الطلب
//         filterRequestBody.removeWhere((key, value) => value == null);

//         final response = await dioClient.post(
//           ApiEndpoints.flightFilter,
//           data: filterRequestBody,
//         );

//         final List<dynamic> responseData = response.data;
//         return responseData.map((json) => FlightData.fromJson(json)).toList();
//       },
//     );
//   }

//   // --- تم حذف دالة bookFlight لأن الـ endpoint غير موجود ---
// }
