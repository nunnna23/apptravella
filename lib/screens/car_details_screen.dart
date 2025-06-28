// // // // import 'package:flutter/material.dart';
// // // // import '../models/car.dart';

// // // // class CarDetailsScreen extends StatefulWidget {
// // // //   final Car car;

// // // //   const CarDetailsScreen({
// // // //     super.key,
// // // //     required this.car,
// // // //   });

// // // //   @override
// // // //   State<CarDetailsScreen> createState() => _CarDetailsScreenState();
// // // // }

// // // // class _CarDetailsScreenState extends State<CarDetailsScreen> {
// // // //   late bool isFavorite;

// // // //   @override
// // // //   void initState() {
// // // //     super.initState();
// // // //     isFavorite = widget.car.isFavorite;
// // // //   }

// // // //   void toggleFavorite() {
// // // //     setState(() {
// // // //       isFavorite = !isFavorite;
// // // //       // Note: This only changes the favorite state locally.
// // // //       // You might want to pass this change back to the previous screen
// // // //       // or save it to a central state management solution.
// // // //       widget.car.isFavorite = isFavorite;
// // // //     });
// // // //   }

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Scaffold(
// // // //       backgroundColor: Colors.white,
// // // //       body: CustomScrollView(
// // // //         slivers: [
// // // //           SliverAppBar(
// // // //             expandedHeight: 300,
// // // //             pinned: true,
// // // //             backgroundColor: Colors.white,
// // // //             leading: IconButton(
// // // //               icon: const Icon(Icons.arrow_back, color: Colors.black),
// // // //               onPressed: () => Navigator.pop(context),
// // // //             ),
// // // //             flexibleSpace: FlexibleSpaceBar(
// // // //               background: Stack(
// // // //                 fit: StackFit.expand,
// // // //                 children: [
// // // //                   // --- MODIFICATION START ---
// // // //                   // Conditionally load image from network or local assets
// // // //                   widget.car.imageUrl.startsWith('http')
// // // //                       ? Image.network(
// // // //                           widget.car.imageUrl,
// // // //                           fit: BoxFit.cover,
// // // //                           errorBuilder: (context, error, stackTrace) {
// // // //                             // Fallback to a local asset if the network image fails
// // // //                             return Image.asset('assets/car.jpeg',
// // // //                                 fit: BoxFit.cover);
// // // //                           },
// // // //                           loadingBuilder: (context, child, progress) {
// // // //                             return progress == null
// // // //                                 ? child
// // // //                                 : const Center(
// // // //                                     child: CircularProgressIndicator());
// // // //                           },
// // // //                         )
// // // //                       : Image.asset(
// // // //                           widget.car.imageUrl,
// // // //                           fit: BoxFit.cover,
// // // //                         ),
// // // //                   // --- MODIFICATION END ---
// // // //                   // Favorite button overlay
// // // //                   Positioned(
// // // //                     top: MediaQuery.of(context).padding.top,
// // // //                     right: 8,
// // // //                     child: CircleAvatar(
// // // //                       backgroundColor: Colors.black.withOpacity(0.3),
// // // //                       child: IconButton(
// // // //                         icon: Icon(
// // // //                           isFavorite ? Icons.favorite : Icons.favorite_border,
// // // //                           color: isFavorite
// // // //                               ? const Color(0xFF4E7D96)
// // // //                               : Colors.white,
// // // //                         ),
// // // //                         onPressed: toggleFavorite,
// // // //                       ),
// // // //                     ),
// // // //                   ),
// // // //                 ],
// // // //               ),
// // // //             ),
// // // //           ),
// // // //           SliverToBoxAdapter(
// // // //             child: Padding(
// // // //               padding: const EdgeInsets.all(16),
// // // //               child: Column(
// // // //                 crossAxisAlignment: CrossAxisAlignment.start,
// // // //                 children: [
// // // //                   Row(
// // // //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // //                     children: [
// // // //                       Expanded(
// // // //                         child: Text(
// // // //                           widget.car.name,
// // // //                           style: const TextStyle(
// // // //                             fontSize: 24,
// // // //                             fontWeight: FontWeight.bold,
// // // //                           ),
// // // //                         ),
// // // //                       ),
// // // //                       Row(
// // // //                         children: [
// // // //                           const Icon(Icons.star,
// // // //                               color: Color(0xFF4E7D96), size: 24),
// // // //                           const SizedBox(width: 4),
// // // //                           Text(
// // // //                             widget.car.rating.toString(),
// // // //                             style: const TextStyle(
// // // //                               fontSize: 20,
// // // //                               fontWeight: FontWeight.bold,
// // // //                             ),
// // // //                           ),
// // // //                         ],
// // // //                       ),
// // // //                     ],
// // // //                   ),
// // // //                   const SizedBox(height: 16),
// // // //                   const Text(
// // // //                     'Features',
// // // //                     style: TextStyle(
// // // //                       fontSize: 20,
// // // //                       fontWeight: FontWeight.bold,
// // // //                     ),
// // // //                   ),
// // // //                   const SizedBox(height: 12),
// // // //                   Row(
// // // //                     mainAxisAlignment: MainAxisAlignment.spaceAround,
// // // //                     children: [
// // // //                       _buildFeature(
// // // //                           Icons.settings_outlined, widget.car.transmission),
// // // //                       _buildFeature(
// // // //                           Icons.local_gas_station, widget.car.fuelType),
// // // //                       _buildFeature(
// // // //                           Icons.person_outline, '${widget.car.seats} seats'),
// // // //                       _buildFeature(Icons.ac_unit, 'AC'),
// // // //                     ],
// // // //                   ),
// // // //                   const SizedBox(height: 24),
// // // //                   const Text(
// // // //                     'Description',
// // // //                     style: TextStyle(
// // // //                       fontSize: 20,
// // // //                       fontWeight: FontWeight.bold,
// // // //                     ),
// // // //                   ),
// // // //                   const SizedBox(height: 12),
// // // //                   Text(
// // // //                     'Experience luxury and comfort with the ${widget.car.name}. This ${widget.car.transmission.toLowerCase()} transmission vehicle comes with ${widget.car.seats} comfortable seats and runs on ${widget.car.fuelType.toLowerCase()} fuel. Perfect for both city drives and long journeys.',
// // // //                     style: const TextStyle(
// // // //                       fontSize: 16,
// // // //                       color: Colors.grey,
// // // //                       height: 1.5,
// // // //                     ),
// // // //                   ),
// // // //                   const SizedBox(height: 24),
// // // //                   const Text(
// // // //                     'Included in the price',
// // // //                     style: TextStyle(
// // // //                       fontSize: 20,
// // // //                       fontWeight: FontWeight.bold,
// // // //                     ),
// // // //                   ),
// // // //                   const SizedBox(height: 12),
// // // //                   _buildIncludedItem(
// // // //                       Icons.local_gas_station, 'Full tank of fuel'),
// // // //                   _buildIncludedItem(
// // // //                       Icons.cleaning_services, 'Vehicle cleaning'),
// // // //                   _buildIncludedItem(Icons.support_agent, '24/7 support'),
// // // //                   _buildIncludedItem(Icons.security, 'Insurance included'),
// // // //                   const SizedBox(height: 24),
// // // //                   Row(
// // // //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // //                     children: [
// // // //                       Column(
// // // //                         crossAxisAlignment: CrossAxisAlignment.start,
// // // //                         children: [
// // // //                           Text(
// // // //                             'EGP ${widget.car.price.toStringAsFixed(0)}',
// // // //                             style: const TextStyle(
// // // //                               fontSize: 24,
// // // //                               fontWeight: FontWeight.bold,
// // // //                               color: Color(0xFF4E7D96),
// // // //                             ),
// // // //                           ),
// // // //                           Text(
// // // //                             'per day', // Changed from 'for 3 nights'
// // // //                             style: TextStyle(
// // // //                               color: Colors.grey[600],
// // // //                               fontSize: 16,
// // // //                             ),
// // // //                           ),
// // // //                         ],
// // // //                       ),
// // // //                       ElevatedButton(
// // // //                         onPressed: () {
// // // //                           // Handle booking
// // // //                         },
// // // //                         style: ElevatedButton.styleFrom(
// // // //                           backgroundColor: const Color(0xFF4E7D96),
// // // //                           padding: const EdgeInsets.symmetric(
// // // //                               horizontal: 32, vertical: 16),
// // // //                           shape: RoundedRectangleBorder(
// // // //                             borderRadius: BorderRadius.circular(8),
// // // //                           ),
// // // //                         ),
// // // //                         child: const Text(
// // // //                           'Book Now',
// // // //                           style: TextStyle(
// // // //                             fontSize: 16,
// // // //                             fontWeight: FontWeight.bold,
// // // //                             color: Colors.white, // Explicitly set text color
// // // //                           ),
// // // //                         ),
// // // //                       ),
// // // //                     ],
// // // //                   ),
// // // //                 ],
// // // //               ),
// // // //             ),
// // // //           ),
// // // //         ],
// // // //       ),
// // // //     );
// // // //   }

// // // //   Widget _buildFeature(IconData icon, String text) {
// // // //     return Column(
// // // //       children: [
// // // //         Container(
// // // //           padding: const EdgeInsets.all(12),
// // // //           decoration: BoxDecoration(
// // // //             color: const Color(0xFF4E7D96).withOpacity(0.1),
// // // //             shape: BoxShape.circle,
// // // //           ),
// // // //           child: Icon(
// // // //             icon,
// // // //             color: const Color(0xFF4E7D96),
// // // //             size: 24,
// // // //           ),
// // // //         ),
// // // //         const SizedBox(height: 8),
// // // //         Text(
// // // //           text,
// // // //           style: const TextStyle(
// // // //             fontSize: 14,
// // // //             color: Colors.grey,
// // // //           ),
// // // //         ),
// // // //       ],
// // // //     );
// // // //   }

// // // //   Widget _buildIncludedItem(IconData icon, String text) {
// // // //     return Padding(
// // // //       padding: const EdgeInsets.only(bottom: 12),
// // // //       child: Row(
// // // //         children: [
// // // //           Container(
// // // //             padding: const EdgeInsets.all(8),
// // // //             decoration: BoxDecoration(
// // // //               color: const Color(0xFF4E7D96).withOpacity(0.1),
// // // //               shape: BoxShape.circle,
// // // //             ),
// // // //             child: Icon(
// // // //               icon,
// // // //               color: const Color(0xFF4E7D96),
// // // //               size: 20,
// // // //             ),
// // // //           ),
// // // //           const SizedBox(width: 12),
// // // //           Text(
// // // //             text,
// // // //             style: const TextStyle(
// // // //               fontSize: 16,
// // // //             ),
// // // //           ),
// // // //         ],
// // // //       ),
// // // //     );
// // // //   }
// // // // }
// // // // lib/screens/car_details_screen.dart

// // // import 'package:flutter/material.dart';
// // // import '../models/car.dart';

// // // class CarDetailsScreen extends StatefulWidget {
// // //   final Car car;

// // //   const CarDetailsScreen({
// // //     super.key,
// // //     required this.car,
// // //   });

// // //   @override
// // //   State<CarDetailsScreen> createState() => _CarDetailsScreenState();
// // // }

// // // class _CarDetailsScreenState extends State<CarDetailsScreen> {
// // //   late bool isFavorite;

// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     isFavorite = widget.car.isFavorite;
// // //   }

// // //   void toggleFavorite() {
// // //     setState(() {
// // //       isFavorite = !isFavorite;
// // //       widget.car.isFavorite = isFavorite;
// // //     });
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       backgroundColor: Colors.white,
// // //       body: CustomScrollView(
// // //         slivers: [
// // //           SliverAppBar(
// // //             expandedHeight: 300,
// // //             pinned: true,
// // //             backgroundColor: Colors.white,
// // //             leading: IconButton(
// // //               icon: const Icon(Icons.arrow_back, color: Colors.black),
// // //               onPressed: () => Navigator.pop(context),
// // //             ),
// // //             flexibleSpace: FlexibleSpaceBar(
// // //               background: Stack(
// // //                 fit: StackFit.expand,
// // //                 children: [
// // //                   // Conditionally load image from network or local assets
// // //                   widget.car.imageUrl.startsWith('http')
// // //                       ? Image.network(
// // //                           widget.car.imageUrl,
// // //                           fit: BoxFit.cover,
// // //                           errorBuilder: (context, error, stackTrace) {
// // //                             return Image.asset('assets/car.jpeg',
// // //                                 fit: BoxFit.cover);
// // //                           },
// // //                           loadingBuilder: (context, child, progress) {
// // //                             return progress == null
// // //                                 ? child
// // //                                 : const Center(
// // //                                     child: CircularProgressIndicator());
// // //                           },
// // //                         )
// // //                       : Image.asset(
// // //                           widget.car.imageUrl,
// // //                           fit: BoxFit.cover,
// // //                         ),
// // //                   Positioned(
// // //                     top: MediaQuery.of(context).padding.top + 8,
// // //                     right: 8,
// // //                     child: CircleAvatar(
// // //                       backgroundColor: Colors.black.withOpacity(0.4),
// // //                       child: IconButton(
// // //                         icon: Icon(
// // //                           isFavorite ? Icons.favorite : Icons.favorite_border,
// // //                           color: isFavorite ? Colors.redAccent : Colors.white,
// // //                         ),
// // //                         onPressed: toggleFavorite,
// // //                       ),
// // //                     ),
// // //                   ),
// // //                 ],
// // //               ),
// // //             ),
// // //           ),
// // //           SliverToBoxAdapter(
// // //             child: Padding(
// // //               padding: const EdgeInsets.all(16),
// // //               child: Column(
// // //                 crossAxisAlignment: CrossAxisAlignment.start,
// // //                 children: [
// // //                   Row(
// // //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // //                     crossAxisAlignment: CrossAxisAlignment.start,
// // //                     children: [
// // //                       Expanded(
// // //                         child: Text(
// // //                           widget.car.name,
// // //                           style: const TextStyle(
// // //                               fontSize: 24, fontWeight: FontWeight.bold),
// // //                         ),
// // //                       ),
// // //                       const SizedBox(width: 10),
// // //                       Row(
// // //                         children: [
// // //                           const Icon(Icons.star,
// // //                               color: Color(0xFF4E7D96), size: 24),
// // //                           const SizedBox(width: 4),
// // //                           Text(widget.car.rating.toString(),
// // //                               style: const TextStyle(
// // //                                   fontSize: 20, fontWeight: FontWeight.bold)),
// // //                         ],
// // //                       ),
// // //                     ],
// // //                   ),
// // //                   const SizedBox(height: 16),
// // //                   const Text('Features',
// // //                       style:
// // //                           TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
// // //                   const SizedBox(height: 12),
// // //                   Row(
// // //                     mainAxisAlignment: MainAxisAlignment.spaceAround,
// // //                     children: [
// // //                       _buildFeature(
// // //                           Icons.settings_outlined, widget.car.transmission),
// // //                       _buildFeature(
// // //                           Icons.local_gas_station, widget.car.fuelType),
// // //                       _buildFeature(
// // //                           Icons.person_outline, '${widget.car.seats} seats'),
// // //                       _buildFeature(Icons.ac_unit, 'AC'),
// // //                     ],
// // //                   ),
// // //                   const SizedBox(height: 24),
// // //                   const Text('Description',
// // //                       style:
// // //                           TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
// // //                   const SizedBox(height: 12),
// // //                   Text(
// // //                     'Experience luxury and comfort with the ${widget.car.name}. This ${widget.car.transmission.toLowerCase()} transmission vehicle comes with ${widget.car.seats} comfortable seats and runs on ${widget.car.fuelType.toLowerCase()} fuel. Perfect for both city drives and long journeys.',
// // //                     style: const TextStyle(
// // //                         fontSize: 16, color: Colors.grey, height: 1.5),
// // //                   ),
// // //                   const SizedBox(height: 24),
// // //                   const Text('Included in the price',
// // //                       style:
// // //                           TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
// // //                   const SizedBox(height: 12),
// // //                   _buildIncludedItem(
// // //                       Icons.local_gas_station, 'Full tank of fuel'),
// // //                   _buildIncludedItem(
// // //                       Icons.cleaning_services, 'Vehicle cleaning'),
// // //                   _buildIncludedItem(Icons.support_agent, '24/7 support'),
// // //                   _buildIncludedItem(Icons.security, 'Insurance included'),
// // //                   const SizedBox(height: 24),
// // //                   Row(
// // //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // //                     children: [
// // //                       Column(
// // //                         crossAxisAlignment: CrossAxisAlignment.start,
// // //                         children: [
// // //                           Text('EGP ${widget.car.price.toStringAsFixed(0)}',
// // //                               style: const TextStyle(
// // //                                   fontSize: 24,
// // //                                   fontWeight: FontWeight.bold,
// // //                                   color: Color(0xFF4E7D96))),
// // //                           Text('per day',
// // //                               style: TextStyle(
// // //                                   color: Colors.grey[600], fontSize: 16)),
// // //                         ],
// // //                       ),
// // //                       ElevatedButton(
// // //                         onPressed: () {/* Handle booking */},
// // //                         style: ElevatedButton.styleFrom(
// // //                           backgroundColor: const Color(0xFF4E7D96),
// // //                           padding: const EdgeInsets.symmetric(
// // //                               horizontal: 32, vertical: 16),
// // //                           shape: RoundedRectangleBorder(
// // //                               borderRadius: BorderRadius.circular(8)),
// // //                         ),
// // //                         child: const Text('Book Now',
// // //                             style: TextStyle(
// // //                                 fontSize: 16,
// // //                                 fontWeight: FontWeight.bold,
// // //                                 color: Colors.white)),
// // //                       ),
// // //                     ],
// // //                   ),
// // //                 ],
// // //               ),
// // //             ),
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }

// // //   Widget _buildFeature(IconData icon, String text) {
// // //     return Column(
// // //       children: [
// // //         Container(
// // //           padding: const EdgeInsets.all(12),
// // //           decoration: BoxDecoration(
// // //             color: const Color(0xFF4E7D96).withOpacity(0.1),
// // //             shape: BoxShape.circle,
// // //           ),
// // //           child: Icon(icon, color: const Color(0xFF4E7D96), size: 24),
// // //         ),
// // //         const SizedBox(height: 8),
// // //         Text(text, style: const TextStyle(fontSize: 14, color: Colors.grey)),
// // //       ],
// // //     );
// // //   }

// // //   Widget _buildIncludedItem(IconData icon, String text) {
// // //     return Padding(
// // //       padding: const EdgeInsets.only(bottom: 12),
// // //       child: Row(
// // //         children: [
// // //           Container(
// // //             padding: const EdgeInsets.all(8),
// // //             decoration: BoxDecoration(
// // //               color: const Color(0xFF4E7D96).withOpacity(0.1),
// // //               shape: BoxShape.circle,
// // //             ),
// // //             child: Icon(icon, color: const Color(0xFF4E7D96), size: 20),
// // //           ),
// // //           const SizedBox(width: 12),
// // //           Text(text, style: const TextStyle(fontSize: 16)),
// // //         ],
// // //       ),
// // //     );
// // //   }
// // // }
// // import 'package:flutter/material.dart';
// // import 'package:travella/services/api/dio_client.dart';
// // import 'package:url_launcher/url_launcher.dart'; // إضافة حزمة url_launcher
// // import '../models/car.dart';

// // class CarDetailsScreen extends StatefulWidget {
// //   final Car car;

// //   const CarDetailsScreen({
// //     super.key,
// //     required this.car,
// //   });

// //   @override
// //   State<CarDetailsScreen> createState() => _CarDetailsScreenState();
// // }

// // class _CarDetailsScreenState extends State<CarDetailsScreen> {
// //   late bool isFavorite;
// //   final DioClient _dioClient = DioClient(); // إنشاء كائن من DioClient

// //   @override
// //   void initState() {
// //     super.initState();
// //     isFavorite = widget.car.isFavorite;
// //   }

// //   void toggleFavorite() {
// //     setState(() {
// //       isFavorite = !isFavorite;
// //       widget.car.isFavorite = isFavorite;
// //     });
// //   }

// //   Future<void> _handleBooking() async {
// //     try {
// //       // استدعاء الدالة لإنشاء جلسة الدفع
// //       final checkoutUrl = await _dioClient.createCarRentalCheckoutSession(
// //         amount: widget.car.price, // استخدام سعر السيارة كمبلغ
// //         serviceName: widget.car.name, // اسم الخدمة
// //         carRentalId: 1, pickUpLocation: '', date: null, // يمكنك تعديله بناءً على معرف السيارة الفعلي
// //       );
// //       // فتح الرابط في المتصفح
// //       if (await canLaunch(checkoutUrl)) {
// //         await launch(checkoutUrl);
// //       } else {
// //         throw 'Could not launch $checkoutUrl';
// //       }
// //     } catch (e) {
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         SnackBar(content: Text('Error: $e')),
// //       );
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.white,
// //       body: CustomScrollView(
// //         slivers: [
// //           SliverAppBar(
// //             expandedHeight: 300,
// //             pinned: true,
// //             backgroundColor: Colors.white,
// //             leading: IconButton(
// //               icon: const Icon(Icons.arrow_back, color: Colors.black),
// //               onPressed: () => Navigator.pop(context),
// //             ),
// //             flexibleSpace: FlexibleSpaceBar(
// //               background: Stack(
// //                 fit: StackFit.expand,
// //                 children: [
// //                   // Conditionally load image from network or local assets
// //                   widget.car.imageUrl.startsWith('http')
// //                       ? Image.network(
// //                           widget.car.imageUrl,
// //                           fit: BoxFit.cover,
// //                           errorBuilder: (context, error, stackTrace) {
// //                             return Image.asset('assets/car.jpeg',
// //                                 fit: BoxFit.cover);
// //                           },
// //                           loadingBuilder: (context, child, progress) {
// //                             return progress == null
// //                                 ? child
// //                                 : const Center(
// //                                     child: CircularProgressIndicator());
// //                           },
// //                         )
// //                       : Image.asset(
// //                           widget.car.imageUrl,
// //                           fit: BoxFit.cover,
// //                         ),
// //                   Positioned(
// //                     top: MediaQuery.of(context).padding.top + 8,
// //                     right: 8,
// //                     child: CircleAvatar(
// //                       backgroundColor: Colors.black.withOpacity(0.4),
// //                       child: IconButton(
// //                         icon: Icon(
// //                           isFavorite ? Icons.favorite : Icons.favorite_border,
// //                           color: isFavorite ? Colors.redAccent : Colors.white,
// //                         ),
// //                         onPressed: toggleFavorite,
// //                       ),
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ),
// //           SliverToBoxAdapter(
// //             child: Padding(
// //               padding: const EdgeInsets.all(16),
// //               child: Column(
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 children: [
// //                   Row(
// //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                     crossAxisAlignment: CrossAxisAlignment.start,
// //                     children: [
// //                       Expanded(
// //                         child: Text(
// //                           widget.car.name,
// //                           style: const TextStyle(
// //                               fontSize: 24, fontWeight: FontWeight.bold),
// //                         ),
// //                       ),
// //                       const SizedBox(width: 10),
// //                       Row(
// //                         children: [
// //                           const Icon(Icons.star,
// //                               color: Color(0xFF4E7D96), size: 24),
// //                           const SizedBox(width: 4),
// //                           Text(widget.car.rating.toString(),
// //                               style: const TextStyle(
// //                                   fontSize: 20, fontWeight: FontWeight.bold)),
// //                         ],
// //                       ),
// //                     ],
// //                   ),
// //                   const SizedBox(height: 16),
// //                   const Text('Features',
// //                       style:
// //                           TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
// //                   const SizedBox(height: 12),
// //                   Row(
// //                     mainAxisAlignment: MainAxisAlignment.spaceAround,
// //                     children: [
// //                       _buildFeature(
// //                           Icons.settings_outlined, widget.car.transmission),
// //                       _buildFeature(
// //                           Icons.local_gas_station, widget.car.fuelType),
// //                       _buildFeature(
// //                           Icons.person_outline, '${widget.car.seats} seats'),
// //                       _buildFeature(Icons.ac_unit, 'AC'),
// //                     ],
// //                   ),
// //                   const SizedBox(height: 24),
// //                   const Text('Description',
// //                       style:
// //                           TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
// //                   const SizedBox(height: 12),
// //                   Text(
// //                     'Experience luxury and comfort with the ${widget.car.name}. This ${widget.car.transmission.toLowerCase()} transmission vehicle comes with ${widget.car.seats} comfortable seats and runs on ${widget.car.fuelType.toLowerCase()} fuel. Perfect for both city drives and long journeys.',
// //                     style: const TextStyle(
// //                         fontSize: 16, color: Colors.grey, height: 1.5),
// //                   ),
// //                   const SizedBox(height: 24),
// //                   const Text('Included in the price',
// //                       style:
// //                           TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
// //                   const SizedBox(height: 12),
// //                   _buildIncludedItem(
// //                       Icons.local_gas_station, 'Full tank of fuel'),
// //                   _buildIncludedItem(
// //                       Icons.cleaning_services, 'Vehicle cleaning'),
// //                   _buildIncludedItem(Icons.support_agent, '24/7 support'),
// //                   _buildIncludedItem(Icons.security, 'Insurance included'),
// //                   const SizedBox(height: 24),
// //                   Row(
// //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                     children: [
// //                       Column(
// //                         crossAxisAlignment: CrossAxisAlignment.start,
// //                         children: [
// //                           Text('EGP ${widget.car.price.toStringAsFixed(0)}',
// //                               style: const TextStyle(
// //                                   fontSize: 24,
// //                                   fontWeight: FontWeight.bold,
// //                                   color: Color(0xFF4E7D96))),
// //                           Text('per day',
// //                               style: TextStyle(
// //                                   color: Colors.grey[600], fontSize: 16)),
// //                         ],
// //                       ),
// //                       ElevatedButton(
// //                         onPressed: _handleBooking, // استدعاء الدالة عند الضغط
// //                         style: ElevatedButton.styleFrom(
// //                           backgroundColor: const Color(0xFF4E7D96),
// //                           padding: const EdgeInsets.symmetric(
// //                               horizontal: 32, vertical: 16),
// //                           shape: RoundedRectangleBorder(
// //                               borderRadius: BorderRadius.circular(8)),
// //                         ),
// //                         child: const Text('Book Now',
// //                             style: TextStyle(
// //                                 fontSize: 16,
// //                                 fontWeight: FontWeight.bold,
// //                                 color: Colors.white)),
// //                       ),
// //                     ],
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// //   Widget _buildFeature(IconData icon, String text) {
// //     return Column(
// //       children: [
// //         Container(
// //           padding: const EdgeInsets.all(12),
// //           decoration: BoxDecoration(
// //             color: const Color(0xFF4E7D96).withOpacity(0.1),
// //             shape: BoxShape.circle,
// //           ),
// //           child: Icon(icon, color: const Color(0xFF4E7D96), size: 24),
// //         ),
// //         const SizedBox(height: 8),
// //         Text(text, style: const TextStyle(fontSize: 14, color: Colors.grey)),
// //       ],
// //     );
// //   }

// //   Widget _buildIncludedItem(IconData icon, String text) {
// //     return Padding(
// //       padding: const EdgeInsets.only(bottom: 12),
// //       child: Row(
// //         children: [
// //           Container(
// //             padding: const EdgeInsets.all(8),
// //             decoration: BoxDecoration(
// //               color: const Color(0xFF4E7D96).withOpacity(0.1),
// //               shape: BoxShape.circle,
// //             ),
// //             child: Icon(icon, color: const Color(0xFF4E7D96), size: 20),
// //           ),
// //           const SizedBox(width: 12),
// //           Text(text, style: const TextStyle(fontSize: 16)),
// //         ],
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:travella/services/api/dio_client.dart';
// import 'package:url_launcher/url_launcher.dart';
// import '../models/car.dart';

// class CarDetailsScreen extends StatefulWidget {
//   final Car car;

//   const CarDetailsScreen({
//     super.key,
//     required this.car,
//   });

//   @override
//   State<CarDetailsScreen> createState() => _CarDetailsScreenState();
// }

// class _CarDetailsScreenState extends State<CarDetailsScreen> {
//   late bool isFavorite;
//   final DioClient _dioClient = DioClient();

//   @override
//   void initState() {
//     super.initState();
//     isFavorite = widget.car.isFavorite;
//   }

//   void toggleFavorite() {
//     setState(() {
//       isFavorite = !isFavorite;
//       widget.car.isFavorite = isFavorite;
//     });
//   }

//   Future<void> _handleBooking() async {
//     try {
//       final checkoutUrl = await _dioClient.createCarRentalCheckoutSession(
//         amount: widget.car.price,
//         serviceName: widget.car.name,
//         carRentalId: int.parse(widget.car.id), pickUpLocation: '',
//         date: DateTime.now(), // استخدم تاريخ حالي أو عدل حسب الحاجة
//       );
//       if (await canLaunch(checkoutUrl)) {
//         await launch(checkoutUrl);
//       } else {
//         throw 'Could not launch checkout URL: $checkoutUrl';
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Booking Error: $e'),
//           duration: const Duration(seconds: 3),
//         ),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: CustomScrollView(
//         slivers: [
//           SliverAppBar(
//             expandedHeight: 300,
//             pinned: true,
//             backgroundColor: Colors.white,
//             leading: IconButton(
//               icon: const Icon(Icons.arrow_back, color: Colors.black),
//               onPressed: () => Navigator.pop(context),
//             ),
//             flexibleSpace: FlexibleSpaceBar(
//               background: Stack(
//                 fit: StackFit.expand,
//                 children: [
//                   widget.car.imageUrl.startsWith('http')
//                       ? Image.network(
//                           widget.car.imageUrl,
//                           fit: BoxFit.cover,
//                           errorBuilder: (context, error, stackTrace) {
//                             return Image.asset('assets/car.jpeg',
//                                 fit: BoxFit.cover);
//                           },
//                           loadingBuilder: (context, child, progress) {
//                             return progress == null
//                                 ? child
//                                 : const Center(
//                                     child: CircularProgressIndicator());
//                           },
//                         )
//                       : Image.asset(
//                           widget.car.imageUrl,
//                           fit: BoxFit.cover,
//                         ),
//                   Positioned(
//                     top: MediaQuery.of(context).padding.top + 8,
//                     right: 8,
//                     child: CircleAvatar(
//                       backgroundColor: Colors.black.withOpacity(0.4),
//                       child: IconButton(
//                         icon: Icon(
//                           isFavorite ? Icons.favorite : Icons.favorite_border,
//                           color: isFavorite ? Colors.redAccent : Colors.white,
//                         ),
//                         onPressed: toggleFavorite,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           SliverToBoxAdapter(
//             child: Padding(
//               padding: const EdgeInsets.all(16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Expanded(
//                         child: Text(
//                           widget.car.name,
//                           style: const TextStyle(
//                               fontSize: 24, fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                       const SizedBox(width: 10),
//                       Row(
//                         children: [
//                           const Icon(Icons.star,
//                               color: Color(0xFF4E7D96), size: 24),
//                           const SizedBox(width: 4),
//                           Text(widget.car.rating.toString(),
//                               style: const TextStyle(
//                                   fontSize: 20, fontWeight: FontWeight.bold)),
//                         ],
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 16),
//                   const Text('Features',
//                       style:
//                           TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//                   const SizedBox(height: 12),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       _buildFeature(
//                           Icons.settings_outlined, widget.car.transmission),
//                       _buildFeature(
//                           Icons.local_gas_station, widget.car.fuelType),
//                       _buildFeature(
//                           Icons.person_outline, '${widget.car.seats} seats'),
//                       _buildFeature(Icons.ac_unit, 'AC'),
//                     ],
//                   ),
//                   const SizedBox(height: 24),
//                   const Text('Description',
//                       style:
//                           TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//                   const SizedBox(height: 12),
//                   Text(
//                     'Experience luxury and comfort with the ${widget.car.name}. This ${widget.car.transmission.toLowerCase()} transmission vehicle comes with ${widget.car.seats} comfortable seats and runs on ${widget.car.fuelType.toLowerCase()} fuel. Perfect for both city drives and long journeys.',
//                     style: const TextStyle(
//                         fontSize: 16, color: Colors.grey, height: 1.5),
//                   ),
//                   const SizedBox(height: 24),
//                   const Text('Included in the price',
//                       style:
//                           TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//                   const SizedBox(height: 12),
//                   _buildIncludedItem(
//                       Icons.local_gas_station, 'Full tank of fuel'),
//                   _buildIncludedItem(
//                       Icons.cleaning_services, 'Vehicle cleaning'),
//                   _buildIncludedItem(Icons.support_agent, '24/7 support'),
//                   _buildIncludedItem(Icons.security, 'Insurance included'),
//                   const SizedBox(height: 24),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text('EGP ${widget.car.price.toStringAsFixed(0)}',
//                               style: const TextStyle(
//                                   fontSize: 24,
//                                   fontWeight: FontWeight.bold,
//                                   color: Color(0xFF4E7D96))),
//                           Text('per day',
//                               style: TextStyle(
//                                   color: Colors.grey[600], fontSize: 16)),
//                         ],
//                       ),
//                       ElevatedButton(
//                         onPressed: _handleBooking,
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: const Color(0xFF4E7D96),
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 32, vertical: 16),
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(8)),
//                         ),
//                         child: const Text('Book Now',
//                             style: TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.white)),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildFeature(IconData icon, String text) {
//     return Column(
//       children: [
//         Container(
//           padding: const EdgeInsets.all(12),
//           decoration: BoxDecoration(
//             color: const Color(0xFF4E7D96).withOpacity(0.1),
//             shape: BoxShape.circle,
//           ),
//           child: Icon(icon, color: const Color(0xFF4E7D96), size: 24),
//         ),
//         const SizedBox(height: 8),
//         Text(text, style: const TextStyle(fontSize: 14, color: Colors.grey)),
//       ],
//     );
//   }

//   Widget _buildIncludedItem(IconData icon, String text) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 12),
//       child: Row(
//         children: [
//           Container(
//             padding: const EdgeInsets.all(8),
//             decoration: BoxDecoration(
//               color: const Color(0xFF4E7D96).withOpacity(0.1),
//               shape: BoxShape.circle,
//             ),
//             child: Icon(icon, color: const Color(0xFF4E7D96), size: 20),
//           ),
//           const SizedBox(width: 12),
//           Text(text, style: const TextStyle(fontSize: 16)),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:apptravella/services/payment/payment_service.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/car.dart';

class CarDetailsScreen extends StatefulWidget {
  final Car car;

  const CarDetailsScreen({
    super.key,
    required this.car,
  });

  @override
  State<CarDetailsScreen> createState() => _CarDetailsScreenState();
}

class _CarDetailsScreenState extends State<CarDetailsScreen> {
  late bool isFavorite;
  final PaymentService _paymentService = PaymentService();

  @override
  void initState() {
    super.initState();
    isFavorite = widget.car.isFavorite;
  }

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
      widget.car.isFavorite = isFavorite;
    });
  }

  Future<void> _handleBooking() async {
    try {
      final checkoutUrl = await _paymentService.createCarRentalCheckoutSession(
        amount: widget.car.price,
        serviceName: widget.car.name,
        carRentalId: int.parse(widget.car.id),
      );
      if (await canLaunch(checkoutUrl)) {
        await launch(checkoutUrl);
      } else {
        throw 'Could not launch checkout URL: $checkoutUrl';
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Booking Error: $e'),
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.pop(context),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  widget.car.imageUrl.startsWith('http')
                      ? Image.network(
                          widget.car.imageUrl,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset('assets/car.jpeg',
                                fit: BoxFit.cover);
                          },
                          loadingBuilder: (context, child, progress) {
                            return progress == null
                                ? child
                                : const Center(
                                    child: CircularProgressIndicator());
                          },
                        )
                      : Image.asset(
                          widget.car.imageUrl,
                          fit: BoxFit.cover,
                        ),
                  Positioned(
                    top: MediaQuery.of(context).padding.top + 8,
                    right: 8,
                    child: CircleAvatar(
                      backgroundColor: Colors.black.withOpacity(0.4),
                      child: IconButton(
                        icon: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: isFavorite ? Colors.redAccent : Colors.white,
                        ),
                        onPressed: toggleFavorite,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          widget.car.name,
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Row(
                        children: [
                          const Icon(Icons.star,
                              color: Color(0xFF4E7D96), size: 24),
                          const SizedBox(width: 4),
                          Text(widget.car.rating.toString(),
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text('Features',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildFeature(
                          Icons.settings_outlined, widget.car.transmission),
                      _buildFeature(
                          Icons.local_gas_station, widget.car.fuelType),
                      _buildFeature(
                          Icons.person_outline, '${widget.car.seats} seats'),
                      _buildFeature(Icons.ac_unit, 'AC'),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const Text('Description',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  Text(
                    'Experience luxury and comfort with the ${widget.car.name}. This ${widget.car.transmission.toLowerCase()} transmission vehicle comes with ${widget.car.seats} comfortable seats and runs on ${widget.car.fuelType.toLowerCase()} fuel. Perfect for both city drives and long journeys.',
                    style: const TextStyle(
                        fontSize: 16, color: Colors.grey, height: 1.5),
                  ),
                  const SizedBox(height: 24),
                  const Text('Included in the price',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  _buildIncludedItem(
                      Icons.local_gas_station, 'Full tank of fuel'),
                  _buildIncludedItem(
                      Icons.cleaning_services, 'Vehicle cleaning'),
                  _buildIncludedItem(Icons.support_agent, '24/7 support'),
                  _buildIncludedItem(Icons.security, 'Insurance included'),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('EGP ${widget.car.price.toStringAsFixed(0)}',
                              style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF4E7D96))),
                          Text('per day',
                              style: TextStyle(
                                  color: Colors.grey[600], fontSize: 16)),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: _handleBooking,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF4E7D96),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 32, vertical: 16),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        child: const Text('Book Now',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeature(IconData icon, String text) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: const Color(0xFF4E7D96).withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: const Color(0xFF4E7D96), size: 24),
        ),
        const SizedBox(height: 8),
        Text(text, style: const TextStyle(fontSize: 14, color: Colors.grey)),
      ],
    );
  }

  Widget _buildIncludedItem(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFF4E7D96).withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: const Color(0xFF4E7D96), size: 20),
          ),
          const SizedBox(width: 12),
          Text(text, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
