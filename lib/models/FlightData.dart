// // // import 'package:equatable/equatable.dart';
// // // import 'package:intl/intl.dart';
// // // import 'package:flutter/material.dart';

// // // class FlightData extends Equatable {
// // //   final int id;
// // //   final String fromCity;
// // //   final String toCity;
// // //   final DateTime departureDateTime;
// // //   final DateTime arrivalDateTime;
// // //   final int stops;
// // //   final String airlineName;
// // //   final int numberOfPersons;
// // //   final String category;
// // //   final double price;

// // //   // --- Helper fields for UI that are not in the API response ---
// // //   final double rating;
// // //   final String logoAsset;

// // //   const FlightData({
// // //     required this.id,
// // //     required this.fromCity,
// // //     required this.toCity,
// // //     required this.departureDateTime,
// // //     required this.arrivalDateTime,
// // //     required this.stops,
// // //     required this.airlineName,
// // //     required this.numberOfPersons,
// // //     required this.category,
// // //     required this.price,
// // //     required this.rating,
// // //     required this.logoAsset,
// // //   });

// // //   factory FlightData.fromJson(Map<String, dynamic> json, String from) {
// // //     String airline = json['airline'] ?? 'Unknown Airline';
// // //     double dummyRating = 4.0 + ((json['id'] ?? 0) % 10) * 0.1;

// // //     return FlightData(
// // //       id: json['id'] ?? 0,
// // //       fromCity: json['fromLocation'] ?? 'N/A',
// // //       toCity: json['destination'] ?? 'N/A',
// // //       departureDateTime:
// // //           DateTime.tryParse(json['departureTime'] ?? '') ?? DateTime.now(),
// // //       arrivalDateTime:
// // //           DateTime.tryParse(json['arrivalTime'] ?? '') ?? DateTime.now(),
// // //       stops: json['stops'] ?? 0,
// // //       airlineName: airline.toUpperCase(),
// // //       numberOfPersons: (json['numberOfpersons'] as num? ?? 0).toInt(),
// // //       category: json['category'] ?? 'Economy',
// // //       price: (json['price'] as num? ?? 0).toDouble(),
// // //       rating: dummyRating,
// // //       logoAsset: _mapAirlineToLogo(airline),
// // //     );
// // //   }

// // //   String get duration {
// // //     final difference = arrivalDateTime.difference(departureDateTime);
// // //     final hours = difference.inHours;
// // //     final minutes = difference.inMinutes.remainder(60);
// // //     return '${hours}h ${minutes}m';
// // //   }

// // //   String get departureTime => DateFormat('h:mm a').format(departureDateTime);
// // //   String get arrivalTime => DateFormat('h:mm a').format(arrivalDateTime);
// // //   String get priceFormattedString =>
// // //       NumberFormat("#,##0", "en_US").format(price);
// // //   double get priceValue => price;
// // //   TimeOfDay get departureTimeOfDay => TimeOfDay.fromDateTime(departureDateTime);

// // //   static String _mapAirlineToLogo(String airlineName) {
// // //     final name = airlineName.toLowerCase();
// // //     if (name.contains('turkish')) return 'assets/turkish_airlines_logo.png';
// // //     if (name.contains('egyptair') || name.contains('egypt air')) {
// // //       return 'assets/egyptair_logo.png';
// // //     }
// // //     if (name.contains('united')) return 'assets/united_logo.png';
// // //     if (name.contains('emirates')) return 'assets/emirates_logo.png';
// // //     if (name.contains('british')) return 'assets/ba_logo.png';
// // //     if (name.contains('qatar')) return 'assets/qatar_logo.png';
// // //     if (name.contains('delta')) return 'assets/default_logo.png';
// // //     return 'assets/default_logo.png';
// // //   }

// // //   @override
// // //   List<Object?> get props => [
// // //         id,
// // //         fromCity,
// // //         toCity,
// // //         departureDateTime,
// // //         arrivalDateTime,
// // //         stops,
// // //         airlineName,
// // //         numberOfPersons,
// // //         category,
// // //         price,
// // //         rating,
// // //         logoAsset,
// // //       ];
// // // }

// // // lib/models/FlightData.dart

// // import 'package:intl/intl.dart';

// // class FlightData {
// //   final int id;
// //   final String fromLocation;
// //   final String destination;
// //   final DateTime departureTime;
// //   final DateTime arrivalTime;
// //   final int stops;
// //   final String airline;
// //   final int numberOfPersons;
// //   final String category;
// //   final double price;

// //   FlightData({
// //     required this.id,
// //     required this.fromLocation,
// //     required this.destination,
// //     required this.departureTime,
// //     required this.arrivalTime,
// //     required this.stops,
// //     required this.airline,
// //     required this.numberOfPersons,
// //     required this.category,
// //     required this.price,
// //   });

// //   factory FlightData.fromJson(Map<String, dynamic> json) {
// //     return FlightData(
// //       id: json['id'] ?? 0,
// //       fromLocation: json['fromLocation'] ?? 'Unknown',
// //       destination: json['destination'] ?? 'Unknown',
// //       departureTime: DateTime.parse(json['departureTime']),
// //       arrivalTime: DateTime.parse(json['arrivalTime']),
// //       stops: json['stops'] ?? 0,
// //       airline: json['airline'] ?? 'Unknown Airline',
// //       numberOfPersons: json['numberOfpersons'] ?? 0,
// //       category: (json['category'] as String?)?.capitalize() ?? 'Economy',
// //       price: (json['price'] as num).toDouble(),
// //     );
// //   }

// //   // --- Getters to solve UI errors ---

// //   // يحل مشكلة 'airlineName' is not defined
// //   String get airlineName => airline;

// //   // يحل مشكلة 'departureTimeOfDay' is not defined
// //   String get departureTimeOfDay => DateFormat('HH:mm').format(departureTime);
// //   String get arrivalTimeOfDay => DateFormat('HH:mm').format(arrivalTime);

// //   // يحل مشكلة 'priceFormattedString' is not defined
// //   String get priceFormattedString => NumberFormat("#,##0", "en_US").format(price);

// //   String get fromCity => fromLocation.split(',').first.trim();
// //   String get toCity => destination.split(',').first.trim();

// //   String get duration {
// //     final difference = arrivalTime.difference(departureTime);
// //     if (difference.isNegative) return "0h 0m";
// //     final hours = difference.inHours;
// //     final minutes = difference.inMinutes.remainder(60);
// //     return '${hours}h ${minutes}m';
// //   }

// //   String get logoAsset {
// //     String name = airline.toLowerCase();
// //     if (name.contains('egyptair') || name.contains('egypt air')) {
// //       return 'assets/egyptair_logo.png';
// //     } else if (name.contains('turkish')) {
// //       return 'assets/turkish_airlines_logo.png';
// //     } else if (name.contains('british')) {
// //       return 'assets/ba_logo.png';
// //     } else if (name.contains('emirates')) {
// //       return 'assets/emirates_logo.png';
// //     }
// //     return 'assets/default_logo.png';
// //   }

// //   // Dummy rating, as it's not in the API response
// //   double get rating => (id % 12 / 10 + 3.8).clamp(3.8, 5.0);
// // }

// // // Helper extension to capitalize strings like "economy" -> "Economy"
// // extension StringExtension on String {
// //   String capitalize() {
// //     if (this.isEmpty) {
// //       return "";
// //     }
// //     return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
// //   }
// // }
// // lib/models/FlightData.dart

// import 'package:intl/intl.dart';

// class FlightData {
//   final int id;
//   final String fromLocation;
//   final String destination;
//   final DateTime departureTime;
//   final DateTime arrivalTime;
//   final int stops;
//   final String airline;
//   final int numberOfPersons;
//   final String category;
//   final double price;

//   FlightData({
//     required this.id,
//     required this.fromLocation,
//     required this.destination,
//     required this.departureTime,
//     required this.arrivalTime,
//     required this.stops,
//     required this.airline,
//     required this.numberOfPersons,
//     required this.category,
//     required this.price,
//   });

//   factory FlightData.fromJson(Map<String, dynamic> json, String from) {
//     return FlightData(
//       id: json['id'] ?? 0,
//       fromLocation: json['fromLocation'] ?? 'Unknown',
//       destination: json['destination'] ?? 'Unknown',
//       departureTime: DateTime.parse(json['departureTime']),
//       arrivalTime: DateTime.parse(json['arrivalTime']),
//       stops: json['stops'] ?? 0,
//       airline: json['airline'] ?? 'Unknown Airline',
//       numberOfPersons: json['numberOfpersons'] ?? 0,
//       category: (json['category'] as String?)?.capitalize() ?? 'Economy',
//       price: (json['price'] as num).toDouble(),
//     );
//   }

//   // --- Getters to solve UI errors ---

//   // Getter for airlineName
//   String get airlineName => airline;

//   // Getters for formatted time
//   String get departureTimeOfDay => DateFormat('HH:mm').format(departureTime);
//   String get arrivalTimeOfDay => DateFormat('HH:mm').format(arrivalTime);

//   // Getter for formatted price string
//   String get priceFormattedString =>
//       NumberFormat("#,##0", "en_US").format(price);

//   // Getter for raw price value
//   double get priceValue => price;

//   String get fromCity => fromLocation.split(',').first.trim();
//   String get toCity => destination.split(',').first.trim();

//   String get duration {
//     final difference = arrivalTime.difference(departureTime);
//     if (difference.isNegative) return "0h 0m";
//     final hours = difference.inHours;
//     final minutes = difference.inMinutes.remainder(60);
//     return '${hours}h ${minutes}m';
//   }

//   String get logoAsset {
//     String name = airline.toLowerCase();
//     if (name.contains('egyptair') || name.contains('egypt air')) {
//       return 'assets/egyptair_logo.png';
//     } else if (name.contains('turkish')) {
//       return 'assets/turkish_airlines_logo.png';
//     } else if (name.contains('british')) {
//       return 'assets/ba_logo.png';
//     } else if (name.contains('emirates')) {
//       return 'assets/emirates_logo.png';
//     }
//     return 'assets/default_logo.png';
//   }

//   // Dummy rating, as it's not in the API response
//   double get rating => (id % 12 / 10 + 3.8).clamp(3.8, 5.0);
// }

// // Helper extension to capitalize strings like "economy" -> "Economy"
// extension StringExtension on String {
//   String capitalize() {
//     if (this.isEmpty) {
//       return "";
//     }
//     return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
//   }
// }
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:math';
import 'api_flight.dart';

extension StringExtension on String {
  String capitalize() {
    if (this.isEmpty) {
      return this;
    }
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }
}

class FlightData {
  final int id;
  final String airlineName;
  final String logoAsset;
  final String fromCity;
  final String toCity;
  final String duration;
  final String departureTime;
  final String arrivalTime;
  final String price;
  final double priceValue;
  final int stops;
  final double rating;
  final String category;
  final TimeOfDay departureTimeOfDay;

  FlightData({
    required this.id,
    required this.airlineName,
    required this.logoAsset,
    required this.fromCity,
    required this.toCity,
    required this.duration,
    required this.departureTime,
    required this.arrivalTime,
    required this.price,
    required this.priceValue,
    required this.stops,
    required this.rating,
    required this.category,
  }) : departureTimeOfDay = _parseTimeOfDay(departureTime);

  factory FlightData.fromApiFlight(ApiFlight apiFlight) {
    final flightDuration =
        apiFlight.arrivalTime.difference(apiFlight.departureTime);
    final hours = flightDuration.inHours;
    final minutes = flightDuration.inMinutes.remainder(60);
    final durationString = '${hours}h ${minutes}m';

    final timeFormat = DateFormat('h:mm a');
    final departureTimeString = timeFormat.format(apiFlight.departureTime);
    final arrivalTimeString = timeFormat.format(apiFlight.arrivalTime);

    final priceFormatter = NumberFormat("#,##0", "en_US");
    final priceString = priceFormatter.format(apiFlight.price);

    final dummyRating = 3.5 + Random().nextDouble() * 1.5;

    return FlightData(
      id: apiFlight.id,
      airlineName: apiFlight.airline,
      logoAsset: _getLogoForAirline(apiFlight.airline),
      fromCity: apiFlight.fromLocation.capitalize(),
      toCity: apiFlight.destination.capitalize(),
      duration: durationString,
      departureTime: departureTimeString,
      arrivalTime: arrivalTimeString,
      price: priceString,
      priceValue: apiFlight.price,
      stops: apiFlight.stops,
      rating: dummyRating,
      category: apiFlight.category.capitalize(),
    );
  }

  static String _getLogoForAirline(String airlineName) {
    final name = airlineName.toLowerCase();
    if (name.contains('egyptair') || name.contains('egypt air')) {
      return 'assets/egyptair_logo.png';
    } else if (name.contains('turkish')) {
      return 'assets/turkish_airlines_logo.png';
    } else if (name.contains('united')) {
      return 'assets/united_logo.png';
    } else if (name.contains('emirates')) {
      return 'assets/emirates_logo.png';
    } else if (name.contains('british')) {
      return 'assets/ba_logo.png';
    } else if (name.contains('qatar')) {
      return 'assets/qatar_logo.png';
    }
    return 'assets/default_logo.png';
  }

  static TimeOfDay _parseTimeOfDay(String timeString) {
    try {
      final format = DateFormat("h:mm a");
      final dt = format.parseStrict(timeString);
      return TimeOfDay.fromDateTime(dt);
    } catch (e) {
      print("Error parsing time: '$timeString', Error: $e");
      return const TimeOfDay(hour: 0, minute: 0);
    }
  }
}
