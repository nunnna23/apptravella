// // // //
// // // import 'package:flutter_bloc/flutter_bloc.dart';
// // // import 'package:travella/services/repositories/flight_repository.dart';
// // // import 'flight_state.dart';

// // // class FlightCubit extends Cubit<FlightState> {
// // //   final FlightRepository _repository;

// // //   FlightCubit(this._repository) : super(FlightInitial());

// // //   Future<void> searchFlights({
// // //     required String origin,
// // //     required String destination,
// // //     // --- تعديل: استقبال التاريخين ---
// // //     required DateTime departureDate,
// // //     required DateTime returnDate,
// // //     // --- نهاية التعديل ---
// // //     required int adults,
// // //     required int children,
// // //     required String category, required String from, required String to, required int numberOfPersons,
// // //   }) async {
// // //     emit(FlightLoading());

// // //     final result = await _repository.searchFlights(
// // //       origin: origin,
// // //       destination: destination,
// // //       departureDate: departureDate, // تمرير تاريخ المغادرة
// // //       returnDate: returnDate, // تمرير تاريخ العودة
// // //       adults: adults,
// // //       children: children,
// // //       category: category,
// // //     );

// // //     result.fold(
// // //       (error) => emit(FlightError(error)),
// // //       (data) => emit(FlightSearchSuccess(data)),
// // //     );
// // //   }
// // // }
// // // lib/cubit/flight/flight_cubit.dart

// // import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'package:travella/services/repositories/flight_repository.dart';
// // import 'flight_state.dart';

// // class FlightCubit extends Cubit<FlightState> {
// //   final FlightRepository _repository;

// //   FlightCubit(this._repository) : super(FlightInitial());

// //   // --- تعديل: تم تحديث أسماء المتغيرات لتطابق الـ Repository
// //   Future<void> searchFlights({
// //     required String fromLocation, // كان اسمه origin
// //     required String destination,
// //     required DateTime departureDate,
// //     required DateTime returnDate,
// //     required int adults,
// //     required int children,
// //     required String category,
// //   }) async {
// //     emit(FlightLoading());

// //     // استدعاء الدالة المحدثة في الـ Repository
// //     final result = await _repository.searchFlights(
// //       fromLocation: fromLocation, // تمرير المتغيرات بالأسماء الصحيحة
// //       destination: destination,
// //       departureTime: departureDate,
// //       arrivalTime: returnDate,
// //       adults: adults,
// //       children: children,
// //       category: category,
// //     );

// //     result.fold(
// //       (error) => emit(FlightError(error)),
// //       (data) => emit(FlightSearchSuccess(data)),
// //     );
// //   }
// // }
// // lib/cubit/flight/flight_cubit.dart

// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:travella/screens/FlightResultsScreen.dart';
// import 'package:travella/services/repositories/flight_repository.dart';
// import 'flight_state.dart';

// class FlightCubit extends Cubit<FlightState> {
//   final FlightRepository _repository;

//   FlightCubit(this._repository) : super(FlightInitial());

//   Future<void> searchFlights({
//     required String fromLocation,
//     required String destination,
//     required DateTime departureDate,
//     required DateTime returnDate,
//     required int adults,
//     required int children,
//     required String category,
//   }) async {
//     emit(FlightLoading());
//     final result = await _repository.searchFlights(
//       fromLocation: fromLocation,
//       destination: destination,
//       departureTime: departureDate,
//       arrivalTime: returnDate,
//       adults: adults,
//       children: children,
//       category: category,
//     );
//     result.fold(
//       (error) => emit(FlightError(error)),
//       (flightList) => emit(FlightSearchSuccess(flightList)),
//     );
//   }

//   Future<void> applyFilters({
//     required FilterSettings settings,
//     required String from,
//     required String to,
//     required DateTime departureDate,
//     required DateTime arrivalDate,
//     required int adults,
//     required int children,
//   }) async {
//     emit(FlightLoading());
//     final result = await _repository.filterFlights(
//       settings: settings,
//       from: from,
//       to: to,
//       departureDate: departureDate,
//       arrivalDate: arrivalDate,
//       adults: adults,
//       children: children,
//     );
//     result.fold(
//       (error) => emit(FlightError(error)),
//       (filteredFlights) => emit(FlightSearchSuccess(filteredFlights)),
//     );
//   }
// }
