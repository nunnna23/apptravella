// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:dio/dio.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:travella/models/hotel_model.dart';
// import 'package:travella/services/api/api_endpoints.dart';
// import 'package:travella/services/hotel_api_service.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:travella/screens/ProfileSignedInScreen.dart';

// class HotelDetailsScreen extends StatefulWidget {
//   final int hotelId;
//   final bool isGuestUser;

//   const HotelDetailsScreen({
//     super.key,
//     required this.hotelId,
//     this.isGuestUser = false,
//     required int nights,
//     required String imageUrl,
//     required String hotelName,
//     required String location,
//     required int rating,
//     required int reviewCount,
//     required int price,
//     required String description,
//     required List facilities,
//   });

//   @override
//   State<HotelDetailsScreen> createState() => _HotelDetailsScreenState();
// }

// class _HotelDetailsScreenState extends State<HotelDetailsScreen> {
//   final HotelApiService _hotelApiService = HotelApiService();
//   late Future<Hotel> _hotelFuture;

//   bool isFavorite = false; // Will be updated from API
//   bool isReadMore = false;
//   bool _isLoadingPayment = false;
//   int _selectedNights = 1; // متغير تفاعلي لعدد الليالي

//   static const Color _primaryColor = Color(0xFF406F89);
//   static const Color _secondaryTextColor = Colors.grey;
//   static const double _borderRadiusValue = 15.0;

//   @override
//   void initState() {
//     super.initState();
//     _hotelFuture = _hotelApiService.getHotelById(widget.hotelId);
//     // You could also fetch the favorite status here from a user-specific API
//   }

//   String formattedPrice(double price) {
//     final formatter = NumberFormat("#,##0", "en_US");
//     final totalPrice = price * _selectedNights; // يعتمد على العدد المختار
//     return 'EGP ${formatter.format(totalPrice)}';
//   }

//   Future<void> _initiateStripeCheckout(Hotel hotel) async {
//     setState(() => _isLoadingPayment = true);
//     try {
//       final prefs = await SharedPreferences.getInstance();
//       final token = prefs.getString('auth_token') ?? '';
//       final totalPriceInPiasters =
//           (hotel.price * _selectedNights * 100).toInt();
//       final dio = Dio();

//       final response = await dio.post(
//         ApiEndpoints.baseUrl + ApiEndpoints.createCheckoutSession,
//         data: {'amount': totalPriceInPiasters, 'serviceName': 'hotel'},
//         options: Options(
//           headers: {
//             'Authorization': 'Bearer $token',
//             'Content-Type': 'application/json',
//             'accept': '*/*',
//           },
//         ),
//       );

//       if (response.statusCode == 200) {
//         final checkoutUrl = response.data['url'] as String?;
//         if (checkoutUrl == null) throw Exception('Checkout URL not provided.');
//         final Uri checkoutUri = Uri.parse(checkoutUrl);
//         if (await canLaunchUrl(checkoutUri)) {
//           await launchUrl(checkoutUri, mode: LaunchMode.externalApplication);
//         } else {
//           throw Exception('Could not launch checkout URL: $checkoutUrl');
//         }
//       } else {
//         throw Exception(
//             'Failed to create checkout session: ${response.statusCode}');
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(context)
//           .showSnackBar(SnackBar(content: Text('Error: $e')));
//     } finally {
//       if (mounted) setState(() => _isLoadingPayment = false);
//     }
//   }

//   Future<void> _toggleFavorite() async {
//     try {
//       await _hotelApiService.toggleFavorite(widget.hotelId);
//       setState(() {
//         isFavorite = !isFavorite;
//       });
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text(
//               isFavorite ? 'Added to favorites!' : 'Removed from favorites.'),
//           backgroundColor: Colors.green,
//         ),
//       );
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Could not update favorites: $e')),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: FutureBuilder<Hotel>(
//         future: _hotelFuture,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           }
//           if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           }
//           if (!snapshot.hasData) {
//             return const Center(child: Text('Hotel not found.'));
//           }

//           final hotel = snapshot.data!;
//           final screenHeight = MediaQuery.of(context).size.height;

//           return Stack(
//             children: [
//               SingleChildScrollView(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Stack(
//                       children: [
//                         ClipRRect(
//                           borderRadius: const BorderRadius.vertical(
//                               bottom:
//                                   Radius.circular(_borderRadiusValue * 1.5)),
//                           child: Image.network(
//                             hotel.primaryImageUrl,
//                             height: screenHeight * 0.45,
//                             width: double.infinity,
//                             fit: BoxFit.cover,
//                             errorBuilder: (context, error, stackTrace) =>
//                                 Container(
//                                     height: screenHeight * 0.45,
//                                     color: Colors.grey[300],
//                                     child: const Center(
//                                         child: Icon(Icons.broken_image,
//                                             color: Colors.grey, size: 50))),
//                           ),
//                         ),
//                         // ... gradient overlay ...
//                       ],
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(16.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(hotel.name,
//                               style: const TextStyle(
//                                   fontSize: 24, fontWeight: FontWeight.bold)),
//                           const SizedBox(height: 8),
//                           Row(children: [
//                             const Icon(Icons.location_on_outlined,
//                                 size: 16, color: _secondaryTextColor),
//                             const SizedBox(width: 4),
//                             Expanded(
//                                 child: Text('${hotel.city}, ${hotel.countery}',
//                                     style: const TextStyle(
//                                         fontSize: 14,
//                                         color: _secondaryTextColor),
//                                     overflow: TextOverflow.ellipsis))
//                           ]),
//                           const SizedBox(height: 10),
//                           Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Row(children: [
//                                   const Icon(Icons.star,
//                                       color: Colors.amber, size: 20),
//                                   const SizedBox(width: 5),
//                                   Text('${hotel.rate}',
//                                       style: const TextStyle(
//                                           fontSize: 16,
//                                           fontWeight: FontWeight.bold)),
//                                 ]),
//                                 TextButton(
//                                     onPressed: () {},
//                                     child: const Text('Show map')),
//                               ]),
//                         ],
//                       ),
//                     ),
//                     const Divider(
//                         height: 1, thickness: 1, indent: 16, endIndent: 16),
//                     Padding(
//                       padding: const EdgeInsets.all(16.0),
//                       child: Text(
//                         'A dummy description text as the API does not provide one. This hotel offers a luxurious stay with world-class amenities and breathtaking views. Enjoy our fine dining restaurant, relax at the spa, or take a dip in our scenic pool. Perfect for both business and leisure travelers.',
//                         style: TextStyle(
//                             fontSize: 14, color: Colors.grey[700], height: 1.5),
//                       ),
//                     ),
//                     const Padding(
//                         padding: EdgeInsets.symmetric(
//                             horizontal: 16.0, vertical: 8.0),
//                         child: Text('Facilities',
//                             style: TextStyle(
//                                 fontSize: 18, fontWeight: FontWeight.bold))),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 16.0, vertical: 8.0),
//                       child: Wrap(
//                         spacing: 10.0,
//                         runSpacing: 10.0,
//                         children: hotel.amenities
//                             .map((facility) => _buildFacilityIcon(facility))
//                             .toList(),
//                       ),
//                     ),
//                     const SizedBox(height: 20), // مساحة للقائمة المنسدلة
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                       child: Row(
//                         children: [
//                           const Text('Nights: ',
//                               style: TextStyle(
//                                   fontSize: 16, color: _secondaryTextColor)),
//                           const SizedBox(width: 10),
//                           DropdownButton<int>(
//                             value: _selectedNights,
//                             items: [1, 2, 3, 4, 5].map((int value) {
//                               return DropdownMenuItem<int>(
//                                 value: value,
//                                 child: Text('$value'),
//                               );
//                             }).toList(),
//                             onChanged: (int? newValue) {
//                               if (newValue != null) {
//                                 setState(() {
//                                   _selectedNights = newValue;
//                                 });
//                               }
//                             },
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(height: 100),
//                   ],
//                 ),
//               ),
//               Positioned(
//                   top: MediaQuery.of(context).padding.top + 8,
//                   left: 10,
//                   child: _buildAppBarButton(
//                       icon: Icons.arrow_back,
//                       onPressed: () => Navigator.of(context).pop())),
//               Positioned(
//                   top: MediaQuery.of(context).padding.top + 8,
//                   right: 10,
//                   child: _buildAppBarButton(
//                       icon: isFavorite ? Icons.favorite : Icons.favorite_border,
//                       color: isFavorite ? Colors.redAccent : Colors.white,
//                       onPressed: _toggleFavorite)),
//               Positioned(
//                 bottom: 0,
//                 left: 0,
//                 right: 0,
//                 child: Container(
//                   padding: EdgeInsets.only(
//                       left: 16,
//                       right: 16,
//                       top: 12,
//                       bottom: MediaQuery.of(context).padding.bottom > 0
//                           ? MediaQuery.of(context).padding.bottom
//                           : 12),
//                   decoration: BoxDecoration(color: Colors.white, boxShadow: [
//                     BoxShadow(
//                         color: Colors.black.withOpacity(0.1),
//                         blurRadius: 10,
//                         offset: const Offset(0, -2))
//                   ]),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const Text('Price',
//                               style: TextStyle(
//                                   fontSize: 13, color: _secondaryTextColor)),
//                           const SizedBox(height: 2),
//                           Text(formattedPrice(hotel.price),
//                               style: const TextStyle(
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.bold,
//                                   color: _primaryColor))
//                         ],
//                       ),
//                       ElevatedButton(
//                         onPressed: _isLoadingPayment
//                             ? null
//                             : () async {
//                                 if (widget.isGuestUser) {
//                                   ScaffoldMessenger.of(context).showSnackBar(
//                                     const SnackBar(
//                                         content: Text(
//                                             'You need to log in to book.')),
//                                   );
//                                   Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                           builder: (context) =>
//                                               const ProfileSignedInScreen()));
//                                 } else {
//                                   await _initiateStripeCheckout(hotel);
//                                 }
//                               },
//                         style: ElevatedButton.styleFrom(
//                             backgroundColor: _primaryColor,
//                             foregroundColor: Colors.white,
//                             shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(10)),
//                             padding: const EdgeInsets.symmetric(
//                                 horizontal: 35, vertical: 12)),
//                         child: _isLoadingPayment
//                             ? const CircularProgressIndicator(
//                                 color: Colors.white, strokeWidth: 2)
//                             : const Text('Book Now',
//                                 style: TextStyle(fontSize: 16)),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }

//   Widget _buildAppBarButton(
//       {required IconData icon, VoidCallback? onPressed, Color? color}) {
//     return Container(
//         decoration: BoxDecoration(
//             color: Colors.black.withOpacity(0.3), shape: BoxShape.circle),
//         child: IconButton(
//             icon: Icon(icon, color: color ?? Colors.white, size: 22),
//             onPressed: onPressed,
//             constraints: const BoxConstraints(),
//             padding: const EdgeInsets.all(8)));
//   }

// ignore_for_file: unused_import, duplicate_ignore

//   Widget _buildFacilityIcon(String facilityName) {
//     IconData iconData;
//     switch (facilityName.toLowerCase()) {
//       case 'wifi':
//       case 'free wifi':
//         iconData = Icons.wifi;
//         break;
//       case 'pool':
//         iconData = Icons.pool;
//         break;
//       case 'restaurant':
//         iconData = Icons.restaurant;
//         break;
//       case 'gym':
//         iconData = Icons.fitness_center;
//         break;
//       case 'spa':
//         iconData = Icons.spa;
//         break;
//       case 'parking':
//         iconData = Icons.local_parking;
//         break;
//       case 'free breakfast':
//         iconData = Icons.free_breakfast;
//         break;
//       default:
//         iconData = Icons.check_box_outline_blank;
//     }
//     return Container(
//         padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//         decoration: BoxDecoration(
//             color: Colors.grey.shade100,
//             borderRadius: BorderRadius.circular(8),
//             border: Border.all(color: Colors.grey.shade300, width: 0.5)),
//         child: Row(mainAxisSize: MainAxisSize.min, children: [
//           Icon(iconData, size: 18, color: _primaryColor.withOpacity(0.8)),
//           const SizedBox(width: 6),
//           Text(facilityName,
//               style: TextStyle(fontSize: 12, color: Colors.grey.shade800))
//         ]));
//   }
// // }
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:apptravella/models/hotel_model.dart';
import 'package:apptravella/services/hotel_api_service.dart';
import 'package:url_launcher/url_launcher.dart';

class HotelDetailsScreen extends StatefulWidget {
  final int hotelId;

  const HotelDetailsScreen({
    super.key,
    required this.hotelId,
  });

  @override
  State<HotelDetailsScreen> createState() => _HotelDetailsScreenState();
}

class _HotelDetailsScreenState extends State<HotelDetailsScreen> {
  final HotelApiService _hotelApiService = HotelApiService();
  late Future<Hotel> _hotelFuture;

  bool isFavorite = false;
  bool isReadMore = false;
  bool _isLoadingPayment = false;
  int _selectedNights = 1;

  static const Color _primaryColor = Color(0xFF406F89);
  static const Color _secondaryTextColor = Colors.grey;
  static const double _borderRadiusValue = 15.0;

  @override
  void initState() {
    super.initState();
    _hotelFuture = _hotelApiService.getHotelById(widget.hotelId);
  }

  String formattedPrice(double price) {
    final formatter = NumberFormat("#,##0", "en_US");
    final totalPrice = price * _selectedNights;
    return 'EGP ${formatter.format(totalPrice)}';
  }

  Future<void> _initiateStripeCheckout(Hotel hotel) async {
    setState(() => _isLoadingPayment = true);
    try {
      final totalPrice = (hotel.price * _selectedNights).toInt();

      final checkoutUrl = await _hotelApiService.createCheckoutSession(
        amount: totalPrice,
        serviceName: hotel.name,
        hotelId: widget.hotelId,
      );

      final Uri checkoutUri = Uri.parse(checkoutUrl);
      if (await canLaunchUrl(checkoutUri)) {
        await launchUrl(checkoutUri, mode: LaunchMode.externalApplication);
      } else {
        throw Exception('Could not launch checkout URL: $checkoutUrl');
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.toString().replaceAll("Exception: ", "")),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoadingPayment = false);
    }
  }

  Future<void> _toggleFavorite() async {
    try {
      await _hotelApiService.toggleFavorite(widget.hotelId);
      setState(() {
        isFavorite = !isFavorite;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              isFavorite ? 'Added to favorites!' : 'Removed from favorites.'),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not update favorites: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: FutureBuilder<Hotel>(
        future: _hotelFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: CircularProgressIndicator(color: _primaryColor));
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData) {
            return const Center(child: Text('Hotel not found.'));
          }

          final hotel = snapshot.data!;
          final screenHeight = MediaQuery.of(context).size.height;

          return Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                              bottom:
                                  Radius.circular(_borderRadiusValue * 1.5)),
                          child: Image.network(
                            hotel.primaryImageUrl,
                            height: screenHeight * 0.45,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                Container(
                                    height: screenHeight * 0.45,
                                    color: Colors.grey[300],
                                    child: const Center(
                                        child: Icon(Icons.broken_image,
                                            color: Colors.grey, size: 50))),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(hotel.name,
                              style: const TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 8),
                          Row(children: [
                            const Icon(Icons.location_on_outlined,
                                size: 16, color: _secondaryTextColor),
                            const SizedBox(width: 4),
                            Expanded(
                                child: Text('${hotel.city}, ${hotel.countery}',
                                    style: const TextStyle(
                                        fontSize: 14,
                                        color: _secondaryTextColor),
                                    overflow: TextOverflow.ellipsis))
                          ]),
                          const SizedBox(height: 10),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(children: [
                                  const Icon(Icons.star,
                                      color: Colors.amber, size: 20),
                                  const SizedBox(width: 5),
                                  Text('${hotel.rate}',
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                ]),
                                TextButton(
                                    onPressed: () {},
                                    child: const Text('Show map')),
                              ]),
                        ],
                      ),
                    ),
                    const Divider(
                        height: 1, thickness: 1, indent: 16, endIndent: 16),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'No description available. This hotel offers a luxurious stay with world-class amenities.',
                        style: TextStyle(
                            fontSize: 14, color: Colors.grey[700], height: 1.5),
                        maxLines: isReadMore ? null : 3,
                        overflow: isReadMore
                            ? TextOverflow.visible
                            : TextOverflow.ellipsis,
                      ),
                    ),
                    if (!isReadMore)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: TextButton(
                          onPressed: () => setState(() => isReadMore = true),
                          child: const Text('Read more',
                              style: TextStyle(color: _primaryColor)),
                        ),
                      ),
                    const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        child: Text('Facilities',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold))),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8.0),
                      child: Wrap(
                        spacing: 10.0,
                        runSpacing: 10.0,
                        children: hotel.amenities
                            .map((facility) => _buildFacilityIcon(facility))
                            .toList(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          const Text('Nights: ',
                              style: TextStyle(
                                  fontSize: 16, color: _secondaryTextColor)),
                          const SizedBox(width: 10),
                          DropdownButton<int>(
                            value: _selectedNights,
                            items: [1, 2, 3, 4, 5].map((int value) {
                              return DropdownMenuItem<int>(
                                value: value,
                                child: Text('$value'),
                              );
                            }).toList(),
                            onChanged: (int? newValue) {
                              if (newValue != null) {
                                setState(() {
                                  _selectedNights = newValue;
                                });
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 120),
                  ],
                ),
              ),
              Positioned(
                  top: MediaQuery.of(context).padding.top + 8,
                  left: 10,
                  child: _buildAppBarButton(
                      icon: Icons.arrow_back,
                      onPressed: () => Navigator.of(context).pop())),
              Positioned(
                  top: MediaQuery.of(context).padding.top + 8,
                  right: 10,
                  child: _buildAppBarButton(
                      icon: isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? Colors.redAccent : Colors.white,
                      onPressed: _toggleFavorite)),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.only(
                      left: 16,
                      right: 16,
                      top: 12,
                      bottom: MediaQuery.of(context).padding.bottom > 0
                          ? MediaQuery.of(context).padding.bottom
                          : 12),
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, -2))
                  ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Price',
                              style: TextStyle(
                                  fontSize: 13, color: _secondaryTextColor)),
                          const SizedBox(height: 2),
                          Text(formattedPrice(hotel.price),
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: _primaryColor))
                        ],
                      ),
                      ElevatedButton(
                        onPressed: _isLoadingPayment
                            ? null
                            : () async {
                                await _initiateStripeCheckout(hotel);
                              },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: _primaryColor,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 35, vertical: 12)),
                        child: _isLoadingPayment
                            ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                    color: Colors.white, strokeWidth: 2))
                            : const Text('Book Now',
                                style: TextStyle(fontSize: 16)),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildAppBarButton(
      {required IconData icon, VoidCallback? onPressed, Color? color}) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.3), shape: BoxShape.circle),
        child: IconButton(
            icon: Icon(icon, color: color ?? Colors.white, size: 22),
            onPressed: onPressed,
            constraints: const BoxConstraints(),
            padding: const EdgeInsets.all(8)));
  }

  Widget _buildFacilityIcon(String facilityName) {
    IconData iconData;
    switch (facilityName.toLowerCase().trim()) {
      case 'wifi':
      case 'free wifi':
        iconData = Icons.wifi;
        break;
      case 'pool':
        iconData = Icons.pool;
        break;
      case 'restaurant':
        iconData = Icons.restaurant;
        break;
      case 'gym':
        iconData = Icons.fitness_center;
        break;
      case 'spa':
      case 'spa & wellness center':
        iconData = Icons.spa;
        break;
      case 'parking':
      case 'valet parking':
        iconData = Icons.local_parking;
        break;
      case 'free breakfast':
        iconData = Icons.free_breakfast;
        break;
      default:
        iconData = Icons.check_box_outline_blank;
    }
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade300, width: 0.5)),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          Icon(iconData, size: 18, color: _primaryColor.withOpacity(0.8)),
          const SizedBox(width: 6),
          Text(facilityName,
              style: TextStyle(fontSize: 12, color: Colors.grey.shade800))
        ]));
  }
}
