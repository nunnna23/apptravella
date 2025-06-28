// // // import 'package:flutter/material.dart';
// // // import 'package:intl/intl.dart'; // لتنسيق الأرقام

// // // // استيراد كلاس بيانات الفندق
// // // import 'hotel_results_screen.dart'; // تأكد من المسار الصحيح

// // // class CompareHotelsScreen extends StatelessWidget {
// // //   final List<HotelData> hotelsToCompare;

// // //   const CompareHotelsScreen({
// // //     super.key,
// // //     required this.hotelsToCompare,
// // //   });

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     final Color themePrimaryColor = Theme.of(context).primaryColor;
// // //     int compareCount = hotelsToCompare.length;

// // //     return Scaffold(
// // //       backgroundColor: Colors.white,
// // //       appBar: AppBar(
// // //         // تصميم موروث من الثيم
// // //         leading: IconButton(
// // //           icon: const Icon(Icons.arrow_back),
// // //           onPressed: () => Navigator.pop(context),
// // //         ),
// // //         title: Text(
// // //             'Compare ($compareCount hotel${compareCount > 1 ? 's' : ''})'), // عنوان ديناميكي
// // //         centerTitle: false, // محاذاة لليسار
// // //       ),
// // //       body: hotelsToCompare.isEmpty
// // //           ? const Center(
// // //               child: Text(
// // //                   'No hotels selected for comparison.')) // رسالة إذا كانت القائمة فارغة
// // //           : PageView.builder(
// // //               // استخدام PageView للتمرير الأفقي بين الفنادق
// // //               itemCount: hotelsToCompare.length,
// // //               itemBuilder: (context, index) {
// // //                 // بناء صفحة لكل فندق
// // //                 return _buildCompareHotelCard(
// // //                     context, hotelsToCompare[index], themePrimaryColor);
// // //               },
// // //             ),
// // //     );
// // //   }

// // //   // دالة بناء محتوى المقارنة لفندق واحد
// // //   Widget _buildCompareHotelCard(
// // //       BuildContext context, HotelData hotel, Color themePrimaryColor) {
// // //     final NumberFormat priceFormatter = NumberFormat("#,##0", "en_US");
// // //     const double paddingValue = 16.0;

// // //     return SingleChildScrollView(
// // //       // للسماح بالتمرير العمودي إذا كان المحتوى طويلاً
// // //       padding: const EdgeInsets.all(paddingValue),
// // //       child: Column(
// // //         crossAxisAlignment: CrossAxisAlignment.start,
// // //         children: [
// // //           // --- الصورة ---
// // //           ClipRRect(
// // //             borderRadius: BorderRadius.circular(12.0),
// // //             child: Image.asset(
// // //               hotel.imageUrl, // استخدم الصورة الافتراضية أو الحقيقية
// // //               height: 200, // ارتفاع أكبر للصورة في المقارنة
// // //               width: double.infinity,
// // //               fit: BoxFit.cover,
// // //               errorBuilder: (context, error, stackTrace) => Container(
// // //                   height: 200,
// // //                   color: Colors.grey[300],
// // //                   child: const Center(
// // //                       child: Icon(Icons.broken_image, color: Colors.grey))),
// // //             ),
// // //           ),
// // //           const SizedBox(height: paddingValue),

// // //           // --- الاسم والموقع ---
// // //           Text(hotel.name,
// // //               style:
// // //                   const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
// // //           const SizedBox(height: 6),
// // //           Row(children: [
// // //             Icon(Icons.location_on_outlined, size: 16, color: Colors.grey[600]),
// // //             const SizedBox(width: 4),
// // //             Expanded(
// // //                 child: Text(hotel.location,
// // //                     style: TextStyle(fontSize: 14, color: Colors.grey[700])))
// // //           ]),
// // //           const SizedBox(height: paddingValue),

// // //           // --- السعر وعدد الليالي ---
// // //           Row(
// // //             crossAxisAlignment: CrossAxisAlignment.baseline, // لمحاذاة النصوص
// // //             textBaseline: TextBaseline.alphabetic,
// // //             children: [
// // //               Text('Pricing',
// // //                   style: TextStyle(
// // //                       fontSize: 16,
// // //                       fontWeight: FontWeight.bold,
// // //                       color: Colors.grey[800])),
// // //               const Spacer(), // لدفع السعر لليمين
// // //               Text(hotel.formattedPrice,
// // //                   style: TextStyle(
// // //                       fontSize: 22,
// // //                       fontWeight: FontWeight.bold,
// // //                       color: themePrimaryColor)),
// // //               const SizedBox(width: 5),
// // //               Padding(
// // //                 padding: const EdgeInsets.only(top: 4.0),
// // //                 child: Text(hotel.priceSubtitle,
// // //                     style: TextStyle(fontSize: 12, color: Colors.grey[600])),
// // //               ),
// // //             ],
// // //           ),
// // //           const SizedBox(height: paddingValue),
// // //           Divider(color: Colors.grey[300]),

// // //           // --- التقييم ---
// // //           _buildCompareSectionTitle('Ratings', Icons.star_border),
// // //           Row(
// // //             children: [
// // //               // عرض النجوم
// // //               Row(
// // //                   children: List.generate(5, (index) {
// // //                 return Icon(
// // //                     index < hotel.rating.floor()
// // //                         ? Icons.star
// // //                         : Icons.star_border,
// // //                     color: Colors.amber[600],
// // //                     size: 20);
// // //               }).toList()),
// // //               const SizedBox(width: 8),
// // //               // نص التقييم (ممتاز، جيد جداً، ...) - يمكنك إضافة منطق لهذا بناءً على قيمة التقييم
// // //               Text(_getRatingText(hotel.rating),
// // //                   style: const TextStyle(
// // //                       fontSize: 14, fontWeight: FontWeight.w500)),
// // //             ],
// // //           ),
// // //           const SizedBox(height: paddingValue),
// // //           Divider(color: Colors.grey[300]),

// // //           // --- وسائل الراحة ---
// // //           _buildCompareSectionTitle('Amenities',
// // //               Icons.local_laundry_service_outlined), // أيقونة مناسبة
// // //           _buildIconList(hotel.amenities), // دالة مساعدة لعرض القائمة
// // //           const SizedBox(height: paddingValue),
// // //           Divider(color: Colors.grey[300]),

// // //           // --- الأنشطة (بيانات تجريبية) ---
// // //           _buildCompareSectionTitle('Activities', Icons.directions_run),
// // //           _buildIconList(['GYM', 'Yoga', 'Spa']), // بيانات تجريبية للأنشطة
// // //           const SizedBox(height: paddingValue * 2),

// // //           // --- زر الحجز ---
// // //           SizedBox(
// // //             width: double.infinity,
// // //             child: ElevatedButton(
// // //               onPressed: () {
// // //                 // TODO: إضافة منطق الحجز أو الانتقال لصفحة الحجز
// // //                 print('Booking hotel: ${hotel.name}');
// // //                 ScaffoldMessenger.of(context).showSnackBar(SnackBar(
// // //                     content: Text('Booking action for ${hotel.name}')));
// // //               },
// // //               style: ElevatedButton.styleFrom(
// // //                 padding: const EdgeInsets.symmetric(vertical: 14),
// // //                 shape: RoundedRectangleBorder(
// // //                     borderRadius: BorderRadius.circular(10)),
// // //               ),
// // //               child: const Text('Book',
// // //                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
// // //             ),
// // //           ),
// // //           const SizedBox(height: paddingValue), // مسافة سفلية
// // //         ],
// // //       ),
// // //     );
// // //   }

// // //   // دالة مساعدة لعرض عنوان قسم في شاشة المقارنة
// // //   Widget _buildCompareSectionTitle(String title, IconData icon) {
// // //     return Padding(
// // //       padding: const EdgeInsets.only(bottom: 8.0),
// // //       child: Row(
// // //         children: [
// // //           Icon(icon, size: 18, color: Colors.grey[700]),
// // //           const SizedBox(width: 8),
// // //           Text(title,
// // //               style: TextStyle(
// // //                   fontSize: 16,
// // //                   fontWeight: FontWeight.bold,
// // //                   color: Colors.grey[800])),
// // //         ],
// // //       ),
// // //     );
// // //   }

// // //   // دالة مساعدة لعرض قائمة نصوص مع أيقونات (لوسائل الراحة والأنشطة)
// // //   Widget _buildIconList(List<String> items) {
// // //     // يمكنك تحسين هذا الجزء لربط كل نص بأيقونة محددة
// // //     Map<String, IconData> iconMap = {
// // //       'free wifi': Icons.wifi,
// // //       'free breakfast': Icons.free_breakfast,
// // //       'free cancellation': Icons.event_available,
// // //       'pool': Icons.pool,
// // //       'parking': Icons.local_parking,
// // //       'no age restriction': Icons.family_restroom, // مثال
// // //       'family rooms': Icons.family_restroom_outlined, // مثال
// // //       'good breakfast': Icons.restaurant, // مثال
// // //       'non smoking rooms': Icons.smoke_free, // مثال
// // //       'gym': Icons.fitness_center,
// // //       'yoga': Icons.self_improvement,
// // //       'spa': Icons.spa,
// // //       // أضف المزيد من الربط بين النص والأيقونة هنا
// // //     };
// // //     IconData defaultIcon = Icons.check_circle_outline; // أيقونة افتراضية

// // //     return Wrap(
// // //       // Wrap أفضل من Column إذا كانت القائمة طويلة
// // //       spacing: 16.0, // مسافة أفقية
// // //       runSpacing: 8.0, // مسافة عمودية
// // //       children: items.map((item) {
// // //         IconData icon = iconMap[item.toLowerCase()] ??
// // //             defaultIcon; // البحث عن الأيقونة أو استخدام الافتراضية
// // //         return Row(
// // //           mainAxisSize: MainAxisSize.min,
// // //           children: [
// // //             Icon(icon, size: 16, color: Colors.green[800]),
// // //             const SizedBox(width: 6),
// // //             Text(item, style: TextStyle(fontSize: 13, color: Colors.grey[800])),
// // //           ],
// // //         );
// // //       }).toList(),
// // //     );
// // //   }

// // //   // دالة مساعدة لتحويل قيمة التقييم إلى نص وصفي
// // //   String _getRatingText(double rating) {
// // //     if (rating >= 4.8) return 'Excellent';
// // //     if (rating >= 4.5) return 'Very Good';
// // //     if (rating >= 4.0) return 'Good';
// // //     if (rating >= 3.5) return 'Fair';
// // //     return 'Okay'; // أو أي نص آخر للتقييمات الأقل
// // //   }
// // // } // نهاية CompareHotelsScreen
// // import 'package:flutter/material.dart';
// // import 'package:intl/intl.dart'; // لتنسيق الأرقام

// // // استيراد كلاس بيانات الفندق - تأكد من المسار الصحيح
// // import 'hotel_results_screen.dart'; // أو أي ملف آخر يحتوي على تعريف HotelData

// // class CompareHotelsScreen extends StatelessWidget {
// //   final List<HotelData> hotelsToCompare;

// //   const CompareHotelsScreen({
// //     super.key,
// //     required this.hotelsToCompare,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     final Color themePrimaryColor = Theme.of(context).primaryColor;
// //     int compareCount = hotelsToCompare.length;
// //     final screenWidth = MediaQuery.of(context).size.width;

// //     // --- حساب عرض العمود بناءً على عدد الفنادق ---
// //     const double totalHorizontalPadding = 32.0; // 16 padding on each side
// //     const double spacingBetweenColumns = 12.0;
// //     double availableWidth = screenWidth - totalHorizontalPadding;

// //     // تحديد العرض لجعل 3+ أعمدة تتطلب التمرير
// //     double columnWidth;
// //     if (compareCount <= 1) {
// //       columnWidth = availableWidth;
// //     } else if (compareCount == 2) {
// //       // عرض عمودين بجانب بعضهما البعض
// //       columnWidth = (availableWidth - spacingBetweenColumns) / 2;
// //     } else {
// //       // عرض أضيق قليلاً للأعمدة لتشجيع التمرير لـ 3 أو 4
// //       columnWidth = screenWidth * 0.75; // مثال: 75% من عرض الشاشة
// //     }
// //     // وضع حدود منطقية لعرض العمود
// //     columnWidth =
// //         columnWidth.clamp(280.0, 400.0); // تعديل الحد الأدنى والأقصى حسب الحاجة

// //     return Scaffold(
// //       backgroundColor: Colors.grey[100], // خلفية رمادية فاتحة للشاشة
// //       appBar: AppBar(
// //         backgroundColor: Colors.white,
// //         elevation: 1.0,
// //         leading: IconButton(
// //           icon: const Icon(Icons.arrow_back, color: Colors.black),
// //           onPressed: () => Navigator.pop(context),
// //         ),
// //         title: Text(
// //           'Compare ($compareCount hotel${compareCount > 1 ? 's' : ''})',
// //           style: const TextStyle(
// //               color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
// //         ),
// //         centerTitle: false,
// //       ),
// //       body: hotelsToCompare.isEmpty
// //           ? const Center(child: Text('No hotels selected for comparison.'))
// //           : SingleChildScrollView(
// //               // --- التمرير الأفقي للصف ---
// //               scrollDirection: Axis.horizontal,
// //               padding: const EdgeInsets.symmetric(
// //                   horizontal: totalHorizontalPadding / 2,
// //                   vertical: 16.0), // هوامش للصف
// //               child: Row(
// //                 // --- لعرض الأعمدة جنبًا إلى جنب ---
// //                 crossAxisAlignment:
// //                     CrossAxisAlignment.start, // محاذاة الأعمدة من الأعلى
// //                 children: List.generate(hotelsToCompare.length, (index) {
// //                   // بناء عمود لكل فندق
// //                   return Container(
// //                     width: columnWidth, // تطبيق العرض المحسوب
// //                     // إضافة مسافة بين الأعمدة ما عدا الأخير
// //                     margin: EdgeInsets.only(
// //                         right: index < hotelsToCompare.length - 1
// //                             ? spacingBetweenColumns
// //                             : 0),
// //                     child: _buildCompareHotelColumn(
// //                         context, hotelsToCompare[index], themePrimaryColor),
// //                   );
// //                 }),
// //               ),
// //             ),
// //     );
// //   }

// //   // --- دالة بناء عمود المقارنة لفندق واحد ---
// //   Widget _buildCompareHotelColumn(
// //       BuildContext context, HotelData hotel, Color themePrimaryColor) {
// //     const double verticalSpacing = 12.0; // المسافة العمودية بين الأقسام
// //     const double internalPadding = 12.0; // الهوامش الداخلية لمحتوى العمود

// //     return Container(
// //       decoration: BoxDecoration(
// //           color: Colors.white, // خلفية بيضاء للعمود
// //           borderRadius: BorderRadius.circular(12.0), // حواف دائرية
// //           boxShadow: [
// //             // ظل خفيف
// //             BoxShadow(
// //                 color: Colors.black.withOpacity(0.05),
// //                 blurRadius: 5,
// //                 offset: Offset(0, 2)),
// //           ]),
// //       child: Column(
// //           // استخدام Column لترتيب العناصر عموديًا داخل العمود
// //           crossAxisAlignment: CrossAxisAlignment.start, // محاذاة العناصر لليسار
// //           children: [
// //             // --- الصورة ---
// //             ClipRRect(
// //               borderRadius:
// //                   const BorderRadius.vertical(top: Radius.circular(12.0)),
// //               child: Image.asset(
// //                 hotel.imageUrl, // استخدام الصورة
// //                 height: 140, // ارتفاع الصورة (أصغر في التصميم الجديد)
// //                 width: double.infinity,
// //                 fit: BoxFit.cover,
// //                 errorBuilder: (context, error, stackTrace) => Container(
// //                     height: 140,
// //                     color: Colors.grey[200],
// //                     child: const Center(
// //                         child: Icon(Icons.broken_image, color: Colors.grey))),
// //               ),
// //             ),
// //             // --- المحتوى النصي مع هوامش ---
// //             Padding(
// //               padding: const EdgeInsets.all(internalPadding),
// //               child: Column(
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 children: [
// //                   // --- الاسم والموقع ---
// //                   Text(hotel.name,
// //                       style: const TextStyle(
// //                           fontSize: 16, fontWeight: FontWeight.bold)),
// //                   const SizedBox(height: 4),
// //                   Row(children: [
// //                     Icon(Icons.location_on_outlined,
// //                         size: 14, color: Colors.grey[600]),
// //                     const SizedBox(width: 4),
// //                     Expanded(
// //                         child: Text(hotel.location,
// //                             style: TextStyle(
// //                                 fontSize: 12, color: Colors.grey[700])))
// //                   ]),
// //                   const SizedBox(height: verticalSpacing),
// //                   Divider(color: Colors.grey[300]), // فاصل

// //                   // --- السعر ---
// //                   _buildCompareSectionTitle('Pricing', null),
// //                   Row(
// //                     crossAxisAlignment: CrossAxisAlignment.baseline,
// //                     textBaseline: TextBaseline.alphabetic,
// //                     children: [
// //                       Text(hotel.formattedPrice,
// //                           style: TextStyle(
// //                               fontSize: 18,
// //                               fontWeight: FontWeight.bold,
// //                               color: themePrimaryColor)), // السعر أكبر قليلاً
// //                       const SizedBox(width: 5),
// //                       Text(hotel.priceSubtitle,
// //                           style:
// //                               TextStyle(fontSize: 11, color: Colors.grey[600])),
// //                     ],
// //                   ),
// //                   const SizedBox(height: verticalSpacing),
// //                   Divider(color: Colors.grey[300]),

// //                   // --- التقييم ---
// //                   _buildCompareSectionTitle('Ratings', Icons.star_border),
// //                   Row(
// //                     children: [
// //                       Row(
// //                           children: List.generate(5, (index) {
// //                         return Icon(
// //                             index < hotel.rating.floor()
// //                                 ? Icons.star
// //                                 : Icons.star_border,
// //                             color: Colors.amber[600],
// //                             size: 18);
// //                       }).toList()), // حجم النجوم أصغر
// //                       const SizedBox(width: 8),
// //                       // عدد التقييمات (بيانات تجريبية)
// //                       Text(
// //                           "(${NumberFormat.compact().format(hotel.rating * 35)})",
// //                           style: TextStyle(
// //                               fontSize: 11,
// //                               color: Colors.grey[600])), // مثال للعدد بين قوسين
// //                       const Spacer(),
// //                       Text(_getRatingText(hotel.rating),
// //                           style: const TextStyle(
// //                               fontSize: 12, fontWeight: FontWeight.w500)),
// //                     ],
// //                   ),
// //                   const SizedBox(height: verticalSpacing),
// //                   Divider(color: Colors.grey[300]),

// //                   // --- وسائل الراحة ---
// //                   _buildCompareSectionTitle(
// //                       'Amenities', Icons.local_laundry_service_outlined),
// //                   _buildIconList(hotel.amenities,
// //                       context), // استخدام الدالة المساعدة الجديدة
// //                   const SizedBox(height: verticalSpacing),
// //                   Divider(color: Colors.grey[300]),

// //                   // --- الأنشطة ---
// //                   _buildCompareSectionTitle('Activities', Icons.directions_run),
// //                   _buildIconList(['GYM', 'Yoga'],
// //                       context), // بيانات تجريبية (Spa محذوفة في التصميم الجديد)
// //                   const SizedBox(
// //                       height: verticalSpacing * 2), // مسافة أكبر قبل الزر
// //                 ],
// //               ),
// //             ),

// //             // --- زر الحجز (خارج الـ Padding الداخلي ليمتد) ---
// //             Padding(
// //               padding: const EdgeInsets.fromLTRB(
// //                   internalPadding, 0, internalPadding, internalPadding),
// //               child: SizedBox(
// //                 width: double.infinity,
// //                 child: ElevatedButton(
// //                   onPressed: () {/* منطق الحجز */},
// //                   style: ElevatedButton.styleFrom(
// //                     backgroundColor: themePrimaryColor,
// //                     foregroundColor: Colors.white,
// //                     padding:
// //                         const EdgeInsets.symmetric(vertical: 12), // ارتفاع الزر
// //                     shape: RoundedRectangleBorder(
// //                         borderRadius: BorderRadius.circular(10)),
// //                     elevation: 1,
// //                   ),
// //                   child: const Text('Book',
// //                       style:
// //                           TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
// //                 ),
// //               ),
// //             ),
// //           ]),
// //     );
// //   }

// //   // --- دالة مساعدة لعناوين الأقسام ---
// //   Widget _buildCompareSectionTitle(String title, IconData? icon) {
// //     return Padding(
// //       padding: const EdgeInsets.only(bottom: 6.0), // تقليل المسافة السفلية
// //       child: Row(
// //         children: [
// //           if (icon != null) ...[
// //             Icon(icon, size: 16, color: Colors.grey[700]), // حجم الأيقونة أصغر
// //             const SizedBox(width: 6),
// //           ],
// //           Text(title,
// //               style: TextStyle(
// //                   fontSize: 14,
// //                   fontWeight: FontWeight.bold,
// //                   color: Colors.grey[800])), // حجم الخط أصغر
// //         ],
// //       ),
// //     );
// //   }

// //   // --- دالة مساعدة لعرض قائمة الأيقونات والنصوص (Amenities, Activities) ---
// //   Widget _buildIconList(List<String> items, BuildContext context) {
// //     Map<String, IconData> iconMap = {
// //       'free wifi': Icons.wifi,
// //       'free breakfast': Icons.free_breakfast,
// //       'free cancellation': Icons.event_available,
// //       'pool': Icons.pool,
// //       'parking': Icons.local_parking,
// //       'no age restriction': Icons.family_restroom,
// //       'family rooms': Icons.family_restroom_outlined,
// //       'good breakfast': Icons.restaurant,
// //       'non smoking rooms': Icons.smoke_free,
// //       'gym': Icons.fitness_center,
// //       'yoga': Icons.self_improvement,
// //       'spa': Icons.spa,
// //     };
// //     IconData defaultIcon = Icons.check_circle_outline;
// //     final Color iconColor = Theme.of(context)
// //         .primaryColor
// //         .withOpacity(0.9); // استخدام لون الثيم للأيقونات

// //     // استخدام Column لعرض العناصر تحت بعضها
// //     return Column(
// //       crossAxisAlignment: CrossAxisAlignment.start, // محاذاة لليسار
// //       children: items.map((item) {
// //         IconData icon = iconMap[item.toLowerCase()] ?? defaultIcon;
// //         return Padding(
// //           padding: const EdgeInsets.only(bottom: 5.0), // مسافة بين العناصر
// //           child: Row(
// //             mainAxisSize: MainAxisSize.min,
// //             children: [
// //               Icon(icon, size: 14, color: iconColor), // حجم الأيقونة أصغر
// //               const SizedBox(width: 6),
// //               Text(item,
// //                   style: TextStyle(
// //                       fontSize: 12, color: Colors.grey[800])), // حجم الخط أصغر
// //             ],
// //           ),
// //         );
// //       }).toList(),
// //     );
// //   }

// // ignore_for_file: unused_import

// //   // --- دالة مساعدة لنص التقييم ---
// //   String _getRatingText(double rating) {
// //     if (rating >= 4.8) return 'Excellent';
// //     if (rating >= 4.5) return 'Very Good';
// //     if (rating >= 4.0) return 'Good';
// //     if (rating >= 3.5) return 'Fair';
// //     return 'Okay';
// //   }
// // } // نهاية CompareHotelsScreen
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:travella/models/hotel_model.dart';
// import 'package:travella/services/hotel_api_service.dart';

// class CompareHotelsScreen extends StatefulWidget {
//   final List<Hotel> hotelsToCompare;

//   const CompareHotelsScreen({
//     super.key,
//     required this.hotelsToCompare,
//   });

//   @override
//   State<CompareHotelsScreen> createState() => _CompareHotelsScreenState();
// }

// class _CompareHotelsScreenState extends State<CompareHotelsScreen> {
//   final HotelApiService _apiService = HotelApiService();
//   late Future<HotelComparison> _comparisonFuture;

//   @override
//   void initState() {
//     super.initState();
//     // The API only supports comparing two hotels. We use the first two selected.
//     if (widget.hotelsToCompare.length >= 2) {
//       _comparisonFuture = _apiService.compareHotels(
//         widget.hotelsToCompare[0].id,
//         widget.hotelsToCompare[1].id,
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     int compareCount = widget.hotelsToCompare.length;

//     return Scaffold(
//       backgroundColor: Colors.grey[100],
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 1.0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () => Navigator.pop(context),
//         ),
//         title: Text(
//           'Compare ($compareCount hotel${compareCount > 1 ? 's' : ''})',
//           style: const TextStyle(
//               color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
//         ),
//         centerTitle: false,
//       ),
//       body: widget.hotelsToCompare.length < 2
//           ? const Center(
//               child: Text('Please select at least two hotels to compare.'))
//           : FutureBuilder<HotelComparison>(
//               future: _comparisonFuture,
//               builder: (context, snapshot) {
//                 if (snapshot.connectionState == ConnectionState.waiting) {
//                   return const Center(child: CircularProgressIndicator());
//                 }
//                 if (snapshot.hasError) {
//                   return Center(
//                       child: Text("Error comparing hotels: ${snapshot.error}"));
//                 }
//                 if (!snapshot.hasData) {
//                   return const Center(
//                       child: Text("Could not get comparison data."));
//                 }

//                 final comparisonData = snapshot.data!;
//                 final hotel1 = comparisonData.hotel1;
//                 final hotel2 = comparisonData.hotel2;

//                 return SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   padding: const EdgeInsets.symmetric(
//                       horizontal: 16.0, vertical: 16.0),
//                   child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       _buildCompareHotelColumn(context, hotel1),
//                       const SizedBox(width: 12),
//                       _buildCompareHotelColumn(context, hotel2),
//                     ],
//                   ),
//                 );
//               },
//             ),
//     );
//   }

//   Widget _buildCompareHotelColumn(BuildContext context, Hotel hotel) {
//     final Color themePrimaryColor = Theme.of(context).primaryColor;
//     const double verticalSpacing = 12.0;
//     const double internalPadding = 12.0;
//     final double columnWidth = MediaQuery.of(context).size.width * 0.75;

//     return Container(
//       width: columnWidth.clamp(280.0, 400.0),
//       decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(12.0),
//           boxShadow: [
//             BoxShadow(
//                 color: Colors.black.withOpacity(0.05),
//                 blurRadius: 5,
//                 offset: const Offset(0, 2)),
//           ]),
//       child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//         ClipRRect(
//           borderRadius: const BorderRadius.vertical(top: Radius.circular(12.0)),
//           child: Image.network(
//             hotel.primaryImageUrl,
//             height: 140,
//             width: double.infinity,
//             fit: BoxFit.cover,
//             errorBuilder: (context, error, stackTrace) => Container(
//                 height: 140,
//                 color: Colors.grey[200],
//                 child: const Center(
//                     child: Icon(Icons.broken_image, color: Colors.grey))),
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.all(internalPadding),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(hotel.name,
//                   style: const TextStyle(
//                       fontSize: 16, fontWeight: FontWeight.bold)),
//               const SizedBox(height: 4),
//               Row(children: [
//                 Icon(Icons.location_on_outlined,
//                     size: 14, color: Colors.grey[600]),
//                 const SizedBox(width: 4),
//                 Expanded(
//                     child: Text('${hotel.city}, ${hotel.countery}',
//                         style:
//                             TextStyle(fontSize: 12, color: Colors.grey[700])))
//               ]),
//               const SizedBox(height: verticalSpacing),
//               const Divider(),
//               _buildCompareSectionTitle('Pricing', null),
//               Text(hotel.formattedPrice,
//                   style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: themePrimaryColor)),
//               const SizedBox(height: verticalSpacing),
//               const Divider(),
//               _buildCompareSectionTitle('Ratings', Icons.star_border),
//               Row(
//                 children: [
//                   Row(
//                       children: List.generate(5, (index) {
//                     return Icon(
//                         index < hotel.rate.floor()
//                             ? Icons.star
//                             : Icons.star_border,
//                         color: Colors.amber[600],
//                         size: 18);
//                   }).toList()),
//                   const SizedBox(width: 8),
//                   Text(_getRatingText(hotel.rate),
//                       style: const TextStyle(
//                           fontSize: 12, fontWeight: FontWeight.w500)),
//                 ],
//               ),
//               const SizedBox(height: verticalSpacing),
//               const Divider(),
//               _buildCompareSectionTitle(
//                   'Amenities', Icons.local_laundry_service_outlined),
//               _buildIconList(hotel.amenities, context),
//               const SizedBox(height: verticalSpacing * 2),
//             ],
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.fromLTRB(
//               internalPadding, 0, internalPadding, internalPadding),
//           child: SizedBox(
//             width: double.infinity,
//             child: ElevatedButton(
//               onPressed: () {},
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: themePrimaryColor,
//                 foregroundColor: Colors.white,
//                 padding: const EdgeInsets.symmetric(vertical: 12),
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10)),
//               ),
//               child: const Text('Book',
//                   style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
//             ),
//           ),
//         ),
//       ]),
//     );
//   }

//   Widget _buildCompareSectionTitle(String title, IconData? icon) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 6.0),
//       child: Row(
//         children: [
//           if (icon != null) ...[
//             Icon(icon, size: 16, color: Colors.grey[700]),
//             const SizedBox(width: 6),
//           ],
//           Text(title,
//               style: TextStyle(
//                   fontSize: 14,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.grey[800])),
//         ],
//       ),
//     );
//   }

//   Widget _buildIconList(List<String> items, BuildContext context) {
//     Map<String, IconData> iconMap = {
//       'free wifi': Icons.wifi,
//       'free breakfast': Icons.free_breakfast,
//       'free cancellation': Icons.event_available,
//       'pool': Icons.pool,
//       'parking': Icons.local_parking,
//       'gym': Icons.fitness_center,
//       'spa': Icons.spa,
//     };
//     final Color iconColor = Theme.of(context).primaryColor.withOpacity(0.9);

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: items.map((item) {
//         IconData icon =
//             iconMap[item.toLowerCase()] ?? Icons.check_circle_outline;
//         return Padding(
//           padding: const EdgeInsets.only(bottom: 5.0),
//           child: Row(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Icon(icon, size: 14, color: iconColor),
//               const SizedBox(width: 6),
//               Text(item,
//                   style: TextStyle(fontSize: 12, color: Colors.grey[800])),
//             ],
//           ),
//         );
//       }).toList(),
//     );
//   }

//   String _getRatingText(double rating) {
//     if (rating >= 4.8) return 'Excellent';
//     if (rating >= 4.5) return 'Very Good';
//     if (rating >= 4.0) return 'Good';
//     return 'Okay';
//   }
// }
// file: lib/screens/compare_hotels_screen.dart
import 'package:flutter/material.dart';
// --- (الحل) إضافة سطر الاستيراد هذا ---
import '../models/hotel_model.dart';
// ------------------------------------
import '../services/hotel_api_service.dart';

class CompareHotelsScreen extends StatefulWidget {
  final List<Hotel> hotelsToCompare;

  const CompareHotelsScreen({
    super.key,
    required this.hotelsToCompare,
  });

  @override
  State<CompareHotelsScreen> createState() => _CompareHotelsScreenState();
}

class _CompareHotelsScreenState extends State<CompareHotelsScreen> {
  final HotelApiService _apiService = HotelApiService();
  // الآن سيعمل هذا السطر بدون خطأ
  late Future<HotelComparison> _comparisonFuture;

  @override
  void initState() {
    super.initState();
    // الـ API يدعم مقارنة فندقين فقط. سنستخدم أول فندقين تم اختيارهما.
    if (widget.hotelsToCompare.length >= 2) {
      _comparisonFuture = _apiService.compareHotels(
        widget.hotelsToCompare[0].id,
        widget.hotelsToCompare[1].id,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    int compareCount = widget.hotelsToCompare.length;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1.0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Compare ($compareCount hotel${compareCount > 1 ? 's' : ''})',
          style: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        centerTitle: false,
      ),
      body: widget.hotelsToCompare.length < 2
          ? const Center(
              child: Text('Please select at least two hotels to compare.'))
          : FutureBuilder<HotelComparison>(
              // وهذا أيضًا سيعمل بدون خطأ
              future: _comparisonFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(
                      child: Text("Error comparing hotels: ${snapshot.error}"));
                }
                if (!snapshot.hasData) {
                  return const Center(
                      child: Text("Could not get comparison data."));
                }

                final comparisonData = snapshot.data!;
                final hotel1 = comparisonData.hotel1;
                final hotel2 = comparisonData.hotel2;

                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildCompareHotelColumn(context, hotel1),
                      const SizedBox(width: 12),
                      _buildCompareHotelColumn(context, hotel2),
                    ],
                  ),
                );
              },
            ),
    );
  }

  Widget _buildCompareHotelColumn(BuildContext context, Hotel hotel) {
    final Color themePrimaryColor = Theme.of(context).primaryColor;
    const double verticalSpacing = 12.0;
    const double internalPadding = 12.0;
    final double columnWidth = MediaQuery.of(context).size.width * 0.75;

    return Container(
      width: columnWidth.clamp(280.0, 400.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 5,
                offset: const Offset(0, 2)),
          ]),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(12.0)),
          child: Image.network(
            hotel.primaryImageUrl,
            height: 140,
            width: double.infinity,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Container(
                height: 140,
                color: Colors.grey[200],
                child: const Center(
                    child: Icon(Icons.broken_image, color: Colors.grey))),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(internalPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(hotel.name,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              Row(children: [
                Icon(Icons.location_on_outlined,
                    size: 14, color: Colors.grey[600]),
                const SizedBox(width: 4),
                Expanded(
                    child: Text('${hotel.city}, ${hotel.countery}',
                        style:
                            TextStyle(fontSize: 12, color: Colors.grey[700])))
              ]),
              const SizedBox(height: verticalSpacing),
              const Divider(),
              _buildCompareSectionTitle('Pricing', null),
              Text(hotel.formattedPrice,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: themePrimaryColor)),
              const SizedBox(height: verticalSpacing),
              const Divider(),
              _buildCompareSectionTitle('Ratings', Icons.star_border),
              Row(
                children: [
                  Row(
                      children: List.generate(5, (index) {
                    return Icon(
                        index < hotel.rate.floor()
                            ? Icons.star
                            : Icons.star_border,
                        color: Colors.amber[600],
                        size: 18);
                  }).toList()),
                  const SizedBox(width: 8),
                  Text(_getRatingText(hotel.rate),
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w500)),
                ],
              ),
              const SizedBox(height: verticalSpacing),
              const Divider(),
              _buildCompareSectionTitle(
                  'Amenities', Icons.local_laundry_service_outlined),
              _buildIconList(hotel.amenities, context),
              const SizedBox(height: verticalSpacing * 2),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(
              internalPadding, 0, internalPadding, internalPadding),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {/* منطق الحجز */},
              style: ElevatedButton.styleFrom(
                backgroundColor: themePrimaryColor,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              child: const Text('Book',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            ),
          ),
        ),
      ]),
    );
  }

  Widget _buildCompareSectionTitle(String title, IconData? icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6.0),
      child: Row(
        children: [
          if (icon != null) ...[
            Icon(icon, size: 16, color: Colors.grey[700]),
            const SizedBox(width: 6),
          ],
          Text(title,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800])),
        ],
      ),
    );
  }

  Widget _buildIconList(List<String> items, BuildContext context) {
    Map<String, IconData> iconMap = {
      'wifi': Icons.wifi, // تم التعديل ليكون مطابقًا للنموذج
      'pool': Icons.pool,
      'restaurant': Icons.restaurant,
      'spa': Icons.spa,
      'parking': Icons.local_parking,
      'gym': Icons.fitness_center,
    };
    final Color iconColor = Theme.of(context).primaryColor.withOpacity(0.9);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items.map((item) {
        IconData icon =
            iconMap[item.toLowerCase()] ?? Icons.check_circle_outline;
        return Padding(
          padding: const EdgeInsets.only(bottom: 5.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 14, color: iconColor),
              const SizedBox(width: 6),
              Text(item,
                  style: TextStyle(fontSize: 12, color: Colors.grey[800])),
            ],
          ),
        );
      }).toList(),
    );
  }

  String _getRatingText(double rating) {
    if (rating >= 4.8) return 'Excellent';
    if (rating >= 4.5) return 'Very Good';
    if (rating >= 4.0) return 'Good';
    return 'Okay';
  }
}
