// // import 'package:equatable/equatable.dart';

// // abstract class FlightState extends Equatable {
// //   const FlightState();

// //   @override
// //   List<Object?> get props => [];
// // }

// // class FlightInitial extends FlightState {}

// // class FlightLoading extends FlightState {}

// // class FlightError extends FlightState {
// //   final String message;

// //   const FlightError(this.message);

// //   @override
// //   List<Object?> get props => [message];
// // }

// // class FlightSearchSuccess extends FlightState {
// //   final List<Map<String, dynamic>> flights;

// //   const FlightSearchSuccess(this.flights);

// //   @override
// //   List<Object?> get props => [flights];
// // }

// // class FlightBookingSuccess extends FlightState {
// //   final Map<String, dynamic> bookingDetails;

// //   const FlightBookingSuccess(this.bookingDetails);

// //   @override
// //   List<Object?> get props => [bookingDetails];
// // }

// // class FlightDetailsLoaded extends FlightState {
// //   final Map<String, dynamic> flightDetails;

// //   const FlightDetailsLoaded(this.flightDetails);

// //   @override
// //   List<Object?> get props => [flightDetails];
// // }

// // class UserFlightBookingsLoaded extends FlightState {
// //   final List<Map<String, dynamic>> bookings;

// //   const UserFlightBookingsLoaded(this.bookings);

// //   @override
// //   List<Object?> get props => [bookings];
// // }
// // lib/cubit/flight/flight_state.dart

// import 'package:equatable/equatable.dart';
// import 'package:travella/models/FlightData.dart'; // --- تعديل: استيراد النموذج

// abstract class FlightState extends Equatable {
//   const FlightState();

//   @override
//   List<Object?> get props => [];
// }

// class FlightInitial extends FlightState {}

// class FlightLoading extends FlightState {}

// class FlightError extends FlightState {
//   final String message;

//   const FlightError(this.message);

//   @override
//   List<Object?> get props => [message];
// }

// class FlightSearchSuccess extends FlightState {
//   // --- تعديل: استخدام النموذج القوي بدلاً من Map
//   final List<FlightData> flights;

//   const FlightSearchSuccess(this.flights);

//   @override
//   List<Object?> get props => [flights];
// }

// class FlightBookingSuccess extends FlightState {
//   final Map<String, dynamic> bookingDetails;

//   const FlightBookingSuccess(this.bookingDetails);

//   @override
//   List<Object?> get props => [bookingDetails];
// }

// class FlightDetailsLoaded extends FlightState {
//   final Map<String, dynamic> flightDetails;

//   const FlightDetailsLoaded(this.flightDetails);

//   @override
//   List<Object?> get props => [flightDetails];
// }

// class UserFlightBookingsLoaded extends FlightState {
//   final List<Map<String, dynamic>> bookings;

//   const UserFlightBookingsLoaded(this.bookings);

//   @override
//   List<Object?> get props => [bookings];
// }
// lib/cubit/flight/flight_state.dart

import 'package:equatable/equatable.dart';
import 'package:apptravella/models/FlightData.dart';

abstract class FlightState extends Equatable {
  const FlightState();

  @override
  List<Object?> get props => [];
}

class FlightInitial extends FlightState {}

class FlightLoading extends FlightState {}

class FlightError extends FlightState {
  final String message;
  const FlightError(this.message);
  @override
  List<Object?> get props => [message];
}

class FlightSearchSuccess extends FlightState {
  // --- تعديل: استخدام النموذج القوي FlightData
  final List<FlightData> flights;

  const FlightSearchSuccess(this.flights);

  @override
  List<Object?> get props => [flights];
}

// يمكن حذف الحالات الأخرى المتعلقة بالحجز
