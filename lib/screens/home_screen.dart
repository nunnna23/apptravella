// // import 'package:flutter/material.dart';
// // import 'package:travella/screens/notifications_screen.dart';
// // import 'package:travella/services/hotel_api_service.dart';
// // import 'package:travella/screens/country_explore_screen.dart';
// // import 'package:travella/screens/hotels_search_screen.dart';
// // import 'package:travella/screens/flights_screen.dart';
// // import 'package:travella/screens/car_rental_screen.dart';
// // import 'package:travella/screens/taxi_search_screen.dart';
// // import '../widgets/custom_bottom_navigation_bar.dart';
// // import 'package:country_picker/country_picker.dart';
// // import '../models/hotel_model.dart';
// // import 'predicted_budget_screen.dart';

// // class HomeScreen extends StatefulWidget {
// //   const HomeScreen({super.key});

// //   @override
// //   State<HomeScreen> createState() => _HomeScreenState();
// // }

// // class _HomeScreenState extends State<HomeScreen> {
// //   int _selectedIndex = 1;
// //   Country selectedCountry = Country(
// //     phoneCode: '20',
// //     countryCode: 'EG',
// //     e164Sc: 0,
// //     geographic: true,
// //     level: 1,
// //     name: 'Egypt',
// //     example: '1001234567',
// //     displayName: 'Egypt (EG)',
// //     displayNameNoCountryCode: 'Egypt',
// //     e164Key: '20-EG-0',
// //   );

// //   final HotelApiService _hotelApiService = HotelApiService();
// //   late Future<List<Hotel>> _allHotelsFuture;
// //   late Future<List<Hotel>>
// //       _dealsHotelsFuture; // حافظنا على late مع التهيئة الآمنة

// //   @override
// //   void initState() {
// //     super.initState();
// //     _allHotelsFuture = _hotelApiService.getAllHotels();
// //     _dealsHotelsFuture = _hotelApiService.getDeals().catchError((e) {
// //       print("Error loading deals: $e");
// //       return <Hotel>[]; // عودة قائمة فارغة لو فشل الاستدعاء
// //     });
// //   }

// //   void toggleFavoriteHotelCard(Hotel hotel) {
// //     setState(() {
// //       hotel.isFavorite = !hotel.isFavorite;
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     final theme = Theme.of(context);
// //     final colorScheme = theme.colorScheme;

// //     return Scaffold(
// //       body: Stack(
// //         children: [
// //           SafeArea(
// //             child: SingleChildScrollView(
// //               child: Padding(
// //                 padding: const EdgeInsets.only(
// //                     bottom: 120.0, left: 0, right: 0, top: 16),
// //                 child: Column(
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   children: [
// //                     Padding(
// //                       padding: const EdgeInsets.symmetric(
// //                           horizontal: 16.0, vertical: 8.0),
// //                       child: Row(
// //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                         crossAxisAlignment: CrossAxisAlignment.start,
// //                         children: [
// //                           Expanded(
// //                             child: Column(
// //                               crossAxisAlignment: CrossAxisAlignment.start,
// //                               children: [
// //                                 GestureDetector(
// //                                   onTap: () {
// //                                     Navigator.push(
// //                                       context,
// //                                       MaterialPageRoute(
// //                                         builder: (context) =>
// //                                             ExploreByCityScreen(
// //                                           countryName: selectedCountry.name,
// //                                         ),
// //                                       ),
// //                                     );
// //                                   },
// //                                   child: Row(
// //                                     mainAxisSize: MainAxisSize.min,
// //                                     crossAxisAlignment:
// //                                         CrossAxisAlignment.center,
// //                                     children: [
// //                                       Flexible(
// //                                         child: Text(
// //                                           'Explore ${selectedCountry.name}',
// //                                           style: theme.textTheme.titleLarge
// //                                               ?.copyWith(
// //                                                   fontWeight: FontWeight.bold),
// //                                           softWrap: true,
// //                                         ),
// //                                       ),
// //                                       const SizedBox(width: 8),
// //                                       Text(selectedCountry.flagEmoji,
// //                                           style: const TextStyle(fontSize: 24)),
// //                                       const SizedBox(width: 8),
// //                                       InkWell(
// //                                         onTap: _showCountryPicker,
// //                                         borderRadius: BorderRadius.circular(20),
// //                                         child: Padding(
// //                                           padding: const EdgeInsets.all(4.0),
// //                                           child: Icon(
// //                                               Icons.edit_location_outlined,
// //                                               color: colorScheme.primary,
// //                                               size: 22),
// //                                         ),
// //                                       ),
// //                                     ],
// //                                   ),
// //                                 ),
// //                               ],
// //                             ),
// //                           ),
// //                           Column(
// //                             crossAxisAlignment: CrossAxisAlignment.end,
// //                             children: [
// //                               GestureDetector(
// //                                 onTap: () => Navigator.push(
// //                                     context,
// //                                     MaterialPageRoute(
// //                                         builder: (context) =>
// //                                             const NotificationsScreen())),
// //                                 child: Stack(
// //                                   children: [
// //                                     Icon(Icons.notifications_none_outlined,
// //                                         color: colorScheme.primary, size: 26),
// //                                     Positioned(
// //                                       right: 2,
// //                                       top: 2,
// //                                       child: Container(
// //                                         width: 8,
// //                                         height: 8,
// //                                         decoration: BoxDecoration(
// //                                             color: colorScheme.primary,
// //                                             shape: BoxShape.circle),
// //                                       ),
// //                                     ),
// //                                   ],
// //                                 ),
// //                               ),
// //                               const SizedBox(height: 8),
// //                               Row(
// //                                 children: [
// //                                   Text('Predicted Budget',
// //                                       style: TextStyle(
// //                                           color: colorScheme.primary,
// //                                           fontSize: 14)),
// //                                   const SizedBox(width: 4),
// //                                   InkWell(
// //                                     onTap: () {
// //                                       Navigator.push(
// //                                           context,
// //                                           MaterialPageRoute(
// //                                               builder: (context) =>
// //                                                   const PredictedBudgetScreen()));
// //                                     },
// //                                     child: Container(
// //                                       padding: const EdgeInsets.all(3),
// //                                       decoration: BoxDecoration(
// //                                         color: colorScheme.surfaceVariant,
// //                                         borderRadius: BorderRadius.circular(8),
// //                                       ),
// //                                       child: Icon(Icons.help_outline,
// //                                           color: colorScheme.primary, size: 16),
// //                                     ),
// //                                   ),
// //                                 ],
// //                               ),
// //                             ],
// //                           ),
// //                         ],
// //                       ),
// //                     ),
// //                     Container(
// //                       margin: const EdgeInsets.symmetric(
// //                           horizontal: 16, vertical: 16),
// //                       padding: const EdgeInsets.all(16),
// //                       decoration: BoxDecoration(
// //                         color: colorScheme.surfaceVariant.withOpacity(0.5),
// //                         borderRadius: BorderRadius.circular(15),
// //                       ),
// //                       child: Column(
// //                         children: [
// //                           Row(
// //                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                             children: [
// //                               _buildServiceButton(
// //                                   Icons.flight_takeoff, 'Flights', 0, theme),
// //                               _buildServiceButton(
// //                                   Icons.hotel, 'Hotels', 1, theme),
// //                               _buildServiceButton(
// //                                   Icons.directions_car, 'Car Rental', 2, theme),
// //                               _buildServiceButton(
// //                                   Icons.local_taxi, 'Taxi', 3, theme),
// //                             ],
// //                           ),
// //                           const SizedBox(height: 20),
// //                           GestureDetector(
// //                             onTap: () {
// //                               Navigator.push(
// //                                   context,
// //                                   MaterialPageRoute(
// //                                       builder: (context) =>
// //                                           const HotelsSearchScreen()));
// //                             },
// //                             child: Container(
// //                               padding:
// //                                   const EdgeInsets.symmetric(horizontal: 12),
// //                               decoration: BoxDecoration(
// //                                 color: colorScheme.surface,
// //                                 borderRadius: BorderRadius.circular(10),
// //                                 boxShadow: [
// //                                   BoxShadow(
// //                                     color: theme.shadowColor.withOpacity(0.1),
// //                                     spreadRadius: 1,
// //                                     blurRadius: 3,
// //                                     offset: const Offset(0, 1),
// //                                   ),
// //                                 ],
// //                               ),
// //                               child: AbsorbPointer(
// //                                 child: TextField(
// //                                   readOnly: true,
// //                                   decoration: InputDecoration(
// //                                     hintText: 'Search destinations, hotels...',
// //                                     hintStyle: theme.textTheme.bodyMedium
// //                                         ?.copyWith(color: theme.hintColor),
// //                                     prefixIcon: Icon(Icons.search,
// //                                         color: colorScheme.onSurface
// //                                             .withOpacity(0.6)),
// //                                     border: InputBorder.none,
// //                                     contentPadding: const EdgeInsets.symmetric(
// //                                         vertical: 14),
// //                                   ),
// //                                 ),
// //                               ),
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //                     ),
// //                     FutureBuilder<List<Hotel>>(
// //                       future: _dealsHotelsFuture,
// //                       builder: (context, snapshot) {
// //                         if (snapshot.connectionState ==
// //                             ConnectionState.waiting) {
// //                           return const Center(
// //                               child: Padding(
// //                                   padding: EdgeInsets.all(32.0),
// //                                   child: CircularProgressIndicator()));
// //                         }
// //                         if (snapshot.hasError) {
// //                           return Center(
// //                               child: Text(
// //                                   'Error loading deals: ${snapshot.error}'));
// //                         }
// //                         if (!snapshot.hasData || snapshot.data!.isEmpty) {
// //                           return const Center(child: Text('No deals found.'));
// //                         }

// //                         final dealHotels = snapshot.data!;
// //                         return Column(
// //                           crossAxisAlignment: CrossAxisAlignment.start,
// //                           children: [
// //                             if (dealHotels.isNotEmpty) ...[
// //                               Padding(
// //                                 padding:
// //                                     const EdgeInsets.fromLTRB(16, 8, 16, 12),
// //                                 child: Text('Deals',
// //                                     style: theme.textTheme.titleLarge),
// //                               ),
// //                               Padding(
// //                                 padding:
// //                                     const EdgeInsets.symmetric(horizontal: 16),
// //                                 child: Column(
// //                                   children: dealHotels
// //                                       .take(3)
// //                                       .map((hotel) => Padding(
// //                                             padding: const EdgeInsets.only(
// //                                                 bottom: 12.0),
// //                                             child: _buildDealCard(hotel, theme),
// //                                           ))
// //                                       .toList(),
// //                                 ),
// //                               ),
// //                               const SizedBox(height: 24),
// //                             ],
// //                             FutureBuilder<List<Hotel>>(
// //                               future: _allHotelsFuture,
// //                               builder: (context, snapshot) {
// //                                 if (snapshot.connectionState ==
// //                                     ConnectionState.waiting) {
// //                                   return const Center(
// //                                       child: Padding(
// //                                           padding: EdgeInsets.all(32.0),
// //                                           child: CircularProgressIndicator()));
// //                                 }
// //                                 if (snapshot.hasError) {
// //                                   return Center(
// //                                       child: Text(
// //                                           'Error loading hotels: ${snapshot.error}'));
// //                                 }
// //                                 if (!snapshot.hasData ||
// //                                     snapshot.data!.isEmpty) {
// //                                   return const Center(
// //                                       child: Text('No hotels found.'));
// //                                 }

// //                                 final allHotels = snapshot.data!;
// //                                 final topRatedHotels = allHotels
// //                                     .where((h) => h.rate >= 4.5)
// //                                     .toList();
// //                                 final nearbyHotels = allHotels
// //                                     .where((h) =>
// //                                         h.city.toLowerCase().contains('cairo'))
// //                                     .toList();

// //                                 return Column(
// //                                   crossAxisAlignment: CrossAxisAlignment.start,
// //                                   children: [
// //                                     if (topRatedHotels.isNotEmpty) ...[
// //                                       Padding(
// //                                         padding: const EdgeInsets.symmetric(
// //                                             horizontal: 16.0),
// //                                         child: Text('Top Rated',
// //                                             style: theme.textTheme.titleLarge),
// //                                       ),
// //                                       const SizedBox(height: 16),
// //                                       SingleChildScrollView(
// //                                         scrollDirection: Axis.horizontal,
// //                                         padding: const EdgeInsets.symmetric(
// //                                             horizontal: 16.0),
// //                                         child: Row(
// //                                           children: topRatedHotels
// //                                               .map((hotel) =>
// //                                                   _buildHotelCard(hotel, theme))
// //                                               .toList(),
// //                                         ),
// //                                       ),
// //                                       const SizedBox(height: 32),
// //                                     ],
// //                                     if (nearbyHotels.isNotEmpty) ...[
// //                                       Padding(
// //                                         padding: const EdgeInsets.symmetric(
// //                                             horizontal: 16.0),
// //                                         child: Text('Nearby Hotel',
// //                                             style: theme.textTheme.titleLarge),
// //                                       ),
// //                                       const SizedBox(height: 16),
// //                                       Padding(
// //                                         padding: const EdgeInsets.symmetric(
// //                                             horizontal: 16.0),
// //                                         child: Column(
// //                                           children: nearbyHotels
// //                                               .map((hotel) =>
// //                                                   _buildNearbyHotelCard(
// //                                                       hotel, theme))
// //                                               .toList(),
// //                                         ),
// //                                       ),
// //                                       const SizedBox(height: 20),
// //                                     ]
// //                                   ],
// //                                 );
// //                               },
// //                             ),
// //                           ],
// //                         );
// //                       },
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ),
// //           ),
// //           Positioned(
// //             bottom: 0,
// //             left: 0,
// //             right: 0,
// //             child: CustomBottomNavigationBar(
// //               currentIndex: 0,
// //               onTap: (int index) {},
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// //   Widget _buildServiceButton(
// //       IconData icon, String label, int index, ThemeData theme) {
// //     final isSelected = _selectedIndex == index;
// //     final colorScheme = theme.colorScheme;

// //     return GestureDetector(
// //       onTap: () {
// //         if (index == 0) {
// //           Navigator.push(context,
// //               MaterialPageRoute(builder: (context) => const FlightsScreen()));
// //         } else if (index == 1) {
// //           Navigator.push(
// //               context,
// //               MaterialPageRoute(
// //                   builder: (context) => const HotelsSearchScreen()));
// //         } else if (index == 2) {
// //           Navigator.push(context,
// //               MaterialPageRoute(builder: (context) => const CarRentalScreen()));
// //         } else if (index == 3) {
// //           Navigator.push(
// //               context,
// //               MaterialPageRoute(
// //                   builder: (context) => const TaxiSearchScreen()));
// //         }
// //         setState(() => _selectedIndex = index);
// //         Future.delayed(const Duration(milliseconds: 150), () {
// //           if (mounted) {
// //             setState(() => _selectedIndex = 1);
// //           }
// //         });
// //       },
// //       child: Container(
// //         padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
// //         decoration: BoxDecoration(
// //           color: isSelected ? colorScheme.primary : Colors.transparent,
// //           borderRadius: BorderRadius.circular(10),
// //         ),
// //         child: Column(
// //           mainAxisSize: MainAxisSize.min,
// //           children: [
// //             Icon(icon,
// //                 color: isSelected
// //                     ? colorScheme.onPrimary
// //                     : colorScheme.onSurface.withOpacity(0.6),
// //                 size: 24),
// //             const SizedBox(height: 4),
// //             Text(
// //               label,
// //               style: TextStyle(
// //                 color: isSelected
// //                     ? colorScheme.onPrimary
// //                     : colorScheme.onSurface.withOpacity(0.8),
// //                 fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
// //                 fontSize: 11,
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   Widget _buildDealCard(Hotel hotel, ThemeData theme) {
// //     final colorScheme = theme.colorScheme;
// //     final textTheme = theme.textTheme;

// //     return GestureDetector(
// //       onTap: () {
// //         print("Deal card tapped for hotel: ${hotel.name}");
// //       },
// //       child: Card(
// //         clipBehavior: Clip.antiAlias,
// //         child: Row(
// //           children: [
// //             SizedBox(
// //               height: 130,
// //               width: 120,
// //               child: Image.network(
// //                 hotel.primaryImageUrl,
// //                 fit: BoxFit.cover,
// //                 errorBuilder: (ctx, err, st) => Container(
// //                   color: colorScheme.surfaceVariant,
// //                   child: Icon(Icons.broken_image,
// //                       color: colorScheme.onSurfaceVariant),
// //                 ),
// //               ),
// //             ),
// //             Expanded(
// //               child: Padding(
// //                 padding: const EdgeInsets.all(12),
// //                 child: Column(
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   children: [
// //                     Text(hotel.name,
// //                         style: textTheme.titleMedium
// //                             ?.copyWith(fontWeight: FontWeight.bold),
// //                         maxLines: 1,
// //                         overflow: TextOverflow.ellipsis),
// //                     const SizedBox(height: 4),
// //                     Row(
// //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                       children: [
// //                         Expanded(
// //                           child: Row(
// //                             children: [
// //                               Icon(Icons.location_on_outlined,
// //                                   color: colorScheme.onSurface.withOpacity(0.6),
// //                                   size: 14),
// //                               const SizedBox(width: 3),
// //                               Expanded(
// //                                 child: Text('${hotel.city}, ${hotel.countery}',
// //                                     style: textTheme.bodySmall?.copyWith(
// //                                         color: colorScheme.onSurface
// //                                             .withOpacity(0.8)),
// //                                     maxLines: 1,
// //                                     overflow: TextOverflow.ellipsis),
// //                               ),
// //                             ],
// //                           ),
// //                         ),
// //                         Container(
// //                           padding: const EdgeInsets.symmetric(
// //                               horizontal: 6, vertical: 2),
// //                           decoration: BoxDecoration(
// //                             color:
// //                                 colorScheme.primaryContainer.withOpacity(0.2),
// //                             borderRadius: BorderRadius.circular(8),
// //                           ),
// //                           child: Row(
// //                             children: [
// //                               Icon(Icons.star,
// //                                   color: colorScheme.primary, size: 14),
// //                               const SizedBox(width: 3),
// //                               Text(hotel.rate.toString(),
// //                                   style: textTheme.labelMedium?.copyWith(
// //                                       fontWeight: FontWeight.bold,
// //                                       color: colorScheme.primary)),
// //                             ],
// //                           ),
// //                         ),
// //                       ],
// //                     ),
// //                     const SizedBox(height: 8),
// //                     Text(hotel.formattedPrice,
// //                         style: textTheme.titleMedium
// //                             ?.copyWith(fontWeight: FontWeight.bold)),
// //                     Text('Per Night', style: textTheme.labelSmall),
// //                   ],
// //                 ),
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   Widget _buildHotelCard(Hotel hotel, ThemeData theme) {
// //     final colorScheme = theme.colorScheme;
// //     final textTheme = theme.textTheme;

// //     return GestureDetector(
// //       onTap: () {
// //         print("Top rated card tapped for hotel: ${hotel.name}");
// //       },
// //       child: Card(
// //         clipBehavior: Clip.antiAlias,
// //         margin: const EdgeInsets.only(right: 16),
// //         child: SizedBox(
// //           width: 260,
// //           child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               Stack(
// //                 alignment: Alignment.topRight,
// //                 children: [
// //                   SizedBox(
// //                     height: 140,
// //                     width: double.infinity,
// //                     child: Image.network(
// //                       hotel.primaryImageUrl,
// //                       fit: BoxFit.cover,
// //                       errorBuilder: (ctx, err, st) => Container(
// //                         color: colorScheme.surfaceVariant,
// //                         child: Icon(Icons.business,
// //                             color: colorScheme.onSurfaceVariant),
// //                       ),
// //                     ),
// //                   ),
// //                   Positioned(
// //                     top: 8,
// //                     right: 8,
// //                     child: GestureDetector(
// //                       onTap: () => toggleFavoriteHotelCard(hotel),
// //                       child: Container(
// //                         padding: const EdgeInsets.all(6),
// //                         decoration: BoxDecoration(
// //                             color: Colors.black.withOpacity(0.5),
// //                             shape: BoxShape.circle),
// //                         child: Icon(
// //                           hotel.isFavorite
// //                               ? Icons.favorite
// //                               : Icons.favorite_border,
// //                           color: hotel.isFavorite
// //                               ? colorScheme.primary
// //                               : Colors.white,
// //                           size: 20,
// //                         ),
// //                       ),
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //               Padding(
// //                 padding: const EdgeInsets.all(12),
// //                 child: Column(
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   children: [
// //                     Row(
// //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                       crossAxisAlignment: CrossAxisAlignment.start,
// //                       children: [
// //                         Expanded(
// //                           child: Text(hotel.name,
// //                               style: textTheme.titleMedium
// //                                   ?.copyWith(fontWeight: FontWeight.bold),
// //                               maxLines: 1,
// //                               overflow: TextOverflow.ellipsis),
// //                         ),
// //                         const SizedBox(width: 8),
// //                         Row(
// //                           children: [
// //                             Icon(Icons.star,
// //                                 color: colorScheme.primary, size: 16),
// //                             const SizedBox(width: 4),
// //                             Text(hotel.rate.toString(),
// //                                 style: textTheme.bodyMedium?.copyWith(
// //                                     fontWeight: FontWeight.bold,
// //                                     color: colorScheme.primary)),
// //                           ],
// //                         ),
// //                       ],
// //                     ),
// //                     const SizedBox(height: 4),
// //                     Row(
// //                       children: [
// //                         Icon(Icons.location_on_outlined,
// //                             color: colorScheme.onSurface.withOpacity(0.6),
// //                             size: 14),
// //                         const SizedBox(width: 4),
// //                         Expanded(
// //                           child: Text('${hotel.city}, ${hotel.countery}',
// //                               style: textTheme.bodySmall?.copyWith(
// //                                   color:
// //                                       colorScheme.onSurface.withOpacity(0.8)),
// //                               maxLines: 1,
// //                               overflow: TextOverflow.ellipsis),
// //                         ),
// //                       ],
// //                     ),
// //                     const SizedBox(height: 8),
// //                     Text(hotel.formattedPrice,
// //                         style: textTheme.titleMedium
// //                             ?.copyWith(fontWeight: FontWeight.bold)),
// //                     Text('Per Night', style: textTheme.labelSmall),
// //                   ],
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   Widget _buildNearbyHotelCard(Hotel hotel, ThemeData theme) {
// //     final colorScheme = theme.colorScheme;
// //     final textTheme = theme.textTheme;

// //     return GestureDetector(
// //       onTap: () {
// //         print("Nearby card tapped for hotel: ${hotel.name}");
// //       },
// //       child: Card(
// //         clipBehavior: Clip.antiAlias,
// //         margin: const EdgeInsets.only(bottom: 16),
// //         child: Row(
// //           children: [
// //             SizedBox(
// //               height: 120,
// //               width: 120,
// //               child: Image.network(
// //                 hotel.primaryImageUrl,
// //                 fit: BoxFit.cover,
// //                 errorBuilder: (ctx, err, st) => Container(
// //                   color: colorScheme.surfaceVariant,
// //                   child: Icon(Icons.broken_image,
// //                       color: colorScheme.onSurfaceVariant),
// //                 ),
// //               ),
// //             ),
// //             Expanded(
// //               child: Padding(
// //                 padding: const EdgeInsets.all(16),
// //                 child: Column(
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   children: [
// //                     Row(
// //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                       crossAxisAlignment: CrossAxisAlignment.start,
// //                       children: [
// //                         Expanded(
// //                           child: Text(hotel.name,
// //                               style: textTheme.titleMedium
// //                                   ?.copyWith(fontWeight: FontWeight.bold),
// //                               maxLines: 2,
// //                               overflow: TextOverflow.ellipsis),
// //                         ),
// //                         const SizedBox(width: 8),
// //                         Row(
// //                           children: [
// //                             Icon(Icons.star,
// //                                 color: colorScheme.primary, size: 18),
// //                             const SizedBox(width: 4),
// //                             Text(hotel.rate.toString(),
// //                                 style: textTheme.bodyLarge?.copyWith(
// //                                     fontWeight: FontWeight.bold,
// //                                     color: colorScheme.primary)),
// //                           ],
// //                         ),
// //                       ],
// //                     ),
// //                     const SizedBox(height: 6),
// //                     Row(
// //                       children: [
// //                         Icon(Icons.location_on_outlined,
// //                             color: colorScheme.onSurface.withOpacity(0.6),
// //                             size: 14),
// //                         const SizedBox(width: 4),
// //                         Expanded(
// //                           child: Text('${hotel.city}, ${hotel.countery}',
// //                               style: textTheme.bodyMedium?.copyWith(
// //                                   color:
// //                                       colorScheme.onSurface.withOpacity(0.8)),
// //                               maxLines: 1,
// //                               overflow: TextOverflow.ellipsis),
// //                         ),
// //                       ],
// //                     ),
// //                     const SizedBox(height: 10),
// //                     Row(
// //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                       crossAxisAlignment: CrossAxisAlignment.end,
// //                       children: [
// //                         Text(hotel.formattedPrice,
// //                             style: textTheme.titleMedium
// //                                 ?.copyWith(fontWeight: FontWeight.bold)),
// //                         Text('Per Night', style: textTheme.labelSmall),
// //                       ],
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   void _showCountryPicker() {
// //     final theme = Theme.of(context);
// //     final colorScheme = theme.colorScheme;

// //     showCountryPicker(
// //       context: context,
// //       showPhoneCode: false,
// //       onSelect: (Country country) {
// //         setState(() => selectedCountry = country);
// //       },
// //       countryListTheme: CountryListThemeData(
// //         bottomSheetHeight: MediaQuery.of(context).size.height * 0.7,
// //         backgroundColor: theme.bottomSheetTheme.modalBackgroundColor ??
// //             theme.dialogBackgroundColor,
// //         borderRadius: const BorderRadius.only(
// //           topLeft: Radius.circular(20.0),
// //           topRight: Radius.circular(20.0),
// //         ),
// //         inputDecoration: InputDecoration(
// //           labelText: 'Search Country',
// //           hintStyle: TextStyle(color: theme.hintColor),
// //           prefixIcon: Icon(Icons.search, color: colorScheme.primary),
// //           border: OutlineInputBorder(
// //               borderRadius: BorderRadius.circular(10),
// //               borderSide:
// //                   BorderSide(color: colorScheme.outline.withOpacity(0.3))),
// //           enabledBorder: OutlineInputBorder(
// //               borderRadius: BorderRadius.circular(10),
// //               borderSide:
// //                   BorderSide(color: colorScheme.outline.withOpacity(0.3))),
// //           focusedBorder: OutlineInputBorder(
// //               borderRadius: BorderRadius.circular(10),
// //               borderSide: BorderSide(color: colorScheme.primary, width: 1.5)),
// //         ),
// //         searchTextStyle: theme.textTheme.bodyLarge,
// //         textStyle: theme.textTheme.bodyMedium
// //             ?.copyWith(color: colorScheme.onSurface.withOpacity(0.8)),
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:travella/screens/HotelDetailsScreen.dart';
// import 'package:travella/screens/notifications_screen.dart';
// import 'package:travella/services/hotel_api_service.dart';
// import 'package:travella/screens/country_explore_screen.dart';
// import 'package:travella/screens/hotels_search_screen.dart';
// import 'package:travella/screens/flights_screen.dart';
// import 'package:travella/screens/car_rental_screen.dart';
// import 'package:travella/screens/taxi_search_screen.dart';
// import '../widgets/custom_bottom_navigation_bar.dart';
// import 'package:country_picker/country_picker.dart';
// import '../models/hotel_model.dart';
// import 'predicted_budget_screen.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key, required String userTags});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   int _selectedIndex = 1;
//   Country selectedCountry = Country(
//     phoneCode: '20',
//     countryCode: 'EG',
//     e164Sc: 0,
//     geographic: true,
//     level: 1,
//     name: 'Egypt',
//     example: '1001234567',
//     displayName: 'Egypt (EG)',
//     displayNameNoCountryCode: 'Egypt',
//     e164Key: '20-EG-0',
//   );

//   final HotelApiService _hotelApiService = HotelApiService();
//   late Future<List<Hotel>> _allHotelsFuture;
//   late Future<List<Hotel>> _dealsHotelsFuture;

//   @override
//   void initState() {
//     super.initState();
//     _allHotelsFuture = _hotelApiService.getAllHotels();
//     _dealsHotelsFuture = _hotelApiService.getDeals().catchError((e) {
//       print("Error loading deals: $e");
//       return <Hotel>[]; // عودة قائمة فارغة لو فشل الاستدعاء
//     });
//   }

//   void toggleFavoriteHotelCard(Hotel hotel) {
//     setState(() {
//       hotel.isFavorite = !hotel.isFavorite;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     final colorScheme = theme.colorScheme;

//     return Scaffold(
//       body: Stack(
//         children: [
//           SafeArea(
//             child: SingleChildScrollView(
//               child: Padding(
//                 padding: const EdgeInsets.only(
//                     bottom: 120.0, left: 0, right: 0, top: 16),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 16.0, vertical: 8.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Expanded(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 GestureDetector(
//                                   onTap: () {
//                                     Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                         builder: (context) =>
//                                             ExploreByCityScreen(
//                                           countryName: selectedCountry.name,
//                                         ),
//                                       ),
//                                     );
//                                   },
//                                   child: Row(
//                                     mainAxisSize: MainAxisSize.min,
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.center,
//                                     children: [
//                                       Flexible(
//                                         child: Text(
//                                           'Explore ${selectedCountry.name}',
//                                           style: theme.textTheme.titleLarge
//                                               ?.copyWith(
//                                                   fontWeight: FontWeight.bold),
//                                           softWrap: true,
//                                         ),
//                                       ),
//                                       const SizedBox(width: 8),
//                                       Text(selectedCountry.flagEmoji,
//                                           style: const TextStyle(fontSize: 24)),
//                                       const SizedBox(width: 8),
//                                       InkWell(
//                                         onTap: _showCountryPicker,
//                                         borderRadius: BorderRadius.circular(20),
//                                         child: Padding(
//                                           padding: const EdgeInsets.all(4.0),
//                                           child: Icon(
//                                               Icons.edit_location_outlined,
//                                               color: colorScheme.primary,
//                                               size: 22),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.end,
//                             children: [
//                               GestureDetector(
//                                 onTap: () => Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (context) =>
//                                             const NotificationsScreen())),
//                                 child: Stack(
//                                   children: [
//                                     Icon(Icons.notifications_none_outlined,
//                                         color: colorScheme.primary, size: 26),
//                                     Positioned(
//                                       right: 2,
//                                       top: 2,
//                                       child: Container(
//                                         width: 8,
//                                         height: 8,
//                                         decoration: BoxDecoration(
//                                             color: colorScheme.primary,
//                                             shape: BoxShape.circle),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               const SizedBox(height: 8),
//                               Row(
//                                 children: [
//                                   Text('Predicted Budget',
//                                       style: TextStyle(
//                                           color: colorScheme.primary,
//                                           fontSize: 14)),
//                                   const SizedBox(width: 4),
//                                   InkWell(
//                                     onTap: () {
//                                       Navigator.push(
//                                           context,
//                                           MaterialPageRoute(
//                                               builder: (context) =>
//                                                   const PredictedBudgetScreen()));
//                                     },
//                                     child: Container(
//                                       padding: const EdgeInsets.all(3),
//                                       decoration: BoxDecoration(
//                                         color: colorScheme.surfaceVariant,
//                                         borderRadius: BorderRadius.circular(8),
//                                       ),
//                                       child: Icon(Icons.help_outline,
//                                           color: colorScheme.primary, size: 16),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                     Container(
//                       margin: const EdgeInsets.symmetric(
//                           horizontal: 16, vertical: 16),
//                       padding: const EdgeInsets.all(16),
//                       decoration: BoxDecoration(
//                         color: colorScheme.surfaceVariant.withOpacity(0.5),
//                         borderRadius: BorderRadius.circular(15),
//                       ),
//                       child: Column(
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               _buildServiceButton(
//                                   Icons.flight_takeoff, 'Flights', 0, theme),
//                               _buildServiceButton(
//                                   Icons.hotel, 'Hotels', 1, theme),
//                               _buildServiceButton(
//                                   Icons.directions_car, 'Car Rental', 2, theme),
//                               _buildServiceButton(
//                                   Icons.local_taxi, 'Taxi', 3, theme),
//                             ],
//                           ),
//                           const SizedBox(height: 20),
//                           GestureDetector(
//                             onTap: () {
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) =>
//                                           const HotelsSearchScreen()));
//                             },
//                             child: Container(
//                               padding:
//                                   const EdgeInsets.symmetric(horizontal: 12),
//                               decoration: BoxDecoration(
//                                 color: colorScheme.surface,
//                                 borderRadius: BorderRadius.circular(10),
//                                 boxShadow: [
//                                   BoxShadow(
//                                     color: theme.shadowColor.withOpacity(0.1),
//                                     spreadRadius: 1,
//                                     blurRadius: 3,
//                                     offset: const Offset(0, 1),
//                                   ),
//                                 ],
//                               ),
//                               child: AbsorbPointer(
//                                 child: TextField(
//                                   readOnly: true,
//                                   decoration: InputDecoration(
//                                     hintText: 'Search destinations, hotels...',
//                                     hintStyle: theme.textTheme.bodyMedium
//                                         ?.copyWith(color: theme.hintColor),
//                                     prefixIcon: Icon(Icons.search,
//                                         color: colorScheme.onSurface
//                                             .withOpacity(0.6)),
//                                     border: InputBorder.none,
//                                     contentPadding: const EdgeInsets.symmetric(
//                                         vertical: 14),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     FutureBuilder<List<Hotel>>(
//                       future: _dealsHotelsFuture,
//                       builder: (context, snapshot) {
//                         if (snapshot.connectionState ==
//                             ConnectionState.waiting) {
//                           return const Center(
//                               child: Padding(
//                                   padding: EdgeInsets.all(32.0),
//                                   child: CircularProgressIndicator()));
//                         }
//                         if (snapshot.hasError) {
//                           return Center(
//                               child: Text(
//                                   'Error loading deals: ${snapshot.error}'));
//                         }
//                         if (!snapshot.hasData || snapshot.data!.isEmpty) {
//                           return const Center(child: Text('No deals found.'));
//                         }

//                         final dealHotels = snapshot.data!;
//                         return Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             if (dealHotels.isNotEmpty) ...[
//                               Padding(
//                                 padding:
//                                     const EdgeInsets.fromLTRB(16, 8, 16, 12),
//                                 child: Text('Deals',
//                                     style: theme.textTheme.titleLarge),
//                               ),
//                               Padding(
//                                 padding:
//                                     const EdgeInsets.symmetric(horizontal: 16),
//                                 child: Column(
//                                   children: dealHotels
//                                       .take(3)
//                                       .map((hotel) => Padding(
//                                             padding: const EdgeInsets.only(
//                                                 bottom: 12.0),
//                                             child: _buildDealCard(hotel, theme),
//                                           ))
//                                       .toList(),
//                                 ),
//                               ),
//                               const SizedBox(height: 24),
//                             ],
//                             FutureBuilder<List<Hotel>>(
//                               future: _allHotelsFuture,
//                               builder: (context, snapshot) {
//                                 if (snapshot.connectionState ==
//                                     ConnectionState.waiting) {
//                                   return const Center(
//                                       child: Padding(
//                                           padding: EdgeInsets.all(32.0),
//                                           child: CircularProgressIndicator()));
//                                 }
//                                 if (snapshot.hasError) {
//                                   return Center(
//                                       child: Text(
//                                           'Error loading hotels: ${snapshot.error}'));
//                                 }
//                                 if (!snapshot.hasData ||
//                                     snapshot.data!.isEmpty) {
//                                   return const Center(
//                                       child: Text('No hotels found.'));
//                                 }

//                                 final allHotels = snapshot.data!;
//                                 final topRatedHotels = allHotels
//                                     .where((h) => h.rate >= 4.5)
//                                     .toList();
//                                 final nearbyHotels = allHotels
//                                     .where((h) =>
//                                         h.city.toLowerCase().contains('cairo'))
//                                     .toList();

//                                 return Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     if (topRatedHotels.isNotEmpty) ...[
//                                       Padding(
//                                         padding: const EdgeInsets.symmetric(
//                                             horizontal: 16.0),
//                                         child: Text('Top Rated',
//                                             style: theme.textTheme.titleLarge),
//                                       ),
//                                       const SizedBox(height: 16),
//                                       SingleChildScrollView(
//                                         scrollDirection: Axis.horizontal,
//                                         padding: const EdgeInsets.symmetric(
//                                             horizontal: 16.0),
//                                         child: Row(
//                                           children: topRatedHotels
//                                               .map((hotel) =>
//                                                   _buildHotelCard(hotel, theme))
//                                               .toList(),
//                                         ),
//                                       ),
//                                       const SizedBox(height: 32),
//                                     ],
//                                     if (nearbyHotels.isNotEmpty) ...[
//                                       Padding(
//                                         padding: const EdgeInsets.symmetric(
//                                             horizontal: 16.0),
//                                         child: Text('Nearby Hotel',
//                                             style: theme.textTheme.titleLarge),
//                                       ),
//                                       const SizedBox(height: 16),
//                                       Padding(
//                                         padding: const EdgeInsets.symmetric(
//                                             horizontal: 16.0),
//                                         child: Column(
//                                           children: nearbyHotels
//                                               .map((hotel) =>
//                                                   _buildNearbyHotelCard(
//                                                       hotel, theme))
//                                               .toList(),
//                                         ),
//                                       ),
//                                       const SizedBox(height: 20),
//                                     ]
//                                   ],
//                                 );
//                               },
//                             ),
//                           ],
//                         );
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//           Positioned(
//             bottom: 0,
//             left: 0,
//             right: 0,
//             child: CustomBottomNavigationBar(
//               currentIndex: 0,
//               onTap: (int index) {},
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildServiceButton(
//       IconData icon, String label, int index, ThemeData theme) {
//     final isSelected = _selectedIndex == index;
//     final colorScheme = theme.colorScheme;

//     return GestureDetector(
//       onTap: () {
//         if (index == 0) {
//           Navigator.push(context,
//               MaterialPageRoute(builder: (context) => const FlightsScreen()));
//         } else if (index == 1) {
//           Navigator.push(
//               context,
//               MaterialPageRoute(
//                   builder: (context) => const HotelsSearchScreen()));
//         } else if (index == 2) {
//           Navigator.push(context,
//               MaterialPageRoute(builder: (context) => const CarRentalScreen()));
//         } else if (index == 3) {
//           Navigator.push(
//               context,
//               MaterialPageRoute(
//                   builder: (context) => const TaxiSearchScreen()));
//         }
//         setState(() => _selectedIndex = index);
//         Future.delayed(const Duration(milliseconds: 150), () {
//           if (mounted) {
//             setState(() => _selectedIndex = 1);
//           }
//         });
//       },
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
//         decoration: BoxDecoration(
//           color: isSelected ? colorScheme.primary : Colors.transparent,
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Icon(icon,
//                 color: isSelected
//                     ? colorScheme.onPrimary
//                     : colorScheme.onSurface.withOpacity(0.6),
//                 size: 24),
//             const SizedBox(height: 4),
//             Text(
//               label,
//               style: TextStyle(
//                 color: isSelected
//                     ? colorScheme.onPrimary
//                     : colorScheme.onSurface.withOpacity(0.8),
//                 fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
//                 fontSize: 11,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildDealCard(Hotel hotel, ThemeData theme) {
//     final colorScheme = theme.colorScheme;
//     final textTheme = theme.textTheme;

//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => HotelDetailsScreen(hotelId: hotel.id),
//           ),
//         );
//       },
//       child: Card(
//         clipBehavior: Clip.antiAlias,
//         child: Row(
//           children: [
//             SizedBox(
//               height: 130,
//               width: 120,
//               child: Image.network(
//                 hotel.primaryImageUrl,
//                 fit: BoxFit.cover,
//                 errorBuilder: (ctx, err, st) => Container(
//                   color: colorScheme.surfaceVariant,
//                   child: Icon(Icons.broken_image,
//                       color: colorScheme.onSurfaceVariant),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.all(12),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(hotel.name,
//                         style: textTheme.titleMedium
//                             ?.copyWith(fontWeight: FontWeight.bold),
//                         maxLines: 1,
//                         overflow: TextOverflow.ellipsis),
//                     const SizedBox(height: 4),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Expanded(
//                           child: Row(
//                             children: [
//                               Icon(Icons.location_on_outlined,
//                                   color: colorScheme.onSurface.withOpacity(0.6),
//                                   size: 14),
//                               const SizedBox(width: 3),
//                               Expanded(
//                                 child: Text('${hotel.city}, ${hotel.countery}',
//                                     style: textTheme.bodySmall?.copyWith(
//                                         color: colorScheme.onSurface
//                                             .withOpacity(0.8)),
//                                     maxLines: 1,
//                                     overflow: TextOverflow.ellipsis),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Container(
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 6, vertical: 2),
//                           decoration: BoxDecoration(
//                             color:
//                                 colorScheme.primaryContainer.withOpacity(0.2),
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                           child: Row(
//                             children: [
//                               Icon(Icons.star,
//                                   color: colorScheme.primary, size: 14),
//                               const SizedBox(width: 3),
//                               Text(hotel.rate.toString(),
//                                   style: textTheme.labelMedium?.copyWith(
//                                       fontWeight: FontWeight.bold,
//                                       color: colorScheme.primary)),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 8),
//                     Text(hotel.formattedPrice,
//                         style: textTheme.titleMedium
//                             ?.copyWith(fontWeight: FontWeight.bold)),
//                     Text('Per Night', style: textTheme.labelSmall),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildHotelCard(Hotel hotel, ThemeData theme) {
//     final colorScheme = theme.colorScheme;
//     final textTheme = theme.textTheme;

//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => HotelDetailsScreen(hotelId: hotel.id),
//           ),
//         );
//       },
//       child: Card(
//         clipBehavior: Clip.antiAlias,
//         margin: const EdgeInsets.only(right: 16),
//         child: SizedBox(
//           width: 260,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Stack(
//                 alignment: Alignment.topRight,
//                 children: [
//                   SizedBox(
//                     height: 140,
//                     width: double.infinity,
//                     child: Image.network(
//                       hotel.primaryImageUrl,
//                       fit: BoxFit.cover,
//                       errorBuilder: (ctx, err, st) => Container(
//                         color: colorScheme.surfaceVariant,
//                         child: Icon(Icons.business,
//                             color: colorScheme.onSurfaceVariant),
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     top: 8,
//                     right: 8,
//                     child: GestureDetector(
//                       onTap: () => toggleFavoriteHotelCard(hotel),
//                       child: Container(
//                         padding: const EdgeInsets.all(6),
//                         decoration: BoxDecoration(
//                             color: Colors.black.withOpacity(0.5),
//                             shape: BoxShape.circle),
//                         child: Icon(
//                           hotel.isFavorite
//                               ? Icons.favorite
//                               : Icons.favorite_border,
//                           color: hotel.isFavorite
//                               ? colorScheme.primary
//                               : Colors.white,
//                           size: 20,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(12),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Expanded(
//                           child: Text(hotel.name,
//                               style: textTheme.titleMedium
//                                   ?.copyWith(fontWeight: FontWeight.bold),
//                               maxLines: 1,
//                               overflow: TextOverflow.ellipsis),
//                         ),
//                         const SizedBox(width: 8),
//                         Row(
//                           children: [
//                             Icon(Icons.star,
//                                 color: colorScheme.primary, size: 16),
//                             const SizedBox(width: 4),
//                             Text(hotel.rate.toString(),
//                                 style: textTheme.bodyMedium?.copyWith(
//                                     fontWeight: FontWeight.bold,
//                                     color: colorScheme.primary)),
//                           ],
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 4),
//                     Row(
//                       children: [
//                         Icon(Icons.location_on_outlined,
//                             color: colorScheme.onSurface.withOpacity(0.6),
//                             size: 14),
//                         const SizedBox(width: 4),
//                         Expanded(
//                           child: Text('${hotel.city}, ${hotel.countery}',
//                               style: textTheme.bodySmall?.copyWith(
//                                   color:
//                                       colorScheme.onSurface.withOpacity(0.8)),
//                               maxLines: 1,
//                               overflow: TextOverflow.ellipsis),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 8),
//                     Text(hotel.formattedPrice,
//                         style: textTheme.titleMedium
//                             ?.copyWith(fontWeight: FontWeight.bold)),
//                     Text('Per Night', style: textTheme.labelSmall),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildNearbyHotelCard(Hotel hotel, ThemeData theme) {
//     final colorScheme = theme.colorScheme;
//     final textTheme = theme.textTheme;

//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => HotelDetailsScreen(hotelId: hotel.id),
//           ),
//         );
//       },
//       child: Card(
//         clipBehavior: Clip.antiAlias,
//         margin: const EdgeInsets.only(bottom: 16),
//         child: Row(
//           children: [
//             SizedBox(
//               height: 120,
//               width: 120,
//               child: Image.network(
//                 hotel.primaryImageUrl,
//                 fit: BoxFit.cover,
//                 errorBuilder: (ctx, err, st) => Container(
//                   color: colorScheme.surfaceVariant,
//                   child: Icon(Icons.broken_image,
//                       color: colorScheme.onSurfaceVariant),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.all(16),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Expanded(
//                           child: Text(hotel.name,
//                               style: textTheme.titleMedium
//                                   ?.copyWith(fontWeight: FontWeight.bold),
//                               maxLines: 2,
//                               overflow: TextOverflow.ellipsis),
//                         ),
//                         const SizedBox(width: 8),
//                         Row(
//                           children: [
//                             Icon(Icons.star,
//                                 color: colorScheme.primary, size: 18),
//                             const SizedBox(width: 4),
//                             Text(hotel.rate.toString(),
//                                 style: textTheme.bodyLarge?.copyWith(
//                                     fontWeight: FontWeight.bold,
//                                     color: colorScheme.primary)),
//                           ],
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 6),
//                     Row(
//                       children: [
//                         Icon(Icons.location_on_outlined,
//                             color: colorScheme.onSurface.withOpacity(0.6),
//                             size: 14),
//                         const SizedBox(width: 4),
//                         Expanded(
//                           child: Text('${hotel.city}, ${hotel.countery}',
//                               style: textTheme.bodyMedium?.copyWith(
//                                   color:
//                                       colorScheme.onSurface.withOpacity(0.8)),
//                               maxLines: 1,
//                               overflow: TextOverflow.ellipsis),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 10),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       children: [
//                         Text(hotel.formattedPrice,
//                             style: textTheme.titleMedium
//                                 ?.copyWith(fontWeight: FontWeight.bold)),
//                         Text('Per Night', style: textTheme.labelSmall),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void _showCountryPicker() {
//     final theme = Theme.of(context);
//     final colorScheme = theme.colorScheme;

//     showCountryPicker(
//       context: context,
//       showPhoneCode: false,
//       onSelect: (Country country) {
//         setState(() => selectedCountry = country);
//       },
//       countryListTheme: CountryListThemeData(
//         bottomSheetHeight: MediaQuery.of(context).size.height * 0.7,
//         backgroundColor: theme.bottomSheetTheme.modalBackgroundColor ??
//             theme.dialogBackgroundColor,
//         borderRadius: const BorderRadius.only(
//           topLeft: Radius.circular(20.0),
//           topRight: Radius.circular(20.0),
//         ),
//         inputDecoration: InputDecoration(
//           labelText: 'Search Country',
//           hintStyle: TextStyle(color: theme.hintColor),
//           prefixIcon: Icon(Icons.search, color: colorScheme.primary),
//           border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10),
//               borderSide:
//                   BorderSide(color: colorScheme.outline.withOpacity(0.3))),
//           enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10),
//               borderSide:
//                   BorderSide(color: colorScheme.outline.withOpacity(0.3))),
//           focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10),
//               borderSide: BorderSide(color: colorScheme.primary, width: 1.5)),
//         ),
//         searchTextStyle: theme.textTheme.bodyLarge,
//         textStyle: theme.textTheme.bodyMedium
//             ?.copyWith(color: colorScheme.onSurface.withOpacity(0.8)),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:apptravella/screens/HotelDetailsScreen.dart';
import 'package:apptravella/screens/notifications_screen.dart';
import 'package:apptravella/services/hotel_api_service.dart';
import 'package:apptravella/screens/country_explore_screen.dart';
import 'package:apptravella/screens/hotels_search_screen.dart';
import 'package:apptravella/screens/flights_screen.dart';
import 'package:apptravella/screens/car_rental_screen.dart';
import 'package:apptravella/screens/taxi_search_screen.dart';
import '../widgets/custom_bottom_navigation_bar.dart';
import 'package:country_picker/country_picker.dart';
import '../models/hotel_model.dart';
import 'predicted_budget_screen.dart';
import 'favorites_screen.dart';

class HomeScreen extends StatefulWidget {
  // تم حذف userTags لأنه لم يعد مستخدماً
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 1;
  Country selectedCountry = Country(
    phoneCode: '20',
    countryCode: 'EG',
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: 'Egypt',
    example: '1001234567',
    displayName: 'Egypt (EG)',
    displayNameNoCountryCode: 'Egypt',
    e164Key: '20-EG-0',
  );

  final HotelApiService _hotelApiService = HotelApiService();
  late Future<List<Hotel>> _allHotelsFuture;
  late Future<List<Hotel>> _dealsHotelsFuture;

  @override
  void initState() {
    super.initState();
    _allHotelsFuture = _hotelApiService.getAllHotels();
    _dealsHotelsFuture = _hotelApiService.getDeals().catchError((e) {
      print("Error loading deals: $e");
      return <Hotel>[]; // عودة قائمة فارغة لو فشل الاستدعاء
    });
  }

  void toggleFavoriteHotelCard(Hotel hotel) {
    setState(() {
      hotel.isFavorite = !hotel.isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                    bottom: 120.0, left: 0, right: 0, top: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ... باقي واجهة المستخدم تبقى كما هي بدون تغيير ...
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            ExploreByCityScreen(
                                          countryName: selectedCountry.name,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Flexible(
                                        child: Text(
                                          'Explore ${selectedCountry.name}',
                                          style: theme.textTheme.titleLarge
                                              ?.copyWith(
                                                  fontWeight: FontWeight.bold),
                                          softWrap: true,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Text(selectedCountry.flagEmoji,
                                          style: const TextStyle(fontSize: 24)),
                                      const SizedBox(width: 8),
                                      InkWell(
                                        onTap: _showCountryPicker,
                                        borderRadius: BorderRadius.circular(20),
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Icon(
                                              Icons.edit_location_outlined,
                                              color: colorScheme.primary,
                                              size: 22),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const NotificationsScreen())),
                                child: Stack(
                                  children: [
                                    Icon(Icons.notifications_none_outlined,
                                        color: colorScheme.primary, size: 26),
                                    Positioned(
                                      right: 2,
                                      top: 2,
                                      child: Container(
                                        width: 8,
                                        height: 8,
                                        decoration: BoxDecoration(
                                            color: colorScheme.primary,
                                            shape: BoxShape.circle),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  Text('Predicted Budget',
                                      style: TextStyle(
                                          color: colorScheme.primary,
                                          fontSize: 14)),
                                  const SizedBox(width: 4),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const PredictedBudgetScreen()));
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                        color: colorScheme.surfaceVariant,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Icon(Icons.help_outline,
                                          color: colorScheme.primary, size: 16),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: colorScheme.surfaceVariant.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _buildServiceButton(
                                  Icons.flight_takeoff, 'Flights', 0, theme),
                              _buildServiceButton(
                                  Icons.hotel, 'Hotels', 1, theme),
                              _buildServiceButton(
                                  Icons.directions_car, 'Car Rental', 2, theme),
                              _buildServiceButton(
                                  Icons.local_taxi, 'Taxi', 3, theme),
                            ],
                          ),
                          const SizedBox(height: 20),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const HotelsSearchScreen()));
                            },
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              decoration: BoxDecoration(
                                color: colorScheme.surface,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: theme.shadowColor.withOpacity(0.1),
                                    spreadRadius: 1,
                                    blurRadius: 3,
                                    offset: const Offset(0, 1),
                                  ),
                                ],
                              ),
                              child: AbsorbPointer(
                                child: TextField(
                                  readOnly: true,
                                  decoration: InputDecoration(
                                    hintText: 'Search destinations, hotels...',
                                    hintStyle: theme.textTheme.bodyMedium
                                        ?.copyWith(color: theme.hintColor),
                                    prefixIcon: Icon(Icons.search,
                                        color: colorScheme.onSurface
                                            .withOpacity(0.6)),
                                    border: InputBorder.none,
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 14),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    FutureBuilder<List<Hotel>>(
                      future: _dealsHotelsFuture,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: Padding(
                                  padding: EdgeInsets.all(32.0),
                                  child: CircularProgressIndicator()));
                        }
                        if (snapshot.hasError) {
                          return Center(
                              child: Text(
                                  'Error loading deals: ${snapshot.error}'));
                        }
                        if (!snapshot.hasData || snapshot.data!.isEmpty) {
                          return const Center(child: Text('No deals found.'));
                        }

                        final dealHotels = snapshot.data!;
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (dealHotels.isNotEmpty) ...[
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(16, 8, 16, 12),
                                child: Text('Deals',
                                    style: theme.textTheme.titleLarge),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                child: Column(
                                  children: dealHotels
                                      .take(3)
                                      .map((hotel) => Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 12.0),
                                            child: _buildDealCard(hotel, theme),
                                          ))
                                      .toList(),
                                ),
                              ),
                              const SizedBox(height: 24),
                            ],
                            FutureBuilder<List<Hotel>>(
                              future: _allHotelsFuture,
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const Center(
                                      child: Padding(
                                          padding: EdgeInsets.all(32.0),
                                          child: CircularProgressIndicator()));
                                }
                                if (snapshot.hasError) {
                                  return Center(
                                      child: Text(
                                          'Error loading hotels: ${snapshot.error}'));
                                }
                                if (!snapshot.hasData ||
                                    snapshot.data!.isEmpty) {
                                  return const Center(
                                      child: Text('No hotels found.'));
                                }

                                final allHotels = snapshot.data!;
                                final topRatedHotels = allHotels
                                    .where((h) => h.rate >= 4.5)
                                    .toList();
                                final nearbyHotels = allHotels
                                    .where((h) =>
                                        h.city.toLowerCase().contains('cairo'))
                                    .toList();

                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if (topRatedHotels.isNotEmpty) ...[
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16.0),
                                        child: Text('Top Rated',
                                            style: theme.textTheme.titleLarge),
                                      ),
                                      const SizedBox(height: 16),
                                      SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16.0),
                                        child: Row(
                                          children: topRatedHotels
                                              .map((hotel) =>
                                                  _buildHotelCard(hotel, theme))
                                              .toList(),
                                        ),
                                      ),
                                      const SizedBox(height: 32),
                                    ],
                                    if (nearbyHotels.isNotEmpty) ...[
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16.0),
                                        child: Text('Nearby Hotel',
                                            style: theme.textTheme.titleLarge),
                                      ),
                                      const SizedBox(height: 16),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16.0),
                                        child: Column(
                                          children: nearbyHotels
                                              .map((hotel) =>
                                                  _buildNearbyHotelCard(
                                                      hotel, theme))
                                              .toList(),
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                    ]
                                  ],
                                );
                              },
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: CustomBottomNavigationBar(
              currentIndex: 0,
              onTap: (int index) {
                if (index == 1) {
                  // --- التعديل هنا ---
                  // تم تعديل التنقل ليتوافق مع المُنشئ الجديد لـ FavoritesScreen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const FavoritesScreen(), // لا حاجة لتمرير userTags
                    ),
                  );
                }
                // يمكنك إضافة تنقلات أخرى للـ indexes الأخرى إذا لزم الأمر
              },
            ),
          ),
        ],
      ),
    );
  }

  // ... باقي الدوال المساعدة (_buildServiceButton, _buildDealCard, etc.) تبقى كما هي ...

  Widget _buildServiceButton(
      IconData icon, String label, int index, ThemeData theme) {
    final isSelected = _selectedIndex == index;
    final colorScheme = theme.colorScheme;

    return GestureDetector(
      onTap: () {
        if (index == 0) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const FlightsScreen()));
        } else if (index == 1) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const HotelsSearchScreen()));
        } else if (index == 2) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const CarRentalScreen()));
        } else if (index == 3) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const TaxiSearchScreen()));
        }
        setState(() => _selectedIndex = index);
        Future.delayed(const Duration(milliseconds: 150), () {
          if (mounted) {
            setState(() => _selectedIndex = 1);
          }
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? colorScheme.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon,
                color: isSelected
                    ? colorScheme.onPrimary
                    : colorScheme.onSurface.withOpacity(0.6),
                size: 24),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: isSelected
                    ? colorScheme.onPrimary
                    : colorScheme.onSurface.withOpacity(0.8),
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                fontSize: 11,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDealCard(Hotel hotel, ThemeData theme) {
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HotelDetailsScreen(hotelId: hotel.id),
          ),
        );
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Row(
          children: [
            SizedBox(
              height: 130,
              width: 120,
              child: Image.network(
                hotel.primaryImageUrl,
                fit: BoxFit.cover,
                errorBuilder: (ctx, err, st) => Container(
                  color: colorScheme.surfaceVariant,
                  child: Icon(Icons.broken_image,
                      color: colorScheme.onSurfaceVariant),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(hotel.name,
                        style: textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Icon(Icons.location_on_outlined,
                                  color: colorScheme.onSurface.withOpacity(0.6),
                                  size: 14),
                              const SizedBox(width: 3),
                              Expanded(
                                child: Text('${hotel.city}, ${hotel.countery}',
                                    style: textTheme.bodySmall?.copyWith(
                                        color: colorScheme.onSurface
                                            .withOpacity(0.8)),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color:
                                colorScheme.primaryContainer.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.star,
                                  color: colorScheme.primary, size: 14),
                              const SizedBox(width: 3),
                              Text(hotel.rate.toString(),
                                  style: textTheme.labelMedium?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: colorScheme.primary)),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(hotel.formattedPrice,
                        style: textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold)),
                    Text('Per Night', style: textTheme.labelSmall),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHotelCard(Hotel hotel, ThemeData theme) {
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HotelDetailsScreen(hotelId: hotel.id),
          ),
        );
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        margin: const EdgeInsets.only(right: 16),
        child: SizedBox(
          width: 260,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                  SizedBox(
                    height: 140,
                    width: double.infinity,
                    child: Image.network(
                      hotel.primaryImageUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (ctx, err, st) => Container(
                        color: colorScheme.surfaceVariant,
                        child: Icon(Icons.business,
                            color: colorScheme.onSurfaceVariant),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: GestureDetector(
                      onTap: () => toggleFavoriteHotelCard(hotel),
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.5),
                            shape: BoxShape.circle),
                        child: Icon(
                          hotel.isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: hotel.isFavorite
                              ? colorScheme.primary
                              : Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(hotel.name,
                              style: textTheme.titleMedium
                                  ?.copyWith(fontWeight: FontWeight.bold),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis),
                        ),
                        const SizedBox(width: 8),
                        Row(
                          children: [
                            Icon(Icons.star,
                                color: colorScheme.primary, size: 16),
                            const SizedBox(width: 4),
                            Text(hotel.rate.toString(),
                                style: textTheme.bodyMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: colorScheme.primary)),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.location_on_outlined,
                            color: colorScheme.onSurface.withOpacity(0.6),
                            size: 14),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text('${hotel.city}, ${hotel.countery}',
                              style: textTheme.bodySmall?.copyWith(
                                  color:
                                      colorScheme.onSurface.withOpacity(0.8)),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(hotel.formattedPrice,
                        style: textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold)),
                    Text('Per Night', style: textTheme.labelSmall),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNearbyHotelCard(Hotel hotel, ThemeData theme) {
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HotelDetailsScreen(hotelId: hotel.id),
          ),
        );
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        margin: const EdgeInsets.only(bottom: 16),
        child: Row(
          children: [
            SizedBox(
              height: 120,
              width: 120,
              child: Image.network(
                hotel.primaryImageUrl,
                fit: BoxFit.cover,
                errorBuilder: (ctx, err, st) => Container(
                  color: colorScheme.surfaceVariant,
                  child: Icon(Icons.broken_image,
                      color: colorScheme.onSurfaceVariant),
                ),
              ),
            ),
            Expanded(
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
                          child: Text(hotel.name,
                              style: textTheme.titleMedium
                                  ?.copyWith(fontWeight: FontWeight.bold),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis),
                        ),
                        const SizedBox(width: 8),
                        Row(
                          children: [
                            Icon(Icons.star,
                                color: colorScheme.primary, size: 18),
                            const SizedBox(width: 4),
                            Text(hotel.rate.toString(),
                                style: textTheme.bodyLarge?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: colorScheme.primary)),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Icon(Icons.location_on_outlined,
                            color: colorScheme.onSurface.withOpacity(0.6),
                            size: 14),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text('${hotel.city}, ${hotel.countery}',
                              style: textTheme.bodyMedium?.copyWith(
                                  color:
                                      colorScheme.onSurface.withOpacity(0.8)),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(hotel.formattedPrice,
                            style: textTheme.titleMedium
                                ?.copyWith(fontWeight: FontWeight.bold)),
                        Text('Per Night', style: textTheme.labelSmall),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showCountryPicker() {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    showCountryPicker(
      context: context,
      showPhoneCode: false,
      onSelect: (Country country) {
        setState(() => selectedCountry = country);
      },
      countryListTheme: CountryListThemeData(
        bottomSheetHeight: MediaQuery.of(context).size.height * 0.7,
        backgroundColor: theme.bottomSheetTheme.modalBackgroundColor ??
            theme.dialogBackgroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        inputDecoration: InputDecoration(
          labelText: 'Search Country',
          hintStyle: TextStyle(color: theme.hintColor),
          prefixIcon: Icon(Icons.search, color: colorScheme.primary),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  BorderSide(color: colorScheme.outline.withOpacity(0.3))),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:
                  BorderSide(color: colorScheme.outline.withOpacity(0.3))),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: colorScheme.primary, width: 1.5)),
        ),
        searchTextStyle: theme.textTheme.bodyLarge,
        textStyle: theme.textTheme.bodyMedium
            ?.copyWith(color: colorScheme.onSurface.withOpacity(0.8)),
      ),
    );
  }
}
