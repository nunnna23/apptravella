// // import 'package:flutter/material.dart';
// // import 'package:intl/intl.dart'; // For date formatting
// // import 'package:country_picker/country_picker.dart'; // <-- إضافة استيراد منتقي الدول

// // // !!! تأكد من صحة هذه المسارات في مشروعك !!!
// // import 'package:travella/screens/flights_screen.dart';
// // import 'package:travella/screens/hotels_search_screen.dart';
// // import 'package:travella/screens/car_rental_screen.dart';
// // import 'package:travella/screens/taxi_results_screen.dart'; // شاشة نتائج التاكسي

// // class TaxiSearchScreen extends StatefulWidget {
// //   const TaxiSearchScreen({super.key});

// //   @override
// //   State<TaxiSearchScreen> createState() => _TaxiSearchScreenState();
// // }

// // class _TaxiSearchScreenState extends State<TaxiSearchScreen> {
// //   // --- متغيرات الحالة ---
// //   // final _pickupLocationController = TextEditingController(); // <-- لم نعد بحاجة لهذا
// //   String? _selectedCountryName; // <-- لتخزين اسم الدولة المختارة
// //   DateTime? _selectedDate;
// //   int _adultCount = 1;
// //   int _childCount = 0;
// //   final int _selectedIndex = 3; // Taxi is pre-selected

// //   // --- حالة إظهار/إخفاء الأقسام ---
// //   //// bool _showDatePickerWidget =
// //   //false; // للتحكم في التقويم إذا أردت جعله مضمناً لاحقاً (اختياري)
// //   bool _showPassengers = false; // <-- للتحكم في عرض قسم الركاب

// //   // --- Getters ---
// //   // نص عرض عدد الركاب
// //   String get passengersText {
// //     if (_showPassengers) {
// //       return 'Select Number of Passengers'; // النص عند فتح القسم
// //     } else {
// //       // النص عند إغلاق القسم (عرض الأعداد)
// //       String text = 'Adult: $_adultCount';
// //       if (_childCount > 0) {
// //         text += ', Child: $_childCount';
// //       }
// //       return text;
// //     }
// //   }

// //   @override
// //   void dispose() {
// //     // _pickupLocationController.dispose(); // <-- لم نعد بحاجة لهذا
// //     super.dispose();
// //   }

// //   // --- دوال تبديل العرض ---
// //   // (يمكن إضافة دالة للتقويم المضمن إذا احتجت إليها)
// //   void _togglePassengers() {
// //     setState(() {
// //       _showPassengers = !_showPassengers;
// //       // _showDatePickerWidget = false; // أغلق الأقسام الأخرى إذا كانت موجودة
// //     });
// //   }

// //   // --- دالة عرض منتقي التاريخ (DatePicker Dialog) ---
// //   Future<void> _selectDate(BuildContext context) async {
// //     final DateTime now = DateTime.now();
// //     final DateTime initial = _selectedDate ?? now;
// //     final DateTime safeInitial = initial.isBefore(now) ? now : initial;

// //     final DateTime? picked = await showDatePicker(
// //       context: context,
// //       initialDate: safeInitial,
// //       firstDate: now.subtract(const Duration(microseconds: 1)),
// //       lastDate: now.add(const Duration(days: 365)),
// //     );
// //     if (picked != null && picked != _selectedDate) {
// //       setState(() {
// //         _selectedDate = picked;
// //         // اختياري: أغلق الأقسام الأخرى عند اختيار التاريخ
// //         // _showPassengers = false;
// //       });
// //     }
// //   }

// //   // --- دالة عرض منتقي الدول ---
// //   void _showCountryPickerDialog() {
// //     // أغلق الأقسام الأخرى أولاً
// //     setState(() {
// //       _showPassengers = false;
// //       // _showDatePickerWidget = false;
// //     });
// //     showCountryPicker(
// //       context: context,
// //       showPhoneCode: false, // لا نحتاج لرمز الهاتف هنا
// //       onSelect: (Country country) {
// //         print('Selected country: ${country.displayName}');
// //         setState(() {
// //           _selectedCountryName = country.name; // تخزين اسم الدولة
// //         });
// //       },
// //       // يمكنك تخصيص مظهر المنتقي باستخدام theme
// //       countryListTheme: CountryListThemeData(
// //         borderRadius: const BorderRadius.only(
// //           topLeft: Radius.circular(20.0),
// //           topRight: Radius.circular(20.0),
// //         ),
// //         inputDecoration: InputDecoration(
// //           labelText: 'Search Country',
// //           hintText: 'Start typing to search',
// //           prefixIcon: const Icon(Icons.search),
// //           border: OutlineInputBorder(
// //             borderSide: BorderSide(
// //               color: const Color(0xFF8C98A8).withOpacity(0.2),
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   // --- دوال التحكم في عدد الركاب (كما هي) ---
// //   void _incrementAdults() {
// //     setState(() {
// //       _adultCount++;
// //     });
// //   }

// //   void _decrementAdults() {
// //     setState(() {
// //       if (_adultCount > 1) _adultCount--;
// //     });
// //   }

// //   void _incrementChildren() {
// //     setState(() {
// //       _childCount++;
// //     });
// //   }

// //   void _decrementChildren() {
// //     setState(() {
// //       if (_childCount > 0) _childCount--;
// //     });
// //   }

// //   // --- دالة الانتقال لنتائج البحث (مُعدلة للتحقق من الدولة) ---
// //   void _navigateToTaxiResults() {
// //     // التحقق من الإدخالات
// //     if (_selectedCountryName == null || _selectedCountryName!.isEmpty) {
// //       // <-- التحقق من الدولة
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         const SnackBar(
// //           content: Text("Please select a pickup country"),
// //           backgroundColor: Colors.orangeAccent,
// //         ),
// //       );
// //       return;
// //     }
// //     if (_selectedDate == null) {
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         const SnackBar(
// //           content: Text("Please select a date"),
// //           backgroundColor: Colors.orangeAccent,
// //         ),
// //       );
// //       return;
// //     }

// //     print('--- Navigating to Taxi Results ---');
// //     print('Pickup Country: $_selectedCountryName'); // <-- استخدام الدولة
// //     print('Date: $_selectedDate');
// //     print('Adults: $_adultCount');
// //     print('Children: $_childCount');
// //     print('----------------------------------');

// //     // !! تأكد من أن TaxiResultsScreen تقبل هذه المعاملات أو أنك لا تحتاج لتمريرها !!
// //     Navigator.push(
// //       context,
// //       MaterialPageRoute(
// //         // قد تحتاج لتمرير الدولة والبيانات الأخرى إلى TaxiResultsScreen
// //         // builder: (context) => TaxiResultsScreen(
// //         //    pickupLocation: _selectedCountryName!, // تمرير اسم الدولة
// //         //    date: _selectedDate!,
// //         //    adults: _adultCount,
// //         //    children: _childCount,
// //         // ),
// //         // أو إذا كانت شاشة النتائج لا تحتاج لهذه البيانات مباشرة:
// //         builder: (context) => const TaxiResultsScreen(), // الذهاب للنتائج فقط
// //       ),
// //     );
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     // استخدام اللون الأساسي الموحد
// //     const Color kPrimaryColor = Color(0xFF4E7D96);
// //     // استخدام لون الخلفية الموحد للحقول
// //     const Color kFieldBackgroundColor = Color(0xFFEEEEEE);

// //     return Scaffold(
// //       backgroundColor: Colors.white,
// //       appBar: AppBar(
// //         elevation: 0,
// //         backgroundColor: Colors.white,
// //         leading: IconButton(
// //           // أيقونة رجوع متناسقة
// //           icon: const Icon(Icons.arrow_back, color: Colors.black),
// //           onPressed: () => Navigator.of(context).pop(),
// //         ),
// //         // title: const Text('Taxi Search', style: TextStyle(color: Colors.black, fontSize: 18)),
// //         // centerTitle: true,
// //       ),
// //       body: SingleChildScrollView(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Column(
// //           children: [
// //             // --- أزرار اختيار الخدمة العلوية (كما هي) ---
// //             Container(
// //               margin: const EdgeInsets.only(bottom: 24),
// //               padding: const EdgeInsets.all(4),
// //               height: 45,
// //               decoration: BoxDecoration(
// //                 color: const Color(0xFFF0F0F0),
// //                 borderRadius: BorderRadius.circular(10),
// //               ),
// //               child: Row(
// //                 children: [
// //                   Expanded(
// //                       child: _buildServiceButton(
// //                           Icons.flight_takeoff, 'Flights', 0)),
// //                   Expanded(
// //                       child: _buildServiceButton(Icons.hotel, 'Hotels', 1)),
// //                   Expanded(
// //                       child: _buildServiceButton(
// //                           Icons.directions_car, 'Car Rental', 2)),
// //                   Expanded(
// //                       child: _buildServiceButton(Icons.local_taxi, 'Taxi', 3)),
// //                 ],
// //               ),
// //             ),

// //             // --- !!! حقل اختيار الدولة (جديد) !!! ---
// //             GestureDetector(
// //               onTap: _showCountryPickerDialog, // <-- فتح منتقي الدول
// //               child: Container(
// //                 padding:
// //                     const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
// //                 decoration: _inputBoxDecoration(
// //                     kFieldBackgroundColor), // استخدام التنسيق الموحد
// //                 child: Row(
// //                   children: [
// //                     Icon(Icons.public_outlined,
// //                         color: Colors.grey[600], size: 20), // أيقونة دولة
// //                     const SizedBox(width: 12),
// //                     Expanded(
// //                       child: Text(
// //                         _selectedCountryName ??
// //                             'Select Pickup Country', // عرض الدولة أو النص المبدئي
// //                         style: TextStyle(
// //                           color: _selectedCountryName == null
// //                               ? Colors.grey[600]
// //                               : Colors.black,
// //                           fontSize: 16,
// //                         ),
// //                         overflow: TextOverflow.ellipsis,
// //                       ),
// //                     ),
// //                     // يمكنك إضافة سهم هنا إذا أردت
// //                     // Icon(Icons.keyboard_arrow_down, color: Colors.grey[600]),
// //                   ],
// //                 ),
// //               ),
// //             ),
// //             // --- !!! نهاية حقل اختيار الدولة !!! ---

// //             const SizedBox(height: 16),

// //             // --- حقل اختيار التاريخ (كما هو، لكن يمكن جعله مضمناً لاحقاً) ---
// //             _buildDateField(kFieldBackgroundColor),
// //             const SizedBox(height: 16),

// //             // --- !!! حقل اختيار عدد الأشخاص (جديد، قابل للطي) !!! ---
// //             GestureDetector(
// //               onTap: _togglePassengers, // <-- تبديل عرض قسم الركاب
// //               child: Container(
// //                 padding:
// //                     const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
// //                 decoration: _inputBoxDecoration(kFieldBackgroundColor),
// //                 child: Row(
// //                   children: [
// //                     Icon(Icons.person_outline,
// //                         color: Colors.grey[600], size: 22),
// //                     const SizedBox(width: 12),
// //                     Expanded(
// //                       child: Text(
// //                         passengersText, // <-- استخدام الـ getter للنص الديناميكي
// //                         style: TextStyle(
// //                           color: _showPassengers
// //                               ? Colors.grey[700]
// //                               : Colors.black, // تغيير اللون
// //                           fontSize: 16,
// //                         ),
// //                         overflow: TextOverflow.ellipsis,
// //                       ),
// //                     ),
// //                     // أيقونة السهم للإشارة للحالة
// //                     Icon(
// //                       _showPassengers
// //                           ? Icons.keyboard_arrow_up
// //                           : Icons.keyboard_arrow_down,
// //                       color: Colors.grey[600],
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ),
// //             // --- عرض عدادات الركاب بشكل شرطي ---
// //             if (_showPassengers)
// //               _buildPassengerCountersView(
// //                   kFieldBackgroundColor), // <-- القسم المخفي

// //             // --- !!! نهاية حقل اختيار عدد الأشخاص !!! ---

// //             const SizedBox(height: 40), // مسافة قبل الزر

// //             // --- زر البحث (كما هو) ---
// //             ElevatedButton(
// //               onPressed: _navigateToTaxiResults, // استدعاء الدالة المحدثة
// //               style: ElevatedButton.styleFrom(
// //                 backgroundColor: kPrimaryColor, // استخدام اللون الأساسي
// //                 minimumSize: const Size(double.infinity, 50),
// //                 shape: RoundedRectangleBorder(
// //                   borderRadius: BorderRadius.circular(12),
// //                 ),
// //                 elevation: 2,
// //               ),
// //               child: const Text(
// //                 'Search Taxi', // نص أوضح
// //                 style: TextStyle(
// //                     fontSize: 18,
// //                     color: Colors.white,
// //                     fontWeight: FontWeight.bold),
// //               ),
// //             ),
// //             const SizedBox(height: 20), // مسافة سفلية
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   // --- الدوال المساعدة للبناء ---

// //   // --- دالة مساعدة لتنسيق حقول الإدخال (مثل الدولة والتاريخ والركاب) ---
// //   BoxDecoration _inputBoxDecoration(Color backgroundColor) {
// //     return BoxDecoration(
// //       color: backgroundColor, // استخدام لون الخلفية الممرر
// //       borderRadius: BorderRadius.circular(8), // حواف دائرية متناسقة
// //     );
// //   }

// //   // --- دالة بناء حقل التاريخ ---
// //   Widget _buildDateField(Color backgroundColor) {
// //     return GestureDetector(
// //       onTap: () => _selectDate(context),
// //       child: Container(
// //         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
// //         decoration: _inputBoxDecoration(backgroundColor), // استخدام التنسيق
// //         child: Row(
// //           children: [
// //             Icon(Icons.calendar_today_outlined,
// //                 color: Colors.grey[600], size: 20),
// //             const SizedBox(width: 12),
// //             Expanded(
// //               child: Text(
// //                 _selectedDate == null
// //                     ? 'Select Date'
// //                     : DateFormat('E, d MMM yyyy').format(_selectedDate!),
// //                 style: TextStyle(
// //                   color:
// //                       _selectedDate == null ? Colors.grey[600] : Colors.black,
// //                   fontSize: 16,
// //                 ),
// //                 overflow: TextOverflow.ellipsis,
// //               ),
// //             ),
// //             // يمكنك إضافة أيقونة سهم هنا إذا أردت
// //             // Icon(Icons.keyboard_arrow_down, color: Colors.grey[600]),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   // --- !!! دالة بناء قسم عدادات الركاب (الذي يظهر عند الضغط) !!! ---
// //   Widget _buildPassengerCountersView(Color backgroundColor) {
// //     return Container(
// //       margin: const EdgeInsets.only(top: 8), // هامش علوي بسيط
// //       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
// //       decoration: _inputBoxDecoration(backgroundColor).copyWith(
// //           // يمكنك إضافة حدود طفيفة هنا إذا أردت تمييزه عن الحقل الرئيسي
// //           // border: Border.all(color: Colors.grey.shade300, width: 0.5)
// //           ),
// //       child: Column(
// //         mainAxisSize: MainAxisSize.min, // ليأخذ أقل ارتفاع ممكن
// //         children: [
// //           // بناء عداد البالغين
// //           _buildCounter(
// //               'Adults', _adultCount, _decrementAdults, _incrementAdults),
// //           const SizedBox(height: 10), // مسافة بين العدادات
// //           // بناء عداد الأطفال
// //           _buildCounter(
// //               'Children', _childCount, _decrementChildren, _incrementChildren),
// //         ],
// //       ),
// //     );
// //   }

// //   // --- دالة بناء عداد فردي (+/-) (تم تعديلها لتطابق التصميم الموحد) ---
// //   Widget _buildCounter(String label, int count, VoidCallback onDecrement,
// //       VoidCallback onIncrement) {
// //     bool canDecrease =
// //         (label == 'Adults' && count > 1) || (label == 'Children' && count > 0);
// //     return Row(
// //       mainAxisAlignment: MainAxisAlignment.spaceBetween, // لتوزيع المسافة
// //       children: [
// //         Text(label,
// //             style: const TextStyle(
// //                 fontSize: 16, color: Colors.black)), // النص (بالغ/طفل)
// //         // حاوية الأزرار والرقم
// //         Container(
// //           padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
// //           decoration: BoxDecoration(
// //               color: Colors.white, // خلفية بيضاء للعداد
// //               borderRadius: BorderRadius.circular(6),
// //               border: Border.all(color: Colors.grey[300]!) // حدود خفيفة
// //               ),
// //           child: Row(
// //             children: [
// //               // زر النقصان
// //               InkWell(
// //                 borderRadius: BorderRadius.circular(4),
// //                 onTap: canDecrease ? onDecrement : null,
// //                 child: Padding(
// //                   padding: const EdgeInsets.all(6.0),
// //                   child: Icon(Icons.remove,
// //                       size: 20,
// //                       color: canDecrease ? Colors.black54 : Colors.grey[300]),
// //                 ),
// //               ),
// //               // عرض الرقم
// //               SizedBox(
// //                 width: 30,
// //                 child: Text(
// //                   '$count',
// //                   textAlign: TextAlign.center,
// //                   style: const TextStyle(
// //                       fontSize: 16, fontWeight: FontWeight.bold),
// //                 ),
// //               ),
// //               // زر الزيادة
// //               InkWell(
// //                 borderRadius: BorderRadius.circular(4),
// //                 onTap: onIncrement,
// //                 child: const Padding(
// //                   padding: EdgeInsets.all(6.0),
// //                   child: Icon(Icons.add, size: 20, color: Colors.black54),
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ],
// //     );
// //   }

// //   // --- دالة بناء أزرار الخدمات العلوية (مع منطق التنقل الصحيح) ---
// //   Widget _buildServiceButton(IconData icon, String label, int index) {
// //     final isSelected = _selectedIndex == index;
// //     const Color kPrimaryColor = Color(0xFF4E7D96);

// //     return GestureDetector(
// //       onTap: () {
// //         if (!isSelected) {
// //           Widget? destinationScreen;
// //           switch (index) {
// //             case 0:
// //               destinationScreen = const FlightsScreen();
// //               break;
// //             case 1:
// //               destinationScreen = const HotelsSearchScreen();
// //               break;
// //             case 2:
// //               destinationScreen = const CarRentalScreen();
// //               break;
// //             case 3:
// //               /* نحن هنا بالفعل */ break;
// //           }
// //           if (destinationScreen != null) {
// //             Navigator.pushReplacement(
// //               context,
// //               MaterialPageRoute(builder: (context) => destinationScreen!),
// //             );
// //           }
// //         }
// //       },
// //       child: Container(
// //         margin: const EdgeInsets.symmetric(horizontal: 2),
// //         padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
// //         decoration: BoxDecoration(
// //           color: isSelected ? kPrimaryColor : Colors.transparent,
// //           borderRadius: BorderRadius.circular(8),
// //         ),
// //         child: Row(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             Icon(icon,
// //                 color: isSelected ? Colors.white : Colors.grey[600], size: 18),
// //             if (isSelected) ...[
// //               const SizedBox(width: 5),
// //               Flexible(
// //                 child: Text(
// //                   label,
// //                   style: const TextStyle(
// //                       color: Colors.white,
// //                       fontWeight: FontWeight.w500,
// //                       fontSize: 12),
// //                   overflow: TextOverflow.ellipsis,
// //                   maxLines: 1,
// //                 ),
// //               ),
// //             ],
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// // ignore_for_file: unused_import

// //   // --- !!! حذف دالة بناء الحقل النصي القديمة !!! ---
// //   // Widget _buildTextField({ ... }) // تم حذفها
// // }
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart'; // For date formatting
// import 'package:travella/models/Taxi.dart';
// import 'package:travella/screens/flights_screen.dart';
// import 'package:travella/screens/hotels_search_screen.dart';
// import 'package:travella/screens/car_rental_screen.dart';
// import 'package:travella/screens/taxi_results_screen.dart'; // شاشة نتائج التاكسي
// import 'package:travella/services/api/dio_client.dart';

// class TaxiSearchScreen extends StatefulWidget {
//   const TaxiSearchScreen({super.key});

//   @override
//   State<TaxiSearchScreen> createState() => _TaxiSearchScreenState();
// }

// class _TaxiSearchScreenState extends State<TaxiSearchScreen> {
//   // --- متغيرات الحالة ---
//   final TextEditingController _pickupLocationController =
//       TextEditingController(); // لإدخال الموقع يدويًا
//   DateTime? _selectedDate;
//   int _adultCount = 1;
//   int _childCount = 0;
//   final int _selectedIndex = 3; // Taxi is pre-selected

//   // --- حالة إظهار/إخفاء الأقسام ---
//   bool _showPassengers = false; // للتحكم في عرض قسم الركاب

//   // --- Getters ---
//   String get passengersText {
//     if (_showPassengers) {
//       return 'Select Number of Passengers';
//     } else {
//       String text = 'Adult: $_adultCount';
//       if (_childCount > 0) {
//         text += ', Child: $_childCount';
//       }
//       return text;
//     }
//   }

//   @override
//   void dispose() {
//     _pickupLocationController.dispose();
//     super.dispose();
//   }

//   // --- دوال تبديل العرض ---
//   void _togglePassengers() {
//     setState(() {
//       _showPassengers = !_showPassengers;
//     });
//   }

//   // --- دالة عرض منتقي التاريخ ---
//   Future<void> _selectDate(BuildContext context) async {
//     final DateTime now = DateTime.now();
//     final DateTime initial = _selectedDate ?? now;
//     final DateTime safeInitial = initial.isBefore(now) ? now : initial;

//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: safeInitial,
//       firstDate: now.subtract(const Duration(microseconds: 1)),
//       lastDate: now.add(const Duration(days: 365)),
//     );
//     if (picked != null && picked != _selectedDate) {
//       setState(() {
//         _selectedDate = picked;
//       });
//     }
//   }

//   // --- دوال التحكم في عدد الركاب ---
//   void _incrementAdults() {
//     setState(() {
//       _adultCount++;
//     });
//   }

//   void _decrementAdults() {
//     setState(() {
//       if (_adultCount > 1) _adultCount--;
//     });
//   }

//   void _incrementChildren() {
//     setState(() {
//       _childCount++;
//     });
//   }

//   void _decrementChildren() {
//     setState(() {
//       if (_childCount > 0) _childCount--;
//     });
//   }

//   // --- دالة الانتقال لنتائج البحث مع استدعاء الـ API ---
//   void _navigateToTaxiResults() async {
//     if (_pickupLocationController.text.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text("Please enter a pickup location"),
//           backgroundColor: Colors.orangeAccent,
//         ),
//       );
//       return;
//     }
//     if (_selectedDate == null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text("Please select a date"),
//           backgroundColor: Colors.orangeAccent,
//         ),
//       );
//       return;
//     }

//     final dioClient = DioClient();
//     try {
//       final passengers = {'adults': _adultCount, 'children': _childCount};
//       final taxis = await dioClient.searchTaxis(
//         pickUpLocation: _pickupLocationController.text,
//         date: _selectedDate!,
//         passengers: passengers,
//       );
//       if (taxis.isNotEmpty) {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => TaxiResultsScreen(
//               taxis: taxis,
//               pickupLocation: _pickupLocationController.text, // تمرير الموقع
//             ),
//           ),
//         );
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('No taxis found for this search')),
//         );
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error fetching taxis: $e')),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     const Color kPrimaryColor = Color(0xFF4E7D96);
//     const Color kFieldBackgroundColor = Color(0xFFEEEEEE);

//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.white,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             Container(
//               margin: const EdgeInsets.only(bottom: 24),
//               padding: const EdgeInsets.all(4),
//               height: 45,
//               decoration: BoxDecoration(
//                 color: const Color(0xFFF0F0F0),
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Row(
//                 children: [
//                   Expanded(
//                       child: _buildServiceButton(
//                           Icons.flight_takeoff, 'Flights', 0)),
//                   Expanded(
//                       child: _buildServiceButton(Icons.hotel, 'Hotels', 1)),
//                   Expanded(
//                       child: _buildServiceButton(
//                           Icons.directions_car, 'Car Rental', 2)),
//                   Expanded(
//                       child: _buildServiceButton(Icons.local_taxi, 'Taxi', 3)),
//                 ],
//               ),
//             ),
//             Container(
//               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
//               decoration: _inputBoxDecoration(kFieldBackgroundColor),
//               child: Row(
//                 children: [
//                   Icon(Icons.location_on, color: Colors.grey[600], size: 20),
//                   const SizedBox(width: 12),
//                   Expanded(
//                     child: TextField(
//                       controller: _pickupLocationController,
//                       decoration: InputDecoration(
//                         hintText: 'Enter Pickup Location',
//                         hintStyle: TextStyle(color: Colors.grey[600]),
//                         border: InputBorder.none,
//                       ),
//                       style: const TextStyle(color: Colors.black, fontSize: 16),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 16),
//             _buildDateField(kFieldBackgroundColor),
//             const SizedBox(height: 16),
//             GestureDetector(
//               onTap: _togglePassengers,
//               child: Container(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
//                 decoration: _inputBoxDecoration(kFieldBackgroundColor),
//                 child: Row(
//                   children: [
//                     Icon(Icons.person_outline,
//                         color: Colors.grey[600], size: 22),
//                     const SizedBox(width: 12),
//                     Expanded(
//                       child: Text(
//                         passengersText,
//                         style: TextStyle(
//                           color:
//                               _showPassengers ? Colors.grey[700] : Colors.black,
//                           fontSize: 16,
//                         ),
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                     ),
//                     Icon(
//                       _showPassengers
//                           ? Icons.keyboard_arrow_up
//                           : Icons.keyboard_arrow_down,
//                       color: Colors.grey[600],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             if (_showPassengers)
//               _buildPassengerCountersView(kFieldBackgroundColor),
//             const SizedBox(height: 40),
//             ElevatedButton(
//               onPressed: _navigateToTaxiResults,
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: kPrimaryColor,
//                 minimumSize: const Size(double.infinity, 50),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 elevation: 2,
//               ),
//               child: const Text(
//                 'Search Taxi',
//                 style: TextStyle(
//                     fontSize: 18,
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold),
//               ),
//             ),
//             const SizedBox(height: 20),
//           ],
//         ),
//       ),
//     );
//   }

//   BoxDecoration _inputBoxDecoration(Color backgroundColor) {
//     return BoxDecoration(
//       color: backgroundColor,
//       borderRadius: BorderRadius.circular(8),
//     );
//   }

//   Widget _buildDateField(Color backgroundColor) {
//     return GestureDetector(
//       onTap: () => _selectDate(context),
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
//         decoration: _inputBoxDecoration(backgroundColor),
//         child: Row(
//           children: [
//             Icon(Icons.calendar_today_outlined,
//                 color: Colors.grey[600], size: 20),
//             const SizedBox(width: 12),
//             Expanded(
//               child: Text(
//                 _selectedDate == null
//                     ? 'Select Date'
//                     : DateFormat('E, d MMM yyyy').format(_selectedDate!),
//                 style: TextStyle(
//                   color:
//                       _selectedDate == null ? Colors.grey[600] : Colors.black,
//                   fontSize: 16,
//                 ),
//                 overflow: TextOverflow.ellipsis,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildPassengerCountersView(Color backgroundColor) {
//     return Container(
//       margin: const EdgeInsets.only(top: 8),
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//       decoration: _inputBoxDecoration(backgroundColor),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           _buildCounter(
//               'Adults', _adultCount, _decrementAdults, _incrementAdults),
//           const SizedBox(height: 10),
//           _buildCounter(
//               'Children', _childCount, _decrementChildren, _incrementChildren),
//         ],
//       ),
//     );
//   }

//   Widget _buildCounter(String label, int count, VoidCallback onDecrement,
//       VoidCallback onIncrement) {
//     bool canDecrease =
//         (label == 'Adults' && count > 1) || (label == 'Children' && count > 0);
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(label, style: const TextStyle(fontSize: 16, color: Colors.black)),
//         Container(
//           padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(6),
//             border: Border.all(color: Colors.grey[300]!),
//           ),
//           child: Row(
//             children: [
//               InkWell(
//                 borderRadius: BorderRadius.circular(4),
//                 onTap: canDecrease ? onDecrement : null,
//                 child: Padding(
//                   padding: const EdgeInsets.all(6.0),
//                   child: Icon(Icons.remove,
//                       size: 20,
//                       color: canDecrease ? Colors.black54 : Colors.grey[300]),
//                 ),
//               ),
//               SizedBox(
//                 width: 30,
//                 child: Text(
//                   '$count',
//                   textAlign: TextAlign.center,
//                   style: const TextStyle(
//                       fontSize: 16, fontWeight: FontWeight.bold),
//                 ),
//               ),
//               InkWell(
//                 borderRadius: BorderRadius.circular(4),
//                 onTap: onIncrement,
//                 child: const Padding(
//                   padding: EdgeInsets.all(6.0),
//                   child: Icon(Icons.add, size: 20, color: Colors.black54),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildServiceButton(IconData icon, String label, int index) {
//     final isSelected = _selectedIndex == index;
//     const Color kPrimaryColor = Color(0xFF4E7D96);

// ignore_for_file: unused_import

//     return GestureDetector(
//       onTap: () {
//         if (!isSelected) {
//           Widget? destinationScreen;
//           switch (index) {
//             case 0:
//               destinationScreen = const FlightsScreen();
//               break;
//             case 1:
//               destinationScreen = const HotelsSearchScreen();
//               break;
//             case 2:
//               destinationScreen = const CarRentalScreen();
//               break;
//             case 3:
//               break;
//           }
//           if (destinationScreen != null) {
//             Navigator.pushReplacement(
//               context,
//               MaterialPageRoute(builder: (context) => destinationScreen!),
//             );
//           }
//         }
//       },
//       child: Container(
//         margin: const EdgeInsets.symmetric(horizontal: 2),
//         padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
//         decoration: BoxDecoration(
//           color: isSelected ? kPrimaryColor : Colors.transparent,
//           borderRadius: BorderRadius.circular(8),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(icon,
//                 color: isSelected ? Colors.white : Colors.grey[600], size: 18),
//             if (isSelected) ...[
//               const SizedBox(width: 5),
//               Flexible(
//                 child: Text(
//                   label,
//                   style: const TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.w500,
//                       fontSize: 12),
//                   overflow: TextOverflow.ellipsis,
//                   maxLines: 1,
//                 ),
//               ),
//             ],
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For date formatting
import 'package:apptravella/models/Taxi.dart';
import 'package:apptravella/screens/flights_screen.dart';
import 'package:apptravella/screens/hotels_search_screen.dart';
import 'package:apptravella/screens/car_rental_screen.dart';
import 'package:apptravella/screens/taxi_results_screen.dart'; // شاشة نتائج التاكسي
import 'package:apptravella/services/api/dio_client.dart';

class TaxiSearchScreen extends StatefulWidget {
  const TaxiSearchScreen({super.key});

  @override
  State<TaxiSearchScreen> createState() => _TaxiSearchScreenState();
}

class _TaxiSearchScreenState extends State<TaxiSearchScreen> {
  // --- متغيرات الحالة ---
  final TextEditingController _pickupLocationController =
      TextEditingController(); // لإدخال الموقع يدويًا
  DateTime? _selectedDate;
  int _adultCount = 1;
  int _childCount = 0;
  final int _selectedIndex = 3; // Taxi is pre-selected

  // --- حالة إظهار/إخفاء الأقسام ---
  bool _showPassengers = false; // للتحكم في عرض قسم الركاب

  // --- Getters ---
  String get passengersText {
    if (_showPassengers) {
      return 'Select Number of Passengers';
    } else {
      String text = 'Adult: $_adultCount';
      if (_childCount > 0) {
        text += ', Child: $_childCount';
      }
      return text;
    }
  }

  @override
  void dispose() {
    _pickupLocationController.dispose();
    super.dispose();
  }

  // --- دوال تبديل العرض ---
  void _togglePassengers() {
    setState(() {
      _showPassengers = !_showPassengers;
    });
  }

  // --- دالة عرض منتقي التاريخ ---
  Future<void> _selectDate(BuildContext context) async {
    final DateTime now = DateTime.now();
    final DateTime initial = _selectedDate ?? now;
    final DateTime safeInitial = initial.isBefore(now) ? now : initial;

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: safeInitial,
      firstDate: now.subtract(const Duration(microseconds: 1)),
      lastDate: now.add(const Duration(days: 365)),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  // --- دوال التحكم في عدد الركاب ---
  void _incrementAdults() {
    setState(() {
      _adultCount++;
    });
  }

  void _decrementAdults() {
    setState(() {
      if (_adultCount > 1) _adultCount--;
    });
  }

  void _incrementChildren() {
    setState(() {
      _childCount++;
    });
  }

  void _decrementChildren() {
    setState(() {
      if (_childCount > 0) _childCount--;
    });
  }

  // --- دالة الانتقال لنتائج البحث مع استدعاء الـ API ---
  void _navigateToTaxiResults() async {
    if (_pickupLocationController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please enter a pickup location"),
          backgroundColor: Colors.orangeAccent,
        ),
      );
      return;
    }
    if (_selectedDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please select a date"),
          backgroundColor: Colors.orangeAccent,
        ),
      );
      return;
    }

    final dioClient = DioClient();
    try {
      final passengers = {'adults': _adultCount, 'children': _childCount};
      final taxis = await dioClient.searchTaxis(
        pickUpLocation: _pickupLocationController.text,
        date: _selectedDate!,
        passengers: passengers,
      );
      if (taxis.isNotEmpty) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TaxiResultsScreen(
              taxis: taxis,
              pickupLocation: _pickupLocationController.text, // تمرير الموقع
            ),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No taxis found for this search')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching taxis: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    const Color kPrimaryColor = Color(0xFF4E7D96);
    const Color kFieldBackgroundColor = Color(0xFFEEEEEE);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 24),
              padding: const EdgeInsets.all(4),
              height: 45,
              decoration: BoxDecoration(
                color: const Color(0xFFF0F0F0),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Expanded(
                      child: _buildServiceButton(
                          Icons.flight_takeoff, 'Flights', 0)),
                  Expanded(
                      child: _buildServiceButton(Icons.hotel, 'Hotels', 1)),
                  Expanded(
                      child: _buildServiceButton(
                          Icons.directions_car, 'Car Rental', 2)),
                  Expanded(
                      child: _buildServiceButton(Icons.local_taxi, 'Taxi', 3)),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              decoration: _inputBoxDecoration(kFieldBackgroundColor),
              child: Row(
                children: [
                  Icon(Icons.location_on, color: Colors.grey[600], size: 20),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextField(
                      controller: _pickupLocationController,
                      decoration: InputDecoration(
                        hintText: 'Enter Pickup Location',
                        hintStyle: TextStyle(color: Colors.grey[600]),
                        border: InputBorder.none,
                      ),
                      style: const TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            _buildDateField(kFieldBackgroundColor),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: _togglePassengers,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                decoration: _inputBoxDecoration(kFieldBackgroundColor),
                child: Row(
                  children: [
                    Icon(Icons.person_outline,
                        color: Colors.grey[600], size: 22),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        passengersText,
                        style: TextStyle(
                          color:
                              _showPassengers ? Colors.grey[700] : Colors.black,
                          fontSize: 16,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Icon(
                      _showPassengers
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      color: Colors.grey[600],
                    ),
                  ],
                ),
              ),
            ),
            if (_showPassengers)
              _buildPassengerCountersView(kFieldBackgroundColor),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: _navigateToTaxiResults,
              style: ElevatedButton.styleFrom(
                backgroundColor: kPrimaryColor,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 2,
              ),
              child: const Text(
                'Search Taxi',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  BoxDecoration _inputBoxDecoration(Color backgroundColor) {
    return BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(8),
    );
  }

  Widget _buildDateField(Color backgroundColor) {
    return GestureDetector(
      onTap: () => _selectDate(context),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: _inputBoxDecoration(backgroundColor),
        child: Row(
          children: [
            Icon(Icons.calendar_today_outlined,
                color: Colors.grey[600], size: 20),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                _selectedDate == null
                    ? 'Select Date'
                    : DateFormat('E, d MMM yyyy').format(_selectedDate!),
                style: TextStyle(
                  color:
                      _selectedDate == null ? Colors.grey[600] : Colors.black,
                  fontSize: 16,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPassengerCountersView(Color backgroundColor) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: _inputBoxDecoration(backgroundColor),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildCounter(
              'Adults', _adultCount, _decrementAdults, _incrementAdults),
          const SizedBox(height: 10),
          _buildCounter(
              'Children', _childCount, _decrementChildren, _incrementChildren),
        ],
      ),
    );
  }

  Widget _buildCounter(String label, int count, VoidCallback onDecrement,
      VoidCallback onIncrement) {
    bool canDecrease =
        (label == 'Adults' && count > 1) || (label == 'Children' && count > 0);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(fontSize: 16, color: Colors.black)),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: Colors.grey[300]!),
          ),
          child: Row(
            children: [
              InkWell(
                borderRadius: BorderRadius.circular(4),
                onTap: canDecrease ? onDecrement : null,
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Icon(Icons.remove,
                      size: 20,
                      color: canDecrease ? Colors.black54 : Colors.grey[300]),
                ),
              ),
              SizedBox(
                width: 30,
                child: Text(
                  '$count',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              InkWell(
                borderRadius: BorderRadius.circular(4),
                onTap: onIncrement,
                child: const Padding(
                  padding: EdgeInsets.all(6.0),
                  child: Icon(Icons.add, size: 20, color: Colors.black54),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildServiceButton(IconData icon, String label, int index) {
    final isSelected = _selectedIndex == index;
    const Color kPrimaryColor = Color(0xFF4E7D96);

    return GestureDetector(
      onTap: () {
        if (!isSelected) {
          Widget? destinationScreen;
          switch (index) {
            case 0:
              destinationScreen = const FlightsScreen();
              break;
            case 1:
              destinationScreen = const HotelsSearchScreen();
              break;
            case 2:
              destinationScreen = const CarRentalScreen();
              break;
            case 3:
              break;
          }
          if (destinationScreen != null) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => destinationScreen!),
            );
          }
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 2),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? kPrimaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon,
                color: isSelected ? Colors.white : Colors.grey[600], size: 18),
            if (isSelected) ...[
              const SizedBox(width: 5),
              Flexible(
                child: Text(
                  label,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 12),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
