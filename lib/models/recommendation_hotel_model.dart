import 'package:intl/intl.dart';
import 'package:apptravella/services/api/api_endpoints.dart';

class RecommendationHotel {
  final int hotelId;
  final String name;
  final String city;
  final double rate;
  final num discountedPrice;
  final String imageUrl;
  final String description;
  final String travelStyle;
  final String foodPreferences;
  final String preferredSeason;
  final String ecoFriendlyOptions;

  RecommendationHotel({
    required this.hotelId,
    required this.name,
    required this.city,
    required this.rate,
    required this.discountedPrice,
    required this.imageUrl,
    required this.description,
    required this.travelStyle,
    required this.foodPreferences,
    required this.preferredSeason,
    required this.ecoFriendlyOptions,
  });

  factory RecommendationHotel.fromJson(Map<String, dynamic> json) {
    double parseDouble(dynamic value) {
      if (value is double) return value;
      if (value is int) return value.toDouble();
      if (value is String) return double.tryParse(value) ?? 0.0;
      return 0.0;
    }

    return RecommendationHotel(
      hotelId: json['HotelId'] as int,
      name: json['Name'] as String,
      city: json['City'] as String,
      rate: parseDouble(json['Rate']),
      discountedPrice: json['DiscountedPrice'] as num,
      imageUrl: json['ImageUrl'] as String,
      description: json['Description'] ?? 'No description available.',
      travelStyle: json['TravelStyle'] ?? '',
      foodPreferences: json['FoodPreferences'] ?? '',
      preferredSeason: json['PreferredSeason'] ?? '',
      ecoFriendlyOptions: json['EcoFriendlyOptions'] ?? '',
    );
  }

  // دالة مساعدة لتجميع كل "التاجات" الخاصة بالفندق للفلترة
  Set<String> getAllTags() {
    final tags = <String>{};
    tags.addAll(travelStyle
        .toLowerCase()
        .split(RegExp(r'[\s,]+'))
        .where((s) => s.isNotEmpty));
    tags.addAll(foodPreferences
        .toLowerCase()
        .split(RegExp(r'[\s,]+'))
        .where((s) => s.isNotEmpty));
    tags.addAll(preferredSeason
        .toLowerCase()
        .split(RegExp(r'[\s,]+'))
        .where((s) => s.isNotEmpty));
    tags.addAll(ecoFriendlyOptions
        .toLowerCase()
        .split(RegExp(r'[\s,]+'))
        .where((s) => s.isNotEmpty));

    if (tags.contains('family')) tags.add('family trip');
    if (tags.contains('adventure')) tags.add('adventure trip');

    return tags;
  }

  // دالة لجلب رابط الصورة الكامل
  String get fullImageUrl {
    if (imageUrl.startsWith('/')) {
      return Uri.parse(ApiEndpoints.imageUrlBase).resolve(imageUrl).toString();
    }
    return imageUrl;
  }

  // دالة لتنسيق السعر
  String get formattedPrice {
    final formatter = NumberFormat.currency(
        locale: 'en_US', symbol: 'EGP ', decimalDigits: 0);
    return formatter.format(discountedPrice);
  }
}
