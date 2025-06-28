// class CityData {
//   final String name;
//   final int propertyCount;
//   final String imageUrl;

//   CityData({
//     required this.name,
//     required this.propertyCount,
//     required this.imageUrl,
//   });

//   factory CityData.fromJson(Map<String, dynamic> json) {
//     return CityData(
//       name: json['cityName'] as String? ?? 'Unknown City',
//       propertyCount: json['activityCount'] as int? ?? 0, imageUrl: '',
//       // imageUrl: json['imageUrl'] as String? ?? 'assets/hotel.jpeg',
//     );
//   }
// }
// models/explore_city.dart

class ExploreCity {
  final String cityName;
  final int activityCount;
  final List<String> imageUrls; // لاحظ هنا: قائمة من نوع String

  ExploreCity({
    required this.cityName,
    required this.activityCount,
    required this.imageUrls,
  });

  // هذا هو الجزء الأهم
  factory ExploreCity.fromJson(Map<String, dynamic> json) {
    return ExploreCity(
      cityName: json['cityName'] ?? 'Unknown City',
      activityCount: json['activityCount'] ?? 0,
      // هنا نقرأ القائمة "imageUrls" ونحولها إلى List<String>
      imageUrls: (json['imageUrls'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [], // إذا كانت القائمة غير موجودة، نرجع قائمة فارغة
    );
  }
}
