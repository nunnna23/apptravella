// // import 'package:flutter/material.dart';
// // import 'package:table_calendar/table_calendar.dart'; // لاستخدام التقويم
// // import 'package:intl/intl.dart'; // لتنسيق التواريخ

// // // --- استيراد الشاشات الأخرى ---
// // import 'hotel_results_screen.dart'; // شاشة نتائج الفنادق (موجودة بالفعل)
// // // تأكد من أن هذه المسارات صحيحة لملفاتك
// // import 'flights_screen.dart'; // شاشة الرحلات
// // import 'car_rental_screen.dart'; // شاشة تأجير السيارات
// // import 'taxi_search_screen.dart'; // شاشة بحث التاكسي

// // class HotelsSearchScreen extends StatefulWidget {
// //   const HotelsSearchScreen({super.key});

// //   @override
// //   State<HotelsSearchScreen> createState() => _HotelsSearchScreenState();
// // }

// // class _HotelsSearchScreenState extends State<HotelsSearchScreen> {
// //   // --- متغيرات الحالة (State Variables) ---
// //   String selectedTopTab = 'Hotels'; // التاب النشط حاليًا
// //   final TextEditingController _destinationController = TextEditingController();
// //   DateTime? _rangeStart;
// //   DateTime? _rangeEnd;
// //   DateTime _focusedDay = DateTime.now();
// //   int adultCount = 1;
// //   int childCount = 0;

// //   bool showCalendar = false;
// //   bool showGuests = false;

// //   // --- Getters للنصوص الديناميكية ---
// //   String get dateRangeText {
// //     if (_rangeStart == null) {
// //       return 'Enter Check-in & Check-out Dates'; // نص أوضح
// //     } else {
// //       final DateFormat formatter = DateFormat('d/M/yy'); // تنسيق أقصر
// //       if (_rangeEnd == null) {
// //         return 'Check-in: ${formatter.format(_rangeStart!)}';
// //       } else {
// //         return '${formatter.format(_rangeStart!)} - ${formatter.format(_rangeEnd!)}';
// //       }
// //     }
// //   }

// //   String get guestsText {
// //     if (showGuests) {
// //       return 'Select Number of Guests'; // نص أوضح
// //     } else {
// //       String text = '$adultCount Adult';
// //       if (childCount > 0) {
// //         text += ', $childCount Children';
// //       }
// //       // يمكنك إضافة الغرف هنا أيضاً إذا لزم الأمر
// //       return text;
// //     }
// //   }

// //   @override
// //   void dispose() {
// //     _destinationController.dispose();
// //     super.dispose();
// //   }

// //   // --- دوال التفاعل (Interaction Methods) ---
// //   void _toggleCalendar() {
// //     setState(() {
// //       showCalendar = !showCalendar;
// //       showGuests = false;
// //     });
// //   }

// //   void _toggleGuests() {
// //     setState(() {
// //       showGuests = !showGuests;
// //       showCalendar = false;
// //     });
// //   }

// //   void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
// //     setState(() {
// //       _focusedDay = focusedDay;
// //       _rangeStart = start;
// //       _rangeEnd = end;
// //       if (start != null && end != null) {
// //         showCalendar = false; // إغلاق التقويم بعد اختيار النطاق كاملاً
// //       }
// //     });
// //   }

// //   // --- دالة الانتقال والتحقق (Navigation & Validation) ---
// //   void _navigateToHotelResults() {
// //     final destination = _destinationController.text.trim();
// //     if (destination.isEmpty) {
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         const SnackBar(
// //           content: Text('Please enter a destination or hotel name'),
// //           backgroundColor: Colors.orangeAccent, // لون مختلف للتحذير
// //         ),
// //       );
// //       return;
// //     }
// //     if (_rangeStart == null || _rangeEnd == null) {
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         const SnackBar(
// //           content: Text('Please select both Check-in and Check-out dates'),
// //           backgroundColor: Colors.orangeAccent,
// //         ),
// //       );
// //       return;
// //     }

// //     // Debug prints
// //     print('--- Navigating to Hotel Results ---');
// //     print('Destination: $destination');
// //     print('Check-in: $_rangeStart');
// //     print('Check-out: $_rangeEnd');
// //     print('Adults: $adultCount');
// //     print('Children: $childCount');
// //     print('------------------------------------');

// //     Navigator.push(
// //       context,
// //       MaterialPageRoute(
// //         builder: (context) => HotelResultsScreen(
// //           destination: destination,
// //           checkInDate: _rangeStart!,
// //           checkOutDate: _rangeEnd!,
// //           adults: adultCount,
// //           children: childCount,
// //         ),
// //       ),
// //     );
// //   }

// //   // --- دالة بناء الواجهة الرئيسية (Build Method) ---
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.white,
// //       body: SafeArea(
// //         child: SingleChildScrollView(
// //           child: Padding(
// //             padding: const EdgeInsets.all(16.0),
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 // --- زر الرجوع ---
// //                 Row(
// //                   children: [
// //                     IconButton(
// //                       icon: const Icon(Icons.arrow_back, color: Colors.black),
// //                       onPressed: () => Navigator.pop(context),
// //                       constraints: const BoxConstraints(),
// //                       padding: EdgeInsets.zero,
// //                     ),
// //                   ],
// //                 ),
// //                 const SizedBox(height: 15),

// //                 // --- تابات اختيار الخدمة (تم تحديثها للتنقل) ---
// //                 Container(
// //                   padding: const EdgeInsets.all(4),
// //                   height: 45,
// //                   decoration: BoxDecoration(
// //                     color: const Color(0xFFF0F0F0),
// //                     borderRadius: BorderRadius.circular(10),
// //                   ),
// //                   child: Row(
// //                     children: [
// //                       // تمرير tabKey لكل تبويب
// //                       Expanded(
// //                           child: _buildTopTab(
// //                               Icons.flight_takeoff, 'Flights', 'Flights')),
// //                       Expanded(
// //                           child: _buildTopTab(Icons.hotel, 'Hotels',
// //                               'Hotels')), // الفنادق هو النشط
// //                       Expanded(
// //                           child: _buildTopTab(Icons.directions_car,
// //                               'Car Rental', 'Car Rental')),
// //                       Expanded(
// //                           child:
// //                               _buildTopTab(Icons.local_taxi, 'Taxi', 'Taxi')),
// //                     ],
// //                   ),
// //                 ),
// //                 const SizedBox(height: 24),

// //                 // --- حقل إدخال الوجهة ---
// //                 TextField(
// //                   controller: _destinationController,
// //                   decoration: _inputDecoration(
// //                       hintText: 'Enter Destination or Hotel Name',
// //                       icon: Icons.search),
// //                   style: const TextStyle(color: Colors.black, fontSize: 16),
// //                   textInputAction: TextInputAction.search,
// //                   onSubmitted: (_) => _navigateToHotelResults(),
// //                 ),
// //                 const SizedBox(height: 12),

// //                 // --- حقل اختيار التاريخ (Check-in/Check-out) ---
// //                 GestureDetector(
// //                   onTap: _toggleCalendar,
// //                   child: Container(
// //                     padding: const EdgeInsets.symmetric(
// //                         horizontal: 16, vertical: 14),
// //                     decoration: _inputBoxDecoration(),
// //                     child: Row(
// //                       children: [
// //                         Icon(Icons.calendar_today,
// //                             color: Colors.grey[600], size: 20),
// //                         const SizedBox(width: 12),
// //                         Expanded(
// //                           child: Text(
// //                             dateRangeText,
// //                             style: TextStyle(
// //                               color: _rangeStart != null
// //                                   ? Colors.black
// //                                   : Colors.grey[700],
// //                               fontSize: 16,
// //                             ),
// //                             overflow: TextOverflow.ellipsis, // منع التجاوز
// //                           ),
// //                         ),
// //                         Icon(
// //                           // إضافة سهم
// //                           showCalendar
// //                               ? Icons.keyboard_arrow_up
// //                               : Icons.keyboard_arrow_down,
// //                           color: Colors.grey[600],
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                 ),
// //                 // --- عرض التقويم ---
// //                 if (showCalendar) _buildCalendarView(),
// //                 const SizedBox(height: 12),

// //                 // --- حقل اختيار النزلاء ---
// //                 GestureDetector(
// //                   onTap: _toggleGuests,
// //                   child: Container(
// //                     padding: const EdgeInsets.symmetric(
// //                         horizontal: 16, vertical: 14),
// //                     decoration: _inputBoxDecoration(),
// //                     child: Row(
// //                       children: [
// //                         Icon(Icons.person_outline, // أيقونة شخص أبسط
// //                             color: Colors.grey[600],
// //                             size: 22),
// //                         const SizedBox(width: 12),
// //                         Expanded(
// //                           child: Text(
// //                             guestsText,
// //                             style: TextStyle(
// //                               color:
// //                                   showGuests ? Colors.grey[700] : Colors.black,
// //                               fontSize: 16,
// //                             ),
// //                             overflow: TextOverflow.ellipsis,
// //                           ),
// //                         ),
// //                         Icon(
// //                           showGuests
// //                               ? Icons.keyboard_arrow_up
// //                               : Icons.keyboard_arrow_down,
// //                           color: Colors.grey[600],
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                 ),
// //                 // --- عرض قسم عدادات النزلاء ---
// //                 if (showGuests) _buildGuestCountersView(),
// //                 const SizedBox(height: 40),

// //                 // --- زر البحث ---
// //                 SizedBox(
// //                   width: double.infinity,
// //                   child: ElevatedButton(
// //                     onPressed: _navigateToHotelResults,
// //                     style: ElevatedButton.styleFrom(
// //                       backgroundColor:
// //                           const Color(0xFF4E7D96), // استخدام نفس لون التطبيق
// //                       padding: const EdgeInsets.symmetric(vertical: 16),
// //                       shape: RoundedRectangleBorder(
// //                           borderRadius: BorderRadius.circular(12)),
// //                       elevation: 2,
// //                     ),
// //                     child: const Text(
// //                       'Search Hotels', // تغيير النص ليكون محدداً
// //                       style: TextStyle(
// //                         fontSize: 18,
// //                         fontWeight: FontWeight.bold,
// //                         color: Colors.white, // نص أبيض
// //                       ),
// //                     ),
// //                   ),
// //                 ),
// //                 const SizedBox(height: 20),
// //               ],
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   // --- ==================== ---
// //   // --- الدوال المساعدة للبناء ---
// //   // --- ==================== ---

// //   InputDecoration _inputDecoration(
// //       {required String hintText, required IconData icon}) {
// //     return InputDecoration(
// //       hintText: hintText,
// //       hintStyle: TextStyle(color: Colors.grey[600], fontSize: 16),
// //       prefixIcon: Icon(icon, color: Colors.grey[600], size: 20),
// //       filled: true,
// //       fillColor: const Color(0xFFEEEEEE),
// //       border: OutlineInputBorder(
// //         borderRadius: BorderRadius.circular(8),
// //         borderSide: BorderSide.none,
// //       ),
// //       contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
// //     );
// //   }

// //   BoxDecoration _inputBoxDecoration() {
// //     return BoxDecoration(
// //       color: const Color(0xFFEEEEEE),
// //       borderRadius: BorderRadius.circular(8),
// //     );
// //   }

// //   // --- دالة بناء التبويبات العلوية (تم التحديث للتنقل) ---
// //   Widget _buildTopTab(IconData icon, String label, String tabKey) {
// //     final isSelected = selectedTopTab == tabKey;
// //     // استخدام اللون الأساسي الموحد
// //     const Color kPrimaryColor = Color(0xFF4E7D96);

// //     return GestureDetector(
// //       onTap: () {
// //         // --- بداية منطق الضغط ---
// //         if (!isSelected) {
// //           // نفذ فقط إذا تم الضغط على تبويب غير محدد
// //           Widget? destinationScreen; // وجهة الانتقال

// //           // تحديد الوجهة بناءً على tabKey
// //           switch (tabKey) {
// //             case 'Flights':
// //               destinationScreen = const FlightsScreen(); // تأكد من الاستيراد
// //               break;
// //             case 'Hotels':
// //               // نحن بالفعل في شاشة الفنادق، فقط حدث الحالة البصرية
// //               setState(() {
// //                 selectedTopTab = tabKey;
// //               });
// //               // قد ترغب في إعادة تعيين الحقول هنا عند العودة لهذا التبويب
// //               break;
// //             case 'Car Rental':
// //               destinationScreen = const CarRentalScreen(); // تأكد من الاستيراد
// //               break;
// //             case 'Taxi':
// //               destinationScreen = const TaxiSearchScreen(); // تأكد من الاستيراد
// //               break;
// //           }

// //           // تنفيذ الانتقال إذا تم تحديد وجهة
// //           if (destinationScreen != null) {
// //             // استبدال الشاشة الحالية
// //             Navigator.pushReplacement(
// //               context,
// //               MaterialPageRoute(builder: (context) => destinationScreen!),
// //             );
// //           }
// //         } else if (tabKey == 'Hotels') {
// //           // هنا إذا تم الضغط على تبويب الفنادق وهو محدد بالفعل
// //           print("Hotels tab tapped while already selected.");
// //           // يمكنك إضافة إجراء هنا (إعادة تعيين النموذج؟)
// //         }
// //         // --- نهاية منطق الضغط ---
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
// //             Icon(
// //               icon,
// //               color: isSelected ? Colors.white : Colors.grey[600],
// //               size: 18,
// //             ),
// //             if (isSelected) ...[
// //               const SizedBox(width: 5),
// //               Flexible(
// //                 child: Text(
// //                   label,
// //                   style: const TextStyle(
// //                     color: Colors.white,
// //                     fontWeight: FontWeight.w500,
// //                     fontSize: 12,
// //                   ),
// //                   overflow: TextOverflow.ellipsis,
// //                   maxLines: 1, // ضمان سطر واحد
// //                 ),
// //               ),
// //             ],
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   Widget _buildCalendarView() {
// //     const Color kPrimaryColor = Color(0xFF4E7D96); // اللون الأساسي
// //     return Container(
// //       margin: const EdgeInsets.only(top: 8),
// //       decoration: BoxDecoration(
// //           color: Colors.white,
// //           borderRadius: BorderRadius.circular(8),
// //           boxShadow: [
// //             BoxShadow(
// //                 color: Colors.grey.withOpacity(0.2),
// //                 spreadRadius: 1,
// //                 blurRadius: 3,
// //                 offset: const Offset(0, 2)),
// //           ]),
// //       child: TableCalendar(
// //         firstDay: DateTime.now()
// //             .subtract(const Duration(days: 1)), // منع الأيام الماضية تمامًا
// //         lastDay: DateTime.utc(2030, 12, 31),
// //         focusedDay: _focusedDay,
// //         rangeStartDay: _rangeStart,
// //         rangeEndDay: _rangeEnd,
// //         rangeSelectionMode: RangeSelectionMode.toggledOn,
// //         onRangeSelected: _onRangeSelected,
// //         // دالة لتحديد ما إذا كان يجب السماح باختيار يوم معين
// //         enabledDayPredicate: (day) {
// //           // السماح باختيار اليوم الحالي والأيام المستقبلية فقط
// //           return !day
// //               .isBefore(DateTime.now().subtract(const Duration(days: 1)));
// //         },
// //         calendarFormat: CalendarFormat.month,
// //         headerStyle: const HeaderStyle(
// //           titleTextStyle:
// //               TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
// //           formatButtonVisible: false,
// //           titleCentered: true,
// //           leftChevronIcon: Icon(Icons.chevron_left, color: Colors.black),
// //           rightChevronIcon: Icon(Icons.chevron_right, color: Colors.black),
// //         ),
// //         calendarStyle: CalendarStyle(
// //           // تصميم النطاق
// //           rangeStartDecoration:
// //               const BoxDecoration(color: kPrimaryColor, shape: BoxShape.circle),
// //           rangeStartTextStyle:
// //               const TextStyle(color: Colors.white, fontSize: 15),
// //           rangeEndDecoration:
// //               const BoxDecoration(color: kPrimaryColor, shape: BoxShape.circle),
// //           rangeEndTextStyle: const TextStyle(color: Colors.white, fontSize: 15),
// //           withinRangeDecoration: BoxDecoration(
// //               color: kPrimaryColor.withOpacity(0.1),
// //               shape: BoxShape.rectangle), // مستطيل أو دائرة
// //           withinRangeTextStyle:
// //               TextStyle(color: Colors.grey[800], fontSize: 15),
// //           rangeHighlightScale: 1.0, // منع تغيير حجم التظليل
// //           rangeHighlightColor: kPrimaryColor.withOpacity(0.15),

// //           // تصميم اليوم المحدد (عند اختيار يوم واحد)
// //           selectedDecoration: BoxDecoration(
// //               color: kPrimaryColor.withOpacity(0.5), shape: BoxShape.circle),
// //           selectedTextStyle: const TextStyle(color: Colors.white, fontSize: 15),

// //           // تصميم اليوم الحالي
// //           todayDecoration: BoxDecoration(
// //               // لون أخف أو حدود فقط لليوم الحالي
// //               // color: kPrimaryColor.withOpacity(0.2),
// //               border: Border.all(color: kPrimaryColor, width: 1.5),
// //               shape: BoxShape.circle),
// //           todayTextStyle: const TextStyle(
// //               color: kPrimaryColor, fontWeight: FontWeight.bold, fontSize: 15),

// //           // تصميم الأيام العادية وغير المتاحة
// //           defaultTextStyle: const TextStyle(color: Colors.black, fontSize: 15),
// //           weekendTextStyle: const TextStyle(
// //               color: Colors.black54, fontSize: 15), // تمييز نهاية الأسبوع
// //           disabledTextStyle: TextStyle(
// //               color: Colors.grey[400]!, fontSize: 15), // الأيام غير المتاحة

// //           outsideDaysVisible: false,
// //         ),
// //         startingDayOfWeek: StartingDayOfWeek.sunday, // أو Monday
// //       ),
// //     );
// //   }

// //   Widget _buildGuestCountersView() {
// //     return Container(
// //       margin: const EdgeInsets.only(top: 8),
// //       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
// //       decoration: BoxDecoration(
// //         color: const Color(0xFFEEEEEE),
// //         borderRadius: BorderRadius.circular(8),
// //       ),
// //       child: Column(
// //         mainAxisSize: MainAxisSize.min,
// //         children: [
// //           _buildGuestCounter(
// //               'Adults',
// //               adultCount, // استخدام Adults/Children
// //               (val) => setState(() => adultCount = val),
// //               1), // Min 1 adult
// //           const SizedBox(height: 10),
// //           _buildGuestCounter('Children', childCount,
// //               (val) => setState(() => childCount = val), 0), // Min 0 children
// //         ],
// //       ),
// //     );
// //   }

// //   Widget _buildGuestCounter(
// //       String label, int count, ValueChanged<int> onChanged, int minValue) {
// //     bool canDecrease = count > minValue; // التحقق من إمكانية النقصان
// //     return Row(
// //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //       children: [
// //         Text(label, style: const TextStyle(fontSize: 16, color: Colors.black)),
// //         Container(
// //           padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
// //           decoration: BoxDecoration(
// //               color: Colors.white,
// //               borderRadius: BorderRadius.circular(6),
// //               border: Border.all(color: Colors.grey[300]!)),
// //           child: Row(
// //             mainAxisSize: MainAxisSize.min,
// //             children: [
// //               InkWell(
// //                 borderRadius: BorderRadius.circular(4),
// //                 // تعطيل الضغط إذا كان لا يمكن النقصان
// //                 onTap: canDecrease ? () => onChanged(count - 1) : null,
// //                 child: Padding(
// //                   padding: const EdgeInsets.all(6.0),
// //                   // تغيير لون الأيقونة عند التعطيل
// //                   child: Icon(Icons.remove,
// //                       size: 20,
// //                       color: canDecrease ? Colors.black54 : Colors.grey[300]),
// //                 ),
// //               ),
// //               SizedBox(
// //                 width: 30,
// //                 child: Text(
// //                   '$count',
// //                   textAlign: TextAlign.center,
// //                   style: const TextStyle(
// //                       fontSize: 16, fontWeight: FontWeight.bold),
// //                 ),
// //               ),
// //               InkWell(
// //                 borderRadius: BorderRadius.circular(4),
// //                 onTap: () => onChanged(count + 1), // يمكن إضافة حد أقصى هنا
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
// // }
// import 'package:flutter/material.dart';
// import 'package:table_calendar/table_calendar.dart';
// import 'package:intl/intl.dart';
// import 'package:travella/models/hotel_model.dart';
// import 'package:travella/services/hotel_api_service.dart';

// import 'hotel_results_screen.dart';
// import 'flights_screen.dart';
// import 'car_rental_screen.dart';
// import 'taxi_search_screen.dart';

// class HotelsSearchScreen extends StatefulWidget {
//   const HotelsSearchScreen({super.key});

//   @override
//   State<HotelsSearchScreen> createState() => _HotelsSearchScreenState();
// }

// class _HotelsSearchScreenState extends State<HotelsSearchScreen> {
//   // --- متغيرات الحالة (State Variables) ---
//   final HotelApiService _hotelApiService = HotelApiService();
//   bool _isLoading = false; // --- New loading state
//   String selectedTopTab = 'Hotels';
//   final TextEditingController _destinationController = TextEditingController();
//   DateTime? _rangeStart;
//   DateTime? _rangeEnd;
//   DateTime _focusedDay = DateTime.now();
//   int adultCount = 1;
//   int childCount = 0;
//   bool showCalendar = false;
//   bool showGuests = false;

//   // --- Getters للنصوص الديناميكية (لا تغيير) ---
//   String get dateRangeText {
//     if (_rangeStart == null) return 'Enter Check-in & Check-out Dates';
//     final DateFormat formatter = DateFormat('d/M/yy');
//     if (_rangeEnd == null) return 'Check-in: ${formatter.format(_rangeStart!)}';
//     return '${formatter.format(_rangeStart!)} - ${formatter.format(_rangeEnd!)}';
//   }

//   String get guestsText {
//     if (showGuests) return 'Select Number of Guests';
//     String text = '$adultCount Adult';
//     if (childCount > 0) text += ', $childCount Children';
//     return text;
//   }

//   @override
//   void dispose() {
//     _destinationController.dispose();
//     super.dispose();
//   }

//   // --- دوال التفاعل (لا تغيير) ---
//   void _toggleCalendar() {
//     setState(() {
//       showCalendar = !showCalendar;
//       showGuests = false;
//     });
//   }

//   void _toggleGuests() {
//     setState(() {
//       showGuests = !showGuests;
//       showCalendar = false;
//     });
//   }

//   void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
//     setState(() {
//       _focusedDay = focusedDay;
//       _rangeStart = start;
//       _rangeEnd = end;
//       if (start != null && end != null) {
//         showCalendar = false;
//       }
//     });
//   }

//   // --- دالة الانتقال والتحقق (API Integration) ---
//   void _searchAndNavigateToResults() async {
//     final destination = _destinationController.text.trim();
//     if (destination.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//           content: Text('Please enter a destination or hotel name')));
//       return;
//     }
//     if (_rangeStart == null || _rangeEnd == null) {
//       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//           content: Text('Please select both Check-in and Check-out dates')));
//       return;
//     }

//     setState(() => _isLoading = true);

//     try {
//       final List<Hotel> hotelResults = await _hotelApiService.searchHotels(
//         location: destination,
//         checkInDate: _rangeStart!,
//         checkOutDate: _rangeEnd!,
//         adults: adultCount,
//         children: childCount,
//         city: '',
//       );

//       // Calculate nights
//       final int nights = _rangeEnd!.difference(_rangeStart!).inDays;

//       if (mounted) {
//         // Check if the widget is still in the tree
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => HotelResultsScreen(
//               initialHotels: hotelResults, // Pass fetched hotels
//               destination: destination,
//               checkInDate: _rangeStart!,
//               checkOutDate: _rangeEnd!,
//               nights: nights,
//               adults: adultCount,
//               children: childCount,
//             ),
//           ),
//         );
//       }
//     } catch (e) {
//       if (mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Search failed: ${e.toString()}')),
//         );
//       }
//     } finally {
//       if (mounted) {
//         setState(() => _isLoading = false);
//       }
//     }
//   }

//   // --- دالة بناء الواجهة الرئيسية (Build Method) ---
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // ... (بقية الواجهة كما هي)
//                 Row(
//                   children: [
//                     IconButton(
//                       icon: const Icon(Icons.arrow_back, color: Colors.black),
//                       onPressed: () => Navigator.pop(context),
//                       constraints: const BoxConstraints(),
//                       padding: EdgeInsets.zero,
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 15),

//                 // --- تابات اختيار الخدمة
//                 Container(
//                   padding: const EdgeInsets.all(4),
//                   height: 45,
//                   decoration: BoxDecoration(
//                     color: const Color(0xFFF0F0F0),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Row(
//                     children: [
//                       Expanded(
//                           child: _buildTopTab(
//                               Icons.flight_takeoff, 'Flights', 'Flights')),
//                       Expanded(
//                           child: _buildTopTab(Icons.hotel, 'Hotels', 'Hotels')),
//                       Expanded(
//                           child: _buildTopTab(Icons.directions_car,
//                               'Car Rental', 'Car Rental')),
//                       Expanded(
//                           child:
//                               _buildTopTab(Icons.local_taxi, 'Taxi', 'Taxi')),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 24),

//                 // --- حقل إدخال الوجهة
//                 TextField(
//                   controller: _destinationController,
//                   decoration: _inputDecoration(
//                       hintText: 'Enter Destination or Hotel Name',
//                       icon: Icons.search),
//                   style: const TextStyle(color: Colors.black, fontSize: 16),
//                   textInputAction: TextInputAction.search,
//                   onSubmitted: (_) => _searchAndNavigateToResults(),
//                 ),
//                 const SizedBox(height: 12),

//                 // --- حقل اختيار التاريخ
//                 GestureDetector(
//                   onTap: _toggleCalendar,
//                   child: Container(
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 16, vertical: 14),
//                     decoration: _inputBoxDecoration(),
//                     child: Row(
//                       children: [
//                         Icon(Icons.calendar_today,
//                             color: Colors.grey[600], size: 20),
//                         const SizedBox(width: 12),
//                         Expanded(
//                           child: Text(
//                             dateRangeText,
//                             style: TextStyle(
//                               color: _rangeStart != null
//                                   ? Colors.black
//                                   : Colors.grey[700],
//                               fontSize: 16,
//                             ),
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                         ),
//                         Icon(
//                           showCalendar
//                               ? Icons.keyboard_arrow_up
//                               : Icons.keyboard_arrow_down,
//                           color: Colors.grey[600],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 if (showCalendar) _buildCalendarView(),
//                 const SizedBox(height: 12),

//                 // --- حقل اختيار النزلاء ---
//                 GestureDetector(
//                   onTap: _toggleGuests,
//                   child: Container(
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 16, vertical: 14),
//                     decoration: _inputBoxDecoration(),
//                     child: Row(
//                       children: [
//                         Icon(Icons.person_outline,
//                             color: Colors.grey[600], size: 22),
//                         const SizedBox(width: 12),
//                         Expanded(
//                           child: Text(
//                             guestsText,
//                             style: TextStyle(
//                               color:
//                                   showGuests ? Colors.grey[700] : Colors.black,
//                               fontSize: 16,
//                             ),
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                         ),
//                         Icon(
//                           showGuests
//                               ? Icons.keyboard_arrow_up
//                               : Icons.keyboard_arrow_down,
//                           color: Colors.grey[600],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 if (showGuests) _buildGuestCountersView(),
//                 const SizedBox(height: 40),

//                 // --- زر البحث (مُعدل) ---
//                 SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     onPressed: _isLoading
//                         ? null
//                         : _searchAndNavigateToResults, // Disable on load
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: const Color(0xFF4E7D96),
//                       padding: const EdgeInsets.symmetric(vertical: 16),
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12)),
//                       elevation: 2,
//                     ),
//                     child: _isLoading
//                         ? const CircularProgressIndicator(color: Colors.white)
//                         : const Text(
//                             'Search Hotels',
//                             style: TextStyle(
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.white,
//                             ),
//                           ),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   // --- الدوال المساعدة للبناء (لا تغيير) ---
//   InputDecoration _inputDecoration(
//       {required String hintText, required IconData icon}) {
//     // ... (الكود كما هو)
//     return InputDecoration(
//       hintText: hintText,
//       hintStyle: TextStyle(color: Colors.grey[600], fontSize: 16),
//       prefixIcon: Icon(icon, color: Colors.grey[600], size: 20),
//       filled: true,
//       fillColor: const Color(0xFFEEEEEE),
//       border: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(8),
//         borderSide: BorderSide.none,
//       ),
//       contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
//     );
//   }

//   BoxDecoration _inputBoxDecoration() {
//     // ... (الكود كما هو)
//     return BoxDecoration(
//       color: const Color(0xFFEEEEEE),
//       borderRadius: BorderRadius.circular(8),
//     );
//   }

//   Widget _buildTopTab(IconData icon, String label, String tabKey) {
//     // ... (الكود كما هو)
//     final isSelected = selectedTopTab == tabKey;
//     const Color kPrimaryColor = Color(0xFF4E7D96);

//     return GestureDetector(
//       onTap: () {
//         if (!isSelected) {
//           Widget? destinationScreen;
//           switch (tabKey) {
//             case 'Flights':
//               destinationScreen = const FlightsScreen();
//               break;
//             case 'Hotels':
//               setState(() {
//                 selectedTopTab = tabKey;
//               });
//               break;
//             case 'Car Rental':
//               destinationScreen = const CarRentalScreen();
//               break;
//             case 'Taxi':
//               destinationScreen = const TaxiSearchScreen();
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
//             Icon(
//               icon,
//               color: isSelected ? Colors.white : Colors.grey[600],
//               size: 18,
//             ),
//             if (isSelected) ...[
//               const SizedBox(width: 5),
//               Flexible(
//                 child: Text(
//                   label,
//                   style: const TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.w500,
//                     fontSize: 12,
//                   ),
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

//   Widget _buildCalendarView() {
//     // ... (الكود كما هو)
//     const Color kPrimaryColor = Color(0xFF4E7D96);
//     return Container(
//       margin: const EdgeInsets.only(top: 8),
//       decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(8),
//           boxShadow: [
//             BoxShadow(
//                 color: Colors.grey.withOpacity(0.2),
//                 spreadRadius: 1,
//                 blurRadius: 3,
//                 offset: const Offset(0, 2)),
//           ]),
//       child: TableCalendar(
//         firstDay: DateTime.now().subtract(const Duration(days: 1)),
//         lastDay: DateTime.utc(2030, 12, 31),
//         focusedDay: _focusedDay,
//         rangeStartDay: _rangeStart,
//         rangeEndDay: _rangeEnd,
//         rangeSelectionMode: RangeSelectionMode.toggledOn,
//         onRangeSelected: _onRangeSelected,
//         enabledDayPredicate: (day) {
//           return !day
//               .isBefore(DateTime.now().subtract(const Duration(days: 1)));
//         },
//         calendarFormat: CalendarFormat.month,
//         headerStyle: const HeaderStyle(
//           titleTextStyle:
//               TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
//           formatButtonVisible: false,
//           titleCentered: true,
//           leftChevronIcon: Icon(Icons.chevron_left, color: Colors.black),
//           rightChevronIcon: Icon(Icons.chevron_right, color: Colors.black),
//         ),
//         calendarStyle: CalendarStyle(
//           rangeStartDecoration:
//               const BoxDecoration(color: kPrimaryColor, shape: BoxShape.circle),
//           rangeStartTextStyle:
//               const TextStyle(color: Colors.white, fontSize: 15),
//           rangeEndDecoration:
//               const BoxDecoration(color: kPrimaryColor, shape: BoxShape.circle),
//           rangeEndTextStyle: const TextStyle(color: Colors.white, fontSize: 15),
//           withinRangeDecoration: BoxDecoration(
//               color: kPrimaryColor.withOpacity(0.1), shape: BoxShape.rectangle),
//           withinRangeTextStyle:
//               TextStyle(color: Colors.grey[800], fontSize: 15),
//           rangeHighlightScale: 1.0,
//           rangeHighlightColor: kPrimaryColor.withOpacity(0.15),
//           selectedDecoration: BoxDecoration(
//               color: kPrimaryColor.withOpacity(0.5), shape: BoxShape.circle),
//           selectedTextStyle: const TextStyle(color: Colors.white, fontSize: 15),
//           todayDecoration: BoxDecoration(
//               border: Border.all(color: kPrimaryColor, width: 1.5),
//               shape: BoxShape.circle),
//           todayTextStyle: const TextStyle(
//               color: kPrimaryColor, fontWeight: FontWeight.bold, fontSize: 15),
//           defaultTextStyle: const TextStyle(color: Colors.black, fontSize: 15),
//           weekendTextStyle:
//               const TextStyle(color: Colors.black54, fontSize: 15),
//           disabledTextStyle: TextStyle(color: Colors.grey[400]!, fontSize: 15),
//           outsideDaysVisible: false,
//         ),
//         startingDayOfWeek: StartingDayOfWeek.sunday,
//       ),
//     );
//   }

//   Widget _buildGuestCountersView() {
//     // ... (الكود كما هو)
//     return Container(
//       margin: const EdgeInsets.only(top: 8),
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//       decoration: BoxDecoration(
//         color: const Color(0xFFEEEEEE),
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           _buildGuestCounter('Adults', adultCount,
//               (val) => setState(() => adultCount = val), 1),
//           const SizedBox(height: 10),
//           _buildGuestCounter('Children', childCount,
//               (val) => setState(() => childCount = val), 0),
//         ],
//       ),
//     );
//   }

//   Widget _buildGuestCounter(
//       String label, int count, ValueChanged<int> onChanged, int minValue) {
//     // ... (الكود كما هو)
//     bool canDecrease = count > minValue;
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(label, style: const TextStyle(fontSize: 16, color: Colors.black)),
//         Container(
//           padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
//           decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(6),
//               border: Border.all(color: Colors.grey[300]!)),
//           child: Row(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               InkWell(
//                 borderRadius: BorderRadius.circular(4),
//                 onTap: canDecrease ? () => onChanged(count - 1) : null,
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
//                 onTap: () => onChanged(count + 1),
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
// // }
// import 'package:flutter/material.dart';
// import 'package:table_calendar/table_calendar.dart';
// import 'package:intl/intl.dart';
// import 'package:apptravella/models/hotel_model.dart';
// import 'package:apptravella/services/hotel_api_service.dart';

// import 'hotel_results_screen.dart';
// import 'flights_screen.dart';
// import 'car_rental_screen.dart';
// import 'taxi_search_screen.dart';

// class HotelsSearchScreen extends StatefulWidget {
//   const HotelsSearchScreen({super.key});

//   @override
//   State<HotelsSearchScreen> createState() => _HotelsSearchScreenState();
// }

// class _HotelsSearchScreenState extends State<HotelsSearchScreen> {
//   // --- متغيرات الحالة (State Variables) ---
//   final HotelApiService _hotelApiService = HotelApiService();
//   bool _isLoading = false; // --- New loading state
//   String selectedTopTab = 'Hotels';
//   final TextEditingController _destinationController = TextEditingController();
//   DateTime? _rangeStart;
//   DateTime? _rangeEnd;
//   DateTime _focusedDay = DateTime.now();
//   int adultCount = 1;
//   int childCount = 0;
//   bool showCalendar = false;
//   bool showGuests = false;

//   // --- Getters للنصوص الديناميكية (لا تغيير) ---
//   String get dateRangeText {
//     if (_rangeStart == null) return 'Enter Check-in & Check-out Dates';
//     final DateFormat formatter = DateFormat('d/M/yy');
//     if (_rangeEnd == null) return 'Check-in: ${formatter.format(_rangeStart!)}';
//     return '${formatter.format(_rangeStart!)} - ${formatter.format(_rangeEnd!)}';
//   }

//   String get guestsText {
//     if (showGuests) return 'Select Number of Guests';
//     String text = '$adultCount Adult';
//     if (childCount > 0) text += ', $childCount Children';
//     return text;
//   }

//   @override
//   void dispose() {
//     _destinationController.dispose();
//     super.dispose();
//   }

//   // --- دوال التفاعل (لا تغيير) ---
//   void _toggleCalendar() {
//     setState(() {
//       showCalendar = !showCalendar;
//       showGuests = false;
//     });
//   }

//   void _toggleGuests() {
//     setState(() {
//       showGuests = !showGuests;
//       showCalendar = false;
//     });
//   }

//   void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
//     setState(() {
//       _focusedDay = focusedDay;
//       _rangeStart = start;
//       _rangeEnd = end;
//       if (start != null && end != null) {
//         showCalendar = false;
//       }
//     });
//   }

//   // --- دالة الانتقال والتحقق (API Integration) ---
//   void _searchAndNavigateToResults() async {
//     final destination = _destinationController.text.trim();
//     if (destination.isEmpty) {
//       ScaffoldMessenger.of(context)
//           .showSnackBar(const SnackBar(content: Text('Please enter a city')));
//       return;
//     }
//     if (_rangeStart == null || _rangeEnd == null) {
//       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//           content: Text('Please select both Check-in and Check-out dates')));
//       return;
//     }

//     setState(() => _isLoading = true);

//     try {
//       final List<Hotel> hotelResults = await _hotelApiService.searchHotels(
//         city: destination,
//         checkInDate: _rangeStart!,
//         checkOutDate: _rangeEnd!,
//         adults: adultCount,
//         children: childCount,
//       );

//       // Calculate nights
//       final int nights = _rangeEnd!.difference(_rangeStart!).inDays;

//       if (mounted) {
//         // Check if the widget is still in the tree
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => HotelResultsScreen(
//               initialHotels: hotelResults, // Pass fetched hotels
//               destination: destination,
//               checkInDate: _rangeStart!,
//               checkOutDate: _rangeEnd!,
//               nights: nights,
//               adults: adultCount,
//               children: childCount,
//             ),
//           ),
//         );
//       }
//     } catch (e) {
//       if (mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Search failed: ${e.toString()}')),
//         );
//       }
//     } finally {
//       if (mounted) {
//         setState(() => _isLoading = false);
//       }
//     }
//   }

//   // --- دالة بناء الواجهة الرئيسية (Build Method) ---
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // ... (بقية الواجهة كما هي)
//                 Row(
//                   children: [
//                     IconButton(
//                       icon: const Icon(Icons.arrow_back, color: Colors.black),
//                       onPressed: () => Navigator.pop(context),
//                       constraints: const BoxConstraints(),
//                       padding: EdgeInsets.zero,
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 15),

//                 // --- تابات اختيار الخدمة
//                 Container(
//                   padding: const EdgeInsets.all(4),
//                   height: 45,
//                   decoration: BoxDecoration(
//                     color: const Color(0xFFF0F0F0),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Row(
//                     children: [
//                       Expanded(
//                           child: _buildTopTab(
//                               Icons.flight_takeoff, 'Flights', 'Flights')),
//                       Expanded(
//                           child: _buildTopTab(Icons.hotel, 'Hotels', 'Hotels')),
//                       Expanded(
//                           child: _buildTopTab(Icons.directions_car,
//                               'Car Rental', 'Car Rental')),
//                       Expanded(
//                           child:
//                               _buildTopTab(Icons.local_taxi, 'Taxi', 'Taxi')),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 24),

//                 // --- حقل إدخال الوجهة
//                 TextField(
//                   controller: _destinationController,
//                   decoration: _inputDecoration(
//                       hintText: 'Enter City or Hotel Name', icon: Icons.search),
//                   style: const TextStyle(color: Colors.black, fontSize: 16),
//                   textInputAction: TextInputAction.search,
//                   onSubmitted: (_) => _searchAndNavigateToResults(),
//                 ),
//                 const SizedBox(height: 12),

//                 // --- حقل اختيار التاريخ
//                 GestureDetector(
//                   onTap: _toggleCalendar,
//                   child: Container(
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 16, vertical: 14),
//                     decoration: _inputBoxDecoration(),
//                     child: Row(
//                       children: [
//                         Icon(Icons.calendar_today,
//                             color: Colors.grey[600], size: 20),
//                         const SizedBox(width: 12),
//                         Expanded(
//                           child: Text(
//                             dateRangeText,
//                             style: TextStyle(
//                               color: _rangeStart != null
//                                   ? Colors.black
//                                   : Colors.grey[700],
//                               fontSize: 16,
//                             ),
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                         ),
//                         Icon(
//                           showCalendar
//                               ? Icons.keyboard_arrow_up
//                               : Icons.keyboard_arrow_down,
//                           color: Colors.grey[600],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 if (showCalendar) _buildCalendarView(),
//                 const SizedBox(height: 12),

//                 // --- حقل اختيار النزلاء ---
//                 GestureDetector(
//                   onTap: _toggleGuests,
//                   child: Container(
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 16, vertical: 14),
//                     decoration: _inputBoxDecoration(),
//                     child: Row(
//                       children: [
//                         Icon(Icons.person_outline,
//                             color: Colors.grey[600], size: 22),
//                         const SizedBox(width: 12),
//                         Expanded(
//                           child: Text(
//                             guestsText,
//                             style: TextStyle(
//                               color:
//                                   showGuests ? Colors.grey[700] : Colors.black,
//                               fontSize: 16,
//                             ),
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                         ),
//                         Icon(
//                           showGuests
//                               ? Icons.keyboard_arrow_up
//                               : Icons.keyboard_arrow_down,
//                           color: Colors.grey[600],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 if (showGuests) _buildGuestCountersView(),
//                 const SizedBox(height: 40),

//                 // --- زر البحث (مُعدل) ---
//                 SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     onPressed: _isLoading
//                         ? null
//                         : _searchAndNavigateToResults, // Disable on load
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: const Color(0xFF4E7D96),
//                       padding: const EdgeInsets.symmetric(vertical: 16),
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12)),
//                       elevation: 2,
//                     ),
//                     child: _isLoading
//                         ? const CircularProgressIndicator(color: Colors.white)
//                         : const Text(
//                             'Search Hotels',
//                             style: TextStyle(
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.white,
//                             ),
//                           ),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   // --- الدوال المساعدة للبناء (لا تغيير) ---
//   InputDecoration _inputDecoration(
//       {required String hintText, required IconData icon}) {
//     return InputDecoration(
//       hintText: hintText,
//       hintStyle: TextStyle(color: Colors.grey[600], fontSize: 16),
//       prefixIcon: Icon(icon, color: Colors.grey[600], size: 20),
//       filled: true,
//       fillColor: const Color(0xFFEEEEEE),
//       border: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(8),
//         borderSide: BorderSide.none,
//       ),
//       contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
//     );
//   }

//   BoxDecoration _inputBoxDecoration() {
//     return BoxDecoration(
//       color: const Color(0xFFEEEEEE),
//       borderRadius: BorderRadius.circular(8),
//     );
//   }

//   Widget _buildTopTab(IconData icon, String label, String tabKey) {
//     final isSelected = selectedTopTab == tabKey;
//     const Color kPrimaryColor = Color(0xFF4E7D96);

//     return GestureDetector(
//       onTap: () {
//         if (!isSelected) {
//           Widget? destinationScreen;
//           switch (tabKey) {
//             case 'Flights':
//               destinationScreen = const FlightsScreen();
//               break;
//             case 'Hotels':
//               setState(() {
//                 selectedTopTab = tabKey;
//               });
//               break;
//             case 'Car Rental':
//               destinationScreen = const CarRentalScreen();
//               break;
//             case 'Taxi':
//               destinationScreen = const TaxiSearchScreen();
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
//             Icon(
//               icon,
//               color: isSelected ? Colors.white : Colors.grey[600],
//               size: 18,
//             ),
//             if (isSelected) ...[
//               const SizedBox(width: 5),
//               Flexible(
//                 child: Text(
//                   label,
//                   style: const TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.w500,
//                     fontSize: 12,
//                   ),
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

//   Widget _buildCalendarView() {
//     const Color kPrimaryColor = Color(0xFF4E7D96);
//     return Container(
//       margin: const EdgeInsets.only(top: 8),
//       decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(8),
//           boxShadow: [
//             BoxShadow(
//                 color: Colors.grey.withOpacity(0.2),
//                 spreadRadius: 1,
//                 blurRadius: 3,
//                 offset: const Offset(0, 2)),
//           ]),
//       child: TableCalendar(
//         firstDay: DateTime.now().subtract(const Duration(days: 1)),
//         lastDay: DateTime.utc(2030, 12, 31),
//         focusedDay: _focusedDay,
//         rangeStartDay: _rangeStart,
//         rangeEndDay: _rangeEnd,
//         rangeSelectionMode: RangeSelectionMode.toggledOn,
//         onRangeSelected: _onRangeSelected,
//         enabledDayPredicate: (day) {
//           return !day
//               .isBefore(DateTime.now().subtract(const Duration(days: 1)));
//         },
//         calendarFormat: CalendarFormat.month,
//         headerStyle: const HeaderStyle(
//           titleTextStyle:
//               TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
//           formatButtonVisible: false,
//           titleCentered: true,
//           leftChevronIcon: Icon(Icons.chevron_left, color: Colors.black),
//           rightChevronIcon: Icon(Icons.chevron_right, color: Colors.black),
//         ),
//         calendarStyle: CalendarStyle(
//           rangeStartDecoration:
//               const BoxDecoration(color: kPrimaryColor, shape: BoxShape.circle),
//           rangeStartTextStyle:
//               const TextStyle(color: Colors.white, fontSize: 15),
//           rangeEndDecoration:
//               const BoxDecoration(color: kPrimaryColor, shape: BoxShape.circle),
//           rangeEndTextStyle: const TextStyle(color: Colors.white, fontSize: 15),
//           withinRangeDecoration: BoxDecoration(
//               color: kPrimaryColor.withOpacity(0.1), shape: BoxShape.rectangle),
//           withinRangeTextStyle:
//               TextStyle(color: Colors.grey[800], fontSize: 15),
//           rangeHighlightScale: 1.0,
//           rangeHighlightColor: kPrimaryColor.withOpacity(0.15),
//           selectedDecoration: BoxDecoration(
//               color: kPrimaryColor.withOpacity(0.5), shape: BoxShape.circle),
//           selectedTextStyle: const TextStyle(color: Colors.white, fontSize: 15),
//           todayDecoration: BoxDecoration(
//               border: Border.all(color: kPrimaryColor, width: 1.5),
//               shape: BoxShape.circle),
//           todayTextStyle: const TextStyle(
//               color: kPrimaryColor, fontWeight: FontWeight.bold, fontSize: 15),
//           defaultTextStyle: const TextStyle(color: Colors.black, fontSize: 15),
//           weekendTextStyle:
//               const TextStyle(color: Colors.black54, fontSize: 15),
//           disabledTextStyle: TextStyle(color: Colors.grey[400]!, fontSize: 15),
//           outsideDaysVisible: false,
//         ),
//         startingDayOfWeek: StartingDayOfWeek.sunday,
//       ),
//     );
//   }

//   Widget _buildGuestCountersView() {
//     return Container(
//       margin: const EdgeInsets.only(top: 8),
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//       decoration: BoxDecoration(
//         color: const Color(0xFFEEEEEE),
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           _buildGuestCounter('Adults', adultCount,
//               (val) => setState(() => adultCount = val), 1),
//           const SizedBox(height: 10),
//           _buildGuestCounter('Children', childCount,
//               (val) => setState(() => childCount = val), 0),
//         ],
//       ),
//     );
//   }

//   Widget _buildGuestCounter(
//       String label, int count, ValueChanged<int> onChanged, int minValue) {
//     bool canDecrease = count > minValue;
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(label, style: const TextStyle(fontSize: 16, color: Colors.black)),
//         Container(
//           padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
//           decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(6),
//               border: Border.all(color: Colors.grey[300]!)),
//           child: Row(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               InkWell(
//                 borderRadius: BorderRadius.circular(4),
//                 onTap: canDecrease ? () => onChanged(count - 1) : null,
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
//                 onTap: () => onChanged(count + 1),
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
// }
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'package:apptravella/models/hotel_model.dart';
import 'package:apptravella/services/hotel_api_service.dart';

import 'hotel_results_screen.dart';
import 'flights_screen.dart';
import 'car_rental_screen.dart';
import 'taxi_search_screen.dart';

class HotelsSearchScreen extends StatefulWidget {
  const HotelsSearchScreen({super.key});

  @override
  State<HotelsSearchScreen> createState() => _HotelsSearchScreenState();
}

class _HotelsSearchScreenState extends State<HotelsSearchScreen> {
  // --- متغيرات الحالة (State Variables) ---
  final HotelApiService _hotelApiService = HotelApiService();
  bool _isLoading = false; // --- New loading state
  String selectedTopTab = 'Hotels';
  final TextEditingController _destinationController = TextEditingController();
  DateTime? _rangeStart;
  DateTime? _rangeEnd;
  DateTime _focusedDay = DateTime.now();
  int adultCount = 1;
  int childCount = 0;
  bool showCalendar = false;
  bool showGuests = false;

  // --- Getters للنصوص الديناميكية (لا تغيير) ---
  String get dateRangeText {
    if (_rangeStart == null) return 'Enter Check-in & Check-out Dates';
    final DateFormat formatter = DateFormat('d/M/yy');
    if (_rangeEnd == null) return 'Check-in: ${formatter.format(_rangeStart!)}';
    return '${formatter.format(_rangeStart!)} - ${formatter.format(_rangeEnd!)}';
  }

  String get guestsText {
    if (showGuests) return 'Select Number of Guests';
    String text = '$adultCount Adult';
    if (childCount > 0) text += ', $childCount Children';
    return text;
  }

  @override
  void dispose() {
    _destinationController.dispose();
    super.dispose();
  }

  // --- دوال التفاعل (لا تغيير) ---
  void _toggleCalendar() {
    setState(() {
      showCalendar = !showCalendar;
      showGuests = false;
    });
  }

  void _toggleGuests() {
    setState(() {
      showGuests = !showGuests;
      showCalendar = false;
    });
  }

  void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    setState(() {
      _focusedDay = focusedDay;
      _rangeStart = start;
      _rangeEnd = end;
      if (start != null && end != null) {
        showCalendar = false;
      }
    });
  }

  // --- دالة الانتقال والتحقق (API Integration) ---
  void _searchAndNavigateToResults() async {
    final destination = _destinationController.text.trim();
    if (destination.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Please enter a city')));
      return;
    }
    if (_rangeStart == null || _rangeEnd == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Please select both Check-in and Check-out dates')));
      return;
    }

    setState(() => _isLoading = true);

    try {
      final List<Hotel> hotelResults = await _hotelApiService.searchHotels(
        city: destination,
        checkInDate: _rangeStart!,
        checkOutDate: _rangeEnd!,
        adults: adultCount,
        children: childCount,
      );

      // Calculate nights
      final int nights = _rangeEnd!.difference(_rangeStart!).inDays;

      if (mounted) {
        // Check if the widget is still in the tree
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HotelResultsScreen(
              initialHotels: hotelResults, // Pass fetched hotels
              destination: destination,
              checkInDate: _rangeStart!,
              checkOutDate: _rangeEnd!,
              nights: nights,
              adults: adultCount,
              children: childCount,
            ),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Search failed: ${e.toString()}')),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  // --- دالة بناء الواجهة الرئيسية (Build Method) ---
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () => Navigator.pop(context),
                      constraints: const BoxConstraints(),
                      padding: EdgeInsets.zero,
                    ),
                  ],
                ),
                const SizedBox(height: 15),

                // --- تابات اختيار الخدمة
                Container(
                  padding: const EdgeInsets.all(4),
                  height: 45,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF0F0F0),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                          child: _buildTopTab(
                              Icons.flight_takeoff, 'Flights', 'Flights')),
                      Expanded(
                          child: _buildTopTab(Icons.hotel, 'Hotels', 'Hotels')),
                      Expanded(
                          child: _buildTopTab(Icons.directions_car,
                              'Car Rental', 'Car Rental')),
                      Expanded(
                          child:
                              _buildTopTab(Icons.local_taxi, 'Taxi', 'Taxi')),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // --- حقل إدخال الوجهة
                TextField(
                  controller: _destinationController,
                  decoration: _inputDecoration(
                      hintText: 'Enter City or Hotel Name', icon: Icons.search),
                  style: const TextStyle(color: Colors.black, fontSize: 16),
                  textInputAction: TextInputAction.search,
                  onSubmitted: (_) => _searchAndNavigateToResults(),
                ),
                const SizedBox(height: 12),

                // --- حقل اختيار التاريخ
                GestureDetector(
                  onTap: _toggleCalendar,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 14),
                    decoration: _inputBoxDecoration(),
                    child: Row(
                      children: [
                        Icon(Icons.calendar_today,
                            color: Colors.grey[600], size: 20),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            dateRangeText,
                            style: TextStyle(
                              color: _rangeStart != null
                                  ? Colors.black
                                  : Colors.grey[700],
                              fontSize: 16,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Icon(
                          showCalendar
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down,
                          color: Colors.grey[600],
                        ),
                      ],
                    ),
                  ),
                ),
                if (showCalendar) _buildCalendarView(),
                const SizedBox(height: 12),

                // --- حقل اختيار النزلاء ---
                GestureDetector(
                  onTap: _toggleGuests,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 14),
                    decoration: _inputBoxDecoration(),
                    child: Row(
                      children: [
                        Icon(Icons.person_outline,
                            color: Colors.grey[600], size: 22),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            guestsText,
                            style: TextStyle(
                              color:
                                  showGuests ? Colors.grey[700] : Colors.black,
                              fontSize: 16,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Icon(
                          showGuests
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down,
                          color: Colors.grey[600],
                        ),
                      ],
                    ),
                  ),
                ),
                if (showGuests) _buildGuestCountersView(),
                const SizedBox(height: 40),

                // --- زر البحث (مُعدل) ---
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _isLoading
                        ? null
                        : _searchAndNavigateToResults, // Disable on load
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4E7D96),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      elevation: 2,
                    ),
                    child: _isLoading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const Text(
                            'Search Hotels',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // --- الدوال المساعدة للبناء (لا تغيير) ---
  InputDecoration _inputDecoration(
      {required String hintText, required IconData icon}) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(color: Colors.grey[600], fontSize: 16),
      prefixIcon: Icon(icon, color: Colors.grey[600], size: 20),
      filled: true,
      fillColor: const Color(0xFFEEEEEE),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    );
  }

  BoxDecoration _inputBoxDecoration() {
    return BoxDecoration(
      color: const Color(0xFFEEEEEE),
      borderRadius: BorderRadius.circular(8),
    );
  }

  Widget _buildTopTab(IconData icon, String label, String tabKey) {
    final isSelected = selectedTopTab == tabKey;
    const Color kPrimaryColor = Color(0xFF4E7D96);

    return GestureDetector(
      onTap: () {
        if (!isSelected) {
          Widget? destinationScreen;
          switch (tabKey) {
            case 'Flights':
              destinationScreen = const FlightsScreen();
              break;
            case 'Hotels':
              setState(() {
                selectedTopTab = tabKey;
              });
              break;
            case 'Car Rental':
              destinationScreen = const CarRentalScreen();
              break;
            case 'Taxi':
              destinationScreen = const TaxiSearchScreen();
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
            Icon(
              icon,
              color: isSelected ? Colors.white : Colors.grey[600],
              size: 18,
            ),
            if (isSelected) ...[
              const SizedBox(width: 5),
              Flexible(
                child: Text(
                  label,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
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

  Widget _buildCalendarView() {
    const Color kPrimaryColor = Color(0xFF4E7D96);
    return Container(
      margin: const EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 3,
                offset: const Offset(0, 2)),
          ]),
      child: TableCalendar(
        firstDay: DateTime(2000, 1, 1), // يسمح بتواريخ قديمة
        lastDay: DateTime.utc(2030, 12, 31),
        focusedDay: _focusedDay,
        rangeStartDay: _rangeStart,
        rangeEndDay: _rangeEnd,
        rangeSelectionMode: RangeSelectionMode.toggledOn,
        onRangeSelected: _onRangeSelected,
        enabledDayPredicate: (day) => true, // يسمح بجميع الأيام
        calendarFormat: CalendarFormat.month,
        headerStyle: const HeaderStyle(
          titleTextStyle:
              TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          formatButtonVisible: false,
          titleCentered: true,
          leftChevronIcon: Icon(Icons.chevron_left, color: Colors.black),
          rightChevronIcon: Icon(Icons.chevron_right, color: Colors.black),
        ),
        calendarStyle: CalendarStyle(
          rangeStartDecoration:
              const BoxDecoration(color: kPrimaryColor, shape: BoxShape.circle),
          rangeStartTextStyle:
              const TextStyle(color: Colors.white, fontSize: 15),
          rangeEndDecoration:
              const BoxDecoration(color: kPrimaryColor, shape: BoxShape.circle),
          rangeEndTextStyle: const TextStyle(color: Colors.white, fontSize: 15),
          withinRangeDecoration: BoxDecoration(
              color: kPrimaryColor.withOpacity(0.1), shape: BoxShape.rectangle),
          withinRangeTextStyle:
              TextStyle(color: Colors.grey[800], fontSize: 15),
          rangeHighlightScale: 1.0,
          rangeHighlightColor: kPrimaryColor.withOpacity(0.15),
          selectedDecoration: BoxDecoration(
              color: kPrimaryColor.withOpacity(0.5), shape: BoxShape.circle),
          selectedTextStyle: const TextStyle(color: Colors.white, fontSize: 15),
          todayDecoration: BoxDecoration(
              border: Border.all(color: kPrimaryColor, width: 1.5),
              shape: BoxShape.circle),
          todayTextStyle: const TextStyle(
              color: kPrimaryColor, fontWeight: FontWeight.bold, fontSize: 15),
          defaultTextStyle: const TextStyle(color: Colors.black, fontSize: 15),
          weekendTextStyle:
              const TextStyle(color: Colors.black54, fontSize: 15),
          disabledTextStyle: TextStyle(color: Colors.grey[400]!, fontSize: 15),
          outsideDaysVisible: false,
        ),
        startingDayOfWeek: StartingDayOfWeek.sunday,
      ),
    );
  }

  Widget _buildGuestCountersView() {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFEEEEEE),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildGuestCounter('Adults', adultCount,
              (val) => setState(() => adultCount = val), 1),
          const SizedBox(height: 10),
          _buildGuestCounter('Children', childCount,
              (val) => setState(() => childCount = val), 0),
        ],
      ),
    );
  }

  Widget _buildGuestCounter(
      String label, int count, ValueChanged<int> onChanged, int minValue) {
    bool canDecrease = count > minValue;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(fontSize: 16, color: Colors.black)),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: Colors.grey[300]!)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                borderRadius: BorderRadius.circular(4),
                onTap: canDecrease ? () => onChanged(count - 1) : null,
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
                onTap: () => onChanged(count + 1),
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
}
