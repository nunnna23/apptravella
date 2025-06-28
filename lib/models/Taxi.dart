// class Taxi {
//   final int id;
//   final String pickUpLocation;
//   final String dropOffLocation;
//   final String company;
//   final String carModel;
//   final double price;
//   final DateTime tripTime;
//   final int driverAge;
//   final double rate;
//   final int estimatedTime;
//   final double distance;
//   final List<String> imageUrls;

//   Taxi({
//     required this.id,
//     required this.pickUpLocation,
//     required this.dropOffLocation,
//     required this.company,
//     required this.carModel,
//     required this.price,
//     required this.tripTime,
//     required this.driverAge,
//     required this.rate,
//     required this.estimatedTime,
//     required this.distance,
//     required this.imageUrls,
//   });

//   factory Taxi.fromJson(Map<String, dynamic> json) {
//     return Taxi(
//       id: json['id'] ?? 0,
//       pickUpLocation: json['pickUplocaion'] ?? 'Unknown Location',
//       dropOffLocation: json['dropoffLocation'] ?? 'Unknown Location',
//       company: json['company'] ?? 'Unknown Company',
//       carModel: json['carModel'] ?? 'Unknown Model',
//       price: (json['price'] is int)
//           ? (json['price'] as int).toDouble()
//           : (json['price'] ?? 0.0),
//       tripTime: DateTime.tryParse(json['tripTime'] ?? '') ?? DateTime.now(),
//       driverAge: json['driverAge'] ?? 0,
//       rate: (json['rate'] is int)
//           ? (json['rate'] as int).toDouble()
//           : (json['rate'] ?? 0.0),
//       estimatedTime: json['estimatedTime'] ?? 0,
//       distance: (json['distance'] is int)
//           ? (json['distance'] as int).toDouble()
//           : (json['distance'] ?? 0.0),
//       imageUrls: json['imageUrls'] != null
//           ? List<String>.from(
//               json['imageUrls'].map((x) => 'http://travella.runasp.net$x'))
//           : [],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'pickUplocaion': pickUpLocation,
//       'dropoffLocation': dropOffLocation,
//       'company': company,
//       'carModel': carModel,
//       'price': price,
//       'tripTime': tripTime.toIso8601String(),
//       'driverAge': driverAge,
//       'rate': rate,
//       'estimatedTime': estimatedTime,
//       'distance': distance,
//       'imageUrls': imageUrls,
//     };
//   }
// }
// lib/models/Taxi.dart

class Taxi {
  final int id;
  final String pickUpLocation;
  final String dropOffLocation;
  final String company;
  final String carModel;
  final double price;
  final DateTime tripTime;
  final int driverAge;
  final double rate;
  final int estimatedTime;
  final double distance;
  // --- سيتم تخزين المسار النسبي هنا كما يأتي من الـ API ---
  final List<String> imageUrls;

  Taxi({
    required this.id,
    required this.pickUpLocation,
    required this.dropOffLocation,
    required this.company,
    required this.carModel,
    required this.price,
    required this.tripTime,
    required this.driverAge,
    required this.rate,
    required this.estimatedTime,
    required this.distance,
    required this.imageUrls,
  });

  factory Taxi.fromJson(Map<String, dynamic> json) {
    return Taxi(
      id: json['id'] ?? 0,
      pickUpLocation: json['pickUplocaion'] ?? 'Unknown Location',
      dropOffLocation: json['dropoffLocation'] ?? 'Unknown Location',
      company: json['company'] ?? 'Unknown Company',
      carModel: json['carModel'] ?? 'Unknown Model',
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      tripTime: DateTime.tryParse(json['tripTime'] ?? '') ?? DateTime.now(),
      driverAge: json['driverAge'] ?? 0,
      rate: (json['rate'] as num?)?.toDouble() ?? 0.0,
      estimatedTime: json['estimatedTime'] ?? 0,
      distance: (json['distance'] as num?)?.toDouble() ?? 0.0,
      // --- التعديل هنا: نحفظ المسار كما هو بدون إضافة رابط السيرفر ---
      imageUrls:
          json['imageUrls'] != null ? List<String>.from(json['imageUrls']) : [],
    );
  }

  // --- دالة مساعدة جديدة لبناء الرابط الكامل للصورة الأولى ---
  String get primaryFullImageUrl {
    if (imageUrls.isNotEmpty) {
      final path = imageUrls.first;
      // إذا كان المسار يبدأ بـ /، فهو مسار نسبي، لذا نضيف رابط السيرفر
      if (path.startsWith('/')) {
        return 'http://travella.runasp.net$path';
      }
      // إذا كان رابطًا كاملاً بالفعل، نرجعه كما هو
      return path;
    }
    // صورة احتياطية في حال عدم وجود صور
    return 'https://via.placeholder.com/150x150.png?text=No+Image';
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'pickUplocaion': pickUpLocation,
      'dropoffLocation': dropOffLocation,
      'company': company,
      'carModel': carModel,
      'price': price,
      'tripTime': tripTime.toIso8601String(),
      'driverAge': driverAge,
      'rate': rate,
      'estimatedTime': estimatedTime,
      'distance': distance,
      'imageUrls': imageUrls,
    };
  }
}
