// lib/models/hotel.dart

import 'package:intl/intl.dart'; // Make sure to import intl package

class Hotel {
  final String name;
  final String location;
  final double rating;
  final String imageUrl;
  final double originalPrice;
  final double discount;
  bool isFavorite;
  // --- ADDED FIELDS ---
  String description;
  int reviewCount;
  List<String> facilities;
  // --- END OF ADDED FIELDS ---

  Hotel({
    required this.name,
    required this.location,
    required this.rating,
    required this.imageUrl,
    required this.originalPrice,
    this.discount = 0, // Default discount to 0 if not provided
    this.isFavorite = false,
    // --- Added to the constructor with default values ---
    this.description = "No description available.",
    this.reviewCount = 0, // Default to 0 reviews
    this.facilities = const [], // Default to an empty list
    // --- End of constructor additions ---
  });

  // Getter for calculating discounted price
  double get discountedPrice {
    // Handle cases where discount might be invalid
    if (discount <= 0 || discount >= 100) return originalPrice;
    return originalPrice * (1 - discount / 100);
  }

  // Getter for formatted discounted price using intl
  String get formattedPrice {
    final formatter = NumberFormat(
        "#,##0", "en_US"); // No decimals for display price generally
    return 'EGP ${formatter.format(discountedPrice)}';
  }

  // Getter for formatted original price using intl
  String get formattedOriginalPrice {
    final formatter = NumberFormat("#,##0", "en_US"); // No decimals
    return 'EGP ${formatter.format(originalPrice)}';
  }

  // --- Sample Data List from your original code ---
  // Added dummy values for description, reviewCount, and facilities
  static List<Hotel> sampleHotels = [
    Hotel(
      imageUrl: 'assets/hotels/paris_hotel.png', // Ensure these assets exist
      name: 'NH Paris Opera Hotel',
      location: 'Paris, France',
      rating: 3.8,
      discount: 30,
      originalPrice: 11209,
      description: 'Located in the heart of Paris near the Opera Garnier.',
      reviewCount: 215,
      facilities: ['Wifi', 'AC', 'Restaurant'],
    ),
    Hotel(
      imageUrl: 'assets/hotels/london_hotel.png', // Ensure these assets exist
      name: 'Landmark Hotel',
      location: 'London, England',
      rating: 4.4,
      discount: 25,
      originalPrice: 29450,
      description: 'A luxurious 5-star hotel in Marylebone, London.',
      reviewCount: 350,
      facilities: ['Wifi', 'Pool', 'Spa', 'Dinner', 'AC'],
    ),
    Hotel(
      imageUrl: 'assets/hotels/rome_hotel.png', // Ensure these assets exist
      name: 'La Griffe Hotel',
      location: 'Rome, Italy',
      rating: 3.8,
      discount: 20,
      originalPrice: 13203,
      description: 'Features a rooftop bar with panoramic views of Rome.',
      reviewCount: 180,
      facilities: ['Wifi', 'Restaurant', 'Bar'],
    ),
  ];
  // --- End Sample Data List ---
}
// class Hotel {
//   final String name;
//   final String location;
//   final double rating;
//   final String imageUrl;
//   final double originalPrice;
//   final double discount;
//   bool isFavorite;

//   Hotel({
//     required this.name,
//     required this.location,
//     required this.rating,
//     required this.imageUrl,
//     required this.originalPrice,
//     required this.discount,
//     this.isFavorite = false,
//   });

//   // Calculate discounted price
//   double get discountedPrice {
//     return originalPrice * (1 - discount / 100);
//   }

//   // Format price as string with currency
//   String get formattedPrice {
//     return 'EGP ${discountedPrice.toStringAsFixed(0)}';
//   }

//   // Format original price as string with currency
//   String get formattedOriginalPrice {
//     return 'EGP ${originalPrice.toStringAsFixed(0)}';
//   }

//   static List<Hotel> sampleHotels = [
//     Hotel(
//       imageUrl: 'assets/hotels/paris_hotel.png',
//       name: 'NH Paris Opera Hotel',
//       location: 'Paris, France',
//       rating: 3.8,
//       discount: 30,
//       originalPrice: 11209,
//     ),
//     Hotel(
//       imageUrl: 'assets/hotels/london_hotel.png',
//       name: 'Landmark Hotel',
//       location: 'London, England',
//       rating: 4.4,
//       discount: 25,
//       originalPrice: 29450,
//     ),
//     Hotel(
//       imageUrl: 'assets/hotels/rome_hotel.png',
//       name: 'La Griffe Hotel',
//       location: 'Rome, Italy',
//       rating: 3.8,
//       discount: 20,
//       originalPrice: 13203,
//     ),
//   ];
// }
