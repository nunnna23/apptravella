// // // // // import 'package:flutter/material.dart';
// // // // // // استيراد بيانات الرحلة ونموذج التنسيق إذا لزم الأمر
// // // // // import 'FlightResultsScreen.dart';
// // // // // import 'ProfileSignedInScreen.dart';
// // // // // // استيراد شاشة الدفع
// // // // // import 'payment_selection_screen.dart';
// // // // // // --- !!! استيراد شاشة الملف الشخصي (أو تسجيل الدخول) !!! ---

// // // // // class FlightDetailsScreen extends StatelessWidget {
// // // // //   final FlightData flight;
// // // // //   // --- !!! إضافة متغير لمعرفة حالة المستخدم (ضيف أم لا) !!! ---
// // // // //   // هذا مثال، يجب أن تحصل على هذه المعلومة من نظام المصادقة لديك
// // // // //   final bool isGuestUser;

// // // // //   const FlightDetailsScreen({
// // // // //     super.key,
// // // // //     required this.flight,
// // // // //     this.isGuestUser = false, // القيمة الافتراضية (مستخدم مسجل) - يجب تعديلها
// // // // //   });

// // // // //   // --- TODO: كيفية تحديد isGuestUser ---
// // // // //   // في التطبيق الفعلي، ستحصل على هذه القيمة من نظام إدارة الحالة (مثل Provider, Bloc, Riverpod)
// // // // //   // أو من خلال تمريرها من الشاشة السابقة.
// // // // //   // مثال افتراضي:
// // // // //   // final bool isGuestUser = context.watch<AuthStatus>() == AuthStatus.guest;

// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     final themeColor = Theme.of(context).primaryColor;
// // // // //     const greyTextColor = Color(0xFF6E6E6E);

// // // // //     return Scaffold(
// // // // //       appBar: AppBar(
// // // // //         /* ... (الكود السابق للـ AppBar) ... */
// // // // //         title: Text(flight.airlineName,
// // // // //             style: const TextStyle(
// // // // //                 fontSize: 18, fontWeight: FontWeight.bold)), // اسم شركة الطيران
// // // // //         centerTitle: true,
// // // // //         leading: IconButton(
// // // // //           icon: const Icon(Icons.arrow_back),
// // // // //           onPressed: () => Navigator.pop(context),
// // // // //         ),
// // // // //         actions: [
// // // // //           IconButton(
// // // // //             icon: const Icon(Icons.favorite_border, color: Colors.redAccent),
// // // // //             tooltip: 'Add to favorites',
// // // // //             onPressed: () {
// // // // //               ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
// // // // //                   content:
// // // // //                       Text('Favorite functionality not implemented yet.')));
// // // // //             },
// // // // //           )
// // // // //         ],
// // // // //       ),
// // // // //       body: SingleChildScrollView(
// // // // //         child: Padding(
// // // // //           padding: const EdgeInsets.all(16.0),
// // // // //           child: Column(
// // // // //             crossAxisAlignment: CrossAxisAlignment.start,
// // // // //             children: [
// // // // //               // --- صورة الطائرة (عنصر نائب) ---
// // // // //               Container(
// // // // //                 /* ... (الكود السابق للصورة) ... */
// // // // //                 height: 200,
// // // // //                 decoration: BoxDecoration(
// // // // //                     color: Colors.grey[200],
// // // // //                     borderRadius: BorderRadius.circular(12.0),
// // // // //                     image: const DecorationImage(
// // // // //                         image: NetworkImage(
// // // // //                             'https://via.placeholder.com/600x400/cccccc/969696?text=Airplane+Image'),
// // // // //                         fit: BoxFit.cover)),
// // // // //               ),
// // // // //               const SizedBox(height: 20),
// // // // //               // --- اسم شركة الطيران والتقييم ---
// // // // //               Row(
// // // // //                 /* ... (الكود السابق للاسم والتقييم) ... */
// // // // //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // // //                 children: [
// // // // //                   Expanded(
// // // // //                     child: Text(
// // // // //                       flight.airlineName,
// // // // //                       style: const TextStyle(
// // // // //                           fontSize: 22, fontWeight: FontWeight.bold),
// // // // //                       overflow: TextOverflow.ellipsis,
// // // // //                     ),
// // // // //                   ),
// // // // //                   Row(
// // // // //                     children: [
// // // // //                       Icon(Icons.star, color: Colors.amber[600], size: 18),
// // // // //                       const SizedBox(width: 4),
// // // // //                       Text(
// // // // //                         flight.rating.toStringAsFixed(1),
// // // // //                         style: const TextStyle(
// // // // //                             fontSize: 14, fontWeight: FontWeight.w500),
// // // // //                       ),
// // // // //                       Text(
// // // // //                         ' (${flight.stops + 50} Reviews)',
// // // // //                         style: TextStyle(fontSize: 12, color: Colors.grey[600]),
// // // // //                       )
// // // // //                     ],
// // // // //                   )
// // // // //                 ],
// // // // //               ),
// // // // //               const SizedBox(height: 15),
// // // // //               // --- تفاصيل إضافية ---
// // // // //               _buildDetailRow(
// // // // //                   Icons.flight_takeoff_outlined, 'From', flight.fromCity),
// // // // //               _buildDetailRow(Icons.flight_land_outlined, 'To', flight.toCity),
// // // // //               _buildDetailRow(
// // // // //                   Icons.schedule_outlined, 'Duration', flight.duration),
// // // // //               _buildDetailRow(
// // // // //                   Icons.compare_arrows_outlined,
// // // // //                   'Stops',
// // // // //                   flight.stops == 0
// // // // //                       ? 'Non-stop'
// // // // //                       : '${flight.stops} Stop${flight.stops > 1 ? 's' : ''}'),
// // // // //               _buildDetailRow(
// // // // //                   Icons.airline_seat_recline_extra,
// // // // //                   'Class',
// // // // //                   flight
// // // // //                       .airlineName), // <-- تأكد من أن category موجودة في FlightData إذا أردت عرضها
// // // // //               _buildDetailRow(
// // // // //                   Icons.access_time, 'Departure', flight.departureTime),
// // // // //               const SizedBox(height: 20),
// // // // //               const Divider(),
// // // // //               const SizedBox(height: 20),
// // // // //               // --- قسم التسهيلات ---
// // // // //               const Text('Facilities',
// // // // //                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
// // // // //               const SizedBox(height: 10),
// // // // //               Wrap(
// // // // //                 /* ... (الكود السابق للتسهيلات) ... */
// // // // //                 spacing: 15.0,
// // // // //                 runSpacing: 10.0,
// // // // //                 children: [
// // // // //                   _buildFacilityChip(Icons.wifi, 'Wi-Fi'),
// // // // //                   _buildFacilityChip(Icons.fastfood_outlined, 'Meals'),
// // // // //                   _buildFacilityChip(Icons.tv_outlined, 'Entertainment'),
// // // // //                   _buildFacilityChip(Icons.power_outlined, 'Power Outlet'),
// // // // //                   _buildFacilityChip(
// // // // //                       Icons.airline_seat_recline_extra, 'Extra Legroom'),
// // // // //                 ],
// // // // //               ),
// // // // //               const SizedBox(height: 30),
// // // // //             ],
// // // // //           ),
// // // // //         ),
// // // // //       ),
// // // // //       bottomNavigationBar: Container(
// // // // //         padding: const EdgeInsets.all(16.0),
// // // // //         decoration: BoxDecoration(
// // // // //           /* ... (الكود السابق للشريط السفلي) ... */
// // // // //           color: Colors.white,
// // // // //           boxShadow: [
// // // // //             BoxShadow(
// // // // //               color: Colors.grey.withOpacity(0.2),
// // // // //               spreadRadius: 1,
// // // // //               blurRadius: 5,
// // // // //               offset: const Offset(0, -2),
// // // // //             ),
// // // // //           ],
// // // // //         ),
// // // // //         child: Row(
// // // // //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // // //           children: [
// // // // //             // السعر
// // // // //             Column(
// // // // //               /* ... (الكود السابق للسعر) ... */
// // // // //               mainAxisSize: MainAxisSize.min,
// // // // //               crossAxisAlignment: CrossAxisAlignment.start,
// // // // //               children: [
// // // // //                 Text(
// // // // //                   'Price',
// // // // //                   style: TextStyle(color: greyTextColor, fontSize: 13),
// // // // //                 ),
// // // // //                 const SizedBox(height: 2),
// // // // //                 Text(
// // // // //                   'EGP ${flight.price}',
// // // // //                   style: TextStyle(
// // // // //                     fontSize: 20,
// // // // //                     fontWeight: FontWeight.bold,
// // // // //                     color: themeColor,
// // // // //                   ),
// // // // //                 ),
// // // // //               ],
// // // // //             ),
// // // // //             // زر الحجز (مع تعديل السلوك)
// // // // //             ElevatedButton(
// // // // //               // --- !!! تعديل onPressed لزر الحجز !!! ---
// // // // //               onPressed: () {
// // // // //                 if (isGuestUser) {
// // // // //                   // المستخدم ضيف
// // // // //                   ScaffoldMessenger.of(context).showSnackBar(
// // // // //                     const SnackBar(
// // // // //                       content: Text('You need to log in to book.'),
// // // // //                       duration: Duration(seconds: 2), // مدة ظهور الرسالة
// // // // //                       behavior: SnackBarBehavior.floating, // شكل الرسالة
// // // // //                     ),
// // // // //                   );
// // // // //                   // الانتقال إلى شاشة الملف الشخصي/تسجيل الدخول
// // // // //                   // اختر الشاشة المناسبة للانتقال إليها للضيف
// // // // //                   Navigator.push(
// // // // //                     context,
// // // // //                     MaterialPageRoute(
// // // // //                         builder: (context) =>
// // // // //                             const ProfileSignedInScreen()), // أو SignInScreen()
// // // // //                   );
// // // // //                 } else {
// // // // //                   // المستخدم مسجل الدخول
// // // // //                   Navigator.push(
// // // // //                     context,
// // // // //                     MaterialPageRoute(
// // // // //                         builder: (context) => const PaymentSelectionScreen()),
// // // // //                   );
// // // // //                 }
// // // // //               },
// // // // //               // --- نهاية التعديل ---
// // // // //               style: ElevatedButton.styleFrom(
// // // // //                 backgroundColor: themeColor,
// // // // //                 padding:
// // // // //                     const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
// // // // //                 shape: RoundedRectangleBorder(
// // // // //                   borderRadius: BorderRadius.circular(10),
// // // // //                 ),
// // // // //               ),
// // // // //               child: const Text(
// // // // //                 'Book Now',
// // // // //                 style: TextStyle(
// // // // //                     fontSize: 16,
// // // // //                     color: Colors.white,
// // // // //                     fontWeight: FontWeight.bold),
// // // // //               ),
// // // // //             ),
// // // // //           ],
// // // // //         ),
// // // // //       ),
// // // // //     );
// // // // //   }

// // // // //   // --- الويدجت المساعدة (تبقى كما هي) ---
// // // // //   Widget _buildDetailRow(IconData icon, String title, String value) {
// // // // //     /* ... (same as before) ... */ return Padding(
// // // // //       padding: const EdgeInsets.symmetric(vertical: 6.0),
// // // // //       child: Row(
// // // // //         children: [
// // // // //           Icon(icon, color: Colors.grey[600], size: 20),
// // // // //           const SizedBox(width: 12),
// // // // //           Text('$title:',
// // // // //               style: TextStyle(
// // // // //                   color: Colors.grey[700], fontWeight: FontWeight.w500)),
// // // // //           const SizedBox(width: 8),
// // // // //           Expanded(
// // // // //             child: Text(
// // // // //               value,
// // // // //               style: const TextStyle(
// // // // //                   fontSize: 15,
// // // // //                   fontWeight: FontWeight.w500,
// // // // //                   color: Colors.black87),
// // // // //               overflow: TextOverflow.ellipsis,
// // // // //             ),
// // // // //           ),
// // // // //         ],
// // // // //       ),
// // // // //     );
// // // // //   }

// // // // //   Widget _buildFacilityChip(IconData icon, String label) {
// // // // //     /* ... (same as before) ... */ return Chip(
// // // // //       avatar: Icon(icon, size: 18, color: Colors.grey[700]),
// // // // //       label:
// // // // //           Text(label, style: TextStyle(fontSize: 13, color: Colors.grey[800])),
// // // // //       backgroundColor: Colors.grey[200],
// // // // //       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
// // // // //       visualDensity: VisualDensity.compact,
// // // // //     );
// // // // //   }
// // // // // }
// // // // // FlightDetailsScreen.dart

// // // // import 'package:flutter/material.dart';
// // // // import 'package:intl/intl.dart'; // لتنسيق الأرقام

// // // // // --- استيراد الملفات الضرورية ---
// // // // // تأكد من استيراد تعريف FlightData المحدث
// // // // import 'FlightResultsScreen.dart'; // يجلب تعريف FlightData
// // // // // تأكد من استيراد شاشة الدفع
// // // // import 'payment_selection_screen.dart';
// // // // // تأكد من استيراد شاشة الملف الشخصي (أو تسجيل الدخول) للضيوف
// // // // import 'ProfileSignedInScreen.dart';

// // // // // --- شاشة تفاصيل الرحلة ---
// // // // class FlightDetailsScreen extends StatelessWidget {
// // // //   // --- استقبال كائن FlightData بأكمله ---
// // // //   // يحتوي هذا الكائن الآن على كل المعلومات المطلوبة بما فيها 'category' و 'arrivalTime'
// // // //   final FlightData flight;
// // // //   // --- حالة المستخدم (ضيف أم لا) ---
// // // //   // يجب الحصول على هذه القيمة من نظام إدارة الحالة أو تمريرها
// // // //   final bool isGuestUser;

// // // //   const FlightDetailsScreen({
// // // //     super.key,
// // // //     required this.flight, // استقبال كائن FlightData
// // // //     this.isGuestUser = false, // القيمة الافتراضية (مستخدم مسجل) - يجب تعديلها!
// // // //   });

// // // //   // Getter لتنسيق السعر بشكل صحيح باستخدام intl
// // // //   String get formattedPrice {
// // // //     final formatter = NumberFormat("#,##0", "en_US");
// // // //     // استخدام قيمة السعر الرقمية (price) من كائن flight للتنسيق
// // // //     return 'EGP ${formatter.format(flight.price)}';
// // // //   }

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     final themeColor = Theme.of(context).primaryColor; // اللون الأساسي من الثيم
// // // //     const greyTextColor = Color(0xFF6E6E6E); // لون النص الرمادي

// // // //     return Scaffold(
// // // //       appBar: AppBar(
// // // //         // --- شريط التطبيق ---
// // // //         title: Text(flight.airlineName,
// // // //             style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
// // // //         centerTitle: true, // توسيط العنوان
// // // //         leading: IconButton(
// // // //           // زر الرجوع
// // // //           icon: const Icon(Icons.arrow_back),
// // // //           onPressed: () => Navigator.pop(context),
// // // //         ),
// // // //         actions: [
// // // //           // أزرار الإجراءات (مثل المفضلة)
// // // //           IconButton(
// // // //             icon: const Icon(Icons.favorite_border,
// // // //                 color: Colors.redAccent), // أيقونة المفضلة
// // // //             tooltip: 'Add to favorites',
// // // //             onPressed: () {
// // // //               // TODO: Implement favorite logic
// // // //               ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
// // // //                   content:
// // // //                       Text('Favorite functionality not implemented yet.')));
// // // //             },
// // // //           )
// // // //         ],
// // // //       ),
// // // //       body: SingleChildScrollView(
// // // //         // للسماح بالتمرير إذا كان المحتوى طويلاً
// // // //         child: Padding(
// // // //           padding: const EdgeInsets.all(16.0), // هوامش حول المحتوى
// // // //           child: Column(
// // // //             // لترتيب العناصر عمودياً
// // // //             crossAxisAlignment:
// // // //                 CrossAxisAlignment.start, // محاذاة العناصر لليسار
// // // //             children: [
// // // //               // --- !!! تمت إزالة حاوية الصورة !!! ---

// // // //               // --- اسم شركة الطيران والتقييم ---
// // // //               Row(
// // // //                 mainAxisAlignment:
// // // //                     MainAxisAlignment.spaceBetween, // توزيع المسافة
// // // //                 children: [
// // // //                   Expanded(
// // // //                     // لجعل الاسم يأخذ المساحة المتاحة
// // // //                     child: Text(
// // // //                       flight.airlineName,
// // // //                       style: const TextStyle(
// // // //                           fontSize: 22, fontWeight: FontWeight.bold),
// // // //                       overflow: TextOverflow.ellipsis, // منع تجاوز النص
// // // //                     ),
// // // //                   ),
// // // //                   // عرض التقييم (النجوم والرقم)
// // // //                   Row(
// // // //                     children: [
// // // //                       Icon(Icons.star, color: Colors.amber[600], size: 18),
// // // //                       const SizedBox(width: 4),
// // // //                       Text(
// // // //                         flight.rating.toStringAsFixed(1), // عرض رقم عشري واحد
// // // //                         style: const TextStyle(
// // // //                             fontSize: 14, fontWeight: FontWeight.w500),
// // // //                       ),
// // // //                       // يمكنك تغيير كيفية عرض عدد المراجعات
// // // //                       Text(
// // // //                         ' (${flight.stops + 50} Reviews)', // مثال
// // // //                         style: TextStyle(fontSize: 12, color: Colors.grey[600]),
// // // //                       )
// // // //                     ],
// // // //                   )
// // // //                 ],
// // // //               ),
// // // //               const SizedBox(height: 15), // مسافة

// // // //               // --- تفاصيل إضافية للرحلة ---
// // // //               _buildDetailRow(
// // // //                   Icons.flight_takeoff_outlined, 'From', flight.fromCity),
// // // //               _buildDetailRow(Icons.flight_land_outlined, 'To', flight.toCity),
// // // //               _buildDetailRow(
// // // //                   Icons.schedule_outlined, 'Duration', flight.duration),
// // // //               _buildDetailRow(
// // // //                   Icons.compare_arrows_outlined,
// // // //                   'Stops',
// // // //                   flight.stops == 0
// // // //                       ? 'Non-stop'
// // // //                       : '${flight.stops} Stop${flight.stops > 1 ? 's' : ''}'), // عرض التوقفات
// // // //               // --- !!! عرض الفئة الديناميكي !!! ---
// // // //               _buildDetailRow(Icons.airline_seat_recline_extra, 'Class',
// // // //                   flight.category // <-- استخدام قيمة الفئة المستلمة
// // // //                   ),
// // // //               // --- نهاية التعديل ---
// // // //               _buildDetailRow(Icons.access_time, 'Departure',
// // // //                   flight.departureTime), // وقت المغادرة
// // // //               _buildDetailRow(Icons.access_time_filled, 'Arrival',
// // // //                   flight.arrivalTime), // وقت الوصول (تمت إضافته)
// // // //               const SizedBox(height: 20), // مسافة
// // // //               const Divider(), // خط فاصل
// // // //               const SizedBox(height: 20), // مسافة

// // // //               // --- قسم التسهيلات (Facilities) ---
// // // //               const Text('Facilities',
// // // //                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
// // // //               const SizedBox(height: 10),
// // // //               Wrap(
// // // //                 // لعرض التسهيلات بشكل مرن
// // // //                 spacing: 15.0, // المسافة الأفقية بين الرقائق
// // // //                 runSpacing: 10.0, // المسافة العمودية بين الأسطر
// // // //                 children: [
// // // //                   // يمكنك جعل هذه القائمة ديناميكية بناءً على بيانات الرحلة الفعلية
// // // //                   _buildFacilityChip(Icons.wifi, 'Wi-Fi'),
// // // //                   _buildFacilityChip(Icons.fastfood_outlined, 'Meals'),
// // // //                   _buildFacilityChip(Icons.tv_outlined, 'Entertainment'),
// // // //                   _buildFacilityChip(Icons.power_outlined, 'Power Outlet'),
// // // //                   _buildFacilityChip(
// // // //                       Icons.airline_seat_recline_extra, 'Extra Legroom'),
// // // //                 ],
// // // //               ),
// // // //               const SizedBox(height: 30), // مسافة قبل نهاية المحتوى
// // // //             ],
// // // //           ),
// // // //         ),
// // // //       ),
// // // //       // --- الشريط السفلي الثابت (Bottom Navigation Bar) ---
// // // //       bottomNavigationBar: Container(
// // // //         padding: const EdgeInsets.all(16.0), // هوامش داخلية للشريط
// // // //         decoration: BoxDecoration(
// // // //           // تصميم الشريط
// // // //           color: Colors.white, // خلفية بيضاء
// // // //           boxShadow: [
// // // //             // ظل خفيف في الأعلى
// // // //             BoxShadow(
// // // //               color: Colors.grey.withOpacity(0.2),
// // // //               spreadRadius: 1,
// // // //               blurRadius: 5,
// // // //               offset: const Offset(0, -2), // إزاحة الظل للأعلى
// // // //             ),
// // // //           ],
// // // //         ),
// // // //         child: Row(
// // // //           // لترتيب السعر وزر الحجز أفقياً
// // // //           mainAxisAlignment:
// // // //               MainAxisAlignment.spaceBetween, // توزيع المسافة بينهما
// // // //           children: [
// // // //             // --- عرض السعر ---
// // // //             Column(
// // // //               mainAxisSize: MainAxisSize.min, // ليأخذ العمود أقل ارتفاع ممكن
// // // //               crossAxisAlignment:
// // // //                   CrossAxisAlignment.start, // محاذاة النص لليسار
// // // //               children: [
// // // //                 Text('Price',
// // // //                     style: TextStyle(
// // // //                         color: greyTextColor, fontSize: 13)), // تسمية "السعر"
// // // //                 const SizedBox(height: 2),
// // // //                 // استخدام الـ getter لتنسيق السعر وعرضه
// // // //                 Text(
// // // //                   formattedPrice,
// // // //                   style: TextStyle(
// // // //                       fontSize: 20,
// // // //                       fontWeight: FontWeight.bold,
// // // //                       color: themeColor),
// // // //                 ),
// // // //               ],
// // // //             ),
// // // //             // --- زر الحجز (مع التحقق من حالة المستخدم) ---
// // // //             ElevatedButton(
// // // //               onPressed: () {
// // // //                 // التحقق إذا كان المستخدم ضيفًا أم مسجل الدخول
// // // //                 if (isGuestUser) {
// // // //                   // المستخدم ضيف: إظهار رسالة والانتقال لتسجيل الدخول
// // // //                   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
// // // //                     content: Text('You need to log in to book.'),
// // // //                     duration: Duration(seconds: 2),
// // // //                     behavior: SnackBarBehavior.floating,
// // // //                   ));
// // // //                   // تأكد من أن ProfileSignedInScreen هي الشاشة الصحيحة
// // // //                   Navigator.push(
// // // //                       context,
// // // //                       MaterialPageRoute(
// // // //                           builder: (context) => const ProfileSignedInScreen()));
// // // //                 } else {
// // // //                   // المستخدم مسجل الدخول: الانتقال إلى شاشة الدفع
// // // //                   Navigator.push(
// // // //                       context,
// // // //                       MaterialPageRoute(
// // // //                           builder: (context) =>
// // // //                               const PaymentSelectionScreen()));
// // // //                 }
// // // //               },
// // // //               style: ElevatedButton.styleFrom(
// // // //                 // تصميم الزر
// // // //                 backgroundColor: themeColor, // استخدام اللون الأساسي
// // // //                 padding: const EdgeInsets.symmetric(
// // // //                     horizontal: 40, vertical: 12), // حجم الزر
// // // //                 shape: RoundedRectangleBorder(
// // // //                     borderRadius: BorderRadius.circular(10)), // حواف دائرية
// // // //               ),
// // // //               child: const Text('Book Now',
// // // //                   style: TextStyle(
// // // //                       fontSize: 16,
// // // //                       color: Colors.white,
// // // //                       fontWeight: FontWeight.bold)),
// // // //             ),
// // // //           ],
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }

// // // //   // --- دالة مساعدة لبناء صف التفاصيل (أيقونة + عنوان + قيمة) ---
// // // //   Widget _buildDetailRow(IconData icon, String title, String value) {
// // // //     return Padding(
// // // //       padding: const EdgeInsets.symmetric(vertical: 6.0), // مسافة عمودية للصف
// // // //       child: Row(
// // // //         children: [
// // // //           Icon(icon, color: Colors.grey[600], size: 20), // الأيقونة
// // // //           const SizedBox(width: 12), // مسافة
// // // //           Text('$title:',
// // // //               style: TextStyle(
// // // //                   color: Colors.grey[700],
// // // //                   fontWeight: FontWeight.w500)), // العنوان
// // // //           const SizedBox(width: 8), // مسافة
// // // //           Expanded(
// // // //             // لجعل القيمة تأخذ المساحة المتبقية
// // // //             child: Text(
// // // //               value, // القيمة
// // // //               style: const TextStyle(
// // // //                   fontSize: 15,
// // // //                   fontWeight: FontWeight.w500,
// // // //                   color: Colors.black87),
// // // //               overflow: TextOverflow.ellipsis, // منع تجاوز النص
// // // //             ),
// // // //           ),
// // // //         ],
// // // //       ),
// // // //     );
// // // //   }

// // // //   // --- دالة مساعدة لبناء رقاقة التسهيلات (Facility Chip) ---
// // // //   Widget _buildFacilityChip(IconData icon, String label) {
// // // //     return Chip(
// // // //       avatar: Icon(icon,
// // // //           size: 18, color: Colors.grey[700]), // الأيقونة داخل الرقاقة
// // // //       label: Text(label,
// // // //           style: TextStyle(fontSize: 13, color: Colors.grey[800])), // النص
// // // //       backgroundColor: Colors.grey[200], // لون خلفية الرقاقة
// // // //       padding: const EdgeInsets.symmetric(
// // // //           horizontal: 10, vertical: 5), // هوامش داخلية
// // // //       visualDensity: VisualDensity.compact, // لتقليل حجم الرقاقة قليلاً
// // // //     );
// // // //   }
// // // // }
// // // import 'package:flutter/material.dart';
// // // import 'package:intl/intl.dart';
// // // import 'package:travella/models/FlightData.dart'; // تأكد من استيراد نموذج FlightData
// // // import 'package:travella/screens/payment_selection_screen.dart';
// // // import 'package:travella/screens/ProfileSignedInScreen.dart';
// // // import 'package:travella/services/payment/payment_service.dart';

// // // class FlightDetailsScreen extends StatelessWidget {
// // //   final FlightData flight;
// // //   final bool isGuestUser;

// // //   const FlightDetailsScreen({
// // //     super.key,
// // //     required this.flight,
// // //     this.isGuestUser = false,
// // //   });

// // //   String get formattedPrice {
// // //     final formatter = NumberFormat("#,##0", "en_US");
// // //     return 'EGP ${formatter.format(flight.price)}';
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     final themeColor = Theme.of(context).primaryColor;
// // //     const greyTextColor = Color(0xFF6E6E6E);

// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: Text(
// // //           flight.airlineName,
// // //           style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// // //         ),
// // //         centerTitle: true,
// // //         leading: IconButton(
// // //           icon: const Icon(Icons.arrow_back),
// // //           onPressed: () => Navigator.pop(context),
// // //         ),
// // //         actions: [
// // //           IconButton(
// // //             icon: const Icon(Icons.favorite_border, color: Colors.redAccent),
// // //             tooltip: 'Add to favorites',
// // //             onPressed: () {
// // //               ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
// // //                 content: Text('Favorite functionality not implemented yet.'),
// // //               ));
// // //             },
// // //           ),
// // //         ],
// // //       ),
// // //       body: SingleChildScrollView(
// // //         child: Padding(
// // //           padding: const EdgeInsets.all(16.0),
// // //           child: Column(
// // //             crossAxisAlignment: CrossAxisAlignment.start,
// // //             children: [
// // //               Row(
// // //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // //                 children: [
// // //                   Expanded(
// // //                     child: Text(
// // //                       flight.airlineName,
// // //                       style: const TextStyle(
// // //                           fontSize: 22, fontWeight: FontWeight.bold),
// // //                       overflow: TextOverflow.ellipsis,
// // //                     ),
// // //                   ),
// // //                   Row(
// // //                     children: [
// // //                       Icon(Icons.star, color: Colors.amber[600], size: 18),
// // //                       const SizedBox(width: 4),
// // //                       Text(
// // //                         flight.rating.toStringAsFixed(1),
// // //                         style: const TextStyle(
// // //                             fontSize: 14, fontWeight: FontWeight.w500),
// // //                       ),
// // //                       Text(
// // //                         ' (${flight.stops + 50} Reviews)',
// // //                         style: TextStyle(fontSize: 12, color: Colors.grey[600]),
// // //                       ),
// // //                     ],
// // //                   ),
// // //                 ],
// // //               ),
// // //               const SizedBox(height: 15),
// // //               _buildDetailRow(
// // //                   Icons.flight_takeoff_outlined, 'From', flight.fromCity),
// // //               _buildDetailRow(Icons.flight_land_outlined, 'To', flight.toCity),
// // //               _buildDetailRow(
// // //                   Icons.schedule_outlined, 'Duration', flight.duration),
// // //               _buildDetailRow(
// // //                 Icons.compare_arrows_outlined,
// // //                 'Stops',
// // //                 flight.stops == 0
// // //                     ? 'Non-stop'
// // //                     : '${flight.stops} Stop${flight.stops > 1 ? 's' : ''}',
// // //               ),
// // //               _buildDetailRow(
// // //                   Icons.airline_seat_recline_extra, 'Class', flight.category),
// // //               _buildDetailRow(
// // //                   Icons.access_time, 'Departure', flight.departureTime),
// // //               _buildDetailRow(
// // //                   Icons.access_time_filled, 'Arrival', flight.arrivalTime),
// // //               const SizedBox(height: 20),
// // //               const Divider(),
// // //               const SizedBox(height: 20),
// // //               const Text(
// // //                 'Facilities',
// // //                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// // //               ),
// // //               const SizedBox(height: 10),
// // //               Wrap(
// // //                 spacing: 15.0,
// // //                 runSpacing: 10.0,
// // //                 children: [
// // //                   _buildFacilityChip(Icons.wifi, 'Wi-Fi'),
// // //                   _buildFacilityChip(Icons.fastfood_outlined, 'Meals'),
// // //                   _buildFacilityChip(Icons.tv_outlined, 'Entertainment'),
// // //                   _buildFacilityChip(Icons.power_outlined, 'Power Outlet'),
// // //                   _buildFacilityChip(
// // //                       Icons.airline_seat_recline_extra, 'Extra Legroom'),
// // //                 ],
// // //               ),
// // //               const SizedBox(height: 30),
// // //             ],
// // //           ),
// // //         ),
// // //       ),
// // //       bottomNavigationBar: Container(
// // //         padding: const EdgeInsets.all(16.0),
// // //         decoration: BoxDecoration(
// // //           color: Colors.white,
// // //           boxShadow: [
// // //             BoxShadow(
// // //               color: Colors.grey.withOpacity(0.2),
// // //               spreadRadius: 1,
// // //               blurRadius: 5,
// // //               offset: const Offset(0, -2),
// // //             ),
// // //           ],
// // //         ),
// // //         child: Row(
// // //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // //           children: [
// // //             Column(
// // //               mainAxisSize: MainAxisSize.min,
// // //               crossAxisAlignment: CrossAxisAlignment.start,
// // //               children: [
// // //                 Text(
// // //                   'Price',
// // //                   style: TextStyle(color: greyTextColor, fontSize: 13),
// // //                 ),
// // //                 const SizedBox(height: 2),
// // //                 Text(
// // //                   formattedPrice,
// // //                   style: TextStyle(
// // //                       fontSize: 20,
// // //                       fontWeight: FontWeight.bold,
// // //                       color: themeColor),
// // //                 ),
// // //               ],
// // //             ),
// // //             ElevatedButton(
// // //               onPressed: () async {
// // //                 if (isGuestUser) {
// // //                   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
// // //                     content: Text('You need to log in to book.'),
// // //                     duration: Duration(seconds: 2),
// // //                     behavior: SnackBarBehavior.floating,
// // //                   ));
// // //                   Navigator.push(
// // //                     context,
// // //                     MaterialPageRoute(
// // //                         builder: (context) => const ProfileSignedInScreen()),
// // //                   );
// // //                 } else {
// // //                   final paymentService = PaymentService();
// // //                   try {
// // //                     final sessionId =
// // //                         await paymentService.createCheckoutSession(
// // //                       token: "YOUR_AUTH_TOKEN", // استبدل بالتوكن الفعلي
// // //                       amount: flight.price,
// // //                       serviceName: flight.airlineName,
// // //                     );
// // //                     Navigator.push(
// // //                       context,
// // //                       MaterialPageRoute(
// // //                         builder: (context) =>
// // //                             PaymentSelectionScreen(sessionId: sessionId),
// // //                       ),
// // //                     );
// // //                   } catch (e) {
// // //                     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
// // //                       content: Text('Payment error: $e'),
// // //                       duration: const Duration(seconds: 2),
// // //                     ));
// // //                   }
// // //                 }
// // //               },
// // //               style: ElevatedButton.styleFrom(
// // //                 backgroundColor: themeColor,
// // //                 padding:
// // //                     const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
// // //                 shape: RoundedRectangleBorder(
// // //                     borderRadius: BorderRadius.circular(10)),
// // //               ),
// // //               child: const Text(
// // //                 'Book Now',
// // //                 style: TextStyle(
// // //                     fontSize: 16,
// // //                     color: Colors.white,
// // //                     fontWeight: FontWeight.bold),
// // //               ),
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }

// // //   Widget _buildDetailRow(IconData icon, String title, String value) {
// // //     return Padding(
// // //       padding: const EdgeInsets.symmetric(vertical: 6.0),
// // //       child: Row(
// // //         children: [
// // //           Icon(icon, color: Colors.grey[600], size: 20),
// // //           const SizedBox(width: 12),
// // //           Text(
// // //             '$title:',
// // //             style:
// // //                 TextStyle(color: Colors.grey[700], fontWeight: FontWeight.w500),
// // //           ),
// // //           const SizedBox(width: 8),
// // //           Expanded(
// // //             child: Text(
// // //               value,
// // //               style: const TextStyle(
// // //                   fontSize: 15,
// // //                   fontWeight: FontWeight.w500,
// // //                   color: Colors.black87),
// // //               overflow: TextOverflow.ellipsis,
// // //             ),
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }

// // //   Widget _buildFacilityChip(IconData icon, String label) {
// // //     return Chip(
// // //       avatar: Icon(icon, size: 18, color: Colors.grey[700]),
// // //       label: Text(
// // //         label,
// // //         style: TextStyle(fontSize: 13, color: Colors.grey[800]),
// // //       ),
// // //       backgroundColor: Colors.grey[200],
// // //       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
// // //       visualDensity: VisualDensity.compact,
// // //     );
// // //   }
// // // }
// // import 'package:flutter/material.dart';
// // import 'package:intl/intl.dart';
// // import 'package:travella/models/FlightData.dart'; // تأكد من استيراد نموذج FlightData
// // import 'package:travella/screens/payment_selection_screen.dart';
// // import 'package:travella/screens/ProfileSignedInScreen.dart';
// // import 'package:travella/services/payment/payment_service.dart';

// // class FlightDetailsScreen extends StatelessWidget {
// //   final FlightData flight;
// //   final bool isGuestUser;

// //   const FlightDetailsScreen({
// //     super.key,
// //     required this.flight,
// //     this.isGuestUser = false,
// //   });

// //   String get formattedPrice {
// //     final formatter = NumberFormat("#,##0", "en_US");
// //     return 'EGP ${formatter.format(flight.price)}';
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     final themeColor = Theme.of(context).primaryColor;
// //     const greyTextColor = Color(0xFF6E6E6E);

// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text(
// //           flight.airlineName,
// //           style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// //         ),
// //         centerTitle: true,
// //         leading: IconButton(
// //           icon: const Icon(Icons.arrow_back),
// //           onPressed: () => Navigator.pop(context),
// //         ),
// //         actions: [
// //           IconButton(
// //             icon: const Icon(Icons.favorite_border, color: Colors.redAccent),
// //             tooltip: 'Add to favorites',
// //             onPressed: () {
// //               ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
// //                 content: Text('Favorite functionality not implemented yet.'),
// //               ));
// //             },
// //           ),
// //         ],
// //       ),
// //       body: SingleChildScrollView(
// //         child: Padding(
// //           padding: const EdgeInsets.all(16.0),
// //           child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               Row(
// //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                 children: [
// //                   Expanded(
// //                     child: Text(
// //                       flight.airlineName,
// //                       style: const TextStyle(
// //                           fontSize: 22, fontWeight: FontWeight.bold),
// //                       overflow: TextOverflow.ellipsis,
// //                     ),
// //                   ),
// //                   Row(
// //                     children: [
// //                       Icon(Icons.star, color: Colors.amber[600], size: 18),
// //                       const SizedBox(width: 4),
// //                       Text(
// //                         flight.rating.toStringAsFixed(1),
// //                         style: const TextStyle(
// //                             fontSize: 14, fontWeight: FontWeight.w500),
// //                       ),
// //                       Text(
// //                         // Dummy review count
// //                         ' (${(flight.rating * 20).toInt()} Reviews)',
// //                         style: TextStyle(fontSize: 12, color: Colors.grey[600]),
// //                       ),
// //                     ],
// //                   ),
// //                 ],
// //               ),
// //               const SizedBox(height: 15),
// //               _buildDetailRow(
// //                   Icons.flight_takeoff_outlined, 'From', flight.fromCity),
// //               _buildDetailRow(Icons.flight_land_outlined, 'To', flight.toCity),
// //               _buildDetailRow(
// //                   Icons.schedule_outlined, 'Duration', flight.duration),
// //               _buildDetailRow(
// //                 Icons.compare_arrows_outlined,
// //                 'Stops',
// //                 flight.stops == 0
// //                     ? 'Non-stop'
// //                     : '${flight.stops} Stop${flight.stops > 1 ? 's' : ''}',
// //               ),
// //               _buildDetailRow(
// //                   Icons.airline_seat_recline_extra, 'Class', flight.category),
// //               _buildDetailRow(
// //                   Icons.access_time, 'Departure', flight.departureTime),
// //               _buildDetailRow(
// //                   Icons.access_time_filled, 'Arrival', flight.arrivalTime),
// //               const SizedBox(height: 20),
// //               const Divider(),
// //               const SizedBox(height: 20),
// //               const Text(
// //                 'Facilities',
// //                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
// //               ),
// //               const SizedBox(height: 10),
// //               Wrap(
// //                 spacing: 15.0,
// //                 runSpacing: 10.0,
// //                 children: [
// //                   _buildFacilityChip(Icons.wifi, 'Wi-Fi'),
// //                   _buildFacilityChip(Icons.fastfood_outlined, 'Meals'),
// //                   _buildFacilityChip(Icons.tv_outlined, 'Entertainment'),
// //                   _buildFacilityChip(Icons.power_outlined, 'Power Outlet'),
// //                   _buildFacilityChip(
// //                       Icons.airline_seat_recline_extra, 'Extra Legroom'),
// //                 ],
// //               ),
// //               const SizedBox(height: 30),
// //             ],
// //           ),
// //         ),
// //       ),
// //       bottomNavigationBar: Container(
// //         padding: const EdgeInsets.all(16.0),
// //         decoration: BoxDecoration(
// //           color: Colors.white,
// //           boxShadow: [
// //             BoxShadow(
// //               color: Colors.grey.withOpacity(0.2),
// //               spreadRadius: 1,
// //               blurRadius: 5,
// //               offset: const Offset(0, -2),
// //             ),
// //           ],
// //         ),
// //         child: Row(
// //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //           children: [
// //             Column(
// //               mainAxisSize: MainAxisSize.min,
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 Text(
// //                   'Price',
// //                   style: TextStyle(color: greyTextColor, fontSize: 13),
// //                 ),
// //                 const SizedBox(height: 2),
// //                 Text(
// //                   formattedPrice,
// //                   style: TextStyle(
// //                       fontSize: 20,
// //                       fontWeight: FontWeight.bold,
// //                       color: themeColor),
// //                 ),
// //               ],
// //             ),
// //             ElevatedButton(
// //               onPressed: () async {
// //                 if (isGuestUser) {
// //                   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
// //                     content: Text('You need to log in to book.'),
// //                     duration: Duration(seconds: 2),
// //                     behavior: SnackBarBehavior.floating,
// //                   ));
// //                   Navigator.push(
// //                     context,
// //                     MaterialPageRoute(
// //                         builder: (context) => const ProfileSignedInScreen()),
// //                   );
// //                 } else {
// //                   final paymentService = PaymentService();
// //                   try {
// //                     final sessionId =
// //                         await paymentService.createCheckoutSession(
// //                       token: "YOUR_AUTH_TOKEN", // استبدل بالتوكن الفعلي
// //                       amount: flight.price,
// //                       serviceName: flight.airlineName,
// //                     );
// //                     Navigator.push(
// //                       context,
// //                       MaterialPageRoute(
// //                         builder: (context) =>
// //                             PaymentSelectionScreen(sessionId: sessionId),
// //                       ),
// //                     );
// //                   } catch (e) {
// //                     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
// //                       content: Text('Payment error: $e'),
// //                       duration: const Duration(seconds: 2),
// //                     ));
// //                   }
// //                 }
// //               },
// //               style: ElevatedButton.styleFrom(
// //                 backgroundColor: themeColor,
// //                 padding:
// //                     const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
// //                 shape: RoundedRectangleBorder(
// //                     borderRadius: BorderRadius.circular(10)),
// //               ),
// //               child: const Text(
// //                 'Book Now',
// //                 style: TextStyle(
// //                     fontSize: 16,
// //                     color: Colors.white,
// //                     fontWeight: FontWeight.bold),
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   Widget _buildDetailRow(IconData icon, String title, String value) {
// //     return Padding(
// //       padding: const EdgeInsets.symmetric(vertical: 6.0),
// //       child: Row(
// //         children: [
// //           Icon(icon, color: Colors.grey[600], size: 20),
// //           const SizedBox(width: 12),
// //           Text(
// //             '$title:',
// //             style:
// //                 TextStyle(color: Colors.grey[700], fontWeight: FontWeight.w500),
// //           ),
// //           const SizedBox(width: 8),
// //           Expanded(
// //             child: Text(
// //               value,
// //               style: const TextStyle(
// //                   fontSize: 15,
// //                   fontWeight: FontWeight.w500,
// //                   color: Colors.black87),
// //               overflow: TextOverflow.ellipsis,
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// //   Widget _buildFacilityChip(IconData icon, String label) {
// //     return Chip(
// //       avatar: Icon(icon, size: 18, color: Colors.grey[700]),
// //       label: Text(
// //         label,
// //         style: TextStyle(fontSize: 13, color: Colors.grey[800]),
// //       ),
// //       backgroundColor: Colors.grey[200],
// //       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
// //       visualDensity: VisualDensity.compact,
// //     );
// //   }
// // }
// // lib/screens/flight_details_screen.dart
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// // --- استيراد الملفات الضرورية ---
// import 'FlightResultsScreen.dart';
// import 'payment_selection_screen.dart';
// import 'ProfileSignedInScreen.dart';

// // --- شاشة تفاصيل الرحلة ---
// class FlightDetailsScreen extends StatelessWidget {
//   final FlightData flight;
//   final bool isGuestUser;

//   const FlightDetailsScreen({
//     super.key,
//     required this.flight,
//     this.isGuestUser = false,
//   });

//   // Getter لتنسيق السعر بشكل صحيح باستخدام intl
//   String get formattedPrice {
//     final formatter = NumberFormat("#,##0", "en_US");
//     // !!! تعديل مهم: استخدام قيمة السعر الرقمية (priceValue) للتنسيق !!!
//     return 'EGP ${formatter.format(flight.priceValue)}';
//   }

//   @override
//   Widget build(BuildContext context) {
//     final themeColor = Theme.of(context).primaryColor;
//     const greyTextColor = Color(0xFF6E6E6E);

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(flight.airlineName,
//             style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//         centerTitle: true,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () => Navigator.pop(context),
//         ),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.favorite_border, color: Colors.redAccent),
//             tooltip: 'Add to favorites',
//             onPressed: () {
//               ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//                   content:
//                       Text('Favorite functionality not implemented yet.')));
//             },
//           )
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Expanded(
//                     child: Text(
//                       flight.airlineName,
//                       style: const TextStyle(
//                           fontSize: 22, fontWeight: FontWeight.bold),
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                   ),
//                   Row(
//                     children: [
//                       Icon(Icons.star, color: Colors.amber[600], size: 18),
//                       const SizedBox(width: 4),
//                       Text(
//                         flight.rating.toStringAsFixed(1),
//                         style: const TextStyle(
//                             fontSize: 14, fontWeight: FontWeight.w500),
//                       ),
//                       Text(
//                         ' (${flight.stops + 50} Reviews)', // مثال
//                         style: TextStyle(fontSize: 12, color: Colors.grey[600]),
//                       )
//                     ],
//                   )
//                 ],
//               ),
//               const SizedBox(height: 15),
//               _buildDetailRow(
//                   Icons.flight_takeoff_outlined, 'From', flight.fromCity),
//               _buildDetailRow(Icons.flight_land_outlined, 'To', flight.toCity),
//               _buildDetailRow(
//                   Icons.schedule_outlined, 'Duration', flight.duration),
//               _buildDetailRow(
//                   Icons.compare_arrows_outlined,
//                   'Stops',
//                   flight.stops == 0
//                       ? 'Non-stop'
//                       : '${flight.stops} Stop${flight.stops > 1 ? 's' : ''}'),
//               _buildDetailRow(
//                   Icons.airline_seat_recline_extra, 'Class', flight.category),
//               _buildDetailRow(
//                   Icons.access_time, 'Departure', flight.departureTime),
//               _buildDetailRow(
//                   Icons.access_time_filled, 'Arrival', flight.arrivalTime),
//               const SizedBox(height: 20),
//               const Divider(),
//               const SizedBox(height: 20),
//               const Text('Facilities',
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//               const SizedBox(height: 10),
//               Wrap(
//                 spacing: 15.0,
//                 runSpacing: 10.0,
//                 children: [
//                   _buildFacilityChip(Icons.wifi, 'Wi-Fi'),
//                   _buildFacilityChip(Icons.fastfood_outlined, 'Meals'),
//                   _buildFacilityChip(Icons.tv_outlined, 'Entertainment'),
//                   _buildFacilityChip(Icons.power_outlined, 'Power Outlet'),
//                   _buildFacilityChip(
//                       Icons.airline_seat_recline_extra, 'Extra Legroom'),
//                 ],
//               ),
//               const SizedBox(height: 30),
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: Container(
//         padding: const EdgeInsets.all(16.0),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.withOpacity(0.2),
//               spreadRadius: 1,
//               blurRadius: 5,
//               offset: const Offset(0, -2),
//             ),
//           ],
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text('Price',
//                     style: TextStyle(color: greyTextColor, fontSize: 13)),
//                 const SizedBox(height: 2),
//                 Text(
//                   formattedPrice, // <-- يستخدم الـ getter المعدل
//                   style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: themeColor),
//                 ),
//               ],
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 if (isGuestUser) {
//                   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//                     content: Text('You need to log in to book.'),
//                     duration: Duration(seconds: 2),
//                     behavior: SnackBarBehavior.floating,
//                   ));
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => const ProfileSignedInScreen()));
//                 } else {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => const PaymentSelectionScreen(
//                                 sessionId: '',
//                               )));
//                 }
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: themeColor,
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10)),
//               ),
//               child: const Text('Book Now',
//                   style: TextStyle(
//                       fontSize: 16,
//                       color: Colors.white,
//                       fontWeight: FontWeight.bold)),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // --- باقي الودجت المساعدة لم تتغير ---
//   Widget _buildDetailRow(IconData icon, String title, String value) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 6.0),
//       child: Row(
//         children: [
//           Icon(icon, color: Colors.grey[600], size: 20),
//           const SizedBox(width: 12),
//           Text('$title:',
//               style: TextStyle(
//                   color: Colors.grey[700], fontWeight: FontWeight.w500)),
//           const SizedBox(width: 8),
//           Expanded(
//             child: Text(
//               value,
//               style: const TextStyle(
//                   fontSize: 15,
//                   fontWeight: FontWeight.w500,
//                   color: Colors.black87),
//               overflow: TextOverflow.ellipsis,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

// ignore_for_file: unused_import

//   Widget _buildFacilityChip(IconData icon, String label) {
//     return Chip(
//       avatar: Icon(icon, size: 18, color: Colors.grey[700]),
//       label:
//           Text(label, style: TextStyle(fontSize: 13, color: Colors.grey[800])),
//       backgroundColor: Colors.grey[200],
//       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//       visualDensity: VisualDensity.compact,
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:apptravella/models/FlightData.dart';
import 'package:apptravella/screens/FlightResultsScreen.dart';
import 'package:apptravella/services/payment/payment_service.dart';
import 'payment_selection_screen.dart';
import 'ProfileSignedInScreen.dart';

class FlightDetailsScreen extends StatefulWidget {
  final FlightData flight;
  final bool isGuestUser;
  final int adults;
  final int children;

  const FlightDetailsScreen({
    super.key,
    required this.flight,
    this.isGuestUser = false,
    required this.adults,
    required this.children,
  });

  @override
  State<FlightDetailsScreen> createState() => _FlightDetailsScreenState();
}

class _FlightDetailsScreenState extends State<FlightDetailsScreen> {
  bool _isLoading = false;
  final PaymentService _paymentService = PaymentService();

  String get formattedPrice {
    final formatter = NumberFormat("#,##0", "en_US");
    return 'EGP ${formatter.format(widget.flight.priceValue)}';
  }

  Future<void> _handleBookNow() async {
    if (widget.isGuestUser) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('You need to log in to book.'),
        behavior: SnackBarBehavior.floating,
      ));
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const ProfileSignedInScreen()));
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final String checkoutUrl =
          await _paymentService.createFlightCheckoutSession(
        flightId: widget.flight.id,
        amount: widget.flight.priceValue,
        serviceName:
            'Flight: ${widget.flight.fromCity} to ${widget.flight.toCity}',
      );

      if (!mounted) return;

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PaymentSelectionScreen(
            checkoutUrl: checkoutUrl,
            sessionId: '',
          ),
        ),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Booking failed: ${e.toString()}')),
      );
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeColor = Theme.of(context).primaryColor;
    const greyTextColor = Color(0xFF6E6E6E);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.flight.airlineName,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        // actions: [
        //   IconButton(
        //     icon: const Icon(Icons.favorite_border, color: Colors.redAccent),
        //     onPressed: () {},
        //   )
        // ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      widget.flight.airlineName,
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber[600], size: 18),
                      const SizedBox(width: 4),
                      Text(
                        widget.flight.rating.toStringAsFixed(1),
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        ' (${widget.flight.stops + 50} Reviews)',
                        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(height: 15),
              _buildDetailRow(Icons.flight_takeoff_outlined, 'From',
                  widget.flight.fromCity),
              _buildDetailRow(
                  Icons.flight_land_outlined, 'To', widget.flight.toCity),
              _buildDetailRow(
                  Icons.schedule_outlined, 'Duration', widget.flight.duration),
              _buildDetailRow(
                  Icons.compare_arrows_outlined,
                  'Stops',
                  widget.flight.stops == 0
                      ? 'Non-stop'
                      : '${widget.flight.stops} Stop${widget.flight.stops > 1 ? 's' : ''}'),
              _buildDetailRow(Icons.airline_seat_recline_extra, 'Class',
                  widget.flight.category),
              _buildDetailRow(
                  Icons.access_time, 'Departure', widget.flight.departureTime),
              _buildDetailRow(Icons.access_time_filled, 'Arrival',
                  widget.flight.arrivalTime),
              const SizedBox(height: 20),
              const Divider(),
              const SizedBox(height: 20),
              const Text('Facilities',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Wrap(
                spacing: 15.0,
                runSpacing: 10.0,
                children: [
                  _buildFacilityChip(Icons.wifi, 'Wi-Fi'),
                  _buildFacilityChip(Icons.fastfood_outlined, 'Meals'),
                  _buildFacilityChip(Icons.tv_outlined, 'Entertainment'),
                  _buildFacilityChip(Icons.power_outlined, 'Power Outlet'),
                  _buildFacilityChip(
                      Icons.airline_seat_recline_extra, 'Extra Legroom'),
                ],
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Price',
                    style: TextStyle(color: greyTextColor, fontSize: 13)),
                const SizedBox(height: 2),
                Text(
                  formattedPrice,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: themeColor),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: _isLoading ? null : _handleBookNow,
              style: ElevatedButton.styleFrom(
                backgroundColor: themeColor,
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              child: _isLoading
                  ? const SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 3,
                      ),
                    )
                  : const Text('Book Now',
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey[600], size: 20),
          const SizedBox(width: 12),
          Text('$title:',
              style: TextStyle(
                  color: Colors.grey[700], fontWeight: FontWeight.w500)),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFacilityChip(IconData icon, String label) {
    return Chip(
      avatar: Icon(icon, size: 18, color: Colors.grey[700]),
      label:
          Text(label, style: TextStyle(fontSize: 13, color: Colors.grey[800])),
      backgroundColor: Colors.grey[200],
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      visualDensity: VisualDensity.compact,
    );
  }
}
