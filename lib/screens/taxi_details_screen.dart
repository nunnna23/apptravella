// // // import 'package:flutter/material.dart';
// // // // استيراد شاشة اختيار الدفع (نفس الشاشة المستخدمة للسيارات)
// // // import 'payment_selection_screen.dart';

// // // class TaxiDetailsScreen extends StatelessWidget {
// // //   // استقبال بيانات التاكسي المحددة (يمكنك إنشاء نموذج Taxi إذا أردت)
// // //   final Map<String, dynamic> taxiData;

// // //   // --- Constants for Styling ---
// // //   static const Color _themeColor = Color(0xFF406F89);
// // //   static const Color _primaryTextColor = Colors.black;
// // //   static const Color _secondaryTextColor = Colors.grey;

// // //   const TaxiDetailsScreen({
// // //     super.key,
// // //     required this.taxiData,
// // //   });

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     // استخراج البيانات لسهولة القراءة
// // //     final String name = taxiData['name'] ?? 'Unknown Taxi';
// // //     final String imageUrl =
// // //         taxiData['imageUrl'] ?? 'assets/placeholder_car.png'; // صورة افتراضية
// // //     final double rating = taxiData['rating'] ?? 0.0;
// // //     final int price = taxiData['price'] ?? 0;
// // //     final String eta = taxiData['eta'] ?? '--';
// // //     final String pickupTime = taxiData['pickupTime'] ?? '--';
// // //     final String distance = taxiData['distance'] ?? '--';
// // //     // يمكنك إضافة بيانات أخرى مثل اسم السائق، لوحة السيارة، إلخ.

// // //     return Scaffold(
// // //       backgroundColor: Colors.white,
// // //       appBar: AppBar(
// // //         backgroundColor: Colors.white,
// // //         elevation: 0.5,
// // //         shadowColor: Colors.grey.shade200,
// // //         leading: IconButton(
// // //           icon: const Icon(Icons.arrow_back, color: _primaryTextColor),
// // //           onPressed: () => Navigator.pop(context),
// // //         ),
// // //         title: Text(
// // //           name, // اسم/نوع السيارة
// // //           style: const TextStyle(
// // //               color: _primaryTextColor,
// // //               fontSize: 18,
// // //               fontWeight: FontWeight.bold),
// // //         ),
// // //         centerTitle: true,
// // //         // يمكنك إضافة زر إلغاء أو أي إجراءات أخرى هنا إذا أردت
// // //       ),
// // //       body: SingleChildScrollView(
// // //         child: Column(
// // //           crossAxisAlignment: CrossAxisAlignment.start,
// // //           children: [
// // //             // --- صورة السيارة ---
// // //             Image.asset(
// // //               imageUrl,
// // //               height: 250, // ارتفاع مناسب للصورة
// // //               width: double.infinity,
// // //               fit: BoxFit.cover,
// // //               errorBuilder: (context, error, stackTrace) => Container(
// // //                 height: 250,
// // //                 width: double.infinity,
// // //                 color: Colors.grey[300],
// // //                 child: const Center(
// // //                     child:
// // //                         Icon(Icons.local_taxi, size: 100, color: Colors.grey)),
// // //               ),
// // //             ),
// // //             // --- قسم التفاصيل ---
// // //             Padding(
// // //               padding: const EdgeInsets.all(16.0),
// // //               child: Column(
// // //                 crossAxisAlignment: CrossAxisAlignment.start,
// // //                 children: [
// // //                   // --- الصف الأول: الاسم والتقييم ---
// // //                   Row(
// // //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // //                     children: [
// // //                       Flexible(
// // //                           child: Text(name,
// // //                               style: const TextStyle(
// // //                                   fontSize: 24, fontWeight: FontWeight.bold))),
// // //                       Row(children: [
// // //                         Icon(Icons.star_rounded,
// // //                             color: Colors.amber[600], size: 20),
// // //                         const SizedBox(width: 4),
// // //                         Text(rating.toStringAsFixed(1),
// // //                             style: const TextStyle(
// // //                                 fontSize: 16, fontWeight: FontWeight.bold))
// // //                       ]),
// // //                     ],
// // //                   ),
// // //                   const SizedBox(height: 16),

// // //                   // --- معلومات إضافية (السائق، لوحة السيارة - مثال) ---
// // //                   _buildDetailRow(
// // //                       Icons.person_outline, "Driver", "Ahmed Ali"), // مثال
// // //                   _buildDetailRow(
// // //                       Icons.pin_outlined, "Plate No.", "ABC-123"), // مثال
// // //                   const Divider(height: 24, thickness: 0.5),

// // //                   // --- تفاصيل الرحلة ---
// // //                   const Text('Trip Details',
// // //                       style:
// // //                           TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
// // //                   const SizedBox(height: 12),
// // //                   _buildDetailRow(Icons.directions_car_filled_outlined,
// // //                       "Distance", distance),
// // //                   _buildDetailRow(
// // //                       Icons.access_time_filled, "Estimated Arrival", eta),
// // //                   _buildDetailRow(
// // //                       Icons.timer_outlined, "Pickup Time", pickupTime),
// // //                   const Divider(height: 24, thickness: 0.5),

// // //                   // --- الأجرة المقدرة ---
// // //                   const Text('Estimated Fare',
// // //                       style:
// // //                           TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
// // //                   const SizedBox(height: 8),
// // //                   Text(
// // //                     'EGP $price',
// // //                     style: const TextStyle(
// // //                         fontSize: 22,
// // //                         fontWeight: FontWeight.bold,
// // //                         color: _themeColor),
// // //                   ),
// // //                   const Text(
// // //                     '(Fare may vary based on traffic and final route)', // ملاحظة
// // //                     style: TextStyle(fontSize: 12, color: _secondaryTextColor),
// // //                   ),

// // //                   const SizedBox(height: 80), // مسافة قبل الزر السفلي
// // //                 ],
// // //               ),
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //       // --- الشريط السفلي لزر الحجز ---
// // //       bottomNavigationBar: Container(
// // //         padding: const EdgeInsets.all(16.0),
// // //         decoration: BoxDecoration(color: Colors.white, boxShadow: [
// // //           BoxShadow(
// // //               color: Colors.grey.withOpacity(0.3),
// // //               spreadRadius: 1,
// // //               blurRadius: 5,
// // //               offset: const Offset(0, -2))
// // //         ]),
// // //         child: ElevatedButton(
// // //           onPressed: () {
// // //             // --- الانتقال إلى شاشة اختيار الدفع ---
// // //             Navigator.push(
// // //               context,
// // //               MaterialPageRoute(
// // //                   builder: (context) => const PaymentSelectionScreen(
// // //                         sessionId: '',
// // //                       )), // إعادة استخدام نفس شاشة الدفع
// // //             );
// // //           },
// // //           style: ElevatedButton.styleFrom(
// // //             backgroundColor: _themeColor,
// // //             padding: const EdgeInsets.symmetric(vertical: 16),
// // //             shape:
// // //                 RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
// // //             elevation: 2,
// // //           ),
// // //           child: const Text('Confirm Pickup',
// // //               style: TextStyle(
// // //                   fontSize: 18,
// // //                   fontWeight: FontWeight.bold,
// // //                   color: Colors.white)),
// // //         ),
// // //       ),
// // //     );
// // //   }

// // //   // دالة مساعدة لعرض صف تفاصيل (أيقونة - عنوان - قيمة)
// // //   Widget _buildDetailRow(IconData icon, String title, String value) {
// // //     return Padding(
// // //       padding: const EdgeInsets.symmetric(vertical: 8.0),
// // //       child: Row(
// // //         children: [
// // //           Icon(icon, color: _secondaryTextColor, size: 20),
// // //           const SizedBox(width: 16),
// // //           Text('$title: ',
// // //               style: const TextStyle(color: _secondaryTextColor, fontSize: 15)),
// // //           Expanded(
// // //             // للسماح للقيمة بالالتفاف إذا كانت طويلة
// // //             child: Text(value,
// // //                 style: const TextStyle(
// // //                     color: _primaryTextColor,
// // //                     fontSize: 15,
// // //                     fontWeight: FontWeight.w500)),
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }
// // // }
// // import 'package:flutter/material.dart';
// // import 'package:intl/intl.dart';
// // import 'package:travella/models/Taxi.dart';
// // import 'payment_selection_screen.dart';

// // class TaxiDetailsScreen extends StatelessWidget {
// //   final Taxi taxiData;

// //   static const Color _themeColor = Color(0xFF406F89);
// //   static const Color _primaryTextColor = Colors.black;
// //   static const Color _secondaryTextColor = Colors.grey;

// //   const TaxiDetailsScreen({super.key, required this.taxiData});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.white,
// //       appBar: AppBar(
// //         backgroundColor: Colors.white,
// //         elevation: 0.5,
// //         shadowColor: Colors.grey.shade200,
// //         leading: IconButton(
// //           icon: const Icon(Icons.arrow_back, color: _primaryTextColor),
// //           onPressed: () => Navigator.pop(context),
// //         ),
// //         title: Text(
// //           taxiData.carModel,
// //           style: const TextStyle(
// //               color: _primaryTextColor,
// //               fontSize: 18,
// //               fontWeight: FontWeight.bold),
// //         ),
// //         centerTitle: true,
// //       ),
// //       body: SingleChildScrollView(
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             Image.network(
// //               taxiData.imageUrls.isNotEmpty
// //                   ? taxiData.imageUrls.first
// //                   : 'assets/placeholder_car.png',
// //               height: 250,
// //               width: double.infinity,
// //               fit: BoxFit.cover,
// //               errorBuilder: (context, error, stackTrace) => Container(
// //                 height: 250,
// //                 width: double.infinity,
// //                 color: Colors.grey[300],
// //                 child: const Center(
// //                     child:
// //                         Icon(Icons.local_taxi, size: 100, color: Colors.grey)),
// //               ),
// //             ),
// //             Padding(
// //               padding: const EdgeInsets.all(16.0),
// //               child: Column(
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 children: [
// //                   Row(
// //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                     children: [
// //                       Flexible(
// //                           child: Text(taxiData.carModel,
// //                               style: const TextStyle(
// //                                   fontSize: 24, fontWeight: FontWeight.bold))),
// //                       Row(children: [
// //                         Icon(Icons.star_rounded,
// //                             color: Colors.amber[600], size: 20),
// //                         const SizedBox(width: 4),
// //                         Text((taxiData.rate).toStringAsFixed(1),
// //                             style: const TextStyle(
// //                                 fontSize: 16, fontWeight: FontWeight.bold)),
// //                       ]),
// //                     ],
// //                   ),
// //                   const SizedBox(height: 16),
// //                   _buildDetailRow(Icons.person_outline, "Driver",
// //                       "Driver Name"), // Placeholder
// //                   _buildDetailRow(Icons.pin_outlined, "Plate No.",
// //                       "ABC-123"), // Placeholder
// //                   const Divider(height: 24, thickness: 0.5),
// //                   const Text('Trip Details',
// //                       style:
// //                           TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
// //                   const SizedBox(height: 12),
// //                   _buildDetailRow(Icons.directions_car_filled_outlined,
// //                       "Distance", '${taxiData.distance} Km'),
// //                   _buildDetailRow(Icons.access_time_filled, "Estimated Arrival",
// //                       '${taxiData.estimatedTime} min'),
// //                   _buildDetailRow(Icons.timer_outlined, "Pickup Time",
// //                       DateFormat('h:mm a').format(taxiData.tripTime)),
// //                   const Divider(height: 24, thickness: 0.5),
// //                   const Text('Estimated Fare',
// //                       style:
// //                           TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
// //                   const SizedBox(height: 8),
// //                   Text(
// //                     'EGP ${(taxiData.price).toStringAsFixed(0)}',
// //                     style: const TextStyle(
// //                         fontSize: 22,
// //                         fontWeight: FontWeight.bold,
// //                         color: _themeColor),
// //                   ),
// //                   const Text(
// //                     '(Fare may vary based on traffic and final route)',
// //                     style: TextStyle(fontSize: 12, color: _secondaryTextColor),
// //                   ),
// //                   const SizedBox(height: 80),
// //                 ],
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //       bottomNavigationBar: Container(
// //         padding: const EdgeInsets.all(16.0),
// //         decoration: BoxDecoration(color: Colors.white, boxShadow: [
// //           BoxShadow(
// //               color: Colors.grey.withOpacity(0.3),
// //               spreadRadius: 1,
// //               blurRadius: 5,
// //               offset: const Offset(0, -2))
// //         ]),
// //         child: ElevatedButton(
// //           onPressed: () {
// //             Navigator.push(
// //               context,
// //               MaterialPageRoute(
// //                   builder: (context) =>
// //                       const PaymentSelectionScreen(sessionId: '')),
// //             );
// //           },
// //           style: ElevatedButton.styleFrom(
// //             backgroundColor: _themeColor,
// //             padding: const EdgeInsets.symmetric(vertical: 16),
// //             shape:
// //                 RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
// //             elevation: 2,
// //           ),
// //           child: const Text('Confirm Pickup',
// //               style: TextStyle(
// //                   fontSize: 18,
// //                   fontWeight: FontWeight.bold,
// //                   color: Colors.white)),
// //         ),
// //       ),
// //     );
// //   }

// //   Widget _buildDetailRow(IconData icon, String title, String value) {
// //     return Padding(
// //       padding: const EdgeInsets.symmetric(vertical: 8.0),
// //       child: Row(
// //         children: [
// //           Icon(icon, color: _secondaryTextColor, size: 20),
// //           const SizedBox(width: 16),
// //           Text('$title: ',
// //               style: const TextStyle(color: _secondaryTextColor, fontSize: 15)),
// //           Expanded(
// //               child: Text(value,
// //                   style: const TextStyle(
// //                       color: _primaryTextColor,
// //                       fontSize: 15,
// //                       fontWeight: FontWeight.w500))),
// //         ],
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:travella/models/Taxi.dart';
// import 'package:travella/services/payment/payment_service.dart';
// import 'package:url_launcher/url_launcher.dart';
// // استيراد مكتبة الصور لتحسين الأداء وتوحيد الكود
// import 'package:cached_network_image/cached_network_image.dart';

// class TaxiDetailsScreen extends StatelessWidget {
//   final Taxi taxiData;

//   static const Color _themeColor = Color(0xFF406F89);
//   static const Color _primaryTextColor = Colors.black;
//   static const Color _secondaryTextColor = Colors.grey;

//   const TaxiDetailsScreen({super.key, required this.taxiData});

//   Future<void> _handleBooking(BuildContext context) async {
//     final paymentService = PaymentService();
//     try {
//       final checkoutUrl = await paymentService.createTaxiCheckoutSession(
//         amount: taxiData.price,
//         serviceName: taxiData.carModel,
//         taxiId: taxiData.id,
//       );
//       final Uri url = Uri.parse(checkoutUrl);
//       if (await canLaunchUrl(url)) {
//         await launchUrl(url, mode: LaunchMode.externalApplication);
//       } else {
//         throw 'Could not launch $url';
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error: $e')),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0.5,
//         shadowColor: Colors.grey.shade200,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: _primaryTextColor),
//           onPressed: () => Navigator.pop(context),
//         ),
//         title: Text(
//           taxiData.carModel,
//           style: const TextStyle(
//               color: _primaryTextColor,
//               fontSize: 18,
//               fontWeight: FontWeight.bold),
//         ),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // --- هذا هو التعديل الذي يحل المشكلة ---
//             CachedNetworkImage(
//               // نستخدم الآن الدالة المساعدة من الموديل
//               imageUrl: taxiData.primaryFullImageUrl,
//               height: 250,
//               width: double.infinity,
//               fit: BoxFit.cover,
//               placeholder: (context, url) => Container(
//                 height: 250,
//                 width: double.infinity,
//                 color: Colors.grey[200],
//                 child: const Center(child: CircularProgressIndicator()),
//               ),
//               errorWidget: (context, url, error) => Container(
//                 height: 250,
//                 width: double.infinity,
//                 color: Colors.grey[300],
//                 child: const Center(
//                     child:
//                         Icon(Icons.local_taxi, size: 100, color: Colors.grey)),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Flexible(
//                           child: Text(taxiData.carModel,
//                               style: const TextStyle(
//                                   fontSize: 24, fontWeight: FontWeight.bold))),
//                       Row(children: [
//                         Icon(Icons.star_rounded,
//                             color: Colors.amber[600], size: 20),
//                         const SizedBox(width: 4),
//                         Text((taxiData.rate).toStringAsFixed(1),
//                             style: const TextStyle(
//                                 fontSize: 16, fontWeight: FontWeight.bold)),
//                       ]),
//                     ],
//                   ),
//                   const SizedBox(height: 16),
//                   _buildDetailRow(
//                       Icons.person_outline, "Driver", "Driver Name"), // بيانات وهمية
//                   _buildDetailRow(
//                       Icons.pin_outlined, "Plate No.", "ABC-123"), // بيانات وهمية
//                   const Divider(height: 24, thickness: 0.5),
//                   const Text('Trip Details',
//                       style:
//                           TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//                   const SizedBox(height: 12),
//                   _buildDetailRow(Icons.directions_car_filled_outlined,
//                       "Distance", '${taxiData.distance} Km'),
//                   _buildDetailRow(Icons.access_time_filled, "Estimated Time",
//                       '${taxiData.estimatedTime} min'),
//                   _buildDetailRow(Icons.timer_outlined, "Pickup Time",
//                       DateFormat('h:mm a').format(taxiData.tripTime)),
//                   const Divider(height: 24, thickness: 0.5),
//                   const Text('Estimated Fare',
//                       style:
//                           TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//                   const SizedBox(height: 8),
//                   Text(
//                     'EGP ${(taxiData.price).toStringAsFixed(0)}',
//                     style: const TextStyle(
//                         fontSize: 22,
//                         fontWeight: FontWeight.bold,
//                         color: _themeColor),
//                   ),
//                   const Text(
//                     '(Fare may vary based on traffic and final route)',
//                     style: TextStyle(fontSize: 12, color: _secondaryTextColor),
//                   ),
//                   const SizedBox(height: 80),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: Container(
//         padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
//         decoration: BoxDecoration(color: Colors.white, boxShadow: [
//           BoxShadow(
//               color: Colors.grey.withOpacity(0.3),
//               spreadRadius: 1,
//               blurRadius: 5,
//               offset: const Offset(0, -2))
//         ]),
//         child: ElevatedButton(
//           onPressed: () => _handleBooking(context),
//           style: ElevatedButton.styleFrom(
//             backgroundColor: _themeColor,
//             padding: const EdgeInsets.symmetric(vertical: 16),
//             shape:
//                 RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//             elevation: 2,
//           ),
//           child: const Text('Confirm Pickup',
//               style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white)),
//         ),
//       ),
//     );
//   }

//   Widget _buildDetailRow(IconData icon, String title, String value) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Row(
//         children: [
//           Icon(icon, color: _secondaryTextColor, size: 20),
//           const SizedBox(width: 16),
//           Text('$title: ',
//               style: const TextStyle(color: _secondaryTextColor, fontSize: 15)),
//           Expanded(
//               child: Text(value,
//                   style: const TextStyle(
//                       color: _primaryTextColor,
//                       fontSize: 15,
//                       fontWeight: FontWeight.w500))),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:apptravella/models/Taxi.dart';
import 'package:apptravella/services/payment/payment_service.dart';
import 'package:url_launcher/url_launcher.dart';
// استيراد مكتبة الصور لتحسين الأداء وتوحيد الكود
import 'package:cached_network_image/cached_network_image.dart';

class TaxiDetailsScreen extends StatelessWidget {
  final Taxi taxiData;

  static const Color _themeColor = Color(0xFF406F89);
  static const Color _primaryTextColor = Colors.black;
  static const Color _secondaryTextColor = Colors.grey;

  const TaxiDetailsScreen({super.key, required this.taxiData});

  Future<void> _handleBooking(BuildContext context) async {
    final paymentService = PaymentService();
    try {
      final checkoutUrl = await paymentService.createTaxiCheckoutSession(
        amount: taxiData.price,
        serviceName: taxiData.carModel,
        taxiId: taxiData.id,
      );
      // استخدام الإصدار الجديد من url_launcher لضمان التوافق
      final Uri url = Uri.parse(checkoutUrl);
      if (await canLaunchUrl(url)) {
        await launchUrl(url, mode: LaunchMode.externalApplication);
      } else {
        throw 'Could not launch $url';
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        shadowColor: Colors.grey.shade200,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: _primaryTextColor),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          taxiData.carModel,
          style: const TextStyle(
              color: _primaryTextColor,
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- هذا هو التعديل الأساسي والمهم ---
            // الآن نستخدم نفس الدالة الموجودة في شاشة النتائج
            CachedNetworkImage(
              imageUrl: taxiData.primaryFullImageUrl,
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
              placeholder: (context, url) => Container(
                height: 250,
                width: double.infinity,
                color: Colors.grey[200],
                child: const Center(child: CircularProgressIndicator()),
              ),
              errorWidget: (context, url, error) => Container(
                height: 250,
                width: double.infinity,
                color: Colors.grey[300],
                child: const Center(
                    child:
                        Icon(Icons.local_taxi, size: 100, color: Colors.grey)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                          child: Text(taxiData.carModel,
                              style: const TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold))),
                      Row(children: [
                        Icon(Icons.star_rounded,
                            color: Colors.amber[600], size: 20),
                        const SizedBox(width: 4),
                        Text((taxiData.rate).toStringAsFixed(1),
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                      ]),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _buildDetailRow(Icons.person_outline, "Driver",
                      "Driver Name"), // بيانات وهمية
                  _buildDetailRow(Icons.pin_outlined, "Plate No.",
                      "ABC-123"), // بيانات وهمية
                  const Divider(height: 24, thickness: 0.5),
                  const Text('Trip Details',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 12),
                  _buildDetailRow(Icons.directions_car_filled_outlined,
                      "Distance", '${taxiData.distance} Km'),
                  _buildDetailRow(Icons.access_time_filled, "Estimated Time",
                      '${taxiData.estimatedTime} min'),
                  _buildDetailRow(Icons.timer_outlined, "Pickup Time",
                      DateFormat('h:mm a').format(taxiData.tripTime)),
                  const Divider(height: 24, thickness: 0.5),
                  const Text('Estimated Fare',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text(
                    'EGP ${(taxiData.price).toStringAsFixed(0)}',
                    style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: _themeColor),
                  ),
                  const Text(
                    '(Fare may vary based on traffic and final route)',
                    style: TextStyle(fontSize: 12, color: _secondaryTextColor),
                  ),
                  const SizedBox(height: 80), // مسافة للـ BottomNavigationBar
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, -2))
        ]),
        child: ElevatedButton(
          onPressed: () => _handleBooking(context),
          style: ElevatedButton.styleFrom(
            backgroundColor: _themeColor,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 2,
          ),
          child: const Text('Confirm Pickup',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
        ),
      ),
    );
  }

  Widget _buildDetailRow(IconData icon, String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: _secondaryTextColor, size: 20),
          const SizedBox(width: 16),
          Text('$title: ',
              style: const TextStyle(color: _secondaryTextColor, fontSize: 15)),
          Expanded(
              child: Text(value,
                  style: const TextStyle(
                      color: _primaryTextColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w500))),
        ],
      ),
    );
  }
}
