// // // // // import 'package:flutter/material.dart';
// // // // // import '../widgets/favorite_hotel_card.dart';
// // // // // import '../widgets/custom_bottom_navigation_bar.dart';

// // // // // class FavoritesScreen extends StatelessWidget {
// // // // //   const FavoritesScreen({super.key});

// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     return Scaffold(
// // // // //       backgroundColor: Colors.white,
// // // // //       body: Stack(
// // // // //         children: [
// // // // //           // Main Content
// // // // //           SafeArea(
// // // // //             child: Padding(
// // // // //               padding: const EdgeInsets.all(16.0),
// // // // //               child: Column(
// // // // //                 crossAxisAlignment: CrossAxisAlignment.start,
// // // // //                 children: [
// // // // //                   const Text(
// // // // //                     'Favourite',
// // // // //                     style: TextStyle(
// // // // //                       fontSize: 32,
// // // // //                       fontWeight: FontWeight.bold,
// // // // //                       color: Colors.black,
// // // // //                     ),
// // // // //                   ),
// // // // //                   const SizedBox(height: 24),
// // // // //                   Expanded(
// // // // //                     child: ListView(
// // // // //                       children: const [
// // // // //                         // Favorite Hotels
// // // // //                         FavoriteHotelCard(
// // // // //                           hotelName: 'The Union Club Hotel',
// // // // //                           location: 'Indiana, USA',
// // // // //                           rating: 4.5,
// // // // //                           price: 'EGP 5,268',
// // // // //                           imageUrl: 'assets/onboarding11.jpeg', isFavorite: null, onTapFavorite: () {  },
// // // // //                         ),
// // // // //                         SizedBox(height: 16),
// // // // //                         FavoriteHotelCard(
// // // // //                           hotelName: 'The White Palace Hotel',
// // // // //                           location: 'Cairo, Egypt',
// // // // //                           rating: 4.5,
// // // // //                           price: 'EGP 2,839',
// // // // //                           imageUrl: 'assets/onboarding11.jpeg',
// // // // //                         ),

// // // // //                         // Suggestion Section
// // // // //                         SizedBox(height: 32),
// // // // //                         Text(
// // // // //                           'Suggestion',
// // // // //                           style: TextStyle(
// // // // //                             fontSize: 24,
// // // // //                             fontWeight: FontWeight.bold,
// // // // //                             color: Colors.black,
// // // // //                           ),
// // // // //                         ),
// // // // //                         SizedBox(height: 16),

// // // // //                         // Suggested Hotels
// // // // //                         FavoriteHotelCard(
// // // // //                           hotelName: 'Top pyramids Hotel',
// // // // //                           location: 'Cairo, Egypt',
// // // // //                           rating: 4.4,
// // // // //                           price: 'EGP 3,592',
// // // // //                           imageUrl: 'assets/onboarding11.jpeg',
// // // // //                         ),
// // // // //                         SizedBox(height: 16),
// // // // //                         FavoriteHotelCard(
// // // // //                           hotelName: 'Country Inn Hotel',
// // // // //                           location: 'Indiana, USA',
// // // // //                           rating: 4.1,
// // // // //                           price: 'EGP 4,818',
// // // // //                           imageUrl: 'assets/onboarding11.jpeg',
// // // // //                         ),
// // // // //                         // Add padding at bottom for navigation bar
// // // // //                         SizedBox(height: 100),
// // // // //                       ],
// // // // //                     ),
// // // // //                   ),
// // // // //                 ],
// // // // //               ),
// // // // //             ),
// // // // //           ),

// // // // //           // Bottom Navigation Bar
// // // // //           Positioned(
// // // // //             bottom: 20,
// // // // //             left: 0,
// // // // //             right: 0,
// // // // //             child: Center(
// // // // //               child: CustomBottomNavigationBar(currentIndex: 1, onTap: (int index) {  },),
// // // // //             ),
// // // // //           ),
// // // // //         ],
// // // // //       ),
// // // // //     );
// // // // //   }
// // // // }
// // // import 'package:flutter/material.dart';
// // // import 'package:travella/services/api/api_endpoints.dart';
// // // import 'package:travella/services/hotel_api_service.dart';
// // // import 'package:travella/models/hotel_model.dart';
// // // import '../widgets/favorite_hotel_card.dart';
// // // import '../widgets/custom_bottom_navigation_bar.dart';

// // // class FavoritesScreen extends StatefulWidget {
// // //   const FavoritesScreen({super.key});

// // //   @override
// // //   State<FavoritesScreen> createState() => _FavoritesScreenState();
// // // }

// // // class _FavoritesScreenState extends State<FavoritesScreen> {
// // //   final HotelApiService _hotelApiService = HotelApiService();
// // //   late Future<List<Hotel>> _favoriteHotelsFuture;
// // //   late Future<List<Hotel>> _suggestionHotelsFuture;

// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     _loadData();
// // //   }

// // //   void _loadData() {
// // //     _favoriteHotelsFuture = _hotelApiService.getFavoriteHotels();
// // //     _suggestionHotelsFuture = _hotelApiService.getSuggestions();
// // //   }

// // //   void _retry() {
// // //     setState(() {
// // //       _loadData();
// // //     });
// // //   }

// // //   void _loginAgain(BuildContext context) {
// // //     Navigator.pushReplacementNamed(context, '/login');
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       backgroundColor: Colors.white,
// // //       body: Stack(
// // //         children: [
// // //           SafeArea(
// // //             child: Padding(
// // //               padding: const EdgeInsets.all(16.0),
// // //               child: Column(
// // //                 crossAxisAlignment: CrossAxisAlignment.start,
// // //                 children: [
// // //                   const Text(
// // //                     'Favourite',
// // //                     style: TextStyle(
// // //                       fontSize: 32,
// // //                       fontWeight: FontWeight.bold,
// // //                       color: Colors.black,
// // //                     ),
// // //                   ),
// // //                   const SizedBox(height: 24),
// // //                   Expanded(
// // //                     child: ListView(
// // //                       children: [
// // //                         FutureBuilder<List<Hotel>>(
// // //                           future: _favoriteHotelsFuture,
// // //                           builder: (context, snapshot) {
// // //                             if (snapshot.connectionState ==
// // //                                 ConnectionState.waiting) {
// // //                               return const Center(
// // //                                   child: CircularProgressIndicator());
// // //                             }
// // //                             if (snapshot.hasError) {
// // //                               return Center(
// // //                                 child: Column(
// // //                                   mainAxisAlignment: MainAxisAlignment.center,
// // //                                   children: [
// // //                                     Text('Error: ${snapshot.error}'),
// // //                                     const SizedBox(height: 10),
// // //                                     ElevatedButton(
// // //                                       onPressed: _retry,
// // //                                       child: const Text('Retry'),
// // //                                     ),
// // //                                     if (snapshot.error
// // //                                         .toString()
// // //                                         .contains('Unauthorized'))
// // //                                       ElevatedButton(
// // //                                         onPressed: () => _loginAgain(context),
// // //                                         child: const Text('Log in Again'),
// // //                                       ),
// // //                                   ],
// // //                                 ),
// // //                               );
// // //                             }
// // //                             if (!snapshot.hasData || snapshot.data!.isEmpty) {
// // //                               return const Center(
// // //                                   child: Text('No favorite hotels found.'));
// // //                             }
// // //                             final favoriteHotels = snapshot.data!;
// // //                             return Column(
// // //                               children: favoriteHotels.map((hotel) {
// // //                                 return Padding(
// // //                                   padding: const EdgeInsets.only(bottom: 16.0),
// // //                                   child: FavoriteHotelCard(
// // //                                     hotelName: hotel.name,
// // //                                     location:
// // //                                         '${hotel.city}, ${hotel.countery}',
// // //                                     rating: hotel.rate,
// // //                                     price:
// // //                                         'EGP ${hotel.discountedPrice ?? hotel.price}',
// // //                                     imageUrl: hotel.imageUrls.isNotEmpty
// // //                                         ? '${ApiEndpoints.imageUrlBase}${hotel.imageUrls[0]}'
// // //                                         : 'assets/onboarding11.jpeg',
// // //                                     isFavorite: true,
// // //                                     onTapFavorite: () => _hotelApiService
// // //                                         .toggleFavorite(hotel.id),
// // //                                     onTap: () {},
// // //                                   ),
// // //                                 );
// // //                               }).toList(),
// // //                             );
// // //                           },
// // //                         ),
// // //                         const SizedBox(height: 32),
// // //                         const Text(
// // //                           'Suggestion',
// // //                           style: TextStyle(
// // //                             fontSize: 24,
// // //                             fontWeight: FontWeight.bold,
// // //                             color: Colors.black,
// // //                           ),
// // //                         ),
// // //                         const SizedBox(height: 16),
// // //                         FutureBuilder<List<Hotel>>(
// // //                           future: _suggestionHotelsFuture,
// // //                           builder: (context, snapshot) {
// // //                             if (snapshot.connectionState ==
// // //                                 ConnectionState.waiting) {
// // //                               return const Center(
// // //                                   child: CircularProgressIndicator());
// // //                             }
// // //                             if (snapshot.hasError) {
// // //                               return Center(
// // //                                   child: Text('Error: ${snapshot.error}'));
// // //                             }
// // //                             if (!snapshot.hasData || snapshot.data!.isEmpty) {
// // //                               return const Center(
// // //                                   child: Text('No suggestions found.'));
// // //                             }
// // //                             final suggestionHotels = snapshot.data!;
// // //                             return Column(
// // //                               children: suggestionHotels.map((hotel) {
// // //                                 return Padding(
// // //                                   padding: const EdgeInsets.only(bottom: 16.0),
// // //                                   child: FavoriteHotelCard(
// // //                                     hotelName: hotel.name,
// // //                                     location:
// // //                                         '${hotel.city}, ${hotel.countery}',
// // //                                     rating: hotel.rate,
// // //                                     price:
// // //                                         'EGP ${hotel.discountedPrice ?? hotel.price}',
// // //                                     imageUrl: hotel.imageUrls.isNotEmpty
// // //                                         ? '${ApiEndpoints.imageUrlBase}${hotel.imageUrls[0]}'
// // //                                         : 'assets/onboarding11.jpeg',
// // //                                     isFavorite: hotel.isFavorite,
// // //                                     onTapFavorite: () => _hotelApiService
// // //                                         .toggleFavorite(hotel.id),
// // //                                     onTap: () {},
// // //                                   ),
// // //                                 );
// // //                               }).toList(),
// // //                             );
// // //                           },
// // //                         ),
// // //                         const SizedBox(height: 100),
// // //                       ],
// // //                     ),
// // //                   ),
// // //                 ],
// // //               ),
// // //             ),
// // //           ),
// // //           Positioned(
// // //             bottom: 20,
// // //             left: 0,
// // //             right: 0,
// // //             child: Center(
// // //               child: CustomBottomNavigationBar(
// // //                 currentIndex: 1,
// // //                 onTap: (index) {
// // //                   // التعامل مع التنقل إذا لزم الأمر
// // //                 },
// // //               ),
// // //             ),
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }
// // // }

// // // // import 'package:flutter/material.dart';
// // // // import 'package:travella/screens/HotelDetailsScreen.dart';
// // // // import 'package:travella/services/api/api_endpoints.dart';
// // // // import 'package:travella/services/hotel_api_service.dart';
// // // // import 'package:travella/models/hotel_model.dart';
// // // // import '../widgets/favorite_hotel_card.dart';
// // // // import '../widgets/custom_bottom_navigation_bar.dart';

// // // // class FavoritesScreen extends StatefulWidget {
// // // //   const FavoritesScreen({super.key});

// // // //   @override
// // // //   State<FavoritesScreen> createState() => _FavoritesScreenState();
// // // // }

// // // // class _FavoritesScreenState extends State<FavoritesScreen> {
// // // //   final HotelApiService _hotelApiService = HotelApiService();
// // // //   late Future<List<Hotel>> _favoriteHotelsFuture;
// // // //   late Future<List<Hotel>> _suggestionHotelsFuture;

// // // //   @override
// // // //   void initState() {
// // // //     super.initState();
// // // //     _loadData();
// // // //   }

// // // //   void _loadData() {
// // // //     _favoriteHotelsFuture = _hotelApiService.getFavoriteHotels();
// // // //     _suggestionHotelsFuture = _hotelApiService.getSuggestions();
// // // //   }

// // // //   void _retry() {
// // // //     setState(() {
// // // //       _loadData();
// // // //     });
// // // //   }

// // // //   void _loginAgain(BuildContext context) {
// // // //     Navigator.pushReplacementNamed(context, '/login');
// // // //   }

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Scaffold(
// // // //       backgroundColor: Colors.white,
// // // //       body: Stack(
// // // //         children: [
// // // //           SafeArea(
// // // //             child: Padding(
// // // //               padding: const EdgeInsets.all(16.0),
// // // //               child: Column(
// // // //                 crossAxisAlignment: CrossAxisAlignment.start,
// // // //                 children: [
// // // //                   const Text(
// // // //                     'Favourite',
// // // //                     style: TextStyle(
// // // //                       fontSize: 32,
// // // //                       fontWeight: FontWeight.bold,
// // // //                       color: Colors.black,
// // // //                     ),
// // // //                   ),
// // // //                   const SizedBox(height: 24),
// // // //                   Expanded(
// // // //                     child: ListView(
// // // //                       children: [
// // // //                         FutureBuilder<List<Hotel>>(
// // // //                           future: _favoriteHotelsFuture,
// // // //                           builder: (context, snapshot) {
// // // //                             if (snapshot.connectionState ==
// // // //                                 ConnectionState.waiting) {
// // // //                               return const Center(
// // // //                                   child: CircularProgressIndicator());
// // // //                             }
// // // //                             if (snapshot.hasError) {
// // // //                               return Center(
// // // //                                 child: Column(
// // // //                                   mainAxisAlignment: MainAxisAlignment.center,
// // // //                                   children: [
// // // //                                     Text('Error: ${snapshot.error}'),
// // // //                                     const SizedBox(height: 10),
// // // //                                     ElevatedButton(
// // // //                                       onPressed: _retry,
// // // //                                       child: const Text('Retry'),
// // // //                                     ),
// // // //                                     if (snapshot.error
// // // //                                         .toString()
// // // //                                         .contains('Unauthorized'))
// // // //                                       ElevatedButton(
// // // //                                         onPressed: () => _loginAgain(context),
// // // //                                         child: const Text('Log in Again'),
// // // //                                       ),
// // // //                                   ],
// // // //                                 ),
// // // //                               );
// // // //                             }
// // // //                             if (!snapshot.hasData || snapshot.data!.isEmpty) {
// // // //                               return const Center(
// // // //                                   child: Text('No favorite hotels found.'));
// // // //                             }
// // // //                             final favoriteHotels = snapshot.data!;
// // // //                             return Column(
// // // //                               children: favoriteHotels.map((hotel) {
// // // //                                 return Padding(
// // // //                                   padding: const EdgeInsets.only(bottom: 16.0),
// // // //                                   child: FavoriteHotelCard(
// // // //                                     hotelName: hotel.name,
// // // //                                     location:
// // // //                                         '${hotel.city}, ${hotel.countery}',
// // // //                                     rating: hotel.rate,
// // // //                                     price:
// // // //                                         'EGP ${hotel.discountedPrice ?? hotel.price}',
// // // //                                     imageUrl: hotel.imageUrls.isNotEmpty
// // // //                                         ? '${ApiEndpoints.imageUrlBase}${hotel.imageUrls[0]}'
// // // //                                         : 'assets/onboarding11.jpeg',
// // // //                                     isFavorite: true,
// // // //                                     onTapFavorite: () => _hotelApiService
// // // //                                         .toggleFavorite(hotel.id),
// // // //                                     onTap: () {
// // // //                                       Navigator.push(
// // // //                                         context,
// // // //                                         MaterialPageRoute(
// // // //                                           builder: (context) =>
// // // //                                               HotelDetailsScreen(
// // // //                                                   hotelId: hotel.id),
// // // //                                         ),
// // // //                                       );
// // // //                                     },
// // // //                                   ),
// // // //                                 );
// // // //                               }).toList(),
// // // //                             );
// // // //                           },
// // // //                         ),
// // // //                         const SizedBox(height: 32),
// // // //                         const Text(
// // // //                           'Suggestion',
// // // //                           style: TextStyle(
// // // //                             fontSize: 24,
// // // //                             fontWeight: FontWeight.bold,
// // // //                             color: Colors.black,
// // // //                           ),
// // // //                         ),
// // // //                         const SizedBox(height: 16),
// // // //                         FutureBuilder<List<Hotel>>(
// // // //                           future: _suggestionHotelsFuture,
// // // //                           builder: (context, snapshot) {
// // // //                             if (snapshot.connectionState ==
// // // //                                 ConnectionState.waiting) {
// // // //                               return const Center(
// // // //                                   child: CircularProgressIndicator());
// // // //                             }
// // // //                             if (snapshot.hasError) {
// // // //                               return Center(
// // // //                                   child: Text('Error: ${snapshot.error}'));
// // // //                             }
// // // //                             if (!snapshot.hasData || snapshot.data!.isEmpty) {
// // // //                               return const Center(
// // // //                                   child: Text('No suggestions found.'));
// // // //                             }
// // // //                             final suggestionHotels = snapshot.data!;
// // // //                             return Column(
// // // //                               children: suggestionHotels.map((hotel) {
// // // //                                 return Padding(
// // // //                                   padding: const EdgeInsets.only(bottom: 16.0),
// // // //                                   child: FavoriteHotelCard(
// // // //                                     hotelName: hotel.name,
// // // //                                     location:
// // // //                                         '${hotel.city}, ${hotel.countery}',
// // // //                                     rating: hotel.rate,
// // // //                                     price:
// // // //                                         'EGP ${hotel.discountedPrice ?? hotel.price}',
// // // //                                     imageUrl: hotel.imageUrls.isNotEmpty
// // // //                                         ? '${ApiEndpoints.imageUrlBase}${hotel.imageUrls[0]}'
// // // //                                         : 'assets/onboarding11.jpeg',
// // // //                                     isFavorite: hotel.isFavorite,
// // // //                                     onTapFavorite: () => _hotelApiService
// // // //                                         .toggleFavorite(hotel.id),
// // // //                                     onTap: () {
// // // //                                       Navigator.push(
// // // //                                         context,
// // // //                                         MaterialPageRoute(
// // // //                                           builder: (context) =>
// // // //                                               HotelDetailsScreen(
// // // //                                                   hotelId: hotel.id),
// // // //                                         ),
// // // //                                       );
// // // //                                     },
// // // //                                   ),
// // // //                                 );
// // // //                               }).toList(),
// // // //                             );
// // // //                           },
// // // //                         ),
// // // //                         const SizedBox(height: 100),
// // // //                       ],
// // // //                     ),
// // // //                   ),
// // // //                 ],
// // // //               ),
// // // //             ),
// // // //           ),
// // // //           Positioned(
// // // //             bottom: 20,
// // // //             left: 0,
// // // //             right: 0,
// // // //             child: Center(
// // // //               child: CustomBottomNavigationBar(
// // // //                 currentIndex: 1,
// // // //                 onTap: (index) {
// // // //                   // التعامل مع التنقل إذا لزم الأمر
// // // //                 },
// // // //               ),
// // // //             ),
// // // //           ),
// // // //         ],
// // // //       ),
// // // //     );
// // // //   }
// // // // }
// // import 'package:flutter/material.dart';
// // import 'package:travella/screens/HotelDetailsScreen.dart';
// // import 'package:travella/services/api/api_endpoints.dart';
// // import 'package:travella/services/hotel_api_service.dart';
// // import 'package:travella/models/hotel_model.dart';
// // import '../widgets/favorite_hotel_card.dart';
// // import '../widgets/custom_bottom_navigation_bar.dart';

// // class FavoritesScreen extends StatefulWidget {
// //   const FavoritesScreen({super.key});

// //   @override
// //   State<FavoritesScreen> createState() => _FavoritesScreenState();
// // }

// // class _FavoritesScreenState extends State<FavoritesScreen> {
// //   final HotelApiService _hotelApiService = HotelApiService();
// //   late Future<List<Hotel>> _favoriteHotelsFuture;
// //   late Future<List<Hotel>> _suggestionHotelsFuture;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _loadData();
// //   }

// //   void _loadData() {
// //     _favoriteHotelsFuture = _hotelApiService.getFavoriteHotels();
// //     _suggestionHotelsFuture = _hotelApiService.getSuggestions();
// //   }

// //   void _retry() {
// //     setState(() {
// //       _loadData();
// //     });
// //   }

// //   void _loginAgain(BuildContext context) {
// //     Navigator.pushReplacementNamed(context, '/login');
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.white,
// //       body: Stack(
// //         children: [
// //           SafeArea(
// //             child: Padding(
// //               padding: const EdgeInsets.all(16.0),
// //               child: Column(
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 children: [
// //                   const Text(
// //                     'Favourite',
// //                     style: TextStyle(
// //                       fontSize: 32,
// //                       fontWeight: FontWeight.bold,
// //                       color: Colors.black,
// //                     ),
// //                   ),
// //                   const SizedBox(height: 24),
// //                   Expanded(
// //                     child: ListView(
// //                       children: [
// //                         FutureBuilder<List<Hotel>>(
// //                           future: _favoriteHotelsFuture,
// //                           builder: (context, snapshot) {
// //                             if (snapshot.connectionState ==
// //                                 ConnectionState.waiting) {
// //                               return const Center(
// //                                   child: CircularProgressIndicator());
// //                             }
// //                             if (snapshot.hasError) {
// //                               return Center(
// //                                 child: Column(
// //                                   mainAxisAlignment: MainAxisAlignment.center,
// //                                   children: [
// //                                     Text('Error: ${snapshot.error}'),
// //                                     const SizedBox(height: 10),
// //                                     ElevatedButton(
// //                                       onPressed: _retry,
// //                                       child: const Text('Retry'),
// //                                     ),
// //                                     if (snapshot.error
// //                                         .toString()
// //                                         .contains('Unauthorized'))
// //                                       ElevatedButton(
// //                                         onPressed: () => _loginAgain(context),
// //                                         child: const Text('Log in Again'),
// //                                       ),
// //                                   ],
// //                                 ),
// //                               );
// //                             }
// //                             if (!snapshot.hasData || snapshot.data!.isEmpty) {
// //                               return const Center(
// //                                   child: Text('No favorite hotels found.'));
// //                             }
// //                             final favoriteHotels = snapshot.data!;
// //                             return Column(
// //                               children: favoriteHotels.map((hotel) {
// //                                 return Padding(
// //                                   padding: const EdgeInsets.only(bottom: 16.0),
// //                                   child: FavoriteHotelCard(
// //                                     hotelName: hotel.name,
// //                                     location:
// //                                         '${hotel.city}, ${hotel.countery}',
// //                                     rating: hotel.rate,
// //                                     price:
// //                                         'EGP ${hotel.discountedPrice ?? hotel.price}',
// //                                     imageUrl: hotel.imageUrls.isNotEmpty
// //                                         ? '${ApiEndpoints.imageUrlBase}${hotel.imageUrls[0]}'
// //                                         : 'https://via.placeholder.com/100x120.png?text=No+Image',
// //                                     isFavorite: true,
// //                                     onTapFavorite: () => _hotelApiService
// //                                         .toggleFavorite(hotel.id),
// //                                     onTap: () {
// //                                       Navigator.push(
// //                                         context,
// //                                         MaterialPageRoute(
// //                                           builder: (context) =>
// //                                               HotelDetailsScreen(
// //                                                   hotelId: hotel.id),
// //                                         ),
// //                                       );
// //                                     },
// //                                   ),
// //                                 );
// //                               }).toList(),
// //                             );
// //                           },
// //                         ),
// //                         const SizedBox(height: 32),
// //                         const Text(
// //                           'Suggestion',
// //                           style: TextStyle(
// //                             fontSize: 24,
// //                             fontWeight: FontWeight.bold,
// //                             color: Colors.black,
// //                           ),
// //                         ),
// //                         const SizedBox(height: 16),
// //                         FutureBuilder<List<Hotel>>(
// //                           future: _suggestionHotelsFuture,
// //                           builder: (context, snapshot) {
// //                             if (snapshot.connectionState ==
// //                                 ConnectionState.waiting) {
// //                               return const Center(
// //                                   child: CircularProgressIndicator());
// //                             }
// //                             if (snapshot.hasError) {
// //                               return Center(
// //                                   child: Text('Error: ${snapshot.error}'));
// //                             }
// //                             if (!snapshot.hasData || snapshot.data!.isEmpty) {
// //                               return const Center(
// //                                   child: Text('No suggestions found.'));
// //                             }
// //                             final suggestionHotels = snapshot.data!;
// //                             return Column(
// //                               children: suggestionHotels.map((hotel) {
// //                                 return Padding(
// //                                   padding: const EdgeInsets.only(bottom: 16.0),
// //                                   child: FavoriteHotelCard(
// //                                     hotelName: hotel.name,
// //                                     location:
// //                                         '${hotel.city}, ${hotel.countery}',
// //                                     rating: hotel.rate,
// //                                     price:
// //                                         'EGP ${hotel.discountedPrice ?? hotel.price}',
// //                                     imageUrl: hotel.imageUrls.isNotEmpty
// //                                         ? '${ApiEndpoints.imageUrlBase}${hotel.imageUrls[0]}'
// //                                         : 'https://via.placeholder.com/100x120.png?text=No+Image',
// //                                     isFavorite: hotel.isFavorite,
// //                                     onTapFavorite: () => _hotelApiService
// //                                         .toggleFavorite(hotel.id),
// //                                     onTap: () {
// //                                       Navigator.push(
// //                                         context,
// //                                         MaterialPageRoute(
// //                                           builder: (context) =>
// //                                               HotelDetailsScreen(
// //                                                   hotelId: hotel.id),
// //                                         ),
// //                                       );
// //                                     },
// //                                   ),
// //                                 );
// //                               }).toList(),
// //                             );
// //                           },
// //                         ),
// //                         const SizedBox(height: 100),
// //                       ],
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ),
// //           Positioned(
// //             bottom: 20,
// //             left: 0,
// //             right: 0,
// //             child: Center(
// //               child: CustomBottomNavigationBar(
// //                 currentIndex: 1,
// //                 onTap: (index) {
// //                   // التعامل مع التنقل إذا لزم الأمر
// //                 },
// //               ),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:travella/screens/HotelDetailsScreen.dart';
// import 'package:travella/services/api/api_endpoints.dart';
// import 'package:travella/services/hotel_api_service.dart';
// import 'package:travella/models/hotel_model.dart';
// import '../widgets/favorite_hotel_card.dart';
// import '../widgets/custom_bottom_navigation_bar.dart';

// class FavoritesScreen extends StatefulWidget {
//   const FavoritesScreen({super.key});

//   @override
//   State<FavoritesScreen> createState() => _FavoritesScreenState();
// }

// class _FavoritesScreenState extends State<FavoritesScreen> {
//   final HotelApiService _hotelApiService = HotelApiService();
//   late Future<List<Hotel>> _favoriteHotelsFuture;
//   late Future<List<Hotel>> _suggestionHotelsFuture;

//   @override
//   void initState() {
//     super.initState();
//     _loadData();
//   }

//   void _loadData() {
//     _favoriteHotelsFuture = _hotelApiService.getFavoriteHotels();
//     _suggestionHotelsFuture = _hotelApiService.getSuggestions();
//   }

//   void _retry() {
//     setState(() {
//       _loadData();
//     });
//   }

//   void _loginAgain(BuildContext context) {
//     Navigator.pushReplacementNamed(context, '/login');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Stack(
//         children: [
//           SafeArea(
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text(
//                     'Favourite',
//                     style: TextStyle(
//                       fontSize: 32,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black,
//                     ),
//                   ),
//                   const SizedBox(height: 24),
//                   Expanded(
//                     child: ListView(
//                       children: [
//                         FutureBuilder<List<Hotel>>(
//                           future: _favoriteHotelsFuture,
//                           builder: (context, snapshot) {
//                             if (snapshot.connectionState ==
//                                 ConnectionState.waiting) {
//                               return const Center(
//                                   child: CircularProgressIndicator());
//                             }
//                             if (snapshot.hasError) {
//                               return Center(
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Text('Error: ${snapshot.error}'),
//                                     const SizedBox(height: 10),
//                                     ElevatedButton(
//                                       onPressed: _retry,
//                                       child: const Text('Retry'),
//                                     ),
//                                     if (snapshot.error
//                                         .toString()
//                                         .contains('Unauthorized'))
//                                       ElevatedButton(
//                                         onPressed: () => _loginAgain(context),
//                                         child: const Text('Log in Again'),
//                                       ),
//                                   ],
//                                 ),
//                               );
//                             }
//                             if (!snapshot.hasData || snapshot.data!.isEmpty) {
//                               return const Center(
//                                   child: Text('No favorite hotels found.'));
//                             }
//                             final favoriteHotels = snapshot.data!;
//                             return Column(
//                               children: favoriteHotels.map((hotel) {
//                                 return Padding(
//                                   padding: const EdgeInsets.only(bottom: 16.0),
//                                   child: FavoriteHotelCard(
//                                     hotelName: hotel.name,
//                                     location:
//                                         '${hotel.city}, ${hotel.countery}',
//                                     rating: hotel.rate,
//                                     price:
//                                         'EGP ${hotel.discountedPrice ?? hotel.price}',
//                                     imageUrl: hotel.imageUrls.isNotEmpty
//                                         ? '${ApiEndpoints.imageUrlBase}${hotel.imageUrls[0]}'
//                                         : 'https://via.placeholder.com/100x120.png?text=No+Image',
//                                     isFavorite: true,
//                                     onTapFavorite: () => _hotelApiService
//                                         .toggleFavorite(hotel.id),
//                                     onTap: () {
//                                       Navigator.push(
//                                         context,
//                                         MaterialPageRoute(
//                                           builder: (context) =>
//                                               HotelDetailsScreen(
//                                                   hotelId: hotel.id),
//                                         ),
//                                       );
//                                     },
//                                   ),
//                                 );
//                               }).toList(),
//                             );
//                           },
//                         ),
//                         const SizedBox(height: 32),
//                         const Text(
//                           'Suggestion',
//                           style: TextStyle(
//                             fontSize: 24,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black,
//                           ),
//                         ),
//                         const SizedBox(height: 16),
//                         FutureBuilder<List<Hotel>>(
//                           future: _suggestionHotelsFuture,
//                           builder: (context, snapshot) {
//                             if (snapshot.connectionState ==
//                                 ConnectionState.waiting) {
//                               return const Center(
//                                   child: CircularProgressIndicator());
//                             }
//                             if (snapshot.hasError) {
//                               return Center(
//                                   child: Text('Error: ${snapshot.error}'));
//                             }
//                             if (!snapshot.hasData || snapshot.data!.isEmpty) {
//                               return const Center(
//                                   child: Text('No suggestions found.'));
//                             }
//                             final suggestionHotels = snapshot.data!;
//                             return Column(
//                               children: suggestionHotels.map((hotel) {
//                                 return Padding(
//                                   padding: const EdgeInsets.only(bottom: 16.0),
//                                   child: FavoriteHotelCard(
//                                     hotelName: hotel.name,
//                                     location:
//                                         '${hotel.city}, ${hotel.countery}',
//                                     rating: hotel.rate,
//                                     price:
//                                         'EGP ${hotel.discountedPrice ?? hotel.price}',
//                                     imageUrl: hotel.imageUrls.isNotEmpty
//                                         ? '${ApiEndpoints.imageUrlBase}${hotel.imageUrls[0]}'
//                                         : 'https://via.placeholder.com/100x120.png?text=No+Image',
//                                     isFavorite: hotel.isFavorite,
//                                     onTapFavorite: () => _hotelApiService
//                                         .toggleFavorite(hotel.id),
//                                     onTap: () {
//                                       Navigator.push(
//                                         context,
//                                         MaterialPageRoute(
//                                           builder: (context) =>
//                                               HotelDetailsScreen(
//                                                   hotelId: hotel.id),
//                                         ),
//                                       );
//                                     },
//                                   ),
//                                 );
//                               }).toList(),
//                             );
//                           },
//                         ),
//                         const SizedBox(height: 100),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Positioned(
//             bottom: 20,
//             left: 0,
//             right: 0,
//             child: Center(
//               child: CustomBottomNavigationBar(
//                 currentIndex: 1,
//                 onTap: (index) {
//                   // التعامل مع التنقل إذا لزم الأمر
//                 },
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:apptravella/screens/HotelDetailsScreen.dart';
import 'package:apptravella/services/hotel_api_service.dart';
import 'package:apptravella/models/hotel_model.dart'; // للقسم الأول (المفضلة)
import 'package:apptravella/models/recommendation_hotel_model.dart'; // للقسم الثاني (الاقتراحات)
import '../widgets/favorite_hotel_card.dart';
import '../widgets/custom_bottom_navigation_bar.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  final HotelApiService _hotelApiService = HotelApiService();
  // المستقبل الأول يستخدم النموذج الأصلي
  late Future<List<Hotel>> _favoriteHotelsFuture;
  // المستقبل الثاني يستخدم النموذج الجديد الخاص بالتوصيات
  late Future<List<RecommendationHotel>> _suggestionHotelsFuture;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() {
    setState(() {
      _favoriteHotelsFuture = _hotelApiService.getFavoriteHotels();
      _suggestionHotelsFuture = _getAndFilterSuggestions();
    });
  }

  // الدالة تعيد قائمة من النموذج الجديد بعد تطبيق الفلترة
  Future<List<RecommendationHotel>> _getAndFilterSuggestions() async {
    // 1. جلب التوصيات (ستكون من نوع RecommendationHotel)
    final recommendations =
        await _hotelApiService.getHotelRecommendations(userId: 0);

    // 2. قراءة تفضيلات المستخدم
    final prefs = await SharedPreferences.getInstance();
    final userPrefsString = prefs.getString('user_preferences') ?? '';

    // إذا لم تكن هناك تفضيلات، أرجع كل التوصيات
    if (userPrefsString.isEmpty) {
      return recommendations;
    }

    final userPreferenceTags =
        userPrefsString.split(',').where((s) => s.isNotEmpty).toSet();

    // 3. فلترة النتائج بناءً على التفضيلات
    final filteredHotels = recommendations.where((hotel) {
      final hotelTags = hotel.getAllTags();
      return userPreferenceTags.any((userTag) => hotelTags.contains(userTag));
    }).toList();

    return filteredHotels;
  }

  void _retry() {
    _loadData();
  }

  void _loginAgain(BuildContext context) {
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Favourite',
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 24),
                  Expanded(
                    child: RefreshIndicator(
                      onRefresh: () async => _loadData(),
                      child: ListView(
                        children: [
                          // --- قسم المفضلة (يستخدم النموذج الأصلي Hotel) ---
                          FutureBuilder<List<Hotel>>(
                            future: _favoriteHotelsFuture,
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              }
                              if (snapshot.hasError) {
                                return Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Error: ${snapshot.error}'),
                                      const SizedBox(height: 10),
                                      ElevatedButton(
                                        onPressed: _retry,
                                        child: const Text('Retry'),
                                      ),
                                      if (snapshot.error
                                          .toString()
                                          .contains('Unauthorized'))
                                        ElevatedButton(
                                          onPressed: () => _loginAgain(context),
                                          child: const Text('Log in Again'),
                                        ),
                                    ],
                                  ),
                                );
                              }
                              if (!snapshot.hasData || snapshot.data!.isEmpty) {
                                return const Center(
                                    child: Text('No favorite hotels found.'));
                              }
                              final favoriteHotels = snapshot.data!;
                              return Column(
                                children: favoriteHotels.map((hotel) {
                                  return Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 16.0),
                                    child: FavoriteHotelCard(
                                      hotelName: hotel.name,
                                      location:
                                          '${hotel.city}, ${hotel.countery}',
                                      rating: hotel.rate,
                                      price: hotel.formattedPrice,
                                      imageUrl: hotel.primaryImageUrl,
                                      isFavorite:
                                          true, // لأنها من قائمة المفضلة
                                      onTapFavorite: () async {
                                        await _hotelApiService
                                            .toggleFavorite(hotel.id);
                                        _loadData();
                                      },
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  HotelDetailsScreen(
                                                      hotelId: hotel.id),
                                            ));
                                      },
                                    ),
                                  );
                                }).toList(),
                              );
                            },
                          ),
                          const SizedBox(height: 32),
                          const Text('Suggestion',
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold)),
                          const SizedBox(height: 16),
                          // --- قسم الاقتراحات (يستخدم النموذج الجديد RecommendationHotel) ---
                          FutureBuilder<List<RecommendationHotel>>(
                            future: _suggestionHotelsFuture,
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              }
                              if (snapshot.hasError) {
                                return Center(
                                    child: Text(
                                        'Error loading suggestions: ${snapshot.error}'));
                              }
                              if (!snapshot.hasData || snapshot.data!.isEmpty) {
                                return const Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Text(
                                      'No matching suggestions found. Try changing your preferences.',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                );
                              }
                              final suggestionHotels = snapshot.data!;
                              return Column(
                                children: suggestionHotels.map((hotel) {
                                  return Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 16.0),
                                    child: FavoriteHotelCard(
                                      hotelName: hotel.name,
                                      location: hotel.city,
                                      rating: hotel.rate,
                                      price: hotel.formattedPrice,
                                      imageUrl: hotel.fullImageUrl,
                                      // isFavorite يجب التحقق منه مقابل قائمة المفضلة
                                      isFavorite: false, // قيمة افتراضية
                                      onTapFavorite: () {
                                        _hotelApiService
                                            .toggleFavorite(hotel.hotelId);
                                        _loadData();
                                      },
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  HotelDetailsScreen(
                                                      hotelId: hotel.hotelId),
                                            ));
                                      },
                                    ),
                                  );
                                }).toList(),
                              );
                            },
                          ),
                          const SizedBox(
                              height: 100), // مسافة لشريط التنقل السفلي
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Center(
              child: CustomBottomNavigationBar(
                currentIndex: 1,
                onTap: (index) {
                  // يمكن إضافة تنقلات هنا
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
