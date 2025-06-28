import 'package:intl/intl.dart';
import 'package:apptravella/services/api/api_endpoints.dart'; // تأكد من المسار

class Hotel {
  final int id;
  final String name;
  final String countery;
  final String city;
  final String location;
  final String? facility;
  final double price;
  final int numberofPersons;
  final String cancellationPolicy;
  final DateTime checkInDate;
  final DateTime checkOutDate;
  final double rate;
  final bool hasPool;
  final bool hasGym;
  final bool hasSpa;
  final bool hasRestaurant;
  final bool hasParking;
  final bool hasWifi;
  final List<String> imageUrls;
  final int reviewCount;
  final String? description; // إضافة خاصية description
  bool isCompared;
  bool isFavorite;

  Hotel({
    required this.id,
    required this.name,
    required this.countery,
    required this.city,
    required this.location,
    this.facility,
    required this.price,
    required this.numberofPersons,
    required this.cancellationPolicy,
    required this.checkInDate,
    required this.checkOutDate,
    required this.rate,
    required this.hasPool,
    required this.hasGym,
    required this.hasSpa,
    required this.hasRestaurant,
    required this.hasParking,
    required this.hasWifi,
    required this.imageUrls,
    required this.reviewCount,
    this.description, // إضافة description كـ optional
    this.isCompared = false,
    this.isFavorite = false,
  });

  factory Hotel.fromJson(Map<String, dynamic> json) {
    double parseDouble(dynamic value) {
      if (value is double) return value;
      if (value is int) return value.toDouble();
      if (value is String) return double.tryParse(value) ?? 0.0;
      return 0.0;
    }

    return Hotel(
      id: json['id'] ?? 0,
      name: json['name'] ?? 'Unknown Hotel',
      countery: json['countery'] ?? 'Unknown Country',
      city: json['city'] ?? 'Unknown City',
      location: json['location'] ?? 'Unknown Location',
      facility: json['facility'],
      price: parseDouble(json['price']),
      numberofPersons: json['numberofPersons'] ?? 0,
      cancellationPolicy: json['cancellationPolicy'] ?? 'N/A',
      checkInDate:
          DateTime.tryParse(json['checkInDate'] ?? '') ?? DateTime.now(),
      checkOutDate:
          DateTime.tryParse(json['checkOutDate'] ?? '') ?? DateTime.now(),
      rate: parseDouble(json['rate']),
      hasPool: json['hasPool'] ?? false,
      hasGym: json['hasGym'] ?? false,
      hasSpa: json['hasSpa'] ?? false,
      hasRestaurant: json['hasRestaurant'] ?? false,
      hasParking: json['hasParking'] ?? false,
      hasWifi: json['hasWifi'] ?? false,
      imageUrls: List<String>.from(json['imageUrls'] ?? []),
      reviewCount:
          json['reviewCount'] ?? (parseDouble(json['rate']) * 150).toInt(),
      description: json['description'] ??
          'No description available', // إضافة description من الـ JSON
    );
  }

  String get primaryImageUrl {
    if (imageUrls.isNotEmpty) {
      return Uri.parse(ApiEndpoints.imageUrlBase)
          .resolve(imageUrls.first)
          .toString();
    }
    return 'https://via.placeholder.com/400x300.png?text=No+Image';
  }

  List<String> get amenities {
    List<String> list = [];
    if (hasWifi) list.add('Wifi');
    if (hasPool) list.add('Pool');
    if (hasRestaurant) list.add('Restaurant');
    if (hasSpa) list.add('Spa');
    if (hasParking) list.add('Parking');
    if (hasGym) list.add('Gym');
    return list;
  }

  String get formattedPrice {
    final formatter = NumberFormat.currency(
        locale: 'en_US', symbol: 'EGP ', decimalDigits: 0);
    return formatter.format(price);
  }

  // إضافة getter لـ discountedPrice لو فيه تخفيضات مستقبلاً
  double? get discountedPrice => null;

  // دالة لحساب السعر بناءً على عدد الليالي
  String priceSubtitle(int nights) {
    return 'for $nights night${nights > 1 ? 's' : ''}';
  }
}

class HotelComparison {
  final Hotel hotel1;
  final Hotel hotel2;

  HotelComparison({required this.hotel1, required this.hotel2});

  factory HotelComparison.fromJson(Map<String, dynamic> json) {
    return HotelComparison(
      hotel1: Hotel.fromJson(json['hotel1']),
      hotel2: Hotel.fromJson(json['hotel2']),
    );
  }
}
