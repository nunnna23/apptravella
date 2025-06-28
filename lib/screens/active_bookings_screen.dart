// // // import 'package:flutter/material.dart';
// // // // تأكد من أن هذا المسار صحيح لمشروعك
// // // import '../widgets/custom_bottom_navigation_bar.dart'; // استيراد شريط التنقل

// // // class ActiveBookingsScreen extends StatelessWidget {
// // //   const ActiveBookingsScreen({Key? key}) : super(key: key);

// // //   // --- Helper Widget لبناء كارت الفندق (مع استقبال السمة) ---
// // //   Widget _buildHotelCard({
// // //     required BuildContext context,
// // //     required String hotelName,
// // //     required String location,
// // //     required double rating,
// // //     required String price,
// // //     required String placeholderImageUrl,
// // //     required ThemeData theme, // استقبال السمة
// // //   }) {
// // //     final colorScheme = theme.colorScheme;
// // //     final textTheme = theme.textTheme;

// // //     // الألوان الثابتة الأصلية (للرجوع إليها إذا لزم الأمر أثناء التعديل)
// // //     // const Color cardColor = Color(0xFFEEEEEE); // -> colorScheme.surfaceVariant or cardTheme.color
// // //     // const Color primaryTextColor = Color(0xFF2E2E2E); // -> colorScheme.onSurface or textTheme styles
// // //     // const Color secondaryTextColor = Colors.grey; // -> colorScheme.onSurface.withOpacity(0.6) or textTheme.bodySmall color
// // //     // const Color ratingColor = Color(0xFF40738A); // -> colorScheme.primary

// // //     return Card(
// // //       // --- استخدام Card Widget للاستفادة من theme.cardTheme ---
// // //       // تم حذف width, margin, decoration(color, borderRadius, boxShadow)
// // //       // سيتم تطبيقها من CardTheme أو الافتراضيات
// // //       margin: const EdgeInsets.only(right: 16), // الحفاظ على الهامش الأيمن
// // //       clipBehavior: Clip.antiAlias, // لقص الصورة داخل حواف الكارد
// // //       child: SizedBox(
// // //         // --- تحديد العرض الكلي للكارد ---
// // //         width: MediaQuery.of(context).size.width * 0.85,
// // //         child: Row(
// // //           crossAxisAlignment: CrossAxisAlignment.stretch,
// // //           children: [
// // //             // --- قسم الصورة ---
// // //             SizedBox(
// // //               width: 140, // عرض ثابت للصورة
// // //               child: Image.asset(
// // //                 placeholderImageUrl,
// // //                 fit: BoxFit.cover,
// // //                 errorBuilder: (context, error, stackTrace) {
// // //                   // التعامل مع خطأ تحميل الصورة باستخدام ألوان السمة
// // //                   print("Error loading image $placeholderImageUrl: $error");
// // //                   return Container(
// // //                     color: colorScheme.surfaceVariant, // لون خلفية مناسب للخطأ
// // //                     alignment: Alignment.center,
// // //                     child: Icon(Icons.broken_image,
// // //                         color: colorScheme
// // //                             .onSurfaceVariant), // لون أيقونة مناسب للخطأ
// // //                   );
// // //                 },
// // //               ),
// // //             ),
// // //             // --- قسم التفاصيل ---
// // //             Expanded(
// // //               child: Stack(
// // //                 children: [
// // //                   Padding(
// // //                     padding: const EdgeInsets.only(
// // //                         left: 12, right: 12, top: 12, bottom: 12),
// // //                     child: Column(
// // //                       crossAxisAlignment: CrossAxisAlignment.start,
// // //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // //                       children: [
// // //                         // -- اسم الفندق والموقع --
// // //                         Column(
// // //                           crossAxisAlignment: CrossAxisAlignment.start,
// // //                           children: [
// // //                             Text(
// // //                               hotelName,
// // //                               maxLines: 2,
// // //                               overflow: TextOverflow.ellipsis,
// // //                               // --- استخدام نمط نص من السمة لاسم الفندق ---
// // //                               style: textTheme.titleMedium
// // //                                   ?.copyWith(fontWeight: FontWeight.bold),
// // //                             ),
// // //                             const SizedBox(height: 6),
// // //                             Row(
// // //                               children: [
// // //                                 Icon(Icons.location_on_outlined,
// // //                                     size: 16,
// // //                                     // --- استخدام لون نص ثانوي من السمة للأيقونة ---
// // //                                     color:
// // //                                         colorScheme.onSurface.withOpacity(0.6)),
// // //                                 const SizedBox(width: 4),
// // //                                 Expanded(
// // //                                   child: Text(
// // //                                     location,
// // //                                     maxLines: 1,
// // //                                     overflow: TextOverflow.ellipsis,
// // //                                     // --- استخدام نمط نص ثانوي من السمة للموقع ---
// // //                                     style: textTheme.bodySmall?.copyWith(
// // //                                         color: colorScheme.onSurface.withOpacity(
// // //                                             0.8) // أكثر وضوحاً قليلاً من الأيقونة
// // //                                         ),
// // //                                   ),
// // //                                 ),
// // //                               ],
// // //                             ),
// // //                           ],
// // //                         ),
// // //                         // -- السعر --
// // //                         Column(
// // //                           crossAxisAlignment: CrossAxisAlignment.start,
// // //                           children: [
// // //                             Text(
// // //                               price,
// // //                               // --- استخدام نمط نص للسعر من السمة ---
// // //                               style: textTheme.titleSmall
// // //                                   ?.copyWith(fontWeight: FontWeight.bold),
// // //                             ),
// // //                             const SizedBox(height: 2), // تقليل المسافة
// // //                             Text(
// // //                               'Per Night',
// // //                               // --- استخدام نمط نص أصغر للسعر من السمة ---
// // //                               style: textTheme.labelSmall,
// // //                             ),
// // //                           ],
// // //                         ),
// // //                       ],
// // //                     ),
// // //                   ),
// // //                   // -- التقييم (موضوع فوق باستخدام Stack) --
// // //                   Positioned(
// // //                     top: 10,
// // //                     right: 10,
// // //                     // --- تمرير السمة لودجت التقييم ---
// // //                     child: _buildRatingBadge(rating, theme),
// // //                   ),
// // //                 ],
// // //               ),
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }

// // //   // --- Helper Widget لعرض أيقونة التقييم (مع استقبال السمة) ---
// // //   Widget _buildRatingBadge(double rating, ThemeData theme) {
// // //     final colorScheme = theme.colorScheme;
// // //     final textTheme = theme.textTheme;

// // //     return Container(
// // //       padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
// // //       decoration: BoxDecoration(
// // //         // --- استخدام لون سطح مناسب من السمة للخلفية ---
// // //         color: colorScheme.surface.withOpacity(0.9), // يمكن تعديل الشفافية
// // //         borderRadius: BorderRadius.circular(12),
// // //       ),
// // //       child: Row(
// // //         mainAxisSize: MainAxisSize.min,
// // //         children: [
// // //           Icon(Icons.star,
// // //               // --- استخدام اللون الأساسي للنجمة ---
// // //               color: colorScheme.primary,
// // //               size: 16),
// // //           const SizedBox(width: 4),
// // //           Text(
// // //             rating.toString(),
// // //             // --- استخدام نمط نص مناسب ولون أساسي للتقييم ---
// // //             style: textTheme.labelMedium?.copyWith(
// // //               fontWeight: FontWeight.bold,
// // //               color: colorScheme.primary,
// // //             ),
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     print("Building ActiveBookingsScreen...");

// // //     // --- الحصول على السمة الحالية ---
// // //     final theme = Theme.of(context);
// // //     final textTheme = theme.textTheme;
// // //     // final colorScheme = theme.colorScheme; // قد لا نحتاجها مباشرة هنا

// // //     // --- المسار الموحد للصورة الاحتياطية ---
// // //     const String placeholderHotelImage =
// // //         'assets/hotel.jpeg'; // تأكد من صحة المسار

// // //     // --- بيانات افتراضية (تبقى كما هي) ---
// // //     final List<Map<String, dynamic>> activeBookings = [
// // //       {
// // //         'hotelName': 'NH Paris opera Hotel',
// // //         'location': 'Paris, France',
// // //         'rating': 3.8,
// // //         'price': 'EGP 7,902',
// // //         'imageUrl': placeholderHotelImage
// // //       },
// // //       {
// // //         'hotelName': 'Steigenberger Hotel',
// // //         'location': 'Berlin, Germany',
// // //         'rating': 4.2,
// // //         'price': 'EGP 6,500',
// // //         'imageUrl': placeholderHotelImage
// // //       },
// // //       {
// // //         'hotelName': 'Plaza Hotel',
// // //         'location': 'New York, USA',
// // //         'rating': 4.9,
// // //         'price': 'EGP 25,300',
// // //         'imageUrl': placeholderHotelImage
// // //       },
// // //     ];
// // //     final List<Map<String, dynamic>> canceledBookings = [
// // //       {
// // //         'hotelName': 'Davinci Beach Hotel',
// // //         'location': 'Hurghada, Egypt',
// // //         'rating': 4.1,
// // //         'price': 'EGP 3,141',
// // //         'imageUrl': placeholderHotelImage
// // //       },
// // //       {
// // //         'hotelName': 'Desert Rose Resort',
// // //         'location': 'Sharm El Sheikh, Egypt',
// // //         'rating': 4.0,
// // //         'price': 'EGP 2,800',
// // //         'imageUrl': placeholderHotelImage
// // //       },
// // //       {
// // //         'hotelName': 'Old Cataract Hotel',
// // //         'location': 'Aswan, Egypt',
// // //         'rating': 4.6,
// // //         'price': 'EGP 8,100',
// // //         'imageUrl': placeholderHotelImage
// // //       },
// // //     ];
// // //     final List<Map<String, dynamic>> pastBookings = [
// // //       {
// // //         'hotelName': 'Gran Meliá Hotel',
// // //         'location': 'Barcelona, Spain',
// // //         'rating': 4.7,
// // //         'price': 'EGP 15,902',
// // //         'imageUrl': placeholderHotelImage
// // //       },
// // //       {
// // //         'hotelName': 'Ritz Carlton',
// // //         'location': 'Dubai, UAE',
// // //         'rating': 4.9,
// // //         'price': 'EGP 18,500',
// // //         'imageUrl': placeholderHotelImage
// // //       },
// // //       {
// // //         'hotelName': 'Savoy Hotel',
// // //         'location': 'London, UK',
// // //         'rating': 4.5,
// // //         'price': 'EGP 22,000',
// // //         'imageUrl': placeholderHotelImage
// // //       },
// // //     ];
// // //     // --- نهاية البيانات الافتراضية ---

// // //     return Scaffold(
// // //       // --- تم حذف backgroundColor: Colors.white ---
// // //       // سيعتمد على theme.scaffoldBackgroundColor
// // //       appBar: AppBar(
// // //         // --- تم حذف backgroundColor, elevation, title style color ---
// // //         // سيعتمد على theme.appBarTheme
// // //         title: const Text(
// // //             'My Booking'), // النص سيتأثر بـ appBarTheme.titleTextStyle
// // //         centerTitle: false, // محاذاة لليسار
// // //         automaticallyImplyLeading: false, // إخفاء زر الرجوع
// // //       ),
// // //       body: SafeArea(
// // //         child: SingleChildScrollView(
// // //           child: Column(
// // //             crossAxisAlignment: CrossAxisAlignment.start,
// // //             children: [
// // //               // --- قسم Active ---
// // //               // --- تمرير السمة لودجت العنوان ---
// // //               _buildSectionTitle('Active', textTheme),
// // //               _buildHorizontalHotelList(
// // //                   context, activeBookings, placeholderHotelImage,
// // //                   theme: theme, // تمرير السمة
// // //                   sectionTitle: 'Active'),

// // //               // --- قسم Canceled ---
// // //               // --- تمرير السمة لودجت العنوان ---
// // //               _buildSectionTitle('Canceled', textTheme),
// // //               _buildHorizontalHotelList(
// // //                   context, canceledBookings, placeholderHotelImage,
// // //                   theme: theme, // تمرير السمة
// // //                   sectionTitle: 'Canceled'),

// // //               // --- قسم Past ---
// // //               // --- تمرير السمة لودجت العنوان ---
// // //               _buildSectionTitle('Past', textTheme),
// // //               _buildHorizontalHotelList(
// // //                   context, pastBookings, placeholderHotelImage,
// // //                   theme: theme, // تمرير السمة
// // //                   sectionTitle: 'Past'),

// // //               const SizedBox(height: 80), // مسافة قبل شريط التنقل
// // //             ],
// // //           ),
// // //         ),
// // //       ),
// // //       // --- تأكد من أن CustomBottomNavigationBar يعتمد على السمة أيضاً ---
// // //       bottomNavigationBar: CustomBottomNavigationBar(
// // //         currentIndex: 2,
// // //         onTap: (int index) {},
// // //       ),
// // //     );
// // //   }

// // //   // --- Helper Widget لعرض عنوان القسم (مع استقبال السمة) ---
// // //   Widget _buildSectionTitle(String title, TextTheme textTheme) {
// // //     return Padding(
// // //       padding: const EdgeInsets.only(
// // //           left: 16.0, right: 16.0, top: 24.0, bottom: 12.0),
// // //       child: Text(
// // //         title,
// // //         // --- استخدام نمط نص العنوان من السمة ---
// // //         style: textTheme.headlineSmall?.copyWith(
// // //             fontWeight: FontWeight.bold), // استخدام headlineSmall أو titleLarge
// // //       ),
// // //     );
// // //   }

// // //   // --- Helper Widget لعرض قائمة الفنادق الأفقية (مع استقبال السمة) ---
// // //   Widget _buildHorizontalHotelList(BuildContext context,
// // //       List<Map<String, dynamic>> hotels, String placeholderImage,
// // //       {required ThemeData theme, // استقبال السمة
// // //       required String sectionTitle}) {
// // //     if (hotels.isEmpty) {
// // //       return Container(
// // //         height: 100,
// // //         alignment: Alignment.center,
// // //         child: Text(
// // //           "No $sectionTitle bookings found.",
// // //           // --- استخدام نمط نص ثانوي من السمة ---
// // //           style: theme.textTheme.bodyMedium?.copyWith(color: theme.hintColor),
// // //         ),
// // //       );
// // //     }
// // //     return SizedBox(
// // //       height: 190, // يجب أن يتناسب هذا الارتفاع مع ارتفاع الكارد
// // //       child: ListView.builder(
// // //         scrollDirection: Axis.horizontal,
// // //         padding: const EdgeInsets.only(left: 16.0),
// // //         itemCount: hotels.length,
// // //         itemBuilder: (context, index) {
// // //           final hotel = hotels[index];
// // //           return _buildHotelCard(
// // //             context: context,
// // //             hotelName: hotel['hotelName'],
// // //             location: hotel['location'],
// // //             rating: hotel['rating'],
// // //             price: hotel['price'],
// // //             placeholderImageUrl: placeholderImage,
// // //             theme: theme, // تمرير السمة لكارت الفندق
// // //           );
// // //         },
// // //       ),
// // //     );
// // //   }
// // // }
// // import 'package:flutter/material.dart';
// // import 'package:travella/models/booking_models.dart';
// // import 'package:travella/services/api/dio_client.dart';
// // import 'package:travella/services/api/api_endpoints.dart';
// // import 'package:travella/widgets/custom_bottom_navigation_bar.dart';

// // class ActiveBookingsScreen extends StatefulWidget {
// //   const ActiveBookingsScreen({Key? key}) : super(key: key);

// //   @override
// //   State<ActiveBookingsScreen> createState() => _ActiveBookingsScreenState();
// // }

// // class _ActiveBookingsScreenState extends State<ActiveBookingsScreen> {
// //   late Future<BookingsResponse> _bookingsFuture;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _bookingsFuture = _fetchBookings();
// //   }

// //   Future<BookingsResponse> _fetchBookings() async {
// //     try {
// //       final dioClient = DioClient();
// //       final responses = await Future.wait([
// //         dioClient.get(ApiEndpoints.activeBookings),
// //         dioClient.get(ApiEndpoints.canceledBookings),
// //         dioClient.get(ApiEndpoints.pastBookings),
// //       ]);

// //       return BookingsResponse(
// //         activeBookings: (responses[0].data as List<dynamic>)
// //             .map((e) => Booking.fromJson(e as Map<String, dynamic>))
// //             .toList(),
// //         canceledBookings: (responses[1].data as List<dynamic>)
// //             .map((e) => Booking.fromJson(e as Map<String, dynamic>))
// //             .toList(),
// //         pastBookings: (responses[2].data as List<dynamic>)
// //             .map((e) => Booking.fromJson(e as Map<String, dynamic>))
// //             .toList(),
// //       );
// //     } catch (e) {
// //       print("Error fetching bookings: $e");
// //       throw Exception('Failed to load bookings: $e');
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     final theme = Theme.of(context);
// //     final textTheme = theme.textTheme;

// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('My Booking'),
// //         centerTitle: false,
// //         automaticallyImplyLeading: false,
// //         actions: [
// //           IconButton(
// //             icon: const Icon(Icons.refresh),
// //             onPressed: () {
// //               setState(() {
// //                 _bookingsFuture = _fetchBookings();
// //               });
// //             },
// //             tooltip: 'Refresh Bookings',
// //           ),
// //         ],
// //       ),
// //       body: SafeArea(
// //         child: FutureBuilder<BookingsResponse>(
// //           future: _bookingsFuture,
// //           builder: (context, snapshot) {
// //             if (snapshot.connectionState == ConnectionState.waiting) {
// //               return const Center(child: CircularProgressIndicator());
// //             } else if (snapshot.hasError) {
// //               return Center(
// //                 child: Padding(
// //                   padding: const EdgeInsets.all(16.0),
// //                   child: Column(
// //                     mainAxisAlignment: MainAxisAlignment.center,
// //                     children: [
// //                       Text(
// //                         'Error loading bookings:\n${snapshot.error}',
// //                         textAlign: TextAlign.center,
// //                         style: TextStyle(color: theme.colorScheme.error),
// //                       ),
// //                       const SizedBox(height: 10),
// //                       ElevatedButton(
// //                         onPressed: () {
// //                           setState(() {
// //                             _bookingsFuture = _fetchBookings();
// //                           });
// //                         },
// //                         child: const Text('Try Again'),
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //               );
// //             } else if (snapshot.hasData) {
// //               final bookings = snapshot.data!;
// //               return SingleChildScrollView(
// //                 child: Column(
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   children: [
// //                     _buildSectionTitle('Active', textTheme),
// //                     _buildHorizontalHotelList(
// //                       context,
// //                       bookings.activeBookings ?? [],
// //                       theme,
// //                       'Active',
// //                     ),
// //                     _buildSectionTitle('Canceled', textTheme),
// //                     _buildHorizontalHotelList(
// //                       context,
// //                       bookings.canceledBookings ?? [],
// //                       theme,
// //                       'Canceled',
// //                     ),
// //                     _buildSectionTitle('Past', textTheme),
// //                     _buildHorizontalHotelList(
// //                       context,
// //                       bookings.pastBookings ?? [],
// //                       theme,
// //                       'Past',
// //                     ),
// //                     const SizedBox(height: 80),
// //                   ],
// //                 ),
// //               );
// //             } else {
// //               return const Center(child: Text('No bookings found.'));
// //             }
// //           },
// //         ),
// //       ),
// //       bottomNavigationBar: CustomBottomNavigationBar(
// //         currentIndex: 2,
// //         onTap: (int index) {},
// //       ),
// //     );
// //   }

// //   Widget _buildSectionTitle(String title, TextTheme textTheme) {
// //     return Padding(
// //       padding: const EdgeInsets.only(
// //           left: 16.0, right: 16.0, top: 24.0, bottom: 12.0),
// //       child: Text(
// //         title,
// //         style: textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
// //       ),
// //     );
// //   }

// //   Widget _buildHorizontalHotelList(
// //     BuildContext context,
// //     List<Booking> bookings,
// //     ThemeData theme,
// //     String sectionTitle,
// //   ) {
// //     if (bookings.isEmpty) {
// //       return Container(
// //         height: 100,
// //         alignment: Alignment.center,
// //         padding: const EdgeInsets.symmetric(horizontal: 16.0),
// //         child: Text(
// //           "No $sectionTitle bookings found.",
// //           style: theme.textTheme.bodyMedium?.copyWith(color: theme.hintColor),
// //         ),
// //       );
// //     }
// //     return SizedBox(
// //       height: 190,
// //       child: ListView.builder(
// //         scrollDirection: Axis.horizontal,
// //         padding: const EdgeInsets.only(left: 16.0),
// //         itemCount: bookings.length,
// //         itemBuilder: (context, index) {
// //           return _buildHotelCard(
// //             context: context,
// //             booking: bookings[index],
// //             theme: theme,
// //           );
// //         },
// //       ),
// //     );
// //   }

// //   Widget _buildHotelCard({
// //     required BuildContext context,
// //     required Booking booking,
// //     required ThemeData theme,
// //   }) {
// //     final colorScheme = theme.colorScheme;
// //     final textTheme = theme.textTheme;

// //     return Card(
// //       margin: const EdgeInsets.only(right: 16),
// //       clipBehavior: Clip.antiAlias,
// //       child: SizedBox(
// //         width: MediaQuery.of(context).size.width * 0.85,
// //         child: Row(
// //           crossAxisAlignment: CrossAxisAlignment.stretch,
// //           children: [
// //             SizedBox(
// //               width: 140,
// //               child: Image.network(
// //                 '${ApiEndpoints.imageUrlBase}${booking.hotelImageUrl}',
// //                 fit: BoxFit.cover,
// //                 loadingBuilder: (context, child, loadingProgress) {
// //                   if (loadingProgress == null) return child;
// //                   return Center(
// //                     child: CircularProgressIndicator(
// //                       value: loadingProgress.expectedTotalBytes != null
// //                           ? loadingProgress.cumulativeBytesLoaded /
// //                               loadingProgress.expectedTotalBytes!
// //                           : null,
// //                       strokeWidth: 2,
// //                     ),
// //                   );
// //                 },
// //                 errorBuilder: (context, error, stackTrace) {
// //                   return Container(
// //                     color: colorScheme.surfaceVariant,
// //                     alignment: Alignment.center,
// //                     child: Icon(Icons.broken_image,
// //                         color: colorScheme.onSurfaceVariant),
// //                   );
// //                 },
// //               ),
// //             ),
// //             Expanded(
// //               child: Stack(
// //                 children: [
// //                   Padding(
// //                     padding: const EdgeInsets.all(12),
// //                     child: Column(
// //                       crossAxisAlignment: CrossAxisAlignment.start,
// //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                       children: [
// //                         Column(
// //                           crossAxisAlignment: CrossAxisAlignment.start,
// //                           children: [
// //                             Text(
// //                               booking.hotelName,
// //                               maxLines: 2,
// //                               overflow: TextOverflow.ellipsis,
// //                               style: textTheme.titleMedium
// //                                   ?.copyWith(fontWeight: FontWeight.bold),
// //                             ),
// //                             const SizedBox(height: 6),
// //                             Row(
// //                               children: [
// //                                 Icon(Icons.location_on_outlined,
// //                                     size: 16,
// //                                     color:
// //                                         colorScheme.onSurface.withOpacity(0.6)),
// //                                 const SizedBox(width: 4),
// //                                 Expanded(
// //                                   child: Text(
// //                                     booking.hotelCity,
// //                                     maxLines: 1,
// //                                     overflow: TextOverflow.ellipsis,
// //                                     style: textTheme.bodySmall?.copyWith(
// //                                         color: colorScheme.onSurface
// //                                             .withOpacity(0.8)),
// //                                   ),
// //                                 ),
// //                               ],
// //                             ),
// //                           ],
// //                         ),
// //                         Column(
// //                           crossAxisAlignment: CrossAxisAlignment.start,
// //                           children: [
// //                             Text(
// //                               'EGP ${booking.totalPrice.toStringAsFixed(2)}',
// //                               style: textTheme.titleSmall
// //                                   ?.copyWith(fontWeight: FontWeight.bold),
// //                             ),
// //                             const SizedBox(height: 2),
// //                             Text(
// //                               'Per Night',
// //                               style: textTheme.labelSmall,
// //                             ),
// //                           ],
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                   Positioned(
// //                     top: 10,
// //                     right: 10,
// //                     child: _buildRatingBadge(booking.hotelRating, theme),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   Widget _buildRatingBadge(double rating, ThemeData theme) {
// //     final colorScheme = theme.colorScheme;
// //     final textTheme = theme.textTheme;

// //     return Container(
// //       padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
// //       decoration: BoxDecoration(
// //         color: colorScheme.surface.withOpacity(0.9),
// //         borderRadius: BorderRadius.circular(12),
// //       ),
// //       child: Row(
// //         mainAxisSize: MainAxisSize.min,
// //         children: [
// //           Icon(Icons.star, color: colorScheme.primary, size: 16),
// //           const SizedBox(width: 4),
// //           Text(
// //             rating.toStringAsFixed(1),
// //             style: textTheme.labelMedium?.copyWith(
// //               fontWeight: FontWeight.bold,
// //               color: colorScheme.primary,
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:travella/models/booking_models.dart';
// import 'package:travella/services/api/dio_client.dart';
// import 'package:travella/services/api/api_endpoints.dart';
// import 'package:travella/widgets/custom_bottom_navigation_bar.dart';

// class ActiveBookingsScreen extends StatefulWidget {
//   const ActiveBookingsScreen({Key? key}) : super(key: key);

//   @override
//   State<ActiveBookingsScreen> createState() => _ActiveBookingsScreenState();
// }

// class _ActiveBookingsScreenState extends State<ActiveBookingsScreen> {
//   late Future<BookingsResponse> _bookingsFuture;

//   @override
//   void initState() {
//     super.initState();
//     _bookingsFuture = _fetchBookings();
//   }

//   Future<BookingsResponse> _fetchBookings() async {
//     try {
//       final dioClient = DioClient();
//       final responses = await Future.wait([
//         dioClient.get(ApiEndpoints.activeBookings),
//         dioClient.get(ApiEndpoints.canceledBookings),
//         dioClient.get(ApiEndpoints.pastBookings),
//       ]);

//       return BookingsResponse(
//         activeBookings: (responses[0].data as List<dynamic>)
//             .map((e) => Booking.fromJson(e as Map<String, dynamic>))
//             .toList(),
//         canceledBookings: (responses[1].data as List<dynamic>)
//             .map((e) => Booking.fromJson(e as Map<String, dynamic>))
//             .toList(),
//         pastBookings: (responses[2].data as List<dynamic>)
//             .map((e) => Booking.fromJson(e as Map<String, dynamic>))
//             .toList(),
//       );
//     } catch (e) {
//       print("Error fetching bookings: $e");
//       if (e is DioException && e.type == DioExceptionType.connectionError) {
//         throw Exception(
//             'Network error: Please check your internet connection.');
//       }
//       throw Exception('Failed to load bookings: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     final textTheme = theme.textTheme;

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('My Booking'),
//         centerTitle: false,
//         automaticallyImplyLeading: false,
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.refresh),
//             onPressed: () {
//               setState(() {
//                 _bookingsFuture = _fetchBookings();
//               });
//             },
//             tooltip: 'Refresh Bookings',
//           ),
//         ],
//       ),
//       body: SafeArea(
//         child: FutureBuilder<BookingsResponse>(
//           future: _bookingsFuture,
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return const Center(child: CircularProgressIndicator());
//             } else if (snapshot.hasError) {
//               return Center(
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         'Error loading bookings:\n${snapshot.error}',
//                         textAlign: TextAlign.center,
//                         style: TextStyle(color: theme.colorScheme.error),
//                       ),
//                       const SizedBox(height: 10),
//                       ElevatedButton(
//                         onPressed: () {
//                           setState(() {
//                             _bookingsFuture = _fetchBookings();
//                           });
//                         },
//                         child: const Text('Try Again'),
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             } else if (snapshot.hasData) {
//               final bookings = snapshot.data!;
//               return SingleChildScrollView(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     _buildSectionTitle('Active', textTheme),
//                     _buildHorizontalHotelList(
//                       context,
//                       bookings.activeBookings ?? [],
//                       theme,
//                       'Active',
//                     ),
//                     _buildSectionTitle('Canceled', textTheme),
//                     _buildHorizontalHotelList(
//                       context,
//                       bookings.canceledBookings ?? [],
//                       theme,
//                       'Canceled',
//                     ),
//                     _buildSectionTitle('Past', textTheme),
//                     _buildHorizontalHotelList(
//                       context,
//                       bookings.pastBookings ?? [],
//                       theme,
//                       'Past',
//                     ),
//                     const SizedBox(height: 80),
//                   ],
//                 ),
//               );
//             } else {
//               return const Center(child: Text('No bookings found.'));
//             }
//           },
//         ),
//       ),
//       bottomNavigationBar: CustomBottomNavigationBar(
//         currentIndex: 2,
//         onTap: (int index) {},
//       ),
//     );
//   }

//   Widget _buildSectionTitle(String title, TextTheme textTheme) {
//     return Padding(
//       padding: const EdgeInsets.only(
//           left: 16.0, right: 16.0, top: 24.0, bottom: 12.0),
//       child: Text(
//         title,
//         style: textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
//       ),
//     );
//   }

//   Widget _buildHorizontalHotelList(
//     BuildContext context,
//     List<Booking> bookings,
//     ThemeData theme,
//     String sectionTitle,
//   ) {
//     if (bookings.isEmpty) {
//       return Container(
//         height: 100,
//         alignment: Alignment.center,
//         padding: const EdgeInsets.symmetric(horizontal: 16.0),
//         child: Text(
//           "No $sectionTitle bookings found.",
//           style: theme.textTheme.bodyMedium?.copyWith(color: theme.hintColor),
//         ),
//       );
//     }
//     return SizedBox(
//       height: 190,
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         padding: const EdgeInsets.only(left: 16.0),
//         itemCount: bookings.length,
//         itemBuilder: (context, index) {
//           return _buildHotelCard(
//             context: context,
//             booking: bookings[index],
//             theme: theme,
//           );
//         },
//       ),
//     );
//   }

//   Widget _buildHotelCard({
//     required BuildContext context,
//     required Booking booking,
//     required ThemeData theme,
//   }) {
//     final colorScheme = theme.colorScheme;
//     final textTheme = theme.textTheme;

//     return Card(
//       margin: const EdgeInsets.only(right: 16),
//       clipBehavior: Clip.antiAlias,
//       child: SizedBox(
//         width: MediaQuery.of(context).size.width * 0.85,
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             SizedBox(
//               width: 140,
//               child: Image.network(
//                 '${ApiEndpoints.imageUrlBase}${booking.hotelImageUrl}',
//                 fit: BoxFit.cover,
//                 loadingBuilder: (context, child, loadingProgress) {
//                   if (loadingProgress == null) return child;
//                   return Center(
//                     child: CircularProgressIndicator(
//                       value: loadingProgress.expectedTotalBytes != null
//                           ? loadingProgress.cumulativeBytesLoaded /
//                               loadingProgress.expectedTotalBytes!
//                           : null,
//                       strokeWidth: 2,
//                     ),
//                   );
//                 },
//                 errorBuilder: (context, error, stackTrace) {
//                   return Container(
//                     color: colorScheme.surfaceVariant,
//                     alignment: Alignment.center,
//                     child: Icon(Icons.broken_image,
//                         color: colorScheme.onSurfaceVariant),
//                   );
//                 },
//               ),
//             ),
//             Expanded(
//               child: Stack(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(12),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               booking.hotelName,
//                               maxLines: 2,
//                               overflow: TextOverflow.ellipsis,
//                               style: textTheme.titleMedium
//                                   ?.copyWith(fontWeight: FontWeight.bold),
//                             ),
//                             const SizedBox(height: 6),
//                             Row(
//                               children: [
//                                 Icon(Icons.location_on_outlined,
//                                     size: 16,
//                                     color:
//                                         colorScheme.onSurface.withOpacity(0.6)),
//                                 const SizedBox(width: 4),
//                                 Expanded(
//                                   child: Text(
//                                     booking.hotelCity,
//                                     maxLines: 1,
//                                     overflow: TextOverflow.ellipsis,
//                                     style: textTheme.bodySmall?.copyWith(
//                                         color: colorScheme.onSurface
//                                             .withOpacity(0.8)),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               'EGP ${booking.totalPrice.toStringAsFixed(2)}',
//                               style: textTheme.titleSmall
//                                   ?.copyWith(fontWeight: FontWeight.bold),
//                             ),
//                             const SizedBox(height: 2),
//                             Text(
//                               'Per Night',
//                               style: textTheme.labelSmall,
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                   Positioned(
//                     top: 10,
//                     right: 10,
//                     child: _buildRatingBadge(booking.hotelRating, theme),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildRatingBadge(double rating, ThemeData theme) {
//     final colorScheme = theme.colorScheme;
//     final textTheme = theme.textTheme;

//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
//       decoration: BoxDecoration(
//         color: colorScheme.surface.withOpacity(0.9),
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Icon(Icons.star, color: colorScheme.primary, size: 16),
//           const SizedBox(width: 4),
//           Text(
//             rating.toStringAsFixed(1),
//             style: textTheme.labelMedium?.copyWith(
//               fontWeight: FontWeight.bold,
//               color: colorScheme.primary,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:apptravella/models/booking_models.dart';
import 'package:apptravella/screens/HotelDetailsScreen.dart'; // تأكد من الاستيراد
import 'package:apptravella/services/api/dio_client.dart';
import 'package:apptravella/services/api/api_endpoints.dart';
import 'package:apptravella/widgets/custom_bottom_navigation_bar.dart';

class ActiveBookingsScreen extends StatefulWidget {
  const ActiveBookingsScreen({Key? key}) : super(key: key);

  @override
  State<ActiveBookingsScreen> createState() => _ActiveBookingsScreenState();
}

class _ActiveBookingsScreenState extends State<ActiveBookingsScreen> {
  late Future<BookingsResponse> _bookingsFuture;

  @override
  void initState() {
    super.initState();
    _bookingsFuture = _fetchBookings();
  }

  Future<BookingsResponse> _fetchBookings() async {
    try {
      final dioClient = DioClient();
      final responses = await Future.wait([
        dioClient.get(ApiEndpoints.activeBookings),
        dioClient.get(ApiEndpoints.canceledBookings),
        dioClient.get(ApiEndpoints.pastBookings),
      ]);

      return BookingsResponse(
        activeBookings: (responses[0].data as List<dynamic>)
            .map((e) => Booking.fromJson(e as Map<String, dynamic>))
            .toList(),
        canceledBookings: (responses[1].data as List<dynamic>)
            .map((e) => Booking.fromJson(e as Map<String, dynamic>))
            .toList(),
        pastBookings: (responses[2].data as List<dynamic>)
            .map((e) => Booking.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
    } catch (e) {
      print("Error fetching bookings: $e");
      if (e is DioException && e.type == DioExceptionType.connectionError) {
        throw Exception(
            'Network error: Please check your internet connection.');
      }
      throw Exception('Failed to load bookings: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Booking'),
        centerTitle: false,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                _bookingsFuture = _fetchBookings();
              });
            },
            tooltip: 'Refresh Bookings',
          ),
        ],
      ),
      body: SafeArea(
        child: FutureBuilder<BookingsResponse>(
          future: _bookingsFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Error loading bookings:\n${snapshot.error}',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: theme.colorScheme.error),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _bookingsFuture = _fetchBookings();
                          });
                        },
                        child: const Text('Try Again'),
                      ),
                    ],
                  ),
                ),
              );
            } else if (snapshot.hasData) {
              final bookings = snapshot.data!;
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSectionTitle('Active', textTheme),
                    _buildHorizontalHotelList(
                      context,
                      bookings.activeBookings ?? [],
                      theme,
                      'Active',
                    ),
                    _buildSectionTitle('Canceled', textTheme),
                    _buildHorizontalHotelList(
                      context,
                      bookings.canceledBookings ?? [],
                      theme,
                      'Canceled',
                    ),
                    _buildSectionTitle('Past', textTheme),
                    _buildHorizontalHotelList(
                      context,
                      bookings.pastBookings ?? [],
                      theme,
                      'Past',
                    ),
                    const SizedBox(height: 80),
                  ],
                ),
              );
            } else {
              return const Center(child: Text('No bookings found.'));
            }
          },
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 2,
        onTap: (int index) {},
      ),
    );
  }

  Widget _buildSectionTitle(String title, TextTheme textTheme) {
    return Padding(
      padding: const EdgeInsets.only(
          left: 16.0, right: 16.0, top: 24.0, bottom: 12.0),
      child: Text(
        title,
        style: textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildHorizontalHotelList(
    BuildContext context,
    List<Booking> bookings,
    ThemeData theme,
    String sectionTitle,
  ) {
    if (bookings.isEmpty) {
      return Container(
        height: 100,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Text(
          "No $sectionTitle bookings found.",
          style: theme.textTheme.bodyMedium?.copyWith(color: theme.hintColor),
        ),
      );
    }
    return SizedBox(
      height: 190,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 16.0),
        itemCount: bookings.length,
        itemBuilder: (context, index) {
          return _buildHotelCard(
            context: context,
            booking: bookings[index],
            theme: theme,
          );
        },
      ),
    );
  }

  Widget _buildHotelCard({
    required BuildContext context,
    required Booking booking,
    required ThemeData theme,
  }) {
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return GestureDetector(
      onTap: () {
        // افتراض أن Booking يحتوي على hotelId أو يمكن استخدام bookingId كبديل
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HotelDetailsScreen(hotelId: booking.hotelId),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.only(right: 16),
        clipBehavior: Clip.antiAlias,
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.85,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                width: 140,
                child: Image.network(
                  '${ApiEndpoints.imageUrlBase}${booking.hotelImageUrl}',
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                        strokeWidth: 2,
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: colorScheme.surfaceVariant,
                      alignment: Alignment.center,
                      child: Icon(Icons.broken_image,
                          color: colorScheme.onSurfaceVariant),
                    );
                  },
                ),
              ),
              Expanded(
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                booking.hotelName,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: textTheme.titleMedium
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 6),
                              Row(
                                children: [
                                  Icon(Icons.location_on_outlined,
                                      size: 16,
                                      color: colorScheme.onSurface
                                          .withOpacity(0.6)),
                                  const SizedBox(width: 4),
                                  Expanded(
                                    child: Text(
                                      booking.hotelCity,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: textTheme.bodySmall?.copyWith(
                                          color: colorScheme.onSurface
                                              .withOpacity(0.8)),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'EGP ${booking.totalPrice.toStringAsFixed(2)}',
                                style: textTheme.titleSmall
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                'Per Night',
                                style: textTheme.labelSmall,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: _buildRatingBadge(booking.hotelRating, theme),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRatingBadge(double rating, ThemeData theme) {
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
      decoration: BoxDecoration(
        color: colorScheme.surface.withOpacity(0.9),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.star, color: colorScheme.primary, size: 16),
          const SizedBox(width: 4),
          Text(
            rating.toStringAsFixed(1),
            style: textTheme.labelMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}
