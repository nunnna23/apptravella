// // lib/services/Car/CarRentalService.dart

// import 'package:travella/models/CarRental.dart';
// import 'package:travella/services/api/dio_client.dart';

// class CarRentalService {
//   final DioClient _dioClient = DioClient();

//   Future<List<CarRental>> searchCarRentals({
//     required String token,
//     required String pickUpLocation,
//     required DateTime date,
//     required String rentType,
//     int? driverAge,
//   }) async {
//     try {
//       // Normalize rentType string to match what the API expects
//       final String apiRentType = rentType.toLowerCase().contains('self')
//           ? 'self driver'
//           : 'with driver';

//       final List<CarRental> carRentals = await _dioClient.searchCarRentals(
//         token: token,
//         pickUpLocation: pickUpLocation,
//         date: date,
//         rentType: apiRentType,
//         driverAge: driverAge,
//       );
//       return carRentals;
//     } catch (e) {
//       // Re-throw the error to be handled by the UI layer
//       rethrow;
//     }
//   }
// }
import 'package:apptravella/models/CarRental.dart';
import 'package:apptravella/services/api/dio_client.dart';

class CarRentalService {
  final DioClient _dioClient = DioClient();

  Future<List<CarRental>> searchCarRentals({
    required String pickUpLocation,
    required DateTime date,
    required String rentType,
  }) async {
    try {
      final String apiRentType = rentType.toLowerCase().contains('self')
          ? 'self driver'
          : 'with driver';
      return await _dioClient.searchCarRentals(
        pickUpLocation: pickUpLocation,
        date: date,
        rentType: apiRentType,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<List<CarRental>> getAvailableCarRentals({
    required String pickUpLocation,
    required DateTime date,
  }) async {
    try {
      return await _dioClient.getAvailableCarRentals(
        pickUpLocation: pickUpLocation,
        date: date,
      );
    } catch (e) {
      rethrow;
    }
  }
}
