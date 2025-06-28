// models/explore_city.dart

class ExploreCity {
  final String cityName;
  final int activityCount;
  final List<String> imageUrls;

  ExploreCity({
    required this.cityName,
    required this.activityCount,
    required this.imageUrls,
  });

  factory ExploreCity.fromJson(Map<String, dynamic> json) {
    return ExploreCity(
      cityName: json['cityName'] ?? 'Unknown City',
      activityCount: json['activityCount'] ?? 0,
      imageUrls: (json['imageUrls'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
    );
  }
}
