// // class Activity {
// //   final int id;
// //   final String name;
// //   final String location;
// //   final String description;
// //   final double rate;
// //   final int duration;
// //   final List<String> imageUrls;

// //   Activity({
// //     required this.id,
// //     required this.name,
// //     required this.location,
// //     required this.description,
// //     required this.rate,
// //     required this.duration,
// //     required this.imageUrls,
// //   });

// //   factory Activity.fromJson(Map<String, dynamic> json) {
// //     return Activity(
// //       id: json['id'] as int? ?? 0,
// //       name: json['name'] as String? ?? 'Unnamed Activity',
// //       location: json['location'] as String? ?? 'Unknown Location',
// //       description: json['description'] as String? ?? 'No description available',
// //       rate: (json['rate'] as num? ?? 0.0).toDouble(),
// //       duration: json['duration'] as int? ?? 0,
// //       imageUrls: (json['imageUrls'] as List<dynamic>?)
// //               ?.map((e) => e.toString())
// //               .toList() ??
// //           [],
// //     );
// //   }
// // }
// // models/activity.dart

// class Activity {
//   final int id;
//   final String name;
//   final String location;
//   final String description;
//   final double rate;
//   final int duration;
//   final List<String> imageUrls;
//   // يمكن إضافة السعر هنا إذا كان الـ API يوفره للأنشطة
//   // final double price;

//   Activity({
//     required this.id,
//     required this.name,
//     required this.location,
//     required this.description,
//     required this.rate,
//     required this.duration,
//     required this.imageUrls,
//     // required this.price,
//   });

//   factory Activity.fromJson(Map<String, dynamic> json) {
//     return Activity(
//       id: json['id'] ?? 0,
//       name: json['name'] ?? 'Unnamed Activity',
//       location: json['location'] ?? 'Unknown Location',
//       description: json['description'] ?? 'No description available.',
//       rate: (json['rate'] as num?)?.toDouble() ?? 0.0,
//       duration: json['duration'] ?? 0,
//       imageUrls: (json['imageUrls'] as List<dynamic>?)
//               ?.map((item) => item.toString())
//               .toList() ??
//           [],
//       // price: (json['price'] as num?)?.toDouble() ?? 0.0,
//     );
//   }
// }
class Attraction {
  final int id;
  final String name;
  final String location;
  final String description;
  final double rate;
  final int duration;
  final List<String> imageUrls;

  Attraction({
    required this.id,
    required this.name,
    required this.location,
    required this.description,
    required this.rate,
    required this.duration,
    required this.imageUrls,
  });

  factory Attraction.fromJson(Map<String, dynamic> json) {
    return Attraction(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? 'Unnamed Attraction',
      location: json['location'] as String? ?? 'Unknown Location',
      description: json['description'] as String? ?? 'No description',
      rate: (json['rate'] as num? ?? 0.0).toDouble(),
      duration: json['duration'] as int? ?? 0,
      imageUrls: (json['imageUrls'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
    );
  }

  // Convert to Activity (if needed for PlaceDetailsScreen)
  Activity toActivity() {
    return Activity(
      id: id,
      name: name,
      location: location,
      description: description,
      rate: rate,
      duration: duration,
      imageUrls: imageUrls,
    );
  }
}

// Assuming Activity is the same as Attraction for simplicity
class Activity {
  final int id;
  final String name;
  final String location;
  final String description;
  final double rate;
  final int duration;
  final List<String> imageUrls;

  Activity({
    required this.id,
    required this.name,
    required this.location,
    required this.description,
    required this.rate,
    required this.duration,
    required this.imageUrls,
  });
}
