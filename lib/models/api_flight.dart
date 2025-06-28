// // // // lib/models/api_flight.dart

// // // class ApiFlight {
// // //   final int id;
// // //   final String fromLocation;
// // //   final String destination;
// // //   final DateTime departureTime;
// // //   final DateTime arrivalTime;
// // //   final int stops;
// // //   final String airline;
// // //   final int numberOfPersons;
// // //   final String category;
// // //   final num price; // استخدام num ليكون مرناً (int or double)

// // //   ApiFlight({
// // //     required this.id,
// // //     required this.fromLocation,
// // //     required this.destination,
// // //     required this.departureTime,
// // //     required this.arrivalTime,
// // //     required this.stops,
// // //     required this.airline,
// // //     required this.numberOfPersons,
// // //     required this.category,
// // //     required this.price,
// // //   });

// // //   // دالة Factory لتحويل JSON إلى كائن ApiFlight
// // //   factory ApiFlight.fromJson(Map<String, dynamic> json) {
// // //     return ApiFlight(
// // //       id: json['id'],
// // //       fromLocation: json['fromLocation'],
// // //       destination: json['destination'],
// // //       departureTime: DateTime.parse(json['departureTime']),
// // //       arrivalTime: DateTime.parse(json['arrivalTime']),
// // //       stops: json['stops'],
// // //       airline: json['airline'],
// // //       numberOfPersons: json['numberOfpersons'],
// // //       category: json['category'],
// // //       price: json['price'],
// // //     );
// // //   }
// // // }
// // class ApiFlight {
// //   final int id;
// //   final String fromLocation;
// //   final String destination;
// //   final DateTime departureTime;
// //   final DateTime arrivalTime;
// //   final int stops;
// //   final String airline;
// //   final int numberOfpersons;
// //   final String category;
// //   final int price;

// //   ApiFlight({
// //     required this.id,
// //     required this.fromLocation,
// //     required this.destination,
// //     required this.departureTime,
// //     required this.arrivalTime,
// //     required this.stops,
// //     required this.airline,
// //     required this.numberOfpersons,
// //     required this.category,
// //     required this.price,
// //   });

// //   factory ApiFlight.fromJson(Map<String, dynamic> json) {
// //     return ApiFlight(
// //       id: json['id'],
// //       fromLocation: json['fromLocation'],
// //       destination: json['destination'],
// //       departureTime: DateTime.parse(json['departureTime']),
// //       arrivalTime: DateTime.parse(json['arrivalTime']),
// //       stops: json['stops'],
// //       airline: json['airline'],
// //       numberOfpersons: json['numberOfpersons'],
// //       category: json['category'],
// //       price: json['price'],
// //     );
// //   }
// // }
// class ApiFlight {
//   final int id;
//   final String fromLocation;
//   final String destination;
//   final DateTime departureTime;
//   final DateTime arrivalTime;
//   final int stops;
//   final String airline;
//   final int numberOfpersons; // قد تحتاجين إلى تعديل هذا إلى Map
//   final String category;
//   final double price;

//   ApiFlight({
//     required this.id,
//     required this.fromLocation,
//     required this.destination,
//     required this.departureTime,
//     required this.arrivalTime,
//     required this.stops,
//     required this.airline,
//     required this.numberOfpersons,
//     required this.category,
//     required this.price,
//   });

//   factory ApiFlight.fromJson(Map<String, dynamic> json) {
//     return ApiFlight(
//       id: json['id'],
//       fromLocation: json['fromLocation'],
//       destination: json['destination'],
//       departureTime: DateTime.parse(json['departureTime']),
//       arrivalTime: DateTime.parse(json['arrivalTime']),
//       stops: json['stops'],
//       airline: json['airline'],
//       numberOfpersons: json['numberOfpersons'], // قد تحتاجين إلى تعديل هذا
//       category: json['category'],
//       price: json['price'].toDouble(),
//     );
//   }
// }
// models/api_flight.dart

class ApiFlight {
  final int id;
  final String fromLocation;
  final String destination;
  final DateTime departureTime;
  final DateTime arrivalTime;
  final int stops;
  final String airline;
  final int numberOfpersons;
  final String category;
  final double price;

  ApiFlight({
    required this.id,
    required this.fromLocation,
    required this.destination,
    required this.departureTime,
    required this.arrivalTime,
    required this.stops,
    required this.airline,
    required this.numberOfpersons,
    required this.category,
    required this.price,
  });

  factory ApiFlight.fromJson(Map<String, dynamic> json) {
    return ApiFlight(
      id: json['id'] ?? 0,
      fromLocation: json['fromLocation'] ?? 'Unknown',
      destination: json['destination'] ?? 'Unknown',
      departureTime: DateTime.parse(json['departureTime']),
      arrivalTime: DateTime.parse(json['arrivalTime']),
      stops: json['stops'] ?? 0,
      airline: json['airline'] ?? 'Unknown Airline',
      numberOfpersons: json['numberOfpersons'] ?? 0,
      category: json['category'] ?? 'economy',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
    );
  }
}
