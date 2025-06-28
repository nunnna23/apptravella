// import 'package:flutter/material.dart';
// import 'package:table_calendar/table_calendar.dart';
// import 'package:country_picker/country_picker.dart'; // تأكد من استيراد الحزمة
// import 'package:intl/intl.dart'; // لاستخدام DateFormat لتنسيق التاريخ

// // --- استيراد الشاشات الأخرى ---
// import 'flights_screen.dart'; // شاشة الرحلات
// import 'hotels_search_screen.dart'; // شاشة الفنادق
// import 'taxi_search_screen.dart'; // <-- إضافة استيراد شاشة التاكسي
// import 'car_search_results_screen.dart'; // شاشة نتائج البحث عن السيارات

// // --- تعريف شاشة تأجير السيارات ---
// class CarRentalScreen extends StatefulWidget {
//   const CarRentalScreen({super.key});

//   @override
//   State<CarRentalScreen> createState() => _CarRentalScreenState();
// }

// // --- حالة شاشة تأجير السيارات ---
// class _CarRentalScreenState extends State<CarRentalScreen> {
//   // --- متغيرات الحالة ---
//   String selectedCountry = ''; // اسم الدولة المختارة للموقع
//   DateTime? selectedDate; // التاريخ المختار
//   bool showCalendar = false; // للتحكم في عرض التقويم
//   String? selectedRentType; // نوع الإيجار (مع سائق أو ذاتي)
//   bool showRentTypeOptions = false; // للتحكم في عرض خيارات نوع الإيجار
//   int driverAge = 30; // عمر السائق الافتراضي (يُستخدم إذا كان النوع "مع سائق")

//   // --- دوال تبديل العرض (لإغلاق العناصر الأخرى عند فتح واحد) ---
//   void _toggleCalendar() {
//     setState(() {
//       showCalendar = !showCalendar;
//       showRentTypeOptions = false; // إغلاق قائمة أنواع الإيجار
//     });
//   }

//   void _toggleRentTypeOptions() {
//     setState(() {
//       showRentTypeOptions = !showRentTypeOptions;
//       showCalendar = false; // إغلاق التقويم
//     });
//   }
//   // --- نهاية دوال تبديل العرض ---

//   // --- دالة التعامل مع البحث والانتقال ---
//   void _handleSearch() {
//     // التحقق من إدخال الموقع
//     if (selectedCountry.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Please select a pickup location')),
//       );
//       return;
//     }

//     // التحقق من إدخال التاريخ
//     if (selectedDate == null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Please select a date')),
//       );
//       return;
//     }

//     // التحقق من اختيار نوع التأجير
//     if (selectedRentType == null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Please select a rent type')),
//       );
//       return;
//     }

//     // الانتقال إلى صفحة النتائج
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => CarSearchResultsScreen(
//           location: selectedCountry,
//           date: selectedDate!,
//           rentType: selectedRentType!,
//           // يمكنك تمرير عمر السائق إذا احتجت إليه في شاشة النتائج
//           // driverAge: selectedRentType == 'With driver' ? driverAge : null,
//         ),
//       ),
//     );
//   }
//   // --- نهاية دالة التعامل مع البحث ---

//   // --- بناء واجهة المستخدم ---
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white, // لون خلفية الشاشة
//       appBar: AppBar(
//         // شريط التطبيق العلوي
//         leading: IconButton(
//           // زر الرجوع
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () => Navigator.pop(context), // العودة للشاشة السابقة
//         ),
//         backgroundColor: Colors.white, // خلفية شريط التطبيق
//         elevation: 0, // إزالة الظل
//       ),
//       body: SingleChildScrollView(
//         // للسماح بالتمرير إذا كانت المحتويات طويلة
//         child: Padding(
//           padding: const EdgeInsets.all(16.0), // تباعد حول المحتوى
//           child: Column(
//             // ترتيب العناصر بشكل عمودي
//             crossAxisAlignment:
//                 CrossAxisAlignment.start, // محاذاة العناصر لليسار
//             children: [
//               // --- أزرار اختيار الخدمة العلوية ---
//               Container(
//                 height: 40, // تحديد ارتفاع ثابت للتبويبات
//                 padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
//                 decoration: BoxDecoration(
//                   color: const Color(0xFFEEEEEE), // لون الخلفية المتناسق
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: Row(
//                   // ترتيب الأزرار أفقياً
//                   children: [
//                     // تمرير `tabKey` بدلاً من الاعتماد الكلي على `label` قد يكون أفضل
//                     Expanded(
//                         child: _buildTab(
//                             Icons.flight, 'Flights', false, 'Flights')),
//                     Expanded(
//                         child:
//                             _buildTab(Icons.hotel, 'Hotels', false, 'Hotels')),
//                     Expanded(
//                         child: _buildTab(Icons.directions_car, 'Car Rental',
//                             true, 'Car Rental')), // التبويب الحالي
//                     Expanded(
//                         child: _buildTab(Icons.local_taxi, 'Taxi', false,
//                             'Taxi')), // استخدام Taxi بدلاً من taxi
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 20), // مسافة فاصلة

//               // --- حقل اختيار الموقع ---
//               GestureDetector(
//                 onTap: () {
//                   // إغلاق العناصر الأخرى عند فتح منتقي الدولة
//                   setState(() {
//                     showCalendar = false;
//                     showRentTypeOptions = false;
//                   });
//                   showCountryPicker(
//                     // عرض منتقي الدول
//                     context: context,
//                     showPhoneCode: false, // عدم عرض رمز الهاتف
//                     onSelect: (Country country) {
//                       // عند اختيار دولة
//                       setState(() {
//                         selectedCountry =
//                             country.name; // تحديث اسم الدولة المختارة
//                       });
//                     },
//                   );
//                 },
//                 child: Container(
//                   padding: const EdgeInsets.symmetric(
//                       horizontal: 16, vertical: 14), // تباعد داخلي
//                   decoration: _inputBoxDecoration(), // استخدام التنسيق الموحد
//                   child: Row(
//                     // ترتيب الأيقونة والنص
//                     children: [
//                       Icon(Icons.location_on_outlined,
//                           color: Colors.grey[600], size: 20),
//                       const SizedBox(width: 12),
//                       Expanded(
//                         child: Text(
//                           selectedCountry.isEmpty
//                               ? 'Pickup Location'
//                               : selectedCountry, // عرض الدولة أو النص المبدئي
//                           style: TextStyle(
//                             color: selectedCountry.isEmpty
//                                 ? Colors.grey[600]
//                                 : Colors.black,
//                             fontSize: 16,
//                           ),
//                           overflow: TextOverflow.ellipsis, // منع تجاوز النص
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 12), // مسافة فاصلة

//               // --- حقل اختيار التاريخ (مطابق للمثال) ---
//               GestureDetector(
//                 onTap: _toggleCalendar, // فتح/إغلاق التقويم عند الضغط
//                 child: Container(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
//                   decoration: _inputBoxDecoration(), // استخدام التنسيق الموحد
//                   child: Row(
//                     children: [
//                       const Icon(Icons.calendar_today,
//                           color: Colors.grey, size: 20),
//                       const SizedBox(width: 12),
//                       Expanded(
//                         child: Text(
//                           // عرض التاريخ المنسق أو النص المبدئي
//                           selectedDate != null
//                               ? DateFormat('d/M/yyyy').format(selectedDate!)
//                               : 'Select Date', // نص مبدئي أوضح
//                           style: TextStyle(
//                             color: selectedDate != null
//                                 ? Colors.black
//                                 : Colors.grey[600],
//                             fontSize: 16,
//                           ),
//                         ),
//                       ),
//                       Icon(
//                         // إضافة سهم للتقويم أيضاً للمستخدم
//                         showCalendar
//                             ? Icons.keyboard_arrow_up
//                             : Icons.keyboard_arrow_down,
//                         color: Colors.grey[600],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               // --- عرض التقويم (بشكل شرطي) ---
//               if (showCalendar) _buildCalendarView(), // عرض ودجت التقويم
//               const SizedBox(height: 12), // مسافة فاصلة

//               // --- حقل اختيار نوع الإيجار ---
//               GestureDetector(
//                 onTap: _toggleRentTypeOptions, // فتح/إغلاق خيارات النوع
//                 child: Container(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
//                   decoration: _inputBoxDecoration(), // استخدام التنسيق الموحد
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment
//                         .spaceBetween, // لتوزيع المسافة بين النص والسهم
//                     children: [
//                       Row(
//                         // لتجميع الأيقونة والنص
//                         children: [
//                           Icon(Icons.drive_eta_outlined,
//                               color: Colors.grey[600], size: 20),
//                           const SizedBox(width: 12),
//                           Text(
//                             selectedRentType ??
//                                 'Select Rent Type', // عرض النوع المختار أو النص المبدئي
//                             style: TextStyle(
//                               color: selectedRentType != null
//                                   ? Colors.black
//                                   : Colors.grey[600],
//                               fontSize: 16,
//                             ),
//                           ),
//                         ],
//                       ),
//                       Icon(
//                         // أيقونة السهم للإشارة إلى القابلية للفتح
//                         showRentTypeOptions
//                             ? Icons.keyboard_arrow_up
//                             : Icons.keyboard_arrow_down,
//                         color: Colors.grey[600],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               // --- خيارات نوع الإيجار (تظهر بشكل شرطي) ---
//               if (showRentTypeOptions)
//                 Container(
//                   margin: const EdgeInsets.only(top: 8),
//                   padding: const EdgeInsets.symmetric(vertical: 8),
//                   decoration: BoxDecoration(
//                     color: const Color(0xFFEEEEEE), // نفس خلفية الحقول
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   child: Column(
//                     // عرض الخيارات كـ ChoiceChip
//                     children: [
//                       _buildRentTypeChip('Self-driver'),
//                       const SizedBox(height: 4),
//                       _buildRentTypeChip('With driver'),
//                     ],
//                   ),
//                 ),
//               const SizedBox(height: 12), // مسافة فاصلة

//               // --- حقل اختيار عمر السائق (يظهر فقط عند اختيار "مع سائق") ---
//               if (selectedRentType == 'With driver')
//                 Container(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//                   decoration: _inputBoxDecoration(), // استخدام التنسيق الموحد
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         // الأيقونة والنص التوضيحي
//                         children: [
//                           Icon(Icons.person_pin_outlined,
//                               color: Colors.grey[600], size: 20),
//                           const SizedBox(width: 12),
//                           Text(
//                             'Driver Age (30-65)',
//                             style: TextStyle(
//                                 color: Colors.grey[600], fontSize: 16),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 12),
//                       Row(
//                         // عداد العمر
//                         mainAxisAlignment:
//                             MainAxisAlignment.spaceBetween, // لتوزيع المسافة
//                         children: [
//                           const Text('Selected Age:',
//                               style: TextStyle(fontSize: 16)),
//                           Container(
//                             // حاوية العداد لتطبيق خلفية بيضاء
//                             decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 borderRadius: BorderRadius.circular(4),
//                                 border: Border.all(
//                                     color:
//                                         Colors.grey[300]!) // إضافة حدود خفيفة
//                                 ),
//                             child: Row(
//                               children: [
//                                 InkWell(
//                                   // زر النقصان
//                                   borderRadius: BorderRadius.circular(4),
//                                   onTap: () {
//                                     if (driverAge > 30) {
//                                       setState(() => driverAge--);
//                                     }
//                                   },
//                                   child: Padding(
//                                     padding: const EdgeInsets.all(6.0),
//                                     child: Icon(Icons.remove,
//                                         size: 20,
//                                         color: driverAge > 30
//                                             ? Colors.black54
//                                             : Colors.grey[300]), // تعطيل مرئي
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   // لعرض الرقم الحالي
//                                   width: 35, // تحديد عرض ثابت للرقم
//                                   child: Text(
//                                     '$driverAge',
//                                     textAlign: TextAlign.center,
//                                     style: const TextStyle(
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                 ),
//                                 InkWell(
//                                   // زر الزيادة
//                                   borderRadius: BorderRadius.circular(4),
//                                   onTap: () {
//                                     if (driverAge < 65) {
//                                       setState(() => driverAge++);
//                                     }
//                                   },
//                                   child: Padding(
//                                     padding: const EdgeInsets.all(6.0),
//                                     child: Icon(Icons.add,
//                                         size: 20,
//                                         color: driverAge < 65
//                                             ? Colors.black54
//                                             : Colors.grey[300]), // تعطيل مرئي
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               const SizedBox(height: 30), // مسافة أكبر قبل زر البحث

//               // --- زر البحث ---
//               SizedBox(
//                 width: double.infinity, // لجعل الزر يملأ العرض
//                 child: ElevatedButton(
//                   onPressed: _handleSearch, // استدعاء دالة البحث عند الضغط
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor:
//                         const Color(0xFF4E7D96), // لون الزر الرئيسي
//                     padding:
//                         const EdgeInsets.symmetric(vertical: 16), // ارتفاع الزر
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12), // حواف دائرية
//                     ),
//                     elevation: 2, // ظل خفيف للزر
//                   ),
//                   child: const Text(
//                     'Search Cars', // تغيير النص ليكون أكثر تحديداً
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20), // مسافة في الأسفل
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // --- بداية الدوال المساعدة ---

//   // --- الدالة المساعدة لبناء أزرار التبويب العلوية (تم التعديل) ---
//   Widget _buildTab(
//       IconData icon, String label, bool isSelected, String tabKey) {
//     return GestureDetector(
//       onTap: () {
//         if (!isSelected) {
//           // لا تفعل شيئًا إذا كان التبويب محددًا بالفعل
//           // --- منطق التنقل باستخدام tabKey ليكون أكثر دقة ---
//           Widget? destinationScreen; // استخدام Widget قابل للإلغاء

//           switch (tabKey) {
//             case 'Flights':
//               destinationScreen = const FlightsScreen();
//               break;
//             case 'Hotels':
//               destinationScreen = const HotelsSearchScreen();
//               break;
//             case 'Taxi': // التحقق من tabKey 'Taxi'
//               destinationScreen = const TaxiSearchScreen(); // شاشة التاكسي
//               break;
//             // لا نضيف حالة 'Car Rental' لأننا فيها بالفعل
//           }

//           // تنفيذ الانتقال إذا تم تحديد شاشة وجهة
//           if (destinationScreen != null) {
//             Navigator.pushReplacement(
//               context,
//               MaterialPageRoute(builder: (context) => destinationScreen!),
//             );
//             // أو استخدم push إذا أردت السماح بالعودة:
//             // Navigator.push(
//             //   context,
//             //   MaterialPageRoute(builder: (context) => destinationScreen!),
//             // );
//           }
//         }
//       },
//       child: Container(
//         margin: const EdgeInsets.symmetric(
//             horizontal: 2), // مسافة صغيرة بين التبويبات
//         padding: const EdgeInsets.symmetric(
//             horizontal: 8, vertical: 6), // تباعد داخلي
//         decoration: BoxDecoration(
//           color: isSelected
//               ? const Color(0xFF4E7D96)
//               : Colors.transparent, // لون الخلفية
//           borderRadius: BorderRadius.circular(8), // حواف دائرية
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center, // توسيط المحتوى
//           children: [
//             Icon(icon,
//                 color: isSelected ? Colors.white : Colors.grey[600],
//                 size: 18), // أيقونة التبويب
//             if (isSelected) ...[
//               // إظهار النص فقط إذا كان التبويب محددًا
//               const SizedBox(width: 6),
//               Flexible(
//                 // لمنع تجاوز النص في التبويبات الضيقة
//                 child: Text(
//                   label,
//                   style: const TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.w500,
//                       fontSize: 13),
//                   overflow:
//                       TextOverflow.ellipsis, // إظهار "..." إذا كان النص طويلاً
//                   maxLines: 1,
//                 ),
//               ),
//             ],
//           ],
//         ),
//       ),
//     );
//   }

//   // --- الدالة المساعدة لبناء أزرار اختيار نوع الإيجار ---
//   Widget _buildRentTypeChip(String type) {
//     final bool isSelected = selectedRentType == type;
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16.0), // تباعد من الحواف
//       child: ChoiceChip(
//         label: SizedBox(
//           // جعل النص يملأ العرض للمحاذاة
//           width: double.infinity,
//           child: Text(
//             type,
//             textAlign: TextAlign.center, // توسيط النص
//             style: TextStyle(
//               color: isSelected
//                   ? Colors.white
//                   : Colors.grey[700], // تغيير لون النص
//               fontSize: 14,
//               fontWeight: isSelected
//                   ? FontWeight.bold
//                   : FontWeight.normal, // تغيير الوزن
//             ),
//           ),
//         ),
//         selected: isSelected,
//         selectedColor: const Color(0xFF4E7D96), // لون التحديد
//         backgroundColor: Colors.white, // لون الخلفية العادي
//         side: isSelected
//             ? BorderSide.none
//             : BorderSide(color: Colors.grey[300]!), // حدود لغير المحدد
//         shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(8)), // شكل الحواف
//         padding: const EdgeInsets.symmetric(
//             horizontal: 12, vertical: 10), // تباعد داخلي
//         onSelected: (bool selected) {
//           if (selected) {
//             setState(() {
//               selectedRentType = type; // تحديث الحالة
//               showRentTypeOptions = false; // إخفاء الخيارات
//               // لا نعيد تعيين العمر هنا، نعتمد على العرض الشرطي لحقل العمر
//             });
//           }
//         },
//       ),
//     );
//   }

//   // --- الدالة المساعدة لبناء واجهة التقويم (مطابقة للمثال) ---
//   Widget _buildCalendarView() {
//     return Container(
//       margin: const EdgeInsets.only(top: 8), // هامش علوي
//       decoration: BoxDecoration(
//           // تصميم الحاوية
//           color: Colors.white, // خلفية بيضاء
//           borderRadius: BorderRadius.circular(8), // حواف دائرية
//           boxShadow: [
//             // ظل خفيف
//             BoxShadow(
//               color: Colors.grey.withOpacity(0.2),
//               spreadRadius: 1,
//               blurRadius: 3,
//               offset: const Offset(0, 2),
//             ),
//           ]),
//       child: TableCalendar(
//         firstDay: DateTime.now()
//             .subtract(const Duration(days: 365)), // سنة ماضية كبداية مقبولة
//         lastDay:
//             DateTime.now().add(const Duration(days: 365 * 2)), // سنتان مستقبلاً
//         focusedDay: selectedDate ?? DateTime.now(), // اليوم المركز عليه
//         currentDay: DateTime.now(), // اليوم الحالي
//         selectedDayPredicate: (day) =>
//             isSameDay(selectedDate, day), // تحديد اليوم المختار
//         calendarFormat: CalendarFormat.month, // عرض شهري
//         headerStyle: const HeaderStyle(
//           // تنسيق رأس التقويم (مطابق للمثال)
//           titleTextStyle:
//               TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
//           formatButtonVisible: false,
//           titleCentered: true,
//           leftChevronIcon: Icon(Icons.chevron_left, color: Colors.black),
//           rightChevronIcon: Icon(Icons.chevron_right, color: Colors.black),
//         ),
//         calendarStyle: CalendarStyle(
//           // تنسيق أيام التقويم (مطابق للمثال)
//           selectedDecoration: const BoxDecoration(
//               color: Color(0xFF4E7D96), shape: BoxShape.circle),
//           selectedTextStyle: const TextStyle(color: Colors.white),
//           todayDecoration: BoxDecoration(
//               color: const Color(0xFFADD8E6).withOpacity(0.5), // لون أخف لليوم
//               shape: BoxShape.circle), // لون مختلف لليوم
//           todayTextStyle: const TextStyle(color: Colors.black),
//           defaultTextStyle: const TextStyle(color: Colors.black),
//           weekendTextStyle: const TextStyle(
//               color: Colors.black54), // تمييز عطلة نهاية الأسبوع قليلاً
//           outsideDaysVisible: false, // إخفاء أيام الشهور الأخرى
//         ),
//         onDaySelected: (selectedDay, focusedDay) {
//           // عند اختيار يوم
//           // منع اختيار تاريخ في الماضي
//           if (selectedDay
//               .isBefore(DateTime.now().subtract(const Duration(days: 1)))) {
//             ScaffoldMessenger.of(context).showSnackBar(
//               const SnackBar(content: Text("Cannot select a past date")),
//             );
//             return;
//           }
//           setState(() {
//             selectedDate = selectedDay; // تحديث التاريخ
//             showCalendar = false; // إخفاء التقويم
//           });
//         },
//         startingDayOfWeek:
//             StartingDayOfWeek.sunday, // بداية الأسبوع (مطابق للمثال)
//       ),
//     );
//   }

// //ignore_for_file: unused_field

//   // --- الدالة المساعدة لتنسيق حقول الإدخال (مطابقة للمثال) ---
//   BoxDecoration _inputBoxDecoration() {
//     return BoxDecoration(
//       color: const Color(0xFFEEEEEE), // لون الخلفية الرمادي الفاتح
//       borderRadius: BorderRadius.circular(8), // حواف دائرية
//     );
//   }
// // --- نهاية الدوال المساعدة ---
// }
// lib/screens/car_rental_screen.dart
// lib/screens/car_rental_screen.dart

// import 'package:flutter/material.dart';
// import 'package:table_calendar/table_calendar.dart';
// import 'package:country_picker/country_picker.dart';
// import 'package:intl/intl.dart';

// // --- استيراد الشاشات الأخرى ---
// import 'flights_screen.dart'; // شاشة الرحلات
// import 'hotels_search_screen.dart'; // شاشة الفنادق
// import 'taxi_search_screen.dart'; // <-- استيراد شاشة التاكسي
// import 'car_search_results_screen.dart'; // شاشة نتائج البحث عن السيارات

// class CarRentalScreen extends StatefulWidget {
//   const CarRentalScreen({super.key});

//   @override
//   State<CarRentalScreen> createState() => _CarRentalScreenState();
// }

// class _CarRentalScreenState extends State<CarRentalScreen> {
//   String selectedCountry = '';
//   DateTime? selectedDate;
//   String? selectedRentType;
//   int driverAge = 30;

//   bool showCalendar = false;
//   bool showRentTypeOptions = false;

//   void _toggleCalendar() {
//     setState(() {
//       showCalendar = !showCalendar;
//       showRentTypeOptions = false;
//     });
//   }

//   void _toggleRentTypeOptions() {
//     setState(() {
//       showRentTypeOptions = !showRentTypeOptions;
//       showCalendar = false;
//     });
//   }

//   void _handleSearch() {
//     if (selectedCountry.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Please select a pickup location')),
//       );
//       return;
//     }
//     if (selectedDate == null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Please select a date')),
//       );
//       return;
//     }
//     if (selectedRentType == null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Please select a rent type')),
//       );
//       return;
//     }

//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => CarSearchResultsScreen(
//           location: selectedCountry,
//           date: selectedDate!,
//           rentType: selectedRentType!,
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () => Navigator.pop(context),
//         ),
//         backgroundColor: Colors.white,
//         elevation: 0,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 height: 40,
//                 padding: const EdgeInsets.all(4),
//                 decoration: BoxDecoration(
//                   color: const Color(0xFFEEEEEE),
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: Row(
//                   children: [
//                     Expanded(
//                         child: _buildTab(
//                             Icons.flight, 'Flights', false, 'Flights')),
//                     Expanded(
//                         child:
//                             _buildTab(Icons.hotel, 'Hotels', false, 'Hotels')),
//                     Expanded(
//                         child: _buildTab(Icons.directions_car, 'Car Rental',
//                             true, 'Car Rental')),
//                     Expanded(
//                         child:
//                             _buildTab(Icons.local_taxi, 'Taxi', false, 'Taxi')),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 20),
//               GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     showCalendar = false;
//                     showRentTypeOptions = false;
//                   });
//                   showCountryPicker(
//                     context: context,
//                     showPhoneCode: false,
//                     onSelect: (Country country) {
//                       setState(() {
//                         selectedCountry = country.name;
//                       });
//                     },
//                   );
//                 },
//                 child: Container(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
//                   decoration: _inputBoxDecoration(),
//                   child: Row(
//                     children: [
//                       Icon(Icons.location_on_outlined,
//                           color: Colors.grey[600], size: 20),
//                       const SizedBox(width: 12),
//                       Expanded(
//                         child: Text(
//                           selectedCountry.isEmpty
//                               ? 'Pickup Location'
//                               : selectedCountry,
//                           style: TextStyle(
//                             color: selectedCountry.isEmpty
//                                 ? Colors.grey[600]
//                                 : Colors.black,
//                             fontSize: 16,
//                           ),
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 12),
//               GestureDetector(
//                 onTap: _toggleCalendar,
//                 child: Container(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
//                   decoration: _inputBoxDecoration(),
//                   child: Row(
//                     children: [
//                       const Icon(Icons.calendar_today,
//                           color: Colors.grey, size: 20),
//                       const SizedBox(width: 12),
//                       Expanded(
//                         child: Text(
//                           selectedDate != null
//                               ? DateFormat('d/M/yyyy').format(selectedDate!)
//                               : 'Select Date',
//                           style: TextStyle(
//                             color: selectedDate != null
//                                 ? Colors.black
//                                 : Colors.grey[600],
//                             fontSize: 16,
//                           ),
//                         ),
//                       ),
//                       Icon(
//                         showCalendar
//                             ? Icons.keyboard_arrow_up
//                             : Icons.keyboard_arrow_down,
//                         color: Colors.grey[600],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               if (showCalendar) _buildCalendarView(),
//               const SizedBox(height: 12),
//               GestureDetector(
//                 onTap: _toggleRentTypeOptions,
//                 child: Container(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
//                   decoration: _inputBoxDecoration(),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Row(
//                         children: [
//                           Icon(Icons.drive_eta_outlined,
//                               color: Colors.grey[600], size: 20),
//                           const SizedBox(width: 12),
//                           Text(
//                             selectedRentType ?? 'Select Rent Type',
//                             style: TextStyle(
//                               color: selectedRentType != null
//                                   ? Colors.black
//                                   : Colors.grey[600],
//                               fontSize: 16,
//                             ),
//                           ),
//                         ],
//                       ),
//                       Icon(
//                         showRentTypeOptions
//                             ? Icons.keyboard_arrow_up
//                             : Icons.keyboard_arrow_down,
//                         color: Colors.grey[600],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               if (showRentTypeOptions)
//                 Container(
//                   margin: const EdgeInsets.only(top: 8),
//                   padding: const EdgeInsets.symmetric(vertical: 8),
//                   decoration: BoxDecoration(
//                     color: const Color(0xFFEEEEEE),
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   child: Column(
//                     children: [
//                       _buildRentTypeChip('Self-driver'),
//                       const SizedBox(height: 4),
//                       _buildRentTypeChip('With driver'),
//                     ],
//                   ),
//                 ),
//               const SizedBox(height: 12),
//               if (selectedRentType == 'With driver')
//                 Container(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//                   decoration: _inputBoxDecoration(),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         children: [
//                           Icon(Icons.person_pin_outlined,
//                               color: Colors.grey[600], size: 20),
//                           const SizedBox(width: 12),
//                           Text('Driver Age (30-65)',
//                               style: TextStyle(
//                                   color: Colors.grey[600], fontSize: 16)),
//                         ],
//                       ),
//                       const SizedBox(height: 12),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           const Text('Selected Age:',
//                               style: TextStyle(fontSize: 16)),
//                           Container(
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(4),
//                               border: Border.all(color: Colors.grey[300]!),
//                             ),
//                             child: Row(
//                               children: [
//                                 InkWell(
//                                   onTap: () {
//                                     if (driverAge > 30)
//                                       setState(() => driverAge--);
//                                   },
//                                   child: Padding(
//                                     padding: const EdgeInsets.all(6.0),
//                                     child: Icon(Icons.remove,
//                                         size: 20,
//                                         color: driverAge > 30
//                                             ? Colors.black54
//                                             : Colors.grey[300]),
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   width: 35,
//                                   child: Text('$driverAge',
//                                       textAlign: TextAlign.center,
//                                       style: const TextStyle(
//                                           fontSize: 16,
//                                           fontWeight: FontWeight.bold)),
//                                 ),
//                                 InkWell(
//                                   onTap: () {
//                                     if (driverAge < 65)
//                                       setState(() => driverAge++);
//                                   },
//                                   child: Padding(
//                                     padding: const EdgeInsets.all(6.0),
//                                     child: Icon(Icons.add,
//                                         size: 20,
//                                         color: driverAge < 65
//                                             ? Colors.black54
//                                             : Colors.grey[300]),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               const SizedBox(height: 30),
//               SizedBox(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   onPressed: _handleSearch,
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color(0xFF4E7D96),
//                     padding: const EdgeInsets.symmetric(vertical: 16),
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12)),
//                     elevation: 2,
//                   ),
//                   child: const Text(
//                     'Search Cars',
//                     style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildTab(
//       IconData icon, String label, bool isSelected, String tabKey) {
//     return GestureDetector(
//       onTap: () {
//         if (isSelected) return;
//         Widget? destinationScreen;
//         switch (tabKey) {
//           case 'Flights':
//             destinationScreen = const FlightsScreen();
//             break;
//           case 'Hotels':
//             destinationScreen = const HotelsSearchScreen();
//             break;
//           case 'Taxi':
//             destinationScreen = const TaxiSearchScreen();
//             break;
//         }
//         if (destinationScreen != null) {
//           Navigator.pushReplacement(
//             context,
//             MaterialPageRoute(builder: (context) => destinationScreen!),
//           );
//         }
//       },
//       child: Container(
//         margin: const EdgeInsets.symmetric(horizontal: 2),
//         padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
//         decoration: BoxDecoration(
//           color: isSelected ? const Color(0xFF4E7D96) : Colors.transparent,
//           borderRadius: BorderRadius.circular(8),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(icon,
//                 color: isSelected ? Colors.white : Colors.grey[600], size: 18),
//             if (isSelected) ...[
//               const SizedBox(width: 6),
//               Flexible(
//                 child: Text(
//                   label,
//                   style: const TextStyle(
//                       color: Colors.white,
//                       fontWeight: FontWeight.w500,
//                       fontSize: 13),
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

//   Widget _buildRentTypeChip(String type) {
//     final bool isSelected = selectedRentType == type;
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16.0),
//       child: ChoiceChip(
//         label: SizedBox(
//           width: double.infinity,
//           child: Text(
//             type,
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               color: isSelected ? Colors.white : Colors.grey[700],
//               fontSize: 14,
//               fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
//             ),
//           ),
//         ),
//         selected: isSelected,
//         selectedColor: const Color(0xFF4E7D96),
//         backgroundColor: Colors.white,
//         side:
//             isSelected ? BorderSide.none : BorderSide(color: Colors.grey[300]!),
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//         padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
//         onSelected: (bool selected) {
//           if (selected) {
//             setState(() {
//               selectedRentType = type;
//               showRentTypeOptions = false;
//             });
//           }
//         },
//       ),
//     );
//   }

//   Widget _buildCalendarView() {
//     return Container(
//       margin: const EdgeInsets.only(top: 8),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(8),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.2),
//             spreadRadius: 1,
//             blurRadius: 3,
//             offset: const Offset(0, 2),
//           ),
//         ],
//       ),
//       child: TableCalendar(
//         firstDay: DateTime.now().subtract(const Duration(days: 365)),
//         lastDay: DateTime.now().add(const Duration(days: 365 * 2)),
//         focusedDay: selectedDate ?? DateTime.now(),
//         currentDay: DateTime.now(),
//         selectedDayPredicate: (day) => isSameDay(selectedDate, day),
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
//           selectedDecoration: const BoxDecoration(
//               color: Color(0xFF4E7D96), shape: BoxShape.circle),
//           selectedTextStyle: const TextStyle(color: Colors.white),
//           todayDecoration: BoxDecoration(
//               color: const Color(0xFFADD8E6).withOpacity(0.5),
//               shape: BoxShape.circle),
//           todayTextStyle: const TextStyle(color: Colors.black),
//           defaultTextStyle: const TextStyle(color: Colors.black),
//           weekendTextStyle: const TextStyle(color: Colors.black54),
//           outsideDaysVisible: false,
//         ),
//         onDaySelected: (selectedDay, focusedDay) {
//           if (selectedDay
//               .isBefore(DateTime.now().subtract(const Duration(days: 1)))) {
//             ScaffoldMessenger.of(context).showSnackBar(
//               const SnackBar(content: Text("Cannot select a past date")),
//             );
//             return;
//           }
//           setState(() {
//             selectedDate = selectedDay;
//             showCalendar = false;
//           });
//         },
//         startingDayOfWeek: StartingDayOfWeek.sunday,
//       ),
//     );
//   }

//   BoxDecoration _inputBoxDecoration() {
//     return BoxDecoration(
//       color: const Color(0xFFEEEEEE),
//       borderRadius: BorderRadius.circular(8),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
//import 'package:country_picker/country_picker.dart';
import 'package:intl/intl.dart';

// --- استيراد الشاشات الأخرى ---
import 'flights_screen.dart'; // شاشة الرحلات
import 'hotels_search_screen.dart'; // شاشة الفنادق
import 'taxi_search_screen.dart'; // <-- استيراد شاشة التاكسي
import 'car_search_results_screen.dart'; // شاشة نتائج البحث عن السيارات

class CarRentalScreen extends StatefulWidget {
  const CarRentalScreen({super.key});

  @override
  State<CarRentalScreen> createState() => _CarRentalScreenState();
}

class _CarRentalScreenState extends State<CarRentalScreen> {
  String selectedLocation = ''; // تم تغيير selectedCountry إلى selectedLocation
  DateTime? selectedDate;
  String? selectedRentType;
  int driverAge = 30;

  bool showCalendar = false;
  bool showRentTypeOptions = false;

  void _toggleCalendar() {
    setState(() {
      showCalendar = !showCalendar;
      showRentTypeOptions = false;
    });
  }

  void _toggleRentTypeOptions() {
    setState(() {
      showRentTypeOptions = !showRentTypeOptions;
      showCalendar = false;
    });
  }

  void _handleSearch() {
    if (selectedLocation.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a pickup location')),
      );
      return;
    }
    if (selectedDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a date')),
      );
      return;
    }
    if (selectedRentType == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a rent type')),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CarSearchResultsScreen(
          location: selectedLocation,
          date: selectedDate!,
          rentType: selectedRentType!,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 40,
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: const Color(0xFFEEEEEE),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Expanded(
                        child: _buildTab(
                            Icons.flight, 'Flights', false, 'Flights')),
                    Expanded(
                        child:
                            _buildTab(Icons.hotel, 'Hotels', false, 'Hotels')),
                    Expanded(
                        child: _buildTab(Icons.directions_car, 'Car Rental',
                            true, 'Car Rental')),
                    Expanded(
                        child:
                            _buildTab(Icons.local_taxi, 'Taxi', false, 'Taxi')),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // استبدال country_picker بـ TextField
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                decoration: _inputBoxDecoration(),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Pickup Location',
                    hintStyle: TextStyle(color: Colors.grey[600], fontSize: 16),
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.location_on_outlined,
                        color: Colors.grey[600], size: 20),
                  ),
                  style: const TextStyle(fontSize: 16),
                  onChanged: (value) {
                    setState(() {
                      selectedLocation = value;
                    });
                  },
                ),
              ),
              const SizedBox(height: 12),
              GestureDetector(
                onTap: _toggleCalendar,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  decoration: _inputBoxDecoration(),
                  child: Row(
                    children: [
                      const Icon(Icons.calendar_today,
                          color: Colors.grey, size: 20),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          selectedDate != null
                              ? DateFormat('d/M/yyyy').format(selectedDate!)
                              : 'Select Date',
                          style: TextStyle(
                            color: selectedDate != null
                                ? Colors.black
                                : Colors.grey[600],
                            fontSize: 16,
                          ),
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
              GestureDetector(
                onTap: _toggleRentTypeOptions,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  decoration: _inputBoxDecoration(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.drive_eta_outlined,
                              color: Colors.grey[600], size: 20),
                          const SizedBox(width: 12),
                          Text(
                            selectedRentType ?? 'Select Rent Type',
                            style: TextStyle(
                              color: selectedRentType != null
                                  ? Colors.black
                                  : Colors.grey[600],
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      Icon(
                        showRentTypeOptions
                            ? Icons.keyboard_arrow_up
                            : Icons.keyboard_arrow_down,
                        color: Colors.grey[600],
                      ),
                    ],
                  ),
                ),
              ),
              if (showRentTypeOptions)
                Container(
                  margin: const EdgeInsets.only(top: 8),
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEEEEEE),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      _buildRentTypeChip('Self-driver'),
                      const SizedBox(height: 4),
                      _buildRentTypeChip('With driver'),
                    ],
                  ),
                ),
              const SizedBox(height: 12),
              if (selectedRentType == 'With driver')
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: _inputBoxDecoration(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.person_pin_outlined,
                              color: Colors.grey[600], size: 20),
                          const SizedBox(width: 12),
                          Text('Driver Age (30-65)',
                              style: TextStyle(
                                  color: Colors.grey[600], fontSize: 16)),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Selected Age:',
                              style: TextStyle(fontSize: 16)),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(color: Colors.grey[300]!),
                            ),
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    if (driverAge > 30)
                                      setState(() => driverAge--);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Icon(Icons.remove,
                                        size: 20,
                                        color: driverAge > 30
                                            ? Colors.black54
                                            : Colors.grey[300]),
                                  ),
                                ),
                                SizedBox(
                                  width: 35,
                                  child: Text('$driverAge',
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                ),
                                InkWell(
                                  onTap: () {
                                    if (driverAge < 65)
                                      setState(() => driverAge++);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Icon(Icons.add,
                                        size: 20,
                                        color: driverAge < 65
                                            ? Colors.black54
                                            : Colors.grey[300]),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _handleSearch,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4E7D96),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    elevation: 2,
                  ),
                  child: const Text(
                    'Search Cars',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTab(
      IconData icon, String label, bool isSelected, String tabKey) {
    return GestureDetector(
      onTap: () {
        if (isSelected) return;
        Widget? destinationScreen;
        switch (tabKey) {
          case 'Flights':
            destinationScreen = const FlightsScreen();
            break;
          case 'Hotels':
            destinationScreen = const HotelsSearchScreen();
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
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 2),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF4E7D96) : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon,
                color: isSelected ? Colors.white : Colors.grey[600], size: 18),
            if (isSelected) ...[
              const SizedBox(width: 6),
              Flexible(
                child: Text(
                  label,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 13),
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

  Widget _buildRentTypeChip(String type) {
    final bool isSelected = selectedRentType == type;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ChoiceChip(
        label: SizedBox(
          width: double.infinity,
          child: Text(
            type,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.grey[700],
              fontSize: 14,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
        selected: isSelected,
        selectedColor: const Color(0xFF4E7D96),
        backgroundColor: Colors.white,
        side:
            isSelected ? BorderSide.none : BorderSide(color: Colors.grey[300]!),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        onSelected: (bool selected) {
          if (selected) {
            setState(() {
              selectedRentType = type;
              showRentTypeOptions = false;
            });
          }
        },
      ),
    );
  }

  Widget _buildCalendarView() {
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
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TableCalendar(
        firstDay: DateTime.now().subtract(const Duration(days: 365)),
        lastDay: DateTime.now().add(const Duration(days: 365 * 2)),
        focusedDay: selectedDate ?? DateTime.now(),
        currentDay: DateTime.now(),
        selectedDayPredicate: (day) => isSameDay(selectedDate, day),
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
          selectedDecoration: const BoxDecoration(
              color: Color(0xFF4E7D96), shape: BoxShape.circle),
          selectedTextStyle: const TextStyle(color: Colors.white),
          todayDecoration: BoxDecoration(
              color: const Color(0xFFADD8E6).withOpacity(0.5),
              shape: BoxShape.circle),
          todayTextStyle: const TextStyle(color: Colors.black),
          defaultTextStyle: const TextStyle(color: Colors.black),
          weekendTextStyle: const TextStyle(color: Colors.black54),
          outsideDaysVisible: false,
        ),
        onDaySelected: (selectedDay, focusedDay) {
          if (selectedDay
              .isBefore(DateTime.now().subtract(const Duration(days: 1)))) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Cannot select a past date")),
            );
            return;
          }
          setState(() {
            selectedDate = selectedDay;
            showCalendar = false;
          });
        },
        startingDayOfWeek: StartingDayOfWeek.sunday,
      ),
    );
  }

  BoxDecoration _inputBoxDecoration() {
    return BoxDecoration(
      color: const Color(0xFFEEEEEE),
      borderRadius: BorderRadius.circular(8),
    );
  }
}
