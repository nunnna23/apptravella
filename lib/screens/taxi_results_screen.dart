// // // import 'package:flutter/material.dart';
// // // //import 'package:intl/intl.dart'; // لم نعد نستخدمه هنا بشكل مباشر، ولكن قد تحتاجه لاحقًا

// // // // !!! تأكد من أن هذه المسارات صحيحة !!!
// // // import '../widgets/taxi_filter_screen.dart'; // شاشة الفلترة
// // // import 'taxi_details_screen.dart'; // شاشة تفاصيل التاكسي

// // // class TaxiResultsScreen extends StatefulWidget {
// // //   // --- FIX: Added const ---
// // //   const TaxiResultsScreen({super.key});

// // //   @override
// // //   State<TaxiResultsScreen> createState() => _TaxiResultsScreenState();
// // // }

// // // class _TaxiResultsScreenState extends State<TaxiResultsScreen> {
// // //   // --- Constants (ثوابت التصميم) ---
// // //   static const Color _themeColor = Color(0xFF406F89); // اللون الأساسي للتطبيق
// // //   static const Color _lightBackgroundColor = Colors.white; // لون الخلفية العام
// // //   static const Color _buttonBackgroundColor =
// // //       Color(0xFFF8F8F8); // خلفية الأزرار
// // //   static const Color _subtleBorderColor =
// // //       Color(0xFFE0E0E0); // لون الحدود الخفيفة
// // //   static const Color _secondaryTextColor =
// // //       Colors.grey; // لون النص الثانوي (الرمادي)
// // //   static const Color _primaryTextColor =
// // //       Colors.black; // لون النص الأساسي (الأسود)

// // //   // --- State (متغيرات الحالة) ---
// // //   String _selectedSortOption = 'Highest rated'; // خيار الترتيب المحدد حاليًا

// // //   // --- Placeholder Data (بيانات تجريبية - استبدلها ببيانات فعلية) ---
// // //   final List<Map<String, dynamic>> taxiResults = [
// // //     {
// // //       'name': 'Toyota Innova',
// // //       'rating': 4.8,
// // //       'price': 100,
// // //       'distance': '1.2km',
// // //       'eta': '3 min',
// // //       'pickupTime': '4:30PM',
// // //       'imageUrl': 'assets/car.jpeg'
// // //     },
// // //     {
// // //       'name': 'Honda City',
// // //       'rating': 4.5,
// // //       'price': 110,
// // //       'distance': '0.7km',
// // //       'eta': '2 min',
// // //       'pickupTime': '4:27PM',
// // //       'imageUrl': 'assets/car.jpeg'
// // //     },
// // //     {
// // //       'name': 'Hyundai Verna',
// // //       'rating': 4.2,
// // //       'price': 90,
// // //       'distance': '3.5km',
// // //       'eta': '7 min',
// // //       'pickupTime': '4:35PM',
// // //       'imageUrl': 'assets/car.jpeg'
// // //     },
// // //     {
// // //       'name': 'Suzuki Swift',
// // //       'rating': 4.0,
// // //       'price': 85,
// // //       'distance': '2.1km',
// // //       'eta': '5 min',
// // //       'pickupTime': '4:31PM',
// // //       'imageUrl': 'assets/car.jpeg'
// // //     }, // مثال إضافي
// // //     {
// // //       'name': 'Kia Seltos',
// // //       'rating': 4.6,
// // //       'price': 120,
// // //       'distance': '1.8km',
// // //       'eta': '4 min',
// // //       'pickupTime': '4:29PM',
// // //       'imageUrl': 'assets/car.jpeg'
// // //     }, // مثال إضافي
// // //   ];
// // //   // --- End Placeholder Data ---

// // //   // --- Methods (الدوال) ---

// // //   // تحديث خيار الترتيب وإعادة ترتيب القائمة
// // //   void _updateSortOption(String? value) {
// // //     if (value != null && value != _selectedSortOption) {
// // //       setState(() {
// // //         _selectedSortOption = value;
// // //         _sortTaxiResults(); // استدعاء دالة الترتيب
// // //         print("Sorting by: $_selectedSortOption"); // للتحقق
// // //       });
// // //     }
// // //   }

// // //   // دالة الترتيب الفعلية للبيانات التجريبية
// // //   void _sortTaxiResults() {
// // //     taxiResults.sort((a, b) {
// // //       switch (_selectedSortOption) {
// // //         case 'Highest rated':
// // //           // الترتيب تنازليًا حسب التقييم
// // //           return (b['rating'] ?? 0.0).compareTo(a['rating'] ?? 0.0);
// // //         case 'Lowest price':
// // //           // الترتيب تصاعديًا حسب السعر
// // //           return (a['price'] ?? 0).compareTo(b['price'] ?? 0);
// // //         case 'Nearest':
// // //           // الترتيب تصاعديًا حسب المسافة (تحويل النص لرقم)
// // //           double distA =
// // //               double.tryParse(a['distance']?.replaceAll('km', '') ?? '999') ??
// // //                   999;
// // //           double distB =
// // //               double.tryParse(b['distance']?.replaceAll('km', '') ?? '999') ??
// // //                   999;
// // //           return distA.compareTo(distB);
// // //         case 'Farthest':
// // //           // الترتيب تنازليًا حسب المسافة (تحويل النص لرقم)
// // //           double distA =
// // //               double.tryParse(a['distance']?.replaceAll('km', '') ?? '999') ??
// // //                   999;
// // //           double distB =
// // //               double.tryParse(b['distance']?.replaceAll('km', '') ?? '999') ??
// // //                   999;
// // //           return distB.compareTo(distA); // عكس المقارنة
// // //         default:
// // //           return 0; // لا تغيير إذا كان الخيار غير معروف
// // //       }
// // //     });
// // //   }

// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     // تطبيق الترتيب الأولي عند بدء الشاشة
// // //     _sortTaxiResults();
// // //   }

// // //   // --- Build Method (دالة بناء الواجهة) ---
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       backgroundColor: _lightBackgroundColor, // لون الخلفية
// // //       appBar: AppBar(
// // //         // --- شريط التطبيق ---
// // //         elevation: 0.5, // ظل خفيف جدًا
// // //         shadowColor: Colors.grey.shade200, // لون الظل
// // //         backgroundColor: _lightBackgroundColor, // خلفية بيضاء
// // //         leading: IconButton(
// // //           icon: const Icon(Icons.arrow_back, color: _primaryTextColor),
// // //           onPressed: () => Navigator.of(context).pop(), // زر الرجوع
// // //         ),
// // //         title: Text(
// // //           // عرض الوجهة (هنا ثابتة كمثال) وعدد النتائج
// // //           'Dokki (${taxiResults.length} results)',
// // //           style: const TextStyle(
// // //               color: _primaryTextColor,
// // //               fontSize: 18,
// // //               fontWeight: FontWeight.bold),
// // //         ),
// // //         centerTitle: true, // توسيط العنوان
// // //       ),
// // //       body: Column(
// // //         // العمود الرئيسي لمحتوى الشاشة
// // //         children: [
// // //           // --- صف أزرار التصنيف والفلتر ---
// // //           Padding(
// // //             padding:
// // //                 const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
// // //             child: Row(
// // //               mainAxisAlignment:
// // //                   MainAxisAlignment.spaceBetween, // توزيع المسافة
// // //               children: [
// // //                 // --- زر التصنيف (يفتح قائمة منبثقة) ---
// // //                 _buildStyledButton(
// // //                   icon: Icons.sort, // الأيقونة غير مستخدمة مباشرة هنا
// // //                   label: 'Sort', // النص غير مستخدم مباشرة هنا
// // //                   childBuilder: (context) {
// // //                     // بناء محتوى الزر المخصص
// // //                     return PopupMenuButton<String>(
// // //                       onSelected: _updateSortOption, // دالة عند الاختيار
// // //                       offset: const Offset(0, 45), // موقع ظهور القائمة
// // //                       shape: RoundedRectangleBorder(
// // //                           borderRadius: BorderRadius.circular(8.0)),
// // //                       elevation: 3, // ظل القائمة
// // //                       itemBuilder: (BuildContext context) =>
// // //                           <PopupMenuEntry<String>>[
// // //                         // بناء عناصر القائمة
// // //                         _buildPopupMenuItem('Highest rated'),
// // //                         const PopupMenuDivider(height: 1),
// // //                         _buildPopupMenuItem('Lowest price'),
// // //                         const PopupMenuDivider(height: 1),
// // //                         _buildPopupMenuItem('Nearest'),
// // //                         const PopupMenuDivider(height: 1),
// // //                         _buildPopupMenuItem('Farthest'),
// // //                       ],
// // //                       // هذا هو الـ Widget الذي يظهر كزر على الشاشة
// // //                       child: Row(
// // //                         mainAxisSize: MainAxisSize.min,
// // //                         children: [
// // //                           Icon(Icons.sort,
// // //                               color: _primaryTextColor.withOpacity(0.7),
// // //                               size: 20),
// // //                           const SizedBox(width: 6),
// // //                           const Text(
// // //                             'Sort', // النص الظاهر على الزر
// // //                             style: TextStyle(
// // //                                 color: _primaryTextColor,
// // //                                 fontWeight: FontWeight.w500,
// // //                                 fontSize: 14),
// // //                           ),
// // //                         ],
// // //                       ),
// // //                     );
// // //                   },
// // //                 ),

// // //                 // --- زر الفلتر ---
// // //                 _buildStyledButton(
// // //                   icon: Icons.filter_list, // أيقونة الفلتر
// // //                   label: 'Filter', // نص الزر
// // //                   onPressed: () async {
// // //                     // دالة عند الضغط (تفتح شاشة الفلتر)
// // //                     final result = await Navigator.push(
// // //                       context,
// // //                       MaterialPageRoute(
// // //                           builder: (context) => const TaxiFilterScreen()),
// // //                     );
// // //                     // معالجة النتيجة العائدة من شاشة الفلتر (إذا لزم الأمر)
// // //                     if (result != null) {
// // //                       print("Filters applied: $result");
// // //                       // !!! هنا يجب تطبيق الفلاتر على قائمة taxiResults وإعادة بناء الواجهة !!!
// // //                       // setState(() { ... });
// // //                     }
// // //                   },
// // //                 ),
// // //               ],
// // //             ),
// // //           ), // نهاية صف الأزرار

// // //           // --- قائمة سيارات الأجرة ---
// // //           Expanded(
// // //             // لأخذ المساحة المتبقية
// // //             child: ListView.builder(
// // //               padding: const EdgeInsets.only(
// // //                   left: 16.0, right: 16.0, bottom: 16.0, top: 4.0),
// // //               itemCount: taxiResults.length, // عدد العناصر في القائمة
// // //               itemBuilder: (context, index) {
// // //                 final taxi =
// // //                     taxiResults[index]; // الحصول على بيانات التاكسي الحالي
// // //                 // --- !!! بناء بطاقة التاكسي القابلة للضغط !!! ---
// // //                 return _buildTaxiCard(taxi);
// // //               },
// // //             ),
// // //           ),
// // //         ], // نهاية عناصر Column الرئيسي
// // //       ), // نهاية body
// // //     ); // نهاية Scaffold
// // //   } // نهاية دالة build

// // //   // --- الدوال المساعدة للبناء (Helper Widgets) ---

// // //   // دالة بناء الأزرار العلوية (تصنيف/فلتر)
// // //   Widget _buildStyledButton(
// // //       {required IconData icon,
// // //       required String label,
// // //       VoidCallback? onPressed,
// // //       Widget Function(BuildContext)? childBuilder}) {
// // //     return Container(
// // //       decoration: BoxDecoration(
// // //         color: _buttonBackgroundColor, // لون خلفية الزر
// // //         borderRadius: BorderRadius.circular(8), // حواف دائرية
// // //         border: Border.all(color: _subtleBorderColor, width: 1.0), // حدود خفيفة
// // //       ),
// // //       child: Material(
// // //         color: Colors.transparent, // لجعل تأثير الضغط (InkWell) يظهر
// // //         child: InkWell(
// // //           onTap: onPressed, // ربط دالة الضغط
// // //           borderRadius: BorderRadius.circular(8), // لجعل تأثير الضغط دائري
// // //           child: Padding(
// // //             padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
// // //             // استخدام childBuilder إذا تم توفيره (مثل زر التصنيف)
// // //             // وإلا بناء Row الافتراضي (مثل زر الفلتر)
// // //             child: childBuilder != null
// // //                 ? childBuilder(context)
// // //                 : Row(
// // //                     mainAxisSize: MainAxisSize.min,
// // //                     children: [
// // //                       Icon(icon,
// // //                           color: _primaryTextColor.withOpacity(0.7), size: 20),
// // //                       const SizedBox(width: 6),
// // //                       Text(label,
// // //                           style: const TextStyle(
// // //                               color: _primaryTextColor,
// // //                               fontWeight: FontWeight.w500,
// // //                               fontSize: 14)),
// // //                     ],
// // //                   ),
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }

// // //   // دالة بناء عنصر واحد في القائمة المنبثقة للتصنيف
// // //   PopupMenuItem<String> _buildPopupMenuItem(String value) {
// // //     bool isSelected =
// // //         _selectedSortOption == value; // التحقق إذا كان هذا هو الخيار المحدد
// // //     return PopupMenuItem<String>(
// // //       value: value, // القيمة التي ستُعاد عند الاختيار
// // //       height: 40, // ارتفاع العنصر
// // //       // الـ child هو الـ Widget الذي يظهر داخل عنصر القائمة
// // //       child: Row(
// // //         mainAxisAlignment:
// // //             MainAxisAlignment.spaceBetween, // لوضع علامة الصح في اليمين
// // //         children: [
// // //           Text(
// // //             value, // نص الخيار
// // //             style: const TextStyle(
// // //               fontSize: 14,
// // //               // تمييز النص المحدد (اختياري)
// // //               // color: isSelected ? _themeColor : _primaryTextColor,
// // //               // fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
// // //             ),
// // //           ),
// // //           // إظهار علامة الصح بجانب الخيار المحدد
// // //           if (isSelected) const Icon(Icons.check, color: _themeColor, size: 18),
// // //         ],
// // //       ),
// // //     );
// // //   }

// // //   // --- دالة بناء بطاقة التاكسي (مع التخطيط المُعدل للمعلومات) ---
// // //   Widget _buildTaxiCard(Map<String, dynamic> taxi) {
// // //     return Card(
// // //       elevation: 1.5, // ظل خفيف
// // //       shadowColor: Colors.grey.withOpacity(0.2), // لون الظل
// // //       margin: const EdgeInsets.symmetric(
// // //           vertical: 8.0), // مسافة عمودية بين البطاقات
// // //       color: Colors.white, // لون خلفية البطاقة
// // //       shape: RoundedRectangleBorder(
// // //           borderRadius: BorderRadius.circular(12)), // حواف دائرية
// // //       child: InkWell(
// // //         // لجعل البطاقة قابلة للضغط
// // //         borderRadius: BorderRadius.circular(12), // لجعل تأثير الضغط دائري
// // //         onTap: () {
// // //           // --- الانتقال إلى شاشة تفاصيل التاكسي ---
// // //           // تأكد من أن TaxiDetailsScreen تقبل taxiData
// // //           Navigator.push(
// // //               context,
// // //               MaterialPageRoute(
// // //                   builder: (context) => TaxiDetailsScreen(taxiData: taxi)));
// // //         },
// // //         child: Padding(
// // //           padding: const EdgeInsets.all(12.0), // هوامش داخلية للبطاقة
// // //           child: Row(
// // //             // الصف الرئيسي للبطاقة
// // //             crossAxisAlignment:
// // //                 CrossAxisAlignment.start, // محاذاة العناصر للأعلى
// // //             children: [
// // //               // --- الصورة ---
// // //               ClipRRect(
// // //                   borderRadius: BorderRadius.circular(8), // حواف دائرية للصورة
// // //                   child: Image.asset(
// // //                       taxi['imageUrl'] ??
// // //                           'assets/placeholder_car.png', // استخدام الصورة أو البديلة
// // //                       height: 85, // ارتفاع الصورة
// // //                       width: 105, // عرض الصورة
// // //                       fit: BoxFit.cover, // كيفية ملء الصورة للمساحة
// // //                       // ودجت يظهر في حالة خطأ تحميل الصورة
// // //                       errorBuilder: (context, error, stackTrace) => Container(
// // //                           height: 85,
// // //                           width: 105,
// // //                           color: Colors.grey[200],
// // //                           child: const Icon(Icons.local_taxi_outlined,
// // //                               color: Colors.grey, size: 40)))),
// // //               const SizedBox(width: 12), // مسافة بين الصورة والتفاصيل

// // //               // --- قسم التفاصيل ---
// // //               Expanded(
// // //                   // ليأخذ المساحة المتبقية
// // //                   child: Column(
// // //                 // لترتيب التفاصيل عمودياً
// // //                 crossAxisAlignment:
// // //                     CrossAxisAlignment.start, // محاذاة النصوص لليسار
// // //                 children: [
// // //                   // --- الصف الأول: اسم التاكسي والتقييم ---
// // //                   Row(
// // //                       mainAxisAlignment: MainAxisAlignment
// // //                           .spaceBetween, // توزيع الاسم والتقييم
// // //                       crossAxisAlignment:
// // //                           CrossAxisAlignment.start, // محاذاة بداية السطر
// // //                       children: [
// // //                         // اسم التاكسي (قابل للتمدد)
// // //                         Flexible(
// // //                             child: Text(
// // //                                 taxi['name'] ?? 'N/A', // اسم التاكسي أو نص بديل
// // //                                 style: const TextStyle(
// // //                                     fontSize: 16, fontWeight: FontWeight.bold),
// // //                                 overflow:
// // //                                     TextOverflow.ellipsis)), // منع تجاوز النص
// // //                         const SizedBox(width: 8), // مسافة قبل التقييم
// // //                         // التقييم (نجوم ورقم)
// // //                         Row(
// // //                             crossAxisAlignment: CrossAxisAlignment.center,
// // //                             children: [
// // //                               Icon(Icons.star,
// // //                                   color: Colors.amber.shade600, size: 18),
// // //                               const SizedBox(width: 4),
// // //                               Text(
// // //                                   (taxi['rating'] ?? 0.0)
// // //                                       .toString(), // رقم التقييم
// // //                                   style: const TextStyle(
// // //                                       fontWeight: FontWeight.bold,
// // //                                       fontSize: 13))
// // //                             ])
// // //                       ]), // نهاية صف الاسم والتقييم
// // //                   const SizedBox(height: 6), // مسافة

// // //                   // --- الصف الثاني: السعر ---
// // //                   Text('EGP ${taxi['price'] ?? '--'}', // السعر
// // //                       style: const TextStyle(
// // //                           fontSize: 14,
// // //                           fontWeight: FontWeight.bold,
// // //                           color: _themeColor)), // استخدام اللون الأساسي
// // //                   const SizedBox(height: 8), // مسافة

// // //                   // --- !!! الصف الثالث المُعدل: معلومات المسافة والوقت !!! ---
// // //                   Row(
// // //                     mainAxisAlignment:
// // //                         MainAxisAlignment.spaceBetween, // توزيع العناصر
// // //                     crossAxisAlignment:
// // //                         CrossAxisAlignment.start, // محاذاة العناصر للأعلى
// // //                     children: [
// // //                       // --- العمود الأيسر: المسافة و ETA ---
// // //                       Column(
// // //                         crossAxisAlignment:
// // //                             CrossAxisAlignment.start, // محاذاة يسار
// // //                         children: [
// // //                           // المسافة
// // //                           _buildInfoChip(
// // //                             Icons
// // //                                 .directions_car_filled_outlined, // أيقونة السيارة
// // //                             taxi['distance'] ?? '--', // نص المسافة
// // //                           ),
// // //                           const SizedBox(height: 4), // مسافة عمودية
// // //                           // الوقت المتوقع للوصول (ETA)
// // //                           _buildInfoChip(
// // //                             Icons.access_time, // أيقونة الساعة
// // //                             taxi['eta'] ?? '--', // نص الوقت المتوقع
// // //                           ),
// // //                         ],
// // //                       ), // نهاية عمود المسافة و ETA

// // //                       // --- العنصر الأيمن: زمن الوصول المحدد ---
// // //                       Padding(
// // //                         padding: const EdgeInsets.only(
// // //                             top: 4.0), // إزاحة بسيطة للأسفل
// // //                         child: _buildInfoChip(
// // //                           Icons.timer_outlined, // أيقونة المؤقت
// // //                           taxi['pickupTime'] ?? '--', // نص زمن الوصول
// // //                         ),
// // //                       ),
// // //                     ], // نهاية عناصر Row للمعلومات
// // //                   ), // نهاية الصف المُعدل
// // //                   // --- !!! نهاية التعديل !!! ---
// // //                 ], // نهاية عناصر Column للتفاصيل
// // //               )), // نهاية Expanded للتفاصيل
// // //             ], // نهاية عناصر Row الرئيسي للبطاقة
// // //           ), // نهاية Padding الداخلي للبطاقة
// // //         ), // نهاية InkWell
// // //       ), // نهاية Card
// // //     ); // نهاية الويدجت
// // //   } // نهاية دالة _buildTaxiCard

// // //   // --- الدالة المساعدة لبناء شرائح المعلومات الصغيرة (مثل المسافة والوقت) ---
// // //   Widget _buildInfoChip(IconData icon, String text) {
// // //     return Row(
// // //         mainAxisSize: MainAxisSize.min, // ليأخذ أقل عرض ممكن
// // //         crossAxisAlignment:
// // //             CrossAxisAlignment.center, // محاذاة عمودية للأيقونة والنص
// // //         children: [
// // //           Icon(icon,
// // //               size: 15,
// // //               color: _secondaryTextColor.withOpacity(0.9)), // الأيقونة
// // //           const SizedBox(width: 4), // مسافة صغيرة
// // //           Flexible(
// // //               // للسماح للنص بالالتفاف إذا كان طويلاً جداً
// // //               child: Text(text, // النص
// // //                   style:
// // //                       const TextStyle(fontSize: 11, color: _secondaryTextColor),
// // //                   overflow: TextOverflow.ellipsis)) // منع تجاوز النص
// // //         ]);
// // //   }
// // // // } // نهاية الكلاس _TaxiResultsScreenState
// // // import 'package:flutter/material.dart';
// // // import 'package:intl/intl.dart';
// // // import 'package:travella/models/Taxi.dart';
// // // import 'package:travella/screens/taxi_details_screen.dart';
// // // import 'package:travella/services/api/dio_client.dart';
// // // import 'package:travella/widgets/taxi_filter_screen.dart';

// // // class TaxiResultsScreen extends StatefulWidget {
// // //   final List<Taxi> taxis;

// // //   const TaxiResultsScreen({super.key, required this.taxis});

// // //   @override
// // //   State<TaxiResultsScreen> createState() => _TaxiResultsScreenState();
// // // }

// // // class _TaxiResultsScreenState extends State<TaxiResultsScreen> {
// // //   static const Color _themeColor = Color(0xFF406F89);
// // //   static const Color _lightBackgroundColor = Colors.white;
// // //   static const Color _buttonBackgroundColor = Color(0xFFF8F8F8);
// // //   static const Color _subtleBorderColor = Color(0xFFE0E0E0);
// // //   static const Color _secondaryTextColor = Colors.grey;
// // //   static const Color _primaryTextColor = Colors.black;

// // //   String _selectedSortOption = 'Highest rated';
// // //   List<Taxi> _filteredTaxis = [];

// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     _filteredTaxis = List.from(widget.taxis);
// // //     _sortTaxiResults();
// // //   }

// // //   void _updateSortOption(String? value) {
// // //     if (value != null && value != _selectedSortOption) {
// // //       setState(() {
// // //         _selectedSortOption = value;
// // //         _sortTaxiResults();
// // //       });
// // //     }
// // //   }

// // //   void _sortTaxiResults() {
// // //     _filteredTaxis.sort((a, b) {
// // //       switch (_selectedSortOption) {
// // //         case 'Highest rated':
// // //           return (b.rate).compareTo(a.rate);
// // //         case 'Lowest price':
// // //           return (a.price).compareTo(b.price);
// // //         case 'Nearest':
// // //           return (a.distance).compareTo(b.distance);
// // //         case 'Farthest':
// // //           return (b.distance).compareTo(a.distance);
// // //         default:
// // //           return 0;
// // //       }
// // //     });
// // //   }

// // //   void _applyFilters(Map<String, dynamic> filters) async {
// // //     final dioClient = DioClient();
// // //     try {
// // //       final taxis = await dioClient.filterTaxis(
// // //         minPrice: filters['price_start'] ?? 0,
// // //         maxPrice: filters['price_end'] ?? 2000,
// // //         minTime: 0,
// // //         maxTime: filters['time'] == 'All'
// // //             ? 999
// // //             : (filters['time'] == '1-5 minutes' ? 5 : 10),
// // //         driverAgeMin: filters['driver_age'] == 'All'
// // //             ? 0
// // //             : int.parse(filters['driver_age'].split('-')[0]),
// // //         driverAgeMax: filters['driver_age'] == 'All'
// // //             ? 99
// // //             : int.parse(filters['driver_age'].split('-')[1]),
// // //         minDistance: 0,
// // //         maxDistance: filters['distance'] == 'All'
// // //             ? 999
// // //             : (filters['distance'] == '0-1 Km' ? 1 : 5),
// // //         minRating: filters['review'] ?? 0.0,
// // //       );
// // //       setState(() {
// // //         _filteredTaxis = taxis;
// // //       });
// // //     } catch (e) {
// // //       ScaffoldMessenger.of(context)
// // //           .showSnackBar(SnackBar(content: Text('Error applying filters: $e')));
// // //     }
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       backgroundColor: _lightBackgroundColor,
// // //       appBar: AppBar(
// // //         elevation: 0.5,
// // //         shadowColor: Colors.grey.shade200,
// // //         backgroundColor: _lightBackgroundColor,
// // //         leading: IconButton(
// // //           icon: const Icon(Icons.arrow_back, color: _primaryTextColor),
// // //           onPressed: () => Navigator.of(context).pop(),
// // //         ),
// // //         title: Text(
// // //           'Dokki (${_filteredTaxis.length} results)',
// // //           style: const TextStyle(
// // //               color: _primaryTextColor,
// // //               fontSize: 18,
// // //               fontWeight: FontWeight.bold),
// // //         ),
// // //         centerTitle: true,
// // //       ),
// // //       body: Column(
// // //         children: [
// // //           Padding(
// // //             padding:
// // //                 const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
// // //             child: Row(
// // //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // //               children: [
// // //                 _buildStyledButton(
// // //                   icon: Icons.sort,
// // //                   childBuilder: (context) => PopupMenuButton<String>(
// // //                     onSelected: _updateSortOption,
// // //                     offset: const Offset(0, 45),
// // //                     shape: RoundedRectangleBorder(
// // //                         borderRadius: BorderRadius.circular(8.0)),
// // //                     elevation: 3,
// // //                     itemBuilder: (BuildContext context) =>
// // //                         <PopupMenuEntry<String>>[
// // //                       _buildPopupMenuItem('Highest rated'),
// // //                       const PopupMenuDivider(height: 1),
// // //                       _buildPopupMenuItem('Lowest price'),
// // //                       const PopupMenuDivider(height: 1),
// // //                       _buildPopupMenuItem('Nearest'),
// // //                       const PopupMenuDivider(height: 1),
// // //                       _buildPopupMenuItem('Farthest'),
// // //                     ],
// // //                     child: Row(
// // //                       mainAxisSize: MainAxisSize.min,
// // //                       children: [
// // //                         Icon(Icons.sort,
// // //                             color: _primaryTextColor.withOpacity(0.7),
// // //                             size: 20),
// // //                         const SizedBox(width: 6),
// // //                         const Text('Sort',
// // //                             style: TextStyle(
// // //                                 color: _primaryTextColor,
// // //                                 fontWeight: FontWeight.w500,
// // //                                 fontSize: 14)),
// // //                       ],
// // //                     ),
// // //                   ),
// // //                   label: '',
// // //                 ),
// // //                 _buildStyledButton(
// // //                   icon: Icons.filter_list,
// // //                   label: 'Filter',
// // //                   onPressed: () async {
// // //                     final result = await Navigator.push(
// // //                       context,
// // //                       MaterialPageRoute(
// // //                           builder: (context) => const TaxiFilterScreen()),
// // //                     );
// // //                     if (result != null) {
// // //                       _applyFilters(result);
// // //                     }
// // //                   },
// // //                 ),
// // //               ],
// // //             ),
// // //           ),
// // //           Expanded(
// // //             child: ListView.builder(
// // //               padding: const EdgeInsets.only(
// // //                   left: 16.0, right: 16.0, bottom: 16.0, top: 4.0),
// // //               itemCount: _filteredTaxis.length,
// // //               itemBuilder: (context, index) {
// // //                 return _buildTaxiCard(_filteredTaxis[index]);
// // //               },
// // //             ),
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }

// // //   Widget _buildStyledButton(
// // //       {required IconData icon,
// // //       required String label,
// // //       VoidCallback? onPressed,
// // //       Widget Function(BuildContext)? childBuilder}) {
// // //     return Container(
// // //       decoration: BoxDecoration(
// // //         color: _buttonBackgroundColor,
// // //         borderRadius: BorderRadius.circular(8),
// // //         border: Border.all(color: _subtleBorderColor, width: 1.0),
// // //       ),
// // //       child: Material(
// // //         color: Colors.transparent,
// // //         child: InkWell(
// // //           onTap: onPressed,
// // //           borderRadius: BorderRadius.circular(8),
// // //           child: Padding(
// // //             padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
// // //             child: childBuilder != null
// // //                 ? childBuilder(context)
// // //                 : Row(
// // //                     mainAxisSize: MainAxisSize.min,
// // //                     children: [
// // //                       Icon(icon,
// // //                           color: _primaryTextColor.withOpacity(0.7), size: 20),
// // //                       const SizedBox(width: 6),
// // //                       Text(label,
// // //                           style: const TextStyle(
// // //                               color: _primaryTextColor,
// // //                               fontWeight: FontWeight.w500,
// // //                               fontSize: 14)),
// // //                     ],
// // //                   ),
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }

// // //   PopupMenuItem<String> _buildPopupMenuItem(String value) {
// // //     bool isSelected = _selectedSortOption == value;
// // //     return PopupMenuItem<String>(
// // //       value: value,
// // //       height: 40,
// // //       child: Row(
// // //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // //         children: [
// // //           Text(value, style: const TextStyle(fontSize: 14)),
// // //           if (isSelected) const Icon(Icons.check, color: _themeColor, size: 18),
// // //         ],
// // //       ),
// // //     );
// // //   }

// // //   Widget _buildTaxiCard(Taxi taxi) {
// // //     return Card(
// // //       elevation: 1.5,
// // //       shadowColor: Colors.grey.withOpacity(0.2),
// // //       margin: const EdgeInsets.symmetric(vertical: 8.0),
// // //       color: Colors.white,
// // //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
// // //       child: InkWell(
// // //         borderRadius: BorderRadius.circular(12),
// // //         onTap: () {
// // //           Navigator.push(
// // //             context,
// // //             MaterialPageRoute(
// // //                 builder: (context) => TaxiDetailsScreen(taxiData: taxi)),
// // //           );
// // //         },
// // //         child: Padding(
// // //           padding: const EdgeInsets.all(12.0),
// // //           child: Row(
// // //             crossAxisAlignment: CrossAxisAlignment.start,
// // //             children: [
// // //               ClipRRect(
// // //                 borderRadius: BorderRadius.circular(8),
// // //                 child: Image.network(
// // //                   taxi.imageUrls.isNotEmpty
// // //                       ? taxi.imageUrls.first
// // //                       : 'assets/placeholder_car.png',
// // //                   height: 85,
// // //                   width: 105,
// // //                   fit: BoxFit.cover,
// // //                   errorBuilder: (context, error, stackTrace) => Container(
// // //                     height: 85,
// // //                     width: 105,
// // //                     color: Colors.grey[200],
// // //                     child: const Icon(Icons.local_taxi_outlined,
// // //                         color: Colors.grey, size: 40),
// // //                   ),
// // //                 ),
// // //               ),
// // //               const SizedBox(width: 12),
// // //               Expanded(
// // //                 child: Column(
// // //                   crossAxisAlignment: CrossAxisAlignment.start,
// // //                   children: [
// // //                     Row(
// // //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // //                       crossAxisAlignment: CrossAxisAlignment.start,
// // //                       children: [
// // //                         Flexible(
// // //                             child: Text(taxi.carModel,
// // //                                 style: const TextStyle(
// // //                                     fontSize: 16, fontWeight: FontWeight.bold),
// // //                                 overflow: TextOverflow.ellipsis)),
// // //                         const SizedBox(width: 8),
// // //                         Row(
// // //                           crossAxisAlignment: CrossAxisAlignment.center,
// // //                           children: [
// // //                             Icon(Icons.star,
// // //                                 color: Colors.amber.shade600, size: 18),
// // //                             const SizedBox(width: 4),
// // //                             Text((taxi.rate).toStringAsFixed(1),
// // //                                 style: const TextStyle(
// // //                                     fontWeight: FontWeight.bold, fontSize: 13)),
// // //                           ],
// // //                         ),
// // //                       ],
// // //                     ),
// // //                     const SizedBox(height: 6),
// // //                     Text('EGP ${(taxi.price).toStringAsFixed(0)}',
// // //                         style: const TextStyle(
// // //                             fontSize: 14,
// // //                             fontWeight: FontWeight.bold,
// // //                             color: _themeColor)),
// // //                     const SizedBox(height: 8),
// // //                     Row(
// // //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // //                       crossAxisAlignment: CrossAxisAlignment.start,
// // //                       children: [
// // //                         Column(
// // //                           crossAxisAlignment: CrossAxisAlignment.start,
// // //                           children: [
// // //                             _buildInfoChip(Icons.directions_car_filled_outlined,
// // //                                 '${taxi.distance} Km'),
// // //                             const SizedBox(height: 4),
// // //                             _buildInfoChip(
// // //                                 Icons.access_time, '${taxi.estimatedTime} min'),
// // //                           ],
// // //                         ),
// // //                         Padding(
// // //                           padding: const EdgeInsets.only(top: 4.0),
// // //                           child: _buildInfoChip(Icons.timer_outlined,
// // //                               DateFormat('h:mm a').format(taxi.tripTime)),
// // //                         ),
// // //                       ],
// // //                     ),
// // //                   ],
// // //                 ),
// // //               ),
// // //             ],
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }

// // //   Widget _buildInfoChip(IconData icon, String text) {
// // //     return Row(
// // //       mainAxisSize: MainAxisSize.min,
// // //       crossAxisAlignment: CrossAxisAlignment.center,
// // //       children: [
// // //         Icon(icon, size: 15, color: _secondaryTextColor.withOpacity(0.9)),
// // //         const SizedBox(width: 4),
// // //         Flexible(
// // //             child: Text(text,
// // //                 style:
// // //                     const TextStyle(fontSize: 11, color: _secondaryTextColor),
// // //                 overflow: TextOverflow.ellipsis)),
// // //       ],
// // //     );
// // //   }
// // // }
// // import 'package:flutter/material.dart';
// // import 'package:intl/intl.dart';
// // import 'package:cached_network_image/cached_network_image.dart'; // إضافة CachedNetworkImage
// // import 'package:travella/models/Taxi.dart';
// // import 'package:travella/screens/taxi_details_screen.dart';
// // import 'package:travella/services/api/dio_client.dart';
// // import 'package:travella/widgets/taxi_filter_screen.dart';

// // class TaxiResultsScreen extends StatefulWidget {
// //   final List<Taxi> taxis;
// //   final String pickupLocation; // معامل جديد للموقع

// //   const TaxiResultsScreen(
// //       {super.key, required this.taxis, required this.pickupLocation});

// //   @override
// //   State<TaxiResultsScreen> createState() => _TaxiResultsScreenState();
// // }

// // class _TaxiResultsScreenState extends State<TaxiResultsScreen> {
// //   static const Color _themeColor = Color(0xFF406F89);
// //   static const Color _lightBackgroundColor = Colors.white;
// //   static const Color _buttonBackgroundColor = Color(0xFFF8F8F8);
// //   static const Color _subtleBorderColor = Color(0xFFE0E0E0);
// //   static const Color _secondaryTextColor = Colors.grey;
// //   static const Color _primaryTextColor = Colors.black;

// //   String _selectedSortOption = 'Highest rated';
// //   List<Taxi> _filteredTaxis = [];

// //   @override
// //   void initState() {
// //     super.initState();
// //     _filteredTaxis = List.from(widget.taxis);
// //     _sortTaxiResults();
// //   }

// //   void _updateSortOption(String? value) {
// //     if (value != null && value != _selectedSortOption) {
// //       setState(() {
// //         _selectedSortOption = value;
// //         _sortTaxiResults();
// //       });
// //     }
// //   }

// //   void _sortTaxiResults() {
// //     _filteredTaxis.sort((a, b) {
// //       switch (_selectedSortOption) {
// //         case 'Highest rated':
// //           return (b.rate).compareTo(a.rate);
// //         case 'Lowest price':
// //           return (a.price).compareTo(b.price);
// //         case 'Nearest':
// //           return (a.distance).compareTo(b.distance);
// //         case 'Farthest':
// //           return (b.distance).compareTo(a.distance);
// //         default:
// //           return 0;
// //       }
// //     });
// //   }

// //   void _applyFilters(Map<String, dynamic> filters) async {
// //     final dioClient = DioClient();
// //     try {
// //       final taxis = await dioClient.filterTaxis(
// //         minPrice: filters['price_start'] ?? 0,
// //         maxPrice: filters['price_end'] ?? 2000,
// //         minTime: 0,
// //         maxTime: filters['time'] == 'All'
// //             ? 999
// //             : (filters['time'] == '1-5 minutes' ? 5 : 10),
// //         driverAgeMin: filters['driver_age'] == 'All'
// //             ? 0
// //             : int.parse(filters['driver_age'].split('-')[0]),
// //         driverAgeMax: filters['driver_age'] == 'All'
// //             ? 99
// //             : int.parse(filters['driver_age'].split('-')[1]),
// //         minDistance: 0,
// //         maxDistance: filters['distance'] == 'All'
// //             ? 999
// //             : (filters['distance'] == '0-1 Km' ? 1 : 5),
// //         minRating: filters['review'] ?? 0.0,
// //       );
// //       setState(() {
// //         _filteredTaxis = taxis;
// //       });
// //     } catch (e) {
// //       ScaffoldMessenger.of(context)
// //           .showSnackBar(SnackBar(content: Text('Error applying filters: $e')));
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: _lightBackgroundColor,
// //       appBar: AppBar(
// //         elevation: 0.5,
// //         shadowColor: Colors.grey.shade200,
// //         backgroundColor: _lightBackgroundColor,
// //         leading: IconButton(
// //           icon: const Icon(Icons.arrow_back, color: _primaryTextColor),
// //           onPressed: () => Navigator.of(context).pop(),
// //         ),
// //         title: Text(
// //           '${widget.pickupLocation} (${_filteredTaxis.length} results)',
// //           style: const TextStyle(
// //               color: _primaryTextColor,
// //               fontSize: 18,
// //               fontWeight: FontWeight.bold),
// //         ),
// //         centerTitle: true,
// //       ),
// //       body: Column(
// //         children: [
// //           Padding(
// //             padding:
// //                 const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
// //             child: Row(
// //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //               children: [
// //                 _buildStyledButton(
// //                   icon: Icons.sort,
// //                   childBuilder: (context) => PopupMenuButton<String>(
// //                     onSelected: _updateSortOption,
// //                     offset: const Offset(0, 45),
// //                     shape: RoundedRectangleBorder(
// //                         borderRadius: BorderRadius.circular(8.0)),
// //                     elevation: 3,
// //                     itemBuilder: (BuildContext context) =>
// //                         <PopupMenuEntry<String>>[
// //                       _buildPopupMenuItem('Highest rated'),
// //                       const PopupMenuDivider(height: 1),
// //                       _buildPopupMenuItem('Lowest price'),
// //                       const PopupMenuDivider(height: 1),
// //                       _buildPopupMenuItem('Nearest'),
// //                       const PopupMenuDivider(height: 1),
// //                       _buildPopupMenuItem('Farthest'),
// //                     ],
// //                     child: Row(
// //                       mainAxisSize: MainAxisSize.min,
// //                       children: [
// //                         Icon(Icons.sort,
// //                             color: _primaryTextColor.withOpacity(0.7),
// //                             size: 20),
// //                         const SizedBox(width: 6),
// //                         const Text('Sort',
// //                             style: TextStyle(
// //                                 color: _primaryTextColor,
// //                                 fontWeight: FontWeight.w500,
// //                                 fontSize: 14)),
// //                       ],
// //                     ),
// //                   ),
// //                   label: '',
// //                 ),
// //                 _buildStyledButton(
// //                   icon: Icons.filter_list,
// //                   label: 'Filter',
// //                   onPressed: () async {
// //                     final result = await Navigator.push(
// //                       context,
// //                       MaterialPageRoute(
// //                           builder: (context) => const TaxiFilterScreen()),
// //                     );
// //                     if (result != null) {
// //                       _applyFilters(result);
// //                     }
// //                   },
// //                 ),
// //               ],
// //             ),
// //           ),
// //           Expanded(
// //             child: ListView.builder(
// //               padding: const EdgeInsets.only(
// //                   left: 16.0, right: 16.0, bottom: 16.0, top: 4.0),
// //               itemCount: _filteredTaxis.length,
// //               itemBuilder: (context, index) {
// //                 return _buildTaxiCard(_filteredTaxis[index]);
// //               },
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// //   Widget _buildStyledButton(
// //       {required IconData icon,
// //       required String label,
// //       VoidCallback? onPressed,
// //       Widget Function(BuildContext)? childBuilder}) {
// //     return Container(
// //       decoration: BoxDecoration(
// //         color: _buttonBackgroundColor,
// //         borderRadius: BorderRadius.circular(8),
// //         border: Border.all(color: _subtleBorderColor, width: 1.0),
// //       ),
// //       child: Material(
// //         color: Colors.transparent,
// //         child: InkWell(
// //           onTap: onPressed,
// //           borderRadius: BorderRadius.circular(8),
// //           child: Padding(
// //             padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
// //             child: childBuilder != null
// //                 ? childBuilder(context)
// //                 : Row(
// //                     mainAxisSize: MainAxisSize.min,
// //                     children: [
// //                       Icon(icon,
// //                           color: _primaryTextColor.withOpacity(0.7), size: 20),
// //                       const SizedBox(width: 6),
// //                       Text(label,
// //                           style: const TextStyle(
// //                               color: _primaryTextColor,
// //                               fontWeight: FontWeight.w500, // تصحيح هنا
// //                               fontSize: 14)),
// //                     ],
// //                   ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   PopupMenuItem<String> _buildPopupMenuItem(String value) {
// //     bool isSelected = _selectedSortOption == value;
// //     return PopupMenuItem<String>(
// //       value: value,
// //       height: 40,
// //       child: Row(
// //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //         children: [
// //           Text(value, style: const TextStyle(fontSize: 14)),
// //           if (isSelected) const Icon(Icons.check, color: _themeColor, size: 18),
// //         ],
// //       ),
// //     );
// //   }

// //   Widget _buildTaxiCard(Taxi taxi) {
// //     return Card(
// //       elevation: 1.5,
// //       shadowColor: Colors.grey.withOpacity(0.2),
// //       margin: const EdgeInsets.symmetric(vertical: 8.0),
// //       color: Colors.white,
// //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
// //       child: InkWell(
// //         borderRadius: BorderRadius.circular(12),
// //         onTap: () {
// //           Navigator.push(
// //             context,
// //             MaterialPageRoute(
// //                 builder: (context) => TaxiDetailsScreen(taxiData: taxi)),
// //           );
// //         },
// //         child: Padding(
// //           padding: const EdgeInsets.all(12.0),
// //           child: Row(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               ClipRRect(
// //                 borderRadius: BorderRadius.circular(8),
// //                 child: CachedNetworkImage(
// //                   imageUrl: taxi.imageUrls.isNotEmpty
// //                       ? taxi.imageUrls.first
// //                       : 'https://via.placeholder.com/105x85', // صورة افتراضية
// //                   height: 85,
// //                   width: 105,
// //                   fit: BoxFit.cover,
// //                   placeholder: (context, url) => Container(
// //                     height: 85,
// //                     width: 105,
// //                     color: Colors.grey[200],
// //                   ),
// //                   errorWidget: (context, url, error) {
// //                     print('Image load error: $error'); // تتبع الأخطاء
// //                     return Container(
// //                       height: 85,
// //                       width: 105,
// //                       color: Colors.grey[200],
// //                       child: const Icon(Icons.local_taxi_outlined,
// //                           color: Colors.grey, size: 40),
// //                     );
// //                   },
// //                 ),
// //               ),
// //               const SizedBox(width: 12),
// //               Expanded(
// //                 child: Column(
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   children: [
// //                     Row(
// //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                       crossAxisAlignment: CrossAxisAlignment.start,
// //                       children: [
// //                         Flexible(
// //                             child: Text(taxi.carModel,
// //                                 style: const TextStyle(
// //                                     fontSize: 16, fontWeight: FontWeight.bold),
// //                                 overflow: TextOverflow.ellipsis)),
// //                         const SizedBox(width: 8),
// //                         Row(
// //                           crossAxisAlignment: CrossAxisAlignment.center,
// //                           children: [
// //                             Icon(Icons.star,
// //                                 color: Colors.amber.shade600, size: 18),
// //                             const SizedBox(width: 4),
// //                             Text((taxi.rate).toStringAsFixed(1),
// //                                 style: const TextStyle(
// //                                     fontWeight: FontWeight.bold, fontSize: 13)),
// //                           ],
// //                         ),
// //                       ],
// //                     ),
// //                     const SizedBox(height: 6),
// //                     Text('EGP ${(taxi.price).toStringAsFixed(0)}',
// //                         style: const TextStyle(
// //                             fontSize: 14,
// //                             fontWeight: FontWeight.bold,
// //                             color: _themeColor)),
// //                     const SizedBox(height: 8),
// //                     Row(
// //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                       crossAxisAlignment: CrossAxisAlignment.start,
// //                       children: [
// //                         Column(
// //                           crossAxisAlignment: CrossAxisAlignment.start,
// //                           children: [
// //                             _buildInfoChip(Icons.directions_car_filled_outlined,
// //                                 '${taxi.distance} Km'),
// //                             const SizedBox(height: 4),
// //                             _buildInfoChip(
// //                                 Icons.access_time, '${taxi.estimatedTime} min'),
// //                           ],
// //                         ),
// //                         Padding(
// //                           padding: const EdgeInsets.only(top: 4.0),
// //                           child: _buildInfoChip(Icons.timer_outlined,
// //                               DateFormat('h:mm a').format(taxi.tripTime)),
// //                         ),
// //                       ],
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   Widget _buildInfoChip(IconData icon, String text) {
// //     return Row(
// //       mainAxisSize: MainAxisSize.min,
// //       crossAxisAlignment: CrossAxisAlignment.center,
// //       children: [
// //         Icon(icon, size: 15, color: _secondaryTextColor.withOpacity(0.9)),
// //         const SizedBox(width: 4),
// //         Flexible(
// //             child: Text(text,
// //                 style:
// //                     const TextStyle(fontSize: 11, color: _secondaryTextColor),
// //                 overflow: TextOverflow.ellipsis)),
// //       ],
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:cached_network_image/cached_network_image.dart'; // إضافة CachedNetworkImage
// import 'package:travella/models/Taxi.dart';
// import 'package:travella/screens/taxi_details_screen.dart';
// import 'package:travella/services/api/dio_client.dart';
// import 'package:travella/widgets/taxi_filter_screen.dart';

// class TaxiResultsScreen extends StatefulWidget {
//   final List<Taxi> taxis;
//   final String pickupLocation; // معامل جديد للموقع

//   const TaxiResultsScreen(
//       {super.key, required this.taxis, required this.pickupLocation});

//   @override
//   State<TaxiResultsScreen> createState() => _TaxiResultsScreenState();
// }

// class _TaxiResultsScreenState extends State<TaxiResultsScreen> {
//   static const Color _themeColor = Color(0xFF406F89);
//   static const Color _lightBackgroundColor = Colors.white;
//   static const Color _buttonBackgroundColor = Color(0xFFF8F8F8);
//   static const Color _subtleBorderColor = Color(0xFFE0E0E0);
//   static const Color _secondaryTextColor = Colors.grey;
//   static const Color _primaryTextColor = Colors.black;

//   String _selectedSortOption = 'Highest rated';
//   List<Taxi> _filteredTaxis = [];

//   @override
//   void initState() {
//     super.initState();
//     _filteredTaxis = List.from(widget.taxis);
//     _sortTaxiResults();
//   }

//   void _updateSortOption(String? value) {
//     if (value != null && value != _selectedSortOption) {
//       setState(() {
//         _selectedSortOption = value;
//         _sortTaxiResults();
//       });
//     }
//   }

//   void _sortTaxiResults() {
//     _filteredTaxis.sort((a, b) {
//       switch (_selectedSortOption) {
//         case 'Highest rated':
//           return (b.rate).compareTo(a.rate);
//         case 'Lowest price':
//           return (a.price).compareTo(b.price);
//         case 'Nearest':
//           return (a.distance).compareTo(b.distance);
//         case 'Farthest':
//           return (b.distance).compareTo(a.distance);
//         default:
//           return 0;
//       }
//     });
//   }

//   void _applyFilters(Map<String, dynamic> filters) async {
//     final dioClient = DioClient();
//     try {
//       final taxis = await dioClient.filterTaxis(
//         minPrice: filters['price_start'] ?? 0,
//         maxPrice: filters['price_end'] ?? 2000,
//         minTime: 0,
//         maxTime: filters['time'] == 'All'
//             ? 999
//             : (filters['time'] == '1-5 minutes' ? 5 : 10),
//         driverAgeMin: filters['driver_age'] == 'All'
//             ? 0
//             : int.parse(filters['driver_age'].split('-')[0]),
//         driverAgeMax: filters['driver_age'] == 'All'
//             ? 99
//             : int.parse(filters['driver_age'].split('-')[1]),
//         minDistance: 0,
//         maxDistance: filters['distance'] == 'All'
//             ? 999
//             : (filters['distance'] == '0-1 Km' ? 1 : 5),
//         minRating: filters['review'] ?? 0.0,
//         pickUpLocation: widget.pickupLocation, // إضافة الموقع
//       );
//       setState(() {
//         _filteredTaxis = taxis;
//       });
//     } catch (e) {
//       ScaffoldMessenger.of(context)
//           .showSnackBar(SnackBar(content: Text('Error applying filters: $e')));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: _lightBackgroundColor,
//       appBar: AppBar(
//         elevation: 0.5,
//         shadowColor: Colors.grey.shade200,
//         backgroundColor: _lightBackgroundColor,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: _primaryTextColor),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//         title: Text(
//           '${widget.pickupLocation} (${_filteredTaxis.length} results)',
//           style: const TextStyle(
//               color: _primaryTextColor,
//               fontSize: 18,
//               fontWeight: FontWeight.bold),
//         ),
//         centerTitle: true,
//       ),
//       body: Column(
//         children: [
//           Padding(
//             padding:
//                 const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 _buildStyledButton(
//                   icon: Icons.sort,
//                   childBuilder: (context) => PopupMenuButton<String>(
//                     onSelected: _updateSortOption,
//                     offset: const Offset(0, 45),
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8.0)),
//                     elevation: 3,
//                     itemBuilder: (BuildContext context) =>
//                         <PopupMenuEntry<String>>[
//                       _buildPopupMenuItem('Highest rated'),
//                       const PopupMenuDivider(height: 1),
//                       _buildPopupMenuItem('Lowest price'),
//                       const PopupMenuDivider(height: 1),
//                       _buildPopupMenuItem('Nearest'),
//                       const PopupMenuDivider(height: 1),
//                       _buildPopupMenuItem('Farthest'),
//                     ],
//                     child: Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Icon(Icons.sort,
//                             color: _primaryTextColor.withOpacity(0.7),
//                             size: 20),
//                         const SizedBox(width: 6),
//                         const Text('Sort',
//                             style: TextStyle(
//                                 color: _primaryTextColor,
//                                 fontWeight: FontWeight.w500,
//                                 fontSize: 14)),
//                       ],
//                     ),
//                   ),
//                   label: '',
//                 ),
//                 _buildStyledButton(
//                   icon: Icons.filter_list,
//                   label: 'Filter',
//                   onPressed: () async {
//                     final result = await Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => const TaxiFilterScreen()),
//                     );
//                     if (result != null) {
//                       _applyFilters(result);
//                     }
//                   },
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//               padding: const EdgeInsets.only(
//                   left: 16.0, right: 16.0, bottom: 16.0, top: 4.0),
//               itemCount: _filteredTaxis.length,
//               itemBuilder: (context, index) {
//                 return _buildTaxiCard(_filteredTaxis[index]);
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildStyledButton(
//       {required IconData icon,
//       required String label,
//       VoidCallback? onPressed,
//       Widget Function(BuildContext)? childBuilder}) {
//     return Container(
//       decoration: BoxDecoration(
//         color: _buttonBackgroundColor,
//         borderRadius: BorderRadius.circular(8),
//         border: Border.all(color: _subtleBorderColor, width: 1.0),
//       ),
//       child: Material(
//         color: Colors.transparent,
//         child: InkWell(
//           onTap: onPressed,
//           borderRadius: BorderRadius.circular(8),
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
//             child: childBuilder != null
//                 ? childBuilder(context)
//                 : Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Icon(icon,
//                           color: _primaryTextColor.withOpacity(0.7), size: 20),
//                       const SizedBox(width: 6),
//                       Text(label,
//                           style: const TextStyle(
//                               color: _primaryTextColor,
//                               fontWeight: FontWeight.w500,
//                               fontSize: 14)),
//                     ],
//                   ),
//           ),
//         ),
//       ),
//     );
//   }

//   PopupMenuItem<String> _buildPopupMenuItem(String value) {
//     bool isSelected = _selectedSortOption == value;
//     return PopupMenuItem<String>(
//       value: value,
//       height: 40,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(value, style: const TextStyle(fontSize: 14)),
//           if (isSelected) const Icon(Icons.check, color: _themeColor, size: 18),
//         ],
//       ),
//     );
//   }

//   Widget _buildTaxiCard(Taxi taxi) {
//     return Card(
//       elevation: 1.5,
//       shadowColor: Colors.grey.withOpacity(0.2),
//       margin: const EdgeInsets.symmetric(vertical: 8.0),
//       color: Colors.white,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       child: InkWell(
//         borderRadius: BorderRadius.circular(12),
//         onTap: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//                 builder: (context) => TaxiDetailsScreen(taxiData: taxi)),
//           );
//         },
//         child: Padding(
//           padding: const EdgeInsets.all(12.0),
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(8),
//                 child: CachedNetworkImage(
//                   imageUrl: taxi.imageUrls.isNotEmpty
//                       ? 'http://travella.runasp.net${taxi.imageUrls.first}' // إضافة رابط السيرفر
//                       : 'https://via.placeholder.com/105x85',
//                   height: 85,
//                   width: 105,
//                   fit: BoxFit.cover,
//                   placeholder: (context, url) => Container(
//                     height: 85,
//                     width: 105,
//                     color: Colors.grey[200],
//                   ),
//                   errorWidget: (context, url, error) {
//                     print('Image load error: $error');
//                     return Container(
//                       height: 85,
//                       width: 105,
//                       color: Colors.grey[200],
//                       child: const Icon(Icons.local_taxi_outlined,
//                           color: Colors.grey, size: 40),
//                     );
//                   },
//                 ),
//               ),
//               const SizedBox(width: 12),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Flexible(
//                             child: Text(taxi.carModel,
//                                 style: const TextStyle(
//                                     fontSize: 16, fontWeight: FontWeight.bold),
//                                 overflow: TextOverflow.ellipsis)),
//                         const SizedBox(width: 8),
//                         Row(
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             Icon(Icons.star,
//                                 color: Colors.amber.shade600, size: 18),
//                             const SizedBox(width: 4),
//                             Text((taxi.rate).toStringAsFixed(1),
//                                 style: const TextStyle(
//                                     fontWeight: FontWeight.bold, fontSize: 13)),
//                           ],
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 6),
//                     Text('EGP ${(taxi.price).toStringAsFixed(0)}',
//                         style: const TextStyle(
//                             fontSize: 14,
//                             fontWeight: FontWeight.bold,
//                             color: _themeColor)),
//                     const SizedBox(height: 8),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             _buildInfoChip(Icons.directions_car_filled_outlined,
//                                 '${taxi.distance} Km'),
//                             const SizedBox(height: 4),
//                             _buildInfoChip(
//                                 Icons.access_time, '${taxi.estimatedTime} min'),
//                           ],
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(top: 4.0),
//                           child: _buildInfoChip(Icons.timer_outlined,
//                               DateFormat('h:mm a').format(taxi.tripTime)),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildInfoChip(IconData icon, String text) {
//     return Row(
//       mainAxisSize: MainAxisSize.min,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Icon(icon, size: 15, color: _secondaryTextColor.withOpacity(0.9)),
//         const SizedBox(width: 4),
//         Flexible(
//             child: Text(text,
//                 style:
//                     const TextStyle(fontSize: 11, color: _secondaryTextColor),
//                 overflow: TextOverflow.ellipsis)),
//       ],
//     );
//   }
// }
// lib/screens/taxi_results_screen.dart

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:apptravella/models/Taxi.dart';
import 'package:apptravella/screens/taxi_details_screen.dart';
import 'package:apptravella/services/api/dio_client.dart';
import 'package:apptravella/widgets/taxi_filter_screen.dart';

class TaxiResultsScreen extends StatefulWidget {
  final List<Taxi> taxis;
  final String pickupLocation;

  const TaxiResultsScreen(
      {super.key, required this.taxis, required this.pickupLocation});

  @override
  State<TaxiResultsScreen> createState() => _TaxiResultsScreenState();
}

class _TaxiResultsScreenState extends State<TaxiResultsScreen> {
  static const Color _themeColor = Color(0xFF406F89);
  static const Color _lightBackgroundColor = Colors.white;
  static const Color _buttonBackgroundColor = Color(0xFFF8F8F8);
  static const Color _subtleBorderColor = Color(0xFFE0E0E0);
  static const Color _secondaryTextColor = Colors.grey;
  static const Color _primaryTextColor = Colors.black;

  String _selectedSortOption = 'Highest rated';
  List<Taxi> _filteredTaxis = [];

  @override
  void initState() {
    super.initState();
    _filteredTaxis = List.from(widget.taxis);
    _sortTaxiResults();
  }

  void _updateSortOption(String? value) {
    if (value != null && value != _selectedSortOption) {
      setState(() {
        _selectedSortOption = value;
        _sortTaxiResults();
      });
    }
  }

  void _sortTaxiResults() {
    _filteredTaxis.sort((a, b) {
      switch (_selectedSortOption) {
        case 'Highest rated':
          return (b.rate).compareTo(a.rate);
        case 'Lowest price':
          return (a.price).compareTo(b.price);
        case 'Nearest':
          return (a.distance).compareTo(b.distance);
        case 'Farthest':
          return (b.distance).compareTo(a.distance);
        default:
          return 0;
      }
    });
  }

  void _applyFilters(Map<String, dynamic> filters) async {
    final dioClient = DioClient();
    try {
      final taxis = await dioClient.filterTaxis(
        minPrice: filters['price_start'] ?? 0,
        maxPrice: filters['price_end'] ?? 2000,
        minTime: 0,
        maxTime: filters['time'] == 'All'
            ? 999
            : (filters['time'] == '1-5 minutes' ? 5 : 10),
        driverAgeMin: filters['driver_age'] == 'All'
            ? 0
            : int.parse(filters['driver_age'].split('-')[0]),
        driverAgeMax: filters['driver_age'] == 'All'
            ? 99
            : int.parse(filters['driver_age'].split('-')[1]),
        minDistance: 0,
        maxDistance: filters['distance'] == 'All'
            ? 999
            : (filters['distance'] == '0-1 Km' ? 1 : 5),
        minRating: filters['review'] ?? 0.0,
        pickUpLocation: widget.pickupLocation,
      );
      setState(() {
        _filteredTaxis = taxis;
      });
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Error applying filters: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _lightBackgroundColor,
      appBar: AppBar(
        elevation: 0.5,
        shadowColor: Colors.grey.shade200,
        backgroundColor: _lightBackgroundColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: _primaryTextColor),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          '${widget.pickupLocation} (${_filteredTaxis.length} results)',
          style: const TextStyle(
              color: _primaryTextColor,
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildStyledButton(
                  icon: Icons.sort,
                  childBuilder: (context) => PopupMenuButton<String>(
                    onSelected: _updateSortOption,
                    offset: const Offset(0, 45),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                    elevation: 3,
                    itemBuilder: (BuildContext context) =>
                        <PopupMenuEntry<String>>[
                      _buildPopupMenuItem('Highest rated'),
                      const PopupMenuDivider(height: 1),
                      _buildPopupMenuItem('Lowest price'),
                      const PopupMenuDivider(height: 1),
                      _buildPopupMenuItem('Nearest'),
                      const PopupMenuDivider(height: 1),
                      _buildPopupMenuItem('Farthest'),
                    ],
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.sort,
                            color: _primaryTextColor.withOpacity(0.7),
                            size: 20),
                        const SizedBox(width: 6),
                        const Text('Sort',
                            style: TextStyle(
                                color: _primaryTextColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 14)),
                      ],
                    ),
                  ),
                  label: '',
                ),
                _buildStyledButton(
                  icon: Icons.filter_list,
                  label: 'Filter',
                  onPressed: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TaxiFilterScreen()),
                    );
                    if (result != null) {
                      _applyFilters(result);
                    }
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(
                  left: 16.0, right: 16.0, bottom: 16.0, top: 4.0),
              itemCount: _filteredTaxis.length,
              itemBuilder: (context, index) {
                return _buildTaxiCard(_filteredTaxis[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStyledButton(
      {required IconData icon,
      required String label,
      VoidCallback? onPressed,
      Widget Function(BuildContext)? childBuilder}) {
    return Container(
      decoration: BoxDecoration(
        color: _buttonBackgroundColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: _subtleBorderColor, width: 1.0),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(8),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
            child: childBuilder != null
                ? childBuilder(context)
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(icon,
                          color: _primaryTextColor.withOpacity(0.7), size: 20),
                      const SizedBox(width: 6),
                      Text(label,
                          style: const TextStyle(
                              color: _primaryTextColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 14)),
                    ],
                  ),
          ),
        ),
      ),
    );
  }

  PopupMenuItem<String> _buildPopupMenuItem(String value) {
    bool isSelected = _selectedSortOption == value;
    return PopupMenuItem<String>(
      value: value,
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(value, style: const TextStyle(fontSize: 14)),
          if (isSelected) const Icon(Icons.check, color: _themeColor, size: 18),
        ],
      ),
    );
  }

  Widget _buildTaxiCard(Taxi taxi) {
    return Card(
      elevation: 1.5,
      shadowColor: Colors.grey.withOpacity(0.2),
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => TaxiDetailsScreen(taxiData: taxi)),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  // --- التعديل هنا: نستخدم الدالة المساعدة الجديدة من الموديل ---
                  imageUrl: taxi.primaryFullImageUrl,
                  height: 85,
                  width: 105,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    height: 85,
                    width: 105,
                    color: Colors.grey[200],
                  ),
                  errorWidget: (context, url, error) {
                    print('Image load error for URL: $url - Error: $error');
                    return Container(
                      height: 85,
                      width: 105,
                      color: Colors.grey[200],
                      child: const Icon(Icons.local_taxi_outlined,
                          color: Colors.grey, size: 40),
                    );
                  },
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                            child: Text(taxi.carModel,
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                                overflow: TextOverflow.ellipsis)),
                        const SizedBox(width: 8),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.star,
                                color: Colors.amber.shade600, size: 18),
                            const SizedBox(width: 4),
                            Text((taxi.rate).toStringAsFixed(1),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 13)),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Text('EGP ${(taxi.price).toStringAsFixed(0)}',
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: _themeColor)),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildInfoChip(Icons.directions_car_filled_outlined,
                                '${taxi.distance} Km'),
                            const SizedBox(height: 4),
                            _buildInfoChip(
                                Icons.access_time, '${taxi.estimatedTime} min'),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: _buildInfoChip(Icons.timer_outlined,
                              DateFormat('h:mm a').format(taxi.tripTime)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoChip(IconData icon, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon, size: 15, color: _secondaryTextColor.withOpacity(0.9)),
        const SizedBox(width: 4),
        Flexible(
            child: Text(text,
                style:
                    const TextStyle(fontSize: 11, color: _secondaryTextColor),
                overflow: TextOverflow.ellipsis)),
      ],
    );
  }
}
