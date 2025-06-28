// // import 'package:travella/models/place_data.dart';

// // class Attraction {
// //   final String name;
// //   final String location; // e.g., "Paris, France"
// //   final String imageUrl;
// //   final double rating;
// //   final int reviewCount;
// //   final String description;
// //   final List<String> facilities;
// //   final double price;
// //   final double latitude;
// //   final double longitude;

// //   Attraction({
// //     required this.name,
// //     required this.location,
// //     required this.imageUrl,
// //     required this.rating,
// //     required this.reviewCount,
// //     required this.description,
// //     required this.facilities,
// //     required this.price,
// //     required this.latitude,
// //     required this.longitude,
// //   });

// //   // دالة لتحويل Attraction إلى PlaceData
// //   PlaceData toPlaceData() {
// //     return PlaceData(
// //       name: name,
// //       location: location,
// //       imageUrl: imageUrl,
// //       rating: rating,
// //       reviewCount: reviewCount,
// //       description: description,
// //       facilities: facilities,
// //       price: price,
// //       latitude: latitude,
// //       longitude: longitude,
// //       id: null, // يمكن تحديثه إذا كان هناك معرف
// //     );
// //   }

// //   // دالة لتحويل JSON إلى Attraction
// //   factory Attraction.fromJson(Map<String, dynamic> json) {
// //     return Attraction(
// //       name: json['name'] as String? ?? 'Unnamed Attraction',
// //       location: json['location'] as String? ?? 'Unknown Location',
// //       imageUrl: json['imageUrl'] as String? ?? 'assets/images/placeholder.jpg',
// //       rating: (json['rating'] as num? ?? 0.0).toDouble(),
// //       reviewCount: json['reviewCount'] as int? ?? 0,
// //       description: json['description'] as String? ?? 'No description available',
// //       facilities: (json['facilities'] as List<dynamic>?)?.map((e) => e.toString()).toList() ?? [],
// //       price: (json['price'] as num? ?? 0.0).toDouble(),
// //       latitude: (json['latitude'] as num? ?? 0.0).toDouble(),
// //       longitude: (json['longitude'] as num? ?? 0.0).toDouble(),
// //     );
// //   }

// // }
// import 'package:travella/models/place_data.dart';
// import 'package:travella/models/activity.dart';

// class Attraction {
//   final String name;
//   final String location;
//   final String imageUrl;
//   final double rating;
//   final int reviewCount;
//   final String description;
//   final List<String> facilities;
//   final double price;
//   final double latitude;
//   final double longitude;

//   Attraction({
//     required this.name,
//     required this.location,
//     required this.imageUrl,
//     required this.rating,
//     required this.reviewCount,
//     required this.description,
//     required this.facilities,
//     required this.price,
//     required this.latitude,
//     required this.longitude,
//   });

//   // تحويل Attraction إلى PlaceData
//   PlaceData toPlaceData() {
//     return PlaceData(
//       name: name,
//       location: location,
//       imageUrl: imageUrl,
//       rating: rating,
//       reviewCount: reviewCount,
//       description: description,
//       facilities: facilities,
//       price: price,
//       latitude: latitude,
//       longitude: longitude,
//       id: null,
//     );
//   }

//   // تحويل Attraction إلى Activity
//   Activity toActivity() {
//     return Activity(
//       id: 0, // يمكن تحديثه إذا كان هناك معرف
//       name: name,
//       location: location,
//       description: description,
//       rate: rating,
//       duration: 0, // افتراضي، يمكن تحديثه
//       imageUrls: [imageUrl],
//     );
//   }

//   // تحويل JSON إلى Attraction
//   factory Attraction.fromJson(Map<String, dynamic> json) {
//     return Attraction(
//       name: json['name'] as String? ?? 'Unnamed Attraction',
//       location: json['location'] as String? ?? 'Unknown Location',
//       imageUrl: json['imageUrl'] as String? ?? 'assets/images/placeholder.jpg',
//       rating: (json['rate'] as num? ?? 0.0).toDouble(),
//       reviewCount: json['reviewCount'] as int? ?? 0,
//       description: json['description'] as String? ?? 'No description available',
//       facilities: (json['facilities'] as List<dynamic>?)
//               ?.map((e) => e.toString())
//               .toList() ??
//           [],
//       price: (json['price'] as num? ?? 0.0).toDouble(),
//       latitude: (json['latitude'] as num? ?? 0.0).toDouble(),
//       longitude: (json['longitude'] as num? ?? 0.0).toDouble(),
//     );
//   }
// }
import 'package:apptravella/models/place_data.dart';
import 'package:apptravella/models/activity.dart';

class Attraction {
  final String name;
  final String location;
  final List<String> imageUrls; // تغيير إلى قائمة لدعم عدة صور
  final double rating;
  final int reviewCount;
  final String description;
  final List<String> facilities;
  final double price;
  final double latitude;
  final double longitude;

  Attraction({
    required this.name,
    required this.location,
    required this.imageUrls,
    required this.rating,
    required this.reviewCount,
    required this.description,
    required this.facilities,
    required this.price,
    required this.latitude,
    required this.longitude,
    required String imageUrl,
  });

  // تحويل Attraction إلى PlaceData
  PlaceData toPlaceData() {
    return PlaceData(
      name: name,
      location: location,
      imageUrl: imageUrls.isNotEmpty
          ? imageUrls.first
          : 'assets/images/placeholder.jpg', // استخدام أول صورة إذا كانت موجودة
      rating: rating,
      reviewCount: reviewCount,
      description: description,
      facilities: facilities,
      price: price,
      latitude: latitude,
      longitude: longitude,
      id: null,
    );
  }

  // تحويل Attraction إلى Activity
  Activity toActivity() {
    return Activity(
      id: 0, // يمكن تحديثه إذا كان هناك معرف
      name: name,
      location: location,
      description: description,
      rate: rating,
      duration: 0, // افتراضي، يمكن تحديثه
      imageUrls: imageUrls.isNotEmpty
          ? imageUrls
          : ['assets/images/placeholder.jpg'], // استخدام القائمة الكاملة
    );
  }

  // تحويل JSON إلى Attraction
  factory Attraction.fromJson(Map<String, dynamic> json) {
    return Attraction(
      name: json['name'] as String? ?? 'Unnamed Attraction',
      location: json['location'] as String? ?? 'Unknown Location',
      imageUrls: (json['imageUrls'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          ['assets/images/placeholder.jpg'],
      rating: (json['rate'] as num? ?? 0.0).toDouble(),
      reviewCount: json['reviewCount'] as int? ?? 0,
      description: json['description'] as String? ?? 'No description available',
      facilities: (json['facilities'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      price: (json['price'] as num? ?? 0.0).toDouble(),
      latitude: (json['latitude'] as num? ?? 0.0).toDouble(),
      longitude: (json['longitude'] as num? ?? 0.0).toDouble(),
      imageUrl: '',
    );
  }
}
