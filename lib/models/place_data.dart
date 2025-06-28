// class PlaceData {
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
//   final int? id; // إضافة معرف اختياري إذا كان متاحًا

//   PlaceData({
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
//     this.id,
//   });
// }
class PlaceData {
  final String name;
  final String location;
  final String imageUrl;
  final double rating;
  final int reviewCount;
  final String description;
  final List<String> facilities;
  final double price;
  final double latitude;
  final double longitude;
  final int? id;

  PlaceData({
    required this.name,
    required this.location,
    required this.imageUrl,
    required this.rating,
    required this.reviewCount,
    required this.description,
    required this.facilities,
    required this.price,
    required this.latitude,
    required this.longitude,
    this.id,
  });
}
