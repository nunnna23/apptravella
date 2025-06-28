// // lib/models/CarRental.dart

// /// Base URL of your backend to construct full image paths.
// const String imageBaseUrl = 'http://travella.runasp.net';

// class CarRental {
//   final int id;
//   final double price;
//   final String? transmission;
//   final String? engineType; // Corresponds to fuelType in UI
//   final String rentType;
//   final String pickUpLocation;
//   final String dropOffLocation;
//   final DateTime date;
//   final List<String> imageUrls;

//   // --- UI Fields (Not in API Response) ---
//   // These are given default values to prevent the UI from crashing.
//   // For a complete solution, these fields should be added to the backend API.
//   final String company; // Corresponds to brand in UI
//   final String carModel; // Corresponds to name in UI
//   final String carType; // e.g., 'SUV', 'Sedan'
//   final int seats;
//   final double rating;

//   CarRental({
//     required this.id,
//     required this.price,
//     this.transmission,
//     this.engineType,
//     required this.rentType,
//     required this.pickUpLocation,
//     required this.dropOffLocation,
//     required this.date,
//     required this.imageUrls,
//     // Default values for missing fields
//     this.company = 'API Auto',
//     this.carModel = 'Model Pro',
//     this.carType = 'SUV',
//     this.seats = 5,
//     this.rating = 3.5,
//   });

//   /// Factory constructor to create a CarRental instance from a JSON map.
//   factory CarRental.fromJson(Map<String, dynamic> json) {
//     // Helper to safely parse numeric values from JSON.
//     double parseDouble(dynamic value) {
//       if (value is double) return value;
//       if (value is int) return value.toDouble();
//       if (value is String) return double.tryParse(value) ?? 0.0;
//       return 0.0;
//     }

//     return CarRental(
//       id: json['id'] ?? 0,
//       price: parseDouble(json['price']),
//       transmission: json['transmission'],
//       engineType: json['engineType'],
//       rentType: json['rentType'] ?? 'self driver',
//       // Note: API response uses 'pIckUpLocation' with a capital 'I'.
//       pickUpLocation: json['pIckUpLocation'] ?? 'Unknown Location',
//       dropOffLocation: json['dropOffLocation'] ?? 'Unknown Location',
//       date: DateTime.tryParse(json['date'] ?? '') ?? DateTime.now(),
//       // API returns relative image paths, so we prepend the base URL.
//       imageUrls: json['imageUrls'] != null
//           ? List<String>.from(json['imageUrls'].map((x) => '$imageBaseUrl$x'))
//           : [],

//       // --- Handling fields missing from API ---
//       // These are not in the /search or /filter response. Default values are used.
//       company: json['company'] ?? 'Unknown Brand',
//       carModel: json['carModel'] ?? 'Unknown Model',
//       carType: json['carType'] ?? 'Sedan',
//       seats: json['seats'] ?? 5,
//       rating: parseDouble(json['rate'] ?? json['rating'] ?? 3.0),
//     );
//   }
// }
/// Base URL of your backend to construct full image paths.
const String imageBaseUrl = 'http://travella.runasp.net';

class CarRental {
  final int id;
  final double price;
  final String? carType;
  final String? transmission;
  final String? brand;
  final String? engineType;
  final String rentType;
  final String pickUpLocation;
  final String dropOffLocation;
  final DateTime date;
  final List<String> imageUrls;

  CarRental({
    required this.id,
    required this.price,
    this.carType,
    this.transmission,
    this.brand,
    this.engineType,
    required this.rentType,
    required this.pickUpLocation,
    required this.dropOffLocation,
    required this.date,
    required this.imageUrls,
  });

  /// Factory constructor to create a CarRental instance from a JSON map.
  factory CarRental.fromJson(Map<String, dynamic> json) {
    return CarRental(
      id: json['id'] ?? 0,
      price: (json['price'] is int)
          ? (json['price'] as int).toDouble()
          : (json['price'] ?? 0.0),
      carType: json['carType'],
      transmission: json['transmission'],
      brand: json['brand'],
      engineType: json['engineType'],
      rentType: json['rentType'] ?? 'self driver',
      pickUpLocation: json['pIckUpLocation'] ??
          'Unknown Location', // ملاحظة: يحتوي الـ API على 'pIckUpLocation' بدلاً من 'pickUpLocation'
      dropOffLocation: json['dropOffLocation'] ?? 'Unknown Location',
      date: DateTime.tryParse(json['date'] ?? '') ?? DateTime.now(),
      imageUrls: json['imageUrls'] != null
          ? List<String>.from(json['imageUrls'].map((x) => '$imageBaseUrl$x'))
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'price': price,
      'carType': carType,
      'transmission': transmission,
      'brand': brand,
      'engineType': engineType,
      'rentType': rentType,
      'pIckUpLocation': pickUpLocation,
      'dropOffLocation': dropOffLocation,
      'date': date.toIso8601String(),
      'imageUrls': imageUrls,
    };
  }
}
