// // // // import 'package:flutter/material.dart';
// // // // import 'package:table_calendar/table_calendar.dart';
// // // // import 'package:intl/intl.dart';
// // // // import 'FlightResultsScreen.dart';
// // // // import 'hotels_search_screen.dart';
// // // // import 'car_rental_screen.dart';
// // // // import 'taxi_search_screen.dart';

// // // // class FlightsScreen extends StatefulWidget {
// // // //   const FlightsScreen({super.key});
// // // //   @override
// // // //   State<FlightsScreen> createState() => _FlightsScreenState();
// // // // }

// // // // class _FlightsScreenState extends State<FlightsScreen> {
// // // //   String selectedTopTab = 'Flights';
// // // //   String selectedCategory = 'Economy';
// // // //   DateTime? _rangeStart;
// // // //   DateTime? _rangeEnd;
// // // //   DateTime _focusedDay = DateTime.now();
// // // //   int adultCount = 2;
// // // //   int childCount = 1;
// // // //   final TextEditingController _destinationController =
// // // //       TextEditingController(text: 'cairo');

// // // //   bool showCalendar = false;
// // // //   bool showCategories = false;
// // // //   bool showPassengers = false;

// // // //   String get passengersText {
// // // //     if (showPassengers) return 'Select Number of Passengers';
// // // //     return 'Adult: $adultCount, Child: $childCount';
// // // //   }

// // // //   String get datesText {
// // // //     if (_rangeStart == null) return 'Select Departure & Return Dates';
// // // //     if (_rangeEnd == null)
// // // //       return 'Departure: ${DateFormat('d/M/yyyy').format(_rangeStart!)}';
// // // //     return '${DateFormat('d/M/yyyy').format(_rangeStart!)} - ${DateFormat('d/M/yyyy').format(_rangeEnd!)}';
// // // //   }

// // // //   @override
// // // //   void dispose() {
// // // //     _destinationController.dispose();
// // // //     super.dispose();
// // // //   }

// // // //   void _toggleCalendar() => setState(() {
// // // //         showCalendar = !showCalendar;
// // // //         showPassengers = false;
// // // //         showCategories = false;
// // // //       });
// // // //   void _togglePassengers() => setState(() {
// // // //         showPassengers = !showPassengers;
// // // //         showCalendar = false;
// // // //         showCategories = false;
// // // //       });
// // // //   void _toggleCategories() => setState(() {
// // // //         showCategories = !showCategories;
// // // //         showCalendar = false;
// // // //         showPassengers = false;
// // // //       });

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Scaffold(
// // // //       backgroundColor: Colors.white,
// // // //       body: SafeArea(
// // // //         child: SingleChildScrollView(
// // // //           padding: const EdgeInsets.all(16.0),
// // // //           child: Column(
// // // //             children: [
// // // //               Row(children: [
// // // //                 IconButton(
// // // //                     icon: const Icon(Icons.arrow_back, color: Colors.black),
// // // //                     onPressed: () => Navigator.pop(context),
// // // //                     constraints: const BoxConstraints(),
// // // //                     padding: EdgeInsets.zero)
// // // //               ]),
// // // //               const SizedBox(height: 15),
// // // //               Container(
// // // //                 padding: const EdgeInsets.all(4),
// // // //                 height: 45,
// // // //                 decoration: BoxDecoration(
// // // //                     color: const Color(0xFFF0F0F0),
// // // //                     borderRadius: BorderRadius.circular(10)),
// // // //                 child: Row(children: [
// // // //                   Expanded(
// // // //                       child: _buildTopTab(
// // // //                           Icons.flight_takeoff, 'Flights', 'Flights')),
// // // //                   Expanded(
// // // //                       child: _buildTopTab(Icons.hotel, 'Hotels', 'Hotels')),
// // // //                   Expanded(
// // // //                       child: _buildTopTab(
// // // //                           Icons.directions_car, 'Car Rental', 'Car Rental')),
// // // //                   Expanded(
// // // //                       child: _buildTopTab(Icons.local_taxi, 'Taxi', 'Taxi')),
// // // //                 ]),
// // // //               ),
// // // //               const SizedBox(height: 24),
// // // //               TextField(
// // // //                   controller: _destinationController,
// // // //                   decoration: _inputDecoration(
// // // //                       hintText: 'Enter Destination', icon: Icons.search),
// // // //                   style: const TextStyle(color: Colors.black, fontSize: 16)),
// // // //               const SizedBox(height: 12),
// // // //               GestureDetector(
// // // //                 onTap: _toggleCalendar,
// // // //                 child: Container(
// // // //                   padding:
// // // //                       const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
// // // //                   decoration: _inputBoxDecoration(),
// // // //                   child: Row(children: [
// // // //                     const Icon(Icons.calendar_today,
// // // //                         color: Colors.grey, size: 20),
// // // //                     const SizedBox(width: 12),
// // // //                     Expanded(
// // // //                         child: Text(datesText,
// // // //                             style: TextStyle(
// // // //                                 color: _rangeStart != null
// // // //                                     ? Colors.black
// // // //                                     : Colors.grey[600],
// // // //                                 fontSize: 16))),
// // // //                     Icon(
// // // //                         showCalendar
// // // //                             ? Icons.keyboard_arrow_up
// // // //                             : Icons.keyboard_arrow_down,
// // // //                         color: Colors.grey[600]),
// // // //                   ]),
// // // //                 ),
// // // //               ),
// // // //               if (showCalendar) _buildCalendarView(),
// // // //               const SizedBox(height: 12),
// // // //               GestureDetector(
// // // //                 onTap: _togglePassengers,
// // // //                 child: Container(
// // // //                   padding:
// // // //                       const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
// // // //                   decoration: _inputBoxDecoration(),
// // // //                   child: Row(children: [
// // // //                     const Icon(Icons.person_outline,
// // // //                         color: Colors.grey, size: 20),
// // // //                     const SizedBox(width: 12),
// // // //                     Expanded(
// // // //                         child: Text(passengersText,
// // // //                             style: TextStyle(
// // // //                                 color: showPassengers
// // // //                                     ? Colors.grey[600]
// // // //                                     : Colors.black,
// // // //                                 fontSize: 16))),
// // // //                     Icon(
// // // //                         showPassengers
// // // //                             ? Icons.keyboard_arrow_up
// // // //                             : Icons.keyboard_arrow_down,
// // // //                         color: Colors.grey[600]),
// // // //                   ]),
// // // //                 ),
// // // //               ),
// // // //               if (showPassengers) _buildPassengerCountersView(),
// // // //               const SizedBox(height: 12),
// // // //               GestureDetector(
// // // //                 onTap: _toggleCategories,
// // // //                 child: Container(
// // // //                   padding:
// // // //                       const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
// // // //                   decoration: _inputBoxDecoration(),
// // // //                   child: Column(
// // // //                     crossAxisAlignment: CrossAxisAlignment.start,
// // // //                     children: [
// // // //                       Row(children: [
// // // //                         const Icon(Icons.flight_class_outlined,
// // // //                             color: Colors.grey, size: 20),
// // // //                         const SizedBox(width: 12),
// // // //                         Expanded(
// // // //                             child: Text(
// // // //                                 showCategories
// // // //                                     ? 'Select Flight Class'
// // // //                                     : selectedCategory,
// // // //                                 style: TextStyle(
// // // //                                     color: showCategories
// // // //                                         ? Colors.grey[600]
// // // //                                         : Colors.black,
// // // //                                     fontSize: 16))),
// // // //                         Icon(
// // // //                             showCategories
// // // //                                 ? Icons.keyboard_arrow_up
// // // //                                 : Icons.keyboard_arrow_down,
// // // //                             color: Colors.grey[600]),
// // // //                       ]),
// // // //                       if (showCategories) ...[
// // // //                         const SizedBox(height: 12),
// // // //                         Divider(color: Colors.grey[300], height: 1),
// // // //                         const SizedBox(height: 12),
// // // //                         _buildCategoryChipsView(),
// // // //                       ],
// // // //                     ],
// // // //                   ),
// // // //                 ),
// // // //               ),
// // // //               const SizedBox(height: 40),
// // // //               SizedBox(
// // // //                 width: double.infinity,
// // // //                 child: ElevatedButton(
// // // //                   onPressed: () {
// // // //                     if (_destinationController.text.isNotEmpty &&
// // // //                         _rangeStart != null &&
// // // //                         _rangeEnd != null) {
// // // //                       Navigator.push(
// // // //                         context,
// // // //                         MaterialPageRoute(
// // // //                           builder: (context) => FlightResultsScreen(
// // // //                             destination: _destinationController.text,
// // // //                             origin: "Cairo",
// // // //                             departureDate: _rangeStart!,
// // // //                             returnDate: _rangeEnd!,
// // // //                             adults: adultCount,
// // // //                             children: childCount,
// // // //                             category: selectedCategory,
// // // //                             date: 0,
// // // //                           ),
// // // //                         ),
// // // //                       );
// // // //                     } else {
// // // //                       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
// // // //                           content: Text(
// // // //                               'Please fill all fields, including return date')));
// // // //                     }
// // // //                   },
// // // //                   style: ElevatedButton.styleFrom(
// // // //                       backgroundColor: const Color(0xFF4E7D96),
// // // //                       padding: const EdgeInsets.symmetric(vertical: 16),
// // // //                       shape: RoundedRectangleBorder(
// // // //                           borderRadius: BorderRadius.circular(12))),
// // // //                   child: const Text('Search Flights',
// // // //                       style: TextStyle(
// // // //                           fontSize: 18,
// // // //                           fontWeight: FontWeight.bold,
// // // //                           color: Colors.white)),
// // // //                 ),
// // // //               ),
// // // //             ],
// // // //           ),
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }

// // // //   Widget _buildCalendarView() {
// // // //     return Container(
// // // //       margin: const EdgeInsets.only(top: 8),
// // // //       decoration: BoxDecoration(
// // // //           color: Colors.white,
// // // //           borderRadius: BorderRadius.circular(8),
// // // //           boxShadow: [
// // // //             BoxShadow(
// // // //                 color: Colors.grey.withOpacity(0.2),
// // // //                 spreadRadius: 1,
// // // //                 blurRadius: 3,
// // // //                 offset: const Offset(0, 2))
// // // //           ]),
// // // //       child: TableCalendar(
// // // //         firstDay: DateTime.now(),
// // // //         lastDay: DateTime.now().add(const Duration(days: 365 * 2)),
// // // //         focusedDay: _focusedDay,
// // // //         rangeStartDay: _rangeStart,
// // // //         rangeEndDay: _rangeEnd,
// // // //         calendarFormat: CalendarFormat.month,
// // // //         rangeSelectionMode: RangeSelectionMode.toggledOn,
// // // //         headerStyle: const HeaderStyle(
// // // //             titleTextStyle:
// // // //                 TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
// // // //             formatButtonVisible: false,
// // // //             titleCentered: true),
// // // //         calendarStyle: CalendarStyle(
// // // //           selectedDecoration: const BoxDecoration(
// // // //               color: Color(0xFF4E7D96), shape: BoxShape.circle),
// // // //           rangeStartDecoration: const BoxDecoration(
// // // //               color: Color(0xFF4E7D96), shape: BoxShape.circle),
// // // //           rangeEndDecoration: const BoxDecoration(
// // // //               color: Color(0xFF4E7D96), shape: BoxShape.circle),
// // // //           rangeHighlightColor: const Color(0xFF4E7D96).withOpacity(0.2),
// // // //           todayDecoration: BoxDecoration(
// // // //               color: const Color(0xFFADD8E6).withOpacity(0.6),
// // // //               shape: BoxShape.circle),
// // // //           outsideDaysVisible: false,
// // // //         ),
// // // //         onRangeSelected: (start, end, focusedDay) {
// // // //           setState(() {
// // // //             _rangeStart = start;
// // // //             _rangeEnd = end;
// // // //             _focusedDay = focusedDay;
// // // //             if (end != null) {
// // // //               showCalendar = false;
// // // //             }
// // // //           });
// // // //         },
// // // //         onDaySelected: (selectedDay, focusedDay) {
// // // //           if (!isSameDay(_rangeStart, selectedDay)) {
// // // //             setState(() {
// // // //               _rangeStart = selectedDay;
// // // //               _rangeEnd = null;
// // // //               _focusedDay = focusedDay;
// // // //               // Keep calendar open to select end date
// // // //               _toggleCalendar();
// // // //               _toggleCalendar();
// // // //             });
// // // //           }
// // // //         },
// // // //       ),
// // // //     );
// // // //   }

// // // //   InputDecoration _inputDecoration(
// // // //           {required String hintText, required IconData icon}) =>
// // // //       InputDecoration(
// // // //           hintText: hintText,
// // // //           hintStyle: TextStyle(color: Colors.grey[600]),
// // // //           prefixIcon: Icon(icon, color: Colors.grey, size: 20),
// // // //           filled: true,
// // // //           fillColor: const Color(0xFFEEEEEE),
// // // //           border: OutlineInputBorder(
// // // //               borderRadius: BorderRadius.circular(8),
// // // //               borderSide: BorderSide.none),
// // // //           contentPadding:
// // // //               const EdgeInsets.symmetric(horizontal: 16, vertical: 14));
// // // //   BoxDecoration _inputBoxDecoration() => BoxDecoration(
// // // //       color: const Color(0xFFEEEEEE), borderRadius: BorderRadius.circular(8));

// // // //   Widget _buildTopTab(IconData icon, String label, String tabKey) {
// // // //     final isSelected = selectedTopTab == tabKey;
// // // //     return GestureDetector(
// // // //       onTap: () {
// // // //         if (isSelected) return;
// // // //         Widget? destinationScreen;
// // // //         switch (tabKey) {
// // // //           case 'Hotels':
// // // //             destinationScreen = const HotelsSearchScreen();
// // // //             break;
// // // //           case 'Car Rental':
// // // //             destinationScreen = const CarRentalScreen();
// // // //             break;
// // // //           case 'Taxi':
// // // //             destinationScreen = const TaxiSearchScreen();
// // // //             break;
// // // //           default:
// // // //             setState(() => selectedTopTab = tabKey);
// // // //         }
// // // //         if (destinationScreen != null) {
// // // //           Navigator.pushReplacement(
// // // //             context,
// // // //             // --- التصحيح هنا بإضافة "!" ---
// // // //             MaterialPageRoute(builder: (context) => destinationScreen!),
// // // //           );
// // // //         }
// // // //       },
// // // //       child: Container(
// // // //         margin: const EdgeInsets.symmetric(horizontal: 2),
// // // //         padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
// // // //         decoration: BoxDecoration(
// // // //             color: isSelected ? const Color(0xFF4E7D96) : Colors.transparent,
// // // //             borderRadius: BorderRadius.circular(8)),
// // // //         child: Row(
// // // //           mainAxisAlignment: MainAxisAlignment.center,
// // // //           children: [
// // // //             Icon(icon,
// // // //                 color: isSelected ? Colors.white : Colors.grey[600], size: 18),
// // // //             if (isSelected) ...[
// // // //               const SizedBox(width: 5),
// // // //               Flexible(
// // // //                   child: Text(label,
// // // //                       style: const TextStyle(
// // // //                           color: Colors.white,
// // // //                           fontWeight: FontWeight.w500,
// // // //                           fontSize: 12),
// // // //                       overflow: TextOverflow.ellipsis,
// // // //                       maxLines: 1)),
// // // //             ],
// // // //           ],
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }

// // // //   Widget _buildPassengerCountersView() {
// // // //     return Container(
// // // //       margin: const EdgeInsets.only(top: 8),
// // // //       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
// // // //       decoration: BoxDecoration(
// // // //           color: const Color(0xFFEEEEEE),
// // // //           borderRadius: BorderRadius.circular(8)),
// // // //       child: Column(
// // // //         children: [
// // // //           _buildPassengerCounter('Adults', adultCount,
// // // //               (val) => setState(() => adultCount = val), 1),
// // // //           const SizedBox(height: 10),
// // // //           _buildPassengerCounter('Children', childCount,
// // // //               (val) => setState(() => childCount = val), 0),
// // // //         ],
// // // //       ),
// // // //     );
// // // //   }

// // // //   Widget _buildPassengerCounter(
// // // //       String label, int count, ValueChanged<int> onChanged, int minValue) {
// // // //     bool canDecrease = count > minValue;
// // // //     return Row(
// // // //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // //       children: [
// // // //         Text(label, style: const TextStyle(fontSize: 16, color: Colors.black)),
// // // //         Container(
// // // //           padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
// // // //           decoration: BoxDecoration(
// // // //               color: Colors.white,
// // // //               borderRadius: BorderRadius.circular(6),
// // // //               border: Border.all(color: Colors.grey[300]!)),
// // // //           child: Row(
// // // //             children: [
// // // //               InkWell(
// // // //                   onTap: canDecrease ? () => onChanged(count - 1) : null,
// // // //                   child: Padding(
// // // //                       padding: const EdgeInsets.all(6.0),
// // // //                       child: Icon(Icons.remove,
// // // //                           size: 20,
// // // //                           color: canDecrease
// // // //                               ? Colors.black54
// // // //                               : Colors.grey[300]))),
// // // //               SizedBox(
// // // //                   width: 30,
// // // //                   child: Text('$count',
// // // //                       textAlign: TextAlign.center,
// // // //                       style: const TextStyle(
// // // //                           fontSize: 16, fontWeight: FontWeight.bold))),
// // // //               InkWell(
// // // //                   onTap: () => onChanged(count + 1),
// // // //                   child: const Padding(
// // // //                       padding: const EdgeInsets.all(6.0),
// // // //                       child: Icon(Icons.add, size: 20, color: Colors.black54))),
// // // //             ],
// // // //           ),
// // // //         ),
// // // //       ],
// // // //     );
// // // //   }

// // // //   Widget _buildCategoryChipsView() {
// // // //     return Row(
// // // //       mainAxisAlignment: MainAxisAlignment.spaceAround,
// // // //       children: ['Economy', 'Business', 'First class']
// // // //           .map((c) => _buildCategoryChip(c))
// // // //           .toList(),
// // // //     );
// // // //   }

// // // //   Widget _buildCategoryChip(String category) {
// // // //     final isSelected = selectedCategory == category;
// // // //     return ChoiceChip(
// // // //       label: Text(category,
// // // //           style: TextStyle(
// // // //               color: isSelected ? Colors.white : const Color(0xFF4E7D96),
// // // //               fontSize: 13,
// // // //               fontWeight: isSelected ? FontWeight.bold : FontWeight.normal)),
// // // //       selected: isSelected,
// // // //       selectedColor: const Color(0xFF4E7D96),
// // // //       backgroundColor: Colors.white,
// // // //       side: isSelected ? BorderSide.none : BorderSide(color: Colors.grey[300]!),
// // // //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
// // // //       padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
// // // //       onSelected: (bool selected) {
// // // //         if (selected) setState(() => selectedCategory = category);
// // // //       },
// // // //     );
// // // //   }
// // // // }
// // // import 'package:flutter/material.dart';
// // // import 'package:table_calendar/table_calendar.dart';
// // // import 'package:intl/intl.dart';
// // // import 'package:travella/screens/FlightResultsScreen.dart';
// // // import 'hotels_search_screen.dart';
// // // import 'car_rental_screen.dart';
// // // import 'taxi_search_screen.dart';

// // // class FlightsScreen extends StatefulWidget {
// // //   const FlightsScreen({super.key});
// // //   @override
// // //   State<FlightsScreen> createState() => _FlightsScreenState();
// // // }

// // // class _FlightsScreenState extends State<FlightsScreen> {
// // //   String selectedTopTab = 'Flights';
// // //   String selectedCategory = 'Economy';
// // //   DateTime? _rangeStart;
// // //   DateTime? _rangeEnd;
// // //   DateTime _focusedDay = DateTime.now();
// // //   int adultCount = 2;
// // //   int childCount = 1;
// // //   final TextEditingController _originController =
// // //       TextEditingController(text: 'Cairo');
// // //   final TextEditingController _destinationController =
// // //       TextEditingController(text: 'London');

// // //   bool showCalendar = false;
// // //   bool showCategories = false;
// // //   bool showPassengers = false;

// // //   String get passengersText {
// // //     if (showPassengers) return 'Select Number of Passengers';
// // //     return 'Adult: $adultCount, Child: $childCount';
// // //   }

// // //   String get datesText {
// // //     if (_rangeStart == null) return 'Select Departure & Return Dates';
// // //     if (_rangeEnd == null)
// // //       return 'Departure: ${DateFormat('d/M/yyyy').format(_rangeStart!)}';
// // //     return '${DateFormat('d/M/yyyy').format(_rangeStart!)} - ${DateFormat('d/M/yyyy').format(_rangeEnd!)}';
// // //   }

// // //   @override
// // //   void dispose() {
// // //     _originController.dispose();
// // //     _destinationController.dispose();
// // //     super.dispose();
// // //   }

// // //   void _toggleCalendar() => setState(() {
// // //         showCalendar = !showCalendar;
// // //         showPassengers = false;
// // //         showCategories = false;
// // //       });
// // //   void _togglePassengers() => setState(() {
// // //         showPassengers = !showPassengers;
// // //         showCalendar = false;
// // //         showCategories = false;
// // //       });
// // //   void _toggleCategories() => setState(() {
// // //         showCategories = !showCategories;
// // //         showCalendar = false;
// // //         showPassengers = false;
// // //       });

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       backgroundColor: Colors.white,
// // //       body: SafeArea(
// // //         child: SingleChildScrollView(
// // //           padding: const EdgeInsets.all(16.0),
// // //           child: Column(
// // //             children: [
// // //               Row(children: [
// // //                 IconButton(
// // //                     icon: const Icon(Icons.arrow_back, color: Colors.black),
// // //                     onPressed: () => Navigator.pop(context),
// // //                     constraints: const BoxConstraints(),
// // //                     padding: EdgeInsets.zero)
// // //               ]),
// // //               const SizedBox(height: 15),
// // //               Container(
// // //                 padding: const EdgeInsets.all(4),
// // //                 height: 45,
// // //                 decoration: BoxDecoration(
// // //                     color: const Color(0xFFF0F0F0),
// // //                     borderRadius: BorderRadius.circular(10)),
// // //                 child: Row(children: [
// // //                   Expanded(
// // //                       child: _buildTopTab(
// // //                           Icons.flight_takeoff, 'Flights', 'Flights')),
// // //                   Expanded(
// // //                       child: _buildTopTab(Icons.hotel, 'Hotels', 'Hotels')),
// // //                   Expanded(
// // //                       child: _buildTopTab(
// // //                           Icons.directions_car, 'Car Rental', 'Car Rental')),
// // //                   Expanded(
// // //                       child: _buildTopTab(Icons.local_taxi, 'Taxi', 'Taxi')),
// // //                 ]),
// // //               ),
// // //               const SizedBox(height: 24),
// // //               // From Input
// // //               TextField(
// // //                 controller: _originController,
// // //                 decoration: _inputDecoration(
// // //                     hintText: 'From', icon: Icons.flight_takeoff),
// // //                 style: const TextStyle(color: Colors.black, fontSize: 16),
// // //               ),
// // //               const SizedBox(height: 12),
// // //               // To Input
// // //               TextField(
// // //                 controller: _destinationController,
// // //                 decoration:
// // //                     _inputDecoration(hintText: 'To', icon: Icons.flight_land),
// // //                 style: const TextStyle(color: Colors.black, fontSize: 16),
// // //               ),
// // //               const SizedBox(height: 12),
// // //               GestureDetector(
// // //                 onTap: _toggleCalendar,
// // //                 child: Container(
// // //                   padding:
// // //                       const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
// // //                   decoration: _inputBoxDecoration(),
// // //                   child: Row(children: [
// // //                     const Icon(Icons.calendar_today,
// // //                         color: Colors.grey, size: 20),
// // //                     const SizedBox(width: 12),
// // //                     Expanded(
// // //                         child: Text(datesText,
// // //                             style: TextStyle(
// // //                                 color: _rangeStart != null
// // //                                     ? Colors.black
// // //                                     : Colors.grey[600],
// // //                                 fontSize: 16))),
// // //                     Icon(
// // //                         showCalendar
// // //                             ? Icons.keyboard_arrow_up
// // //                             : Icons.keyboard_arrow_down,
// // //                         color: Colors.grey[600]),
// // //                   ]),
// // //                 ),
// // //               ),
// // //               if (showCalendar) _buildCalendarView(),
// // //               const SizedBox(height: 12),
// // //               GestureDetector(
// // //                 onTap: _togglePassengers,
// // //                 child: Container(
// // //                   padding:
// // //                       const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
// // //                   decoration: _inputBoxDecoration(),
// // //                   child: Row(children: [
// // //                     const Icon(Icons.person_outline,
// // //                         color: Colors.grey, size: 20),
// // //                     const SizedBox(width: 12),
// // //                     Expanded(
// // //                         child: Text(passengersText,
// // //                             style: TextStyle(
// // //                                 color: showPassengers
// // //                                     ? Colors.grey[600]
// // //                                     : Colors.black,
// // //                                 fontSize: 16))),
// // //                     Icon(
// // //                         showPassengers
// // //                             ? Icons.keyboard_arrow_up
// // //                             : Icons.keyboard_arrow_down,
// // //                         color: Colors.grey[600]),
// // //                   ]),
// // //                 ),
// // //               ),
// // //               if (showPassengers) _buildPassengerCountersView(),
// // //               const SizedBox(height: 12),
// // //               GestureDetector(
// // //                 onTap: _toggleCategories,
// // //                 child: Container(
// // //                   padding:
// // //                       const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
// // //                   decoration: _inputBoxDecoration(),
// // //                   child: Column(
// // //                     crossAxisAlignment: CrossAxisAlignment.start,
// // //                     children: [
// // //                       Row(children: [
// // //                         const Icon(Icons.flight_class_outlined,
// // //                             color: Colors.grey, size: 20),
// // //                         const SizedBox(width: 12),
// // //                         Expanded(
// // //                             child: Text(
// // //                                 showCategories
// // //                                     ? 'Select Flight Class'
// // //                                     : selectedCategory,
// // //                                 style: TextStyle(
// // //                                     color: showCategories
// // //                                         ? Colors.grey[600]
// // //                                         : Colors.black,
// // //                                     fontSize: 16))),
// // //                         Icon(
// // //                             showCategories
// // //                                 ? Icons.keyboard_arrow_up
// // //                                 : Icons.keyboard_arrow_down,
// // //                             color: Colors.grey[600]),
// // //                       ]),
// // //                       if (showCategories) ...[
// // //                         const SizedBox(height: 12),
// // //                         Divider(color: Colors.grey[300], height: 1),
// // //                         const SizedBox(height: 12),
// // //                         _buildCategoryChipsView(),
// // //                       ],
// // //                     ],
// // //                   ),
// // //                 ),
// // //               ),
// // //               const SizedBox(height: 40),
// // //               SizedBox(
// // //                 width: double.infinity,
// // //                 child: ElevatedButton(
// // //                   onPressed: () {
// // //                     if (_originController.text.isNotEmpty &&
// // //                         _destinationController.text.isNotEmpty &&
// // //                         _rangeStart != null &&
// // //                         _rangeEnd != null) {
// // //                       Navigator.push(
// // //                         context,
// // //                         MaterialPageRoute(
// // //                           builder: (context) => FlightResultsScreen(
// // //                             destination: _destinationController.text,
// // //                             origin: _originController.text,
// // //                             departureDate: _rangeStart!,
// // //                             returnDate: _rangeEnd!,
// // //                             adults: adultCount,
// // //                             children: childCount,
// // //                             category: selectedCategory,
// // //                             date: 0, // غير مستخدم، يمكن حذفه
// // //                           ),
// // //                         ),
// // //                       );
// // //                     } else {
// // //                       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
// // //                           content: Text(
// // //                               'Please fill all fields, including return date')));
// // //                     }
// // //                   },
// // //                   style: ElevatedButton.styleFrom(
// // //                       backgroundColor: const Color(0xFF4E7D96),
// // //                       padding: const EdgeInsets.symmetric(vertical: 16),
// // //                       shape: RoundedRectangleBorder(
// // //                           borderRadius: BorderRadius.circular(12))),
// // //                   child: const Text('Search Flights',
// // //                       style: TextStyle(
// // //                           fontSize: 18,
// // //                           fontWeight: FontWeight.bold,
// // //                           color: Colors.white)),
// // //                 ),
// // //               ),
// // //             ],
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }

// // //   Widget _buildCalendarView() {
// // //     return Container(
// // //       margin: const EdgeInsets.only(top: 8),
// // //       decoration: BoxDecoration(
// // //           color: Colors.white,
// // //           borderRadius: BorderRadius.circular(8),
// // //           boxShadow: [
// // //             BoxShadow(
// // //                 color: Colors.grey.withOpacity(0.2),
// // //                 spreadRadius: 1,
// // //                 blurRadius: 3,
// // //                 offset: const Offset(0, 2))
// // //           ]),
// // //       child: TableCalendar(
// // //         firstDay: DateTime.now(),
// // //         lastDay: DateTime.now().add(const Duration(days: 365 * 2)),
// // //         focusedDay: _focusedDay,
// // //         rangeStartDay: _rangeStart,
// // //         rangeEndDay: _rangeEnd,
// // //         calendarFormat: CalendarFormat.month,
// // //         rangeSelectionMode: RangeSelectionMode.toggledOn,
// // //         headerStyle: const HeaderStyle(
// // //             titleTextStyle:
// // //                 TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
// // //             formatButtonVisible: false,
// // //             titleCentered: true),
// // //         calendarStyle: CalendarStyle(
// // //           selectedDecoration: const BoxDecoration(
// // //               color: Color(0xFF4E7D96), shape: BoxShape.circle),
// // //           rangeStartDecoration: const BoxDecoration(
// // //               color: Color(0xFF4E7D96), shape: BoxShape.circle),
// // //           rangeEndDecoration: const BoxDecoration(
// // //               color: Color(0xFF4E7D96), shape: BoxShape.circle),
// // //           rangeHighlightColor: const Color(0xFF4E7D96).withOpacity(0.2),
// // //           todayDecoration: BoxDecoration(
// // //               color: const Color(0xFFADD8E6).withOpacity(0.6),
// // //               shape: BoxShape.circle),
// // //           outsideDaysVisible: false,
// // //         ),
// // //         onRangeSelected: (start, end, focusedDay) {
// // //           setState(() {
// // //             _rangeStart = start;
// // //             _rangeEnd = end;
// // //             _focusedDay = focusedDay;
// // //             if (end != null) {
// // //               showCalendar = false;
// // //             }
// // //           });
// // //         },
// // //         onDaySelected: (selectedDay, focusedDay) {
// // //           if (!isSameDay(_rangeStart, selectedDay)) {
// // //             setState(() {
// // //               _rangeStart = selectedDay;
// // //               _rangeEnd = null;
// // //               _focusedDay = focusedDay;
// // //               // Keep calendar open to select end date
// // //               _toggleCalendar();
// // //               _toggleCalendar();
// // //             });
// // //           }
// // //         },
// // //       ),
// // //     );
// // //   }

// // //   InputDecoration _inputDecoration(
// // //           {required String hintText, required IconData icon}) =>
// // //       InputDecoration(
// // //           hintText: hintText,
// // //           hintStyle: TextStyle(color: Colors.grey[600]),
// // //           prefixIcon: Icon(icon, color: Colors.grey, size: 20),
// // //           filled: true,
// // //           fillColor: const Color(0xFFEEEEEE),
// // //           border: OutlineInputBorder(
// // //               borderRadius: BorderRadius.circular(8),
// // //               borderSide: BorderSide.none),
// // //           contentPadding:
// // //               const EdgeInsets.symmetric(horizontal: 16, vertical: 14));
// // //   BoxDecoration _inputBoxDecoration() => BoxDecoration(
// // //       color: const Color(0xFFEEEEEE), borderRadius: BorderRadius.circular(8));

// // //   Widget _buildTopTab(IconData icon, String label, String tabKey) {
// // //     final isSelected = selectedTopTab == tabKey;
// // //     return GestureDetector(
// // //       onTap: () {
// // //         if (isSelected) return;
// // //         Widget? destinationScreen;
// // //         switch (tabKey) {
// // //           case 'Hotels':
// // //             destinationScreen = const HotelsSearchScreen();
// // //             break;
// // //           case 'Car Rental':
// // //             destinationScreen = const CarRentalScreen();
// // //             break;
// // //           case 'Taxi':
// // //             destinationScreen = const TaxiSearchScreen();
// // //             break;
// // //           default:
// // //             setState(() => selectedTopTab = tabKey);
// // //         }
// // //         if (destinationScreen != null) {
// // //           Navigator.pushReplacement(
// // //             context,
// // //             MaterialPageRoute(builder: (context) => destinationScreen!),
// // //           );
// // //         }
// // //       },
// // //       child: Container(
// // //         margin: const EdgeInsets.symmetric(horizontal: 2),
// // //         padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
// // //         decoration: BoxDecoration(
// // //             color: isSelected ? const Color(0xFF4E7D96) : Colors.transparent,
// // //             borderRadius: BorderRadius.circular(8)),
// // //         child: Row(
// // //           mainAxisAlignment: MainAxisAlignment.center,
// // //           children: [
// // //             Icon(icon,
// // //                 color: isSelected ? Colors.white : Colors.grey[600], size: 18),
// // //             if (isSelected) ...[
// // //               const SizedBox(width: 5),
// // //               Flexible(
// // //                   child: Text(label,
// // //                       style: const TextStyle(
// // //                           color: Colors.white,
// // //                           fontWeight: FontWeight.w500,
// // //                           fontSize: 12),
// // //                       overflow: TextOverflow.ellipsis,
// // //                       maxLines: 1)),
// // //             ],
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }

// // //   Widget _buildPassengerCountersView() {
// // //     return Container(
// // //       margin: const EdgeInsets.only(top: 8),
// // //       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
// // //       decoration: BoxDecoration(
// // //           color: const Color(0xFFEEEEEE),
// // //           borderRadius: BorderRadius.circular(8)),
// // //       child: Column(
// // //         children: [
// // //           _buildPassengerCounter('Adults', adultCount,
// // //               (val) => setState(() => adultCount = val), 1),
// // //           const SizedBox(height: 10),
// // //           _buildPassengerCounter('Children', childCount,
// // //               (val) => setState(() => childCount = val), 0),
// // //         ],
// // //       ),
// // //     );
// // //   }

// // //   Widget _buildPassengerCounter(
// // //       String label, int count, ValueChanged<int> onChanged, int minValue) {
// // //     bool canDecrease = count > minValue;
// // //     return Row(
// // //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // //       children: [
// // //         Text(label, style: const TextStyle(fontSize: 16, color: Colors.black)),
// // //         Container(
// // //           padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
// // //           decoration: BoxDecoration(
// // //               color: Colors.white,
// // //               borderRadius: BorderRadius.circular(6),
// // //               border: Border.all(color: Colors.grey[300]!)),
// // //           child: Row(
// // //             children: [
// // //               InkWell(
// // //                   onTap: canDecrease ? () => onChanged(count - 1) : null,
// // //                   child: Padding(
// // //                       padding: const EdgeInsets.all(6.0),
// // //                       child: Icon(Icons.remove,
// // //                           size: 20,
// // //                           color: canDecrease
// // //                               ? Colors.black54
// // //                               : Colors.grey[300]))),
// // //               SizedBox(
// // //                   width: 30,
// // //                   child: Text('$count',
// // //                       textAlign: TextAlign.center,
// // //                       style: const TextStyle(
// // //                           fontSize: 16, fontWeight: FontWeight.bold))),
// // //               InkWell(
// // //                   onTap: () => onChanged(count + 1),
// // //                   child: const Padding(
// // //                       padding: EdgeInsets.all(6.0),
// // //                       child: Icon(Icons.add, size: 20, color: Colors.black54))),
// // //             ],
// // //           ),
// // //         ),
// // //       ],
// // //     );
// // //   }

// // //   Widget _buildCategoryChipsView() {
// // //     return Row(
// // //       mainAxisAlignment: MainAxisAlignment.spaceAround,
// // //       children: ['Economy', 'Business', 'First class']
// // //           .map((c) => _buildCategoryChip(c))
// // //           .toList(),
// // //     );
// // //   }

// // //   Widget _buildCategoryChip(String category) {
// // //     final isSelected = selectedCategory == category;
// // //     return ChoiceChip(
// // //       label: Text(category,
// // //           style: TextStyle(
// // //               color: isSelected ? Colors.white : const Color(0xFF4E7D96),
// // //               fontSize: 13,
// // //               fontWeight: isSelected ? FontWeight.bold : FontWeight.normal)),
// // //       selected: isSelected,
// // //       selectedColor: const Color(0xFF4E7D96),
// // //       backgroundColor: Colors.white,
// // //       side: isSelected ? BorderSide.none : BorderSide(color: Colors.grey[300]!),
// // //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
// // //       padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
// // //       onSelected: (bool selected) {
// // //         if (selected) setState(() => selectedCategory = category);
// // //       },
// // //     );
// // //   }
// // // }
// // // lib/screens/flights_screen.dart

// // import 'package:flutter/material.dart';
// // import 'package:table_calendar/table_calendar.dart';
// // import 'package:intl/intl.dart';
// // import 'package:travella/screens/FlightResultsScreen.dart';
// // import 'hotels_search_screen.dart';
// // import 'car_rental_screen.dart';
// // import 'taxi_search_screen.dart';

// // class FlightsScreen extends StatefulWidget {
// //   const FlightsScreen({super.key});
// //   @override
// //   State<FlightsScreen> createState() => _FlightsScreenState();
// // }

// // class _FlightsScreenState extends State<FlightsScreen> {
// //   String selectedTopTab = 'Flights';
// //   String selectedCategory = 'Economy';
// //   DateTime? _rangeStart;
// //   DateTime? _rangeEnd;
// //   DateTime _focusedDay = DateTime.now();
// //   int adultCount = 2;
// //   int childCount = 1;
// //   final TextEditingController _originController =
// //       TextEditingController(text: 'Cairo');
// //   final TextEditingController _destinationController =
// //       TextEditingController(text: 'London');

// //   bool showCalendar = false;
// //   bool showCategories = false;
// //   bool showPassengers = false;

// //   String get passengersText {
// //     if (showPassengers) return 'Select Number of Passengers';
// //     return 'Adult: $adultCount, Child: $childCount';
// //   }

// //   String get datesText {
// //     if (_rangeStart == null) return 'Select Departure & Return Dates';
// //     if (_rangeEnd == null) {
// //       return 'Departure: ${DateFormat('d/M/yyyy').format(_rangeStart!)}';
// //     }
// //     return '${DateFormat('d/M/yyyy').format(_rangeStart!)} - ${DateFormat('d/M/yyyy').format(_rangeEnd!)}';
// //   }

// //   @override
// //   void dispose() {
// //     _originController.dispose();
// //     _destinationController.dispose();
// //     super.dispose();
// //   }

// //   void _toggleCalendar() => setState(() {
// //         showCalendar = !showCalendar;
// //         showPassengers = false;
// //         showCategories = false;
// //       });
// //   void _togglePassengers() => setState(() {
// //         showPassengers = !showPassengers;
// //         showCalendar = false;
// //         showCategories = false;
// //       });
// //   void _toggleCategories() => setState(() {
// //         showCategories = !showCategories;
// //         showCalendar = false;
// //         showPassengers = false;
// //       });

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.white,
// //       body: SafeArea(
// //         child: SingleChildScrollView(
// //           padding: const EdgeInsets.all(16.0),
// //           child: Column(
// //             children: [
// //               // Your UI remains the same here...
// //               Row(children: [
// //                 IconButton(
// //                     icon: const Icon(Icons.arrow_back, color: Colors.black),
// //                     onPressed: () => Navigator.pop(context),
// //                     constraints: const BoxConstraints(),
// //                     padding: EdgeInsets.zero)
// //               ]),
// //               const SizedBox(height: 15),
// //               Container(
// //                 padding: const EdgeInsets.all(4),
// //                 height: 45,
// //                 decoration: BoxDecoration(
// //                     color: const Color(0xFFF0F0F0),
// //                     borderRadius: BorderRadius.circular(10)),
// //                 child: Row(children: [
// //                   Expanded(
// //                       child: _buildTopTab(
// //                           Icons.flight_takeoff, 'Flights', 'Flights')),
// //                   Expanded(
// //                       child: _buildTopTab(Icons.hotel, 'Hotels', 'Hotels')),
// //                   Expanded(
// //                       child: _buildTopTab(
// //                           Icons.directions_car, 'Car Rental', 'Car Rental')),
// //                   Expanded(
// //                       child: _buildTopTab(Icons.local_taxi, 'Taxi', 'Taxi')),
// //                 ]),
// //               ),
// //               const SizedBox(height: 24),
// //               TextField(
// //                 controller: _originController,
// //                 decoration: _inputDecoration(
// //                     hintText: 'From', icon: Icons.flight_takeoff),
// //                 style: const TextStyle(color: Colors.black, fontSize: 16),
// //               ),
// //               const SizedBox(height: 12),
// //               TextField(
// //                 controller: _destinationController,
// //                 decoration:
// //                     _inputDecoration(hintText: 'To', icon: Icons.flight_land),
// //                 style: const TextStyle(color: Colors.black, fontSize: 16),
// //               ),
// //               const SizedBox(height: 12),
// //               GestureDetector(
// //                 onTap: _toggleCalendar,
// //                 child: Container(
// //                   padding:
// //                       const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
// //                   decoration: _inputBoxDecoration(),
// //                   child: Row(children: [
// //                     const Icon(Icons.calendar_today,
// //                         color: Colors.grey, size: 20),
// //                     const SizedBox(width: 12),
// //                     Expanded(
// //                         child: Text(datesText,
// //                             style: TextStyle(
// //                                 color: _rangeStart != null
// //                                     ? Colors.black
// //                                     : Colors.grey[600],
// //                                 fontSize: 16))),
// //                     Icon(
// //                         showCalendar
// //                             ? Icons.keyboard_arrow_up
// //                             : Icons.keyboard_arrow_down,
// //                         color: Colors.grey[600]),
// //                   ]),
// //                 ),
// //               ),
// //               if (showCalendar) _buildCalendarView(),
// //               const SizedBox(height: 12),
// //               GestureDetector(
// //                 onTap: _togglePassengers,
// //                 child: Container(
// //                   padding:
// //                       const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
// //                   decoration: _inputBoxDecoration(),
// //                   child: Row(children: [
// //                     const Icon(Icons.person_outline,
// //                         color: Colors.grey, size: 20),
// //                     const SizedBox(width: 12),
// //                     Expanded(
// //                         child: Text(passengersText,
// //                             style: TextStyle(
// //                                 color: showPassengers
// //                                     ? Colors.grey[600]
// //                                     : Colors.black,
// //                                 fontSize: 16))),
// //                     Icon(
// //                         showPassengers
// //                             ? Icons.keyboard_arrow_up
// //                             : Icons.keyboard_arrow_down,
// //                         color: Colors.grey[600]),
// //                   ]),
// //                 ),
// //               ),
// //               if (showPassengers) _buildPassengerCountersView(),
// //               const SizedBox(height: 12),
// //               GestureDetector(
// //                 onTap: _toggleCategories,
// //                 child: Container(
// //                   padding:
// //                       const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
// //                   decoration: _inputBoxDecoration(),
// //                   child: Column(
// //                     crossAxisAlignment: CrossAxisAlignment.start,
// //                     children: [
// //                       Row(children: [
// //                         const Icon(Icons.flight_class_outlined,
// //                             color: Colors.grey, size: 20),
// //                         const SizedBox(width: 12),
// //                         Expanded(
// //                             child: Text(
// //                                 showCategories
// //                                     ? 'Select Flight Class'
// //                                     : selectedCategory,
// //                                 style: TextStyle(
// //                                     color: showCategories
// //                                         ? Colors.grey[600]
// //                                         : Colors.black,
// //                                     fontSize: 16))),
// //                         Icon(
// //                             showCategories
// //                                 ? Icons.keyboard_arrow_up
// //                                 : Icons.keyboard_arrow_down,
// //                             color: Colors.grey[600]),
// //                       ]),
// //                       if (showCategories) ...[
// //                         const SizedBox(height: 12),
// //                         Divider(color: Colors.grey[300], height: 1),
// //                         const SizedBox(height: 12),
// //                         _buildCategoryChipsView(),
// //                       ],
// //                     ],
// //                   ),
// //                 ),
// //               ),
// //               const SizedBox(height: 40),
// //               SizedBox(
// //                 width: double.infinity,
// //                 child: ElevatedButton(
// //                   onPressed: () {
// //                     if (_originController.text.isNotEmpty &&
// //                         _destinationController.text.isNotEmpty &&
// //                         _rangeStart != null &&
// //                         _rangeEnd != null) {
// //                       Navigator.push(
// //                         context,
// //                         MaterialPageRoute(
// //                           builder: (context) => FlightResultsScreen(
// //                             destination: _destinationController.text,
// //                             origin: _originController.text,
// //                             departureDate: _rangeStart!,
// //                             returnDate: _rangeEnd!,
// //                             adults: adultCount,
// //                             children: childCount,
// //                             category: selectedCategory, date: 0,
// //                           ),
// //                         ),
// //                       );
// //                     } else {
// //                       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
// //                           content: Text(
// //                               'Please fill all fields, including return date')));
// //                     }
// //                   },
// //                   style: ElevatedButton.styleFrom(
// //                       backgroundColor: const Color(0xFF4E7D96),
// //                       padding: const EdgeInsets.symmetric(vertical: 16),
// //                       shape: RoundedRectangleBorder(
// //                           borderRadius: BorderRadius.circular(12))),
// //                   child: const Text('Search Flights',
// //                       style: TextStyle(
// //                           fontSize: 18,
// //                           fontWeight: FontWeight.bold,
// //                           color: Colors.white)),
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   // All your helper methods (_buildCalendarView, _buildTopTab, etc.) remain the same
// //   // No changes are needed in them. I'll include them for completeness.

// //   Widget _buildCalendarView() {
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
// //                 offset: const Offset(0, 2))
// //           ]),
// //       child: TableCalendar(
// //         firstDay: DateTime.now().subtract(const Duration(days: 30)),
// //         lastDay: DateTime.now().add(const Duration(days: 365 * 2)),
// //         focusedDay: _focusedDay,
// //         rangeStartDay: _rangeStart,
// //         rangeEndDay: _rangeEnd,
// //         calendarFormat: CalendarFormat.month,
// //         rangeSelectionMode: RangeSelectionMode.toggledOn,
// //         headerStyle: const HeaderStyle(
// //             titleTextStyle:
// //                 TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
// //             formatButtonVisible: false,
// //             titleCentered: true),
// //         calendarStyle: CalendarStyle(
// //           selectedDecoration: const BoxDecoration(
// //               color: Color(0xFF4E7D96), shape: BoxShape.circle),
// //           rangeStartDecoration: const BoxDecoration(
// //               color: Color(0xFF4E7D96), shape: BoxShape.circle),
// //           rangeEndDecoration: const BoxDecoration(
// //               color: Color(0xFF4E7D96), shape: BoxShape.circle),
// //           rangeHighlightColor: const Color(0xFF4E7D96).withOpacity(0.2),
// //           todayDecoration: BoxDecoration(
// //               color: const Color(0xFFADD8E6).withOpacity(0.6),
// //               shape: BoxShape.circle),
// //           outsideDaysVisible: false,
// //         ),
// //         onRangeSelected: (start, end, focusedDay) {
// //           setState(() {
// //             _rangeStart = start;
// //             _rangeEnd = end;
// //             _focusedDay = focusedDay;
// //             if (end != null) {
// //               showCalendar = false;
// //             }
// //           });
// //         },
// //         onDaySelected: (selectedDay, focusedDay) {
// //           if (!isSameDay(_rangeStart, selectedDay)) {
// //             setState(() {
// //               _rangeStart = selectedDay;
// //               _rangeEnd = null;
// //               _focusedDay = focusedDay;
// //             });
// //           }
// //         },
// //       ),
// //     );
// //   }

// //   InputDecoration _inputDecoration(
// //           {required String hintText, required IconData icon}) =>
// //       InputDecoration(
// //           hintText: hintText,
// //           hintStyle: TextStyle(color: Colors.grey[600]),
// //           prefixIcon: Icon(icon, color: Colors.grey, size: 20),
// //           filled: true,
// //           fillColor: const Color(0xFFEEEEEE),
// //           border: OutlineInputBorder(
// //               borderRadius: BorderRadius.circular(8),
// //               borderSide: BorderSide.none),
// //           contentPadding:
// //               const EdgeInsets.symmetric(horizontal: 16, vertical: 14));
// //   BoxDecoration _inputBoxDecoration() => BoxDecoration(
// //       color: const Color(0xFFEEEEEE), borderRadius: BorderRadius.circular(8));

// //   Widget _buildTopTab(IconData icon, String label, String tabKey) {
// //     final isSelected = selectedTopTab == tabKey;
// //     return GestureDetector(
// //       onTap: () {
// //         if (isSelected) return;
// //         Widget? destinationScreen;
// //         switch (tabKey) {
// //           case 'Hotels':
// //             destinationScreen = const HotelsSearchScreen();
// //             break;
// //           case 'Car Rental':
// //             destinationScreen = const CarRentalScreen();
// //             break;
// //           case 'Taxi':
// //             destinationScreen = const TaxiSearchScreen();
// //             break;
// //           default:
// //             setState(() => selectedTopTab = tabKey);
// //         }
// //         if (destinationScreen != null) {
// //           Navigator.pushReplacement(
// //             context,
// //             MaterialPageRoute(builder: (context) => destinationScreen!),
// //           );
// //         }
// //       },
// //       child: Container(
// //         margin: const EdgeInsets.symmetric(horizontal: 2),
// //         padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
// //         decoration: BoxDecoration(
// //             color: isSelected ? const Color(0xFF4E7D96) : Colors.transparent,
// //             borderRadius: BorderRadius.circular(8)),
// //         child: Row(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             Icon(icon,
// //                 color: isSelected ? Colors.white : Colors.grey[600], size: 18),
// //             if (isSelected) ...[
// //               const SizedBox(width: 5),
// //               Flexible(
// //                   child: Text(label,
// //                       style: const TextStyle(
// //                           color: Colors.white,
// //                           fontWeight: FontWeight.w500,
// //                           fontSize: 12),
// //                       overflow: TextOverflow.ellipsis,
// //                       maxLines: 1)),
// //             ],
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   Widget _buildPassengerCountersView() {
// //     return Container(
// //       margin: const EdgeInsets.only(top: 8),
// //       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
// //       decoration: BoxDecoration(
// //           color: const Color(0xFFEEEEEE),
// //           borderRadius: BorderRadius.circular(8)),
// //       child: Column(
// //         children: [
// //           _buildPassengerCounter('Adults', adultCount,
// //               (val) => setState(() => adultCount = val), 1),
// //           const SizedBox(height: 10),
// //           _buildPassengerCounter('Children', childCount,
// //               (val) => setState(() => childCount = val), 0),
// //         ],
// //       ),
// //     );
// //   }

// //   Widget _buildPassengerCounter(
// //       String label, int count, ValueChanged<int> onChanged, int minValue) {
// //     bool canDecrease = count > minValue;
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
// //             children: [
// //               InkWell(
// //                   onTap: canDecrease ? () => onChanged(count - 1) : null,
// //                   child: Padding(
// //                       padding: const EdgeInsets.all(6.0),
// //                       child: Icon(Icons.remove,
// //                           size: 20,
// //                           color: canDecrease
// //                               ? Colors.black54
// //                               : Colors.grey[300]))),
// //               SizedBox(
// //                   width: 30,
// //                   child: Text('$count',
// //                       textAlign: TextAlign.center,
// //                       style: const TextStyle(
// //                           fontSize: 16, fontWeight: FontWeight.bold))),
// //               InkWell(
// //                   onTap: () => onChanged(count + 1),
// //                   child: const Padding(
// //                       padding: EdgeInsets.all(6.0),
// //                       child: Icon(Icons.add, size: 20, color: Colors.black54))),
// //             ],
// //           ),
// //         ),
// //       ],
// //     );
// //   }

// //   Widget _buildCategoryChipsView() {
// //     return Row(
// //       mainAxisAlignment: MainAxisAlignment.spaceAround,
// //       children: ['Economy', 'Business', 'First Class']
// //           .map((c) => _buildCategoryChip(c))
// //           .toList(),
// //     );
// //   }

// //   Widget _buildCategoryChip(String category) {
// //     final isSelected = selectedCategory == category;
// //     return ChoiceChip(
// //       label: Text(category,
// //           style: TextStyle(
// //               color: isSelected ? Colors.white : const Color(0xFF4E7D96),
// //               fontSize: 13,
// //               fontWeight: isSelected ? FontWeight.bold : FontWeight.normal)),
// //       selected: isSelected,
// //       selectedColor: const Color(0xFF4E7D96),
// //       backgroundColor: Colors.white,
// //       side: isSelected ? BorderSide.none : BorderSide(color: Colors.grey[300]!),
// //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
// //       padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
// //       onSelected: (bool selected) {
// //         if (selected) setState(() => selectedCategory = category);
// //       },
// //     );
// //   }
// // // }
// // import 'package:flutter/material.dart';
// // import 'package:table_calendar/table_calendar.dart';
// // import 'package:intl/intl.dart';

// // // --- استيراد الشاشات والخدمات ---
// // import 'FlightResultsScreen.dart';
// // import 'hotels_search_screen.dart';
// // import 'car_rental_screen.dart';
// // import 'taxi_search_screen.dart';
// // import '../services/api_service.dart'; // <-- استيراد خدمة الـ API
// // import '../models/api_flight.dart'; // <-- استيراد نموذج الـ API

// // // --- شاشة الرحلات ---
// // class FlightsScreen extends StatefulWidget {
// //   const FlightsScreen({super.key});

// //   @override
// //   State<FlightsScreen> createState() => _FlightsScreenState();
// // }

// // class _FlightsScreenState extends State<FlightsScreen> {
// //   // --- متغيرات الحالة ---
// //   String selectedTopTab = 'Flights';
// //   String selectedCategory = 'Economy';
// //   DateTime? selectedDate;
// //   int adultCount = 2;
// //   int childCount = 1;
// //   final TextEditingController _destinationController = TextEditingController();
// //   final TextEditingController _originController =
// //       TextEditingController(text: "Cairo"); // حقل جديد للمنطلق

// //   bool showCalendar = false;
// //   bool showCategories = false;
// //   bool showPassengers = false;
// //   bool _isLoading = false; // <-- متغير لتتبع حالة التحميل
// //   final ApiService _apiService = ApiService(); // <-- إنشاء نسخة من خدمة الـ API

// //   String get passengersText {
// //     if (showPassengers) {
// //       return 'Select Number of Passengers';
// //     } else {
// //       return 'Adult: $adultCount, Child: $childCount';
// //     }
// //   }

// //   @override
// //   void dispose() {
// //     _destinationController.dispose();
// //     _originController.dispose();
// //     super.dispose();
// //   }

// //   // --- دوال تبديل العرض ---
// //   void _toggleCalendar() {
// //     setState(() {
// //       showCalendar = !showCalendar;
// //       showPassengers = false;
// //       showCategories = false;
// //     });
// //   }

// //   void _togglePassengers() {
// //     setState(() {
// //       showPassengers = !showPassengers;
// //       showCalendar = false;
// //       showCategories = false;
// //     });
// //   }

// //   void _toggleCategories() {
// //     setState(() {
// //       showCategories = !showCategories;
// //       showCalendar = false;
// //       showPassengers = false;
// //     });
// //   }

// //   // --- دالة البحث واستدعاء الـ API ---
// //   void _handleSearch() async {
// //     // التحقق من صحة المدخلات
// //     if (_originController.text.isEmpty ||
// //         _destinationController.text.isEmpty ||
// //         selectedDate == null) {
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         const SnackBar(
// //             content:
// //                 Text('Please fill all fields: Origin, Destination, and Date')),
// //       );
// //       return;
// //     }

// //     setState(() {
// //       _isLoading = true; // بدء التحميل
// //     });

// //     try {
// //       // استدعاء الـ API
// //       final List<ApiFlight> apiFlights = await _apiService.searchFlights(
// //         from: _originController.text,
// //         to: _destinationController.text,
// //         departureDate: selectedDate!,
// //         category: selectedCategory,
// //         adults: adultCount,
// //         children: childCount,
// //       );

// //       // تحويل نتائج الـ API إلى نموذج العرض (FlightData)
// //       final List<FlightData> flightDataList = apiFlights
// //           .map((apiFlight) => FlightData.fromApiFlight(apiFlight))
// //           .toList();

// //       // الانتقال إلى شاشة النتائج مع تمرير البيانات الحقيقية
// //       Navigator.push(
// //         context,
// //         MaterialPageRoute(
// //           builder: (context) => FlightResultsScreen(
// //             initialFlights: flightDataList, // <-- تمرير البيانات الحقيقية
// //             destination: _destinationController.text,
// //             origin: _originController.text,
// //             date: DateFormat('EEE, d MMM yy').format(selectedDate!),
// //             adults: adultCount,
// //             children: childCount,
// //             category: selectedCategory,
// //           ),
// //         ),
// //       );
// //     } catch (e) {
// //       // إظهار رسالة خطأ في حالة فشل الطلب
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         SnackBar(content: Text('Error: ${e.toString()}')),
// //       );
// //     } finally {
// //       setState(() {
// //         _isLoading = false; // إيقاف التحميل
// //       });
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.white,
// //       body: SafeArea(
// //         child: SingleChildScrollView(
// //           child: Padding(
// //             padding: const EdgeInsets.all(16.0),
// //             child: Column(
// //               children: [
// //                 // ... (نفس ودجت سهم الرجوع والتبويبات العلوية)
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

// //                 Container(
// //                   padding: const EdgeInsets.all(4),
// //                   height: 45,
// //                   decoration: BoxDecoration(
// //                     color: const Color(0xFFF0F0F0),
// //                     borderRadius: BorderRadius.circular(10),
// //                   ),
// //                   child: Row(
// //                     children: [
// //                       Expanded(
// //                           child: _buildTopTab(
// //                               Icons.flight_takeoff, 'Flights', 'Flights')),
// //                       Expanded(
// //                           child: _buildTopTab(Icons.hotel, 'Hotels', 'Hotels')),
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
// //                 // --- نهاية الأجزاء غير المتغيرة ---

// //                 // حقل مكان الانطلاق
// //                 TextField(
// //                   controller: _originController,
// //                   decoration: _inputDecoration(
// //                       hintText: 'From', icon: Icons.flight_takeoff),
// //                   style: const TextStyle(color: Colors.black, fontSize: 16),
// //                 ),
// //                 const SizedBox(height: 12),

// //                 // حقل البحث عن الوجهة
// //                 TextField(
// //                   controller: _destinationController,
// //                   decoration:
// //                       _inputDecoration(hintText: 'To', icon: Icons.flight_land),
// //                   style: const TextStyle(color: Colors.black, fontSize: 16),
// //                 ),
// //                 const SizedBox(height: 12),

// //                 // ... (نفس ودجتات اختيار التاريخ والركاب والفئة)
// //                 GestureDetector(
// //                   onTap: _toggleCalendar,
// //                   child: Container(
// //                     padding: const EdgeInsets.symmetric(
// //                         horizontal: 16, vertical: 14),
// //                     decoration: _inputBoxDecoration(),
// //                     child: Row(
// //                       children: [
// //                         const Icon(Icons.calendar_today,
// //                             color: Colors.grey, size: 20),
// //                         const SizedBox(width: 12),
// //                         Expanded(
// //                           child: Text(
// //                             selectedDate != null
// //                                 ? DateFormat('d/M/yyyy').format(selectedDate!)
// //                                 : 'Select Departure Date',
// //                             style: TextStyle(
// //                               color: selectedDate != null
// //                                   ? Colors.black
// //                                   : Colors.grey[600],
// //                               fontSize: 16,
// //                             ),
// //                           ),
// //                         ),
// //                         Icon(
// //                           showCalendar
// //                               ? Icons.keyboard_arrow_up
// //                               : Icons.keyboard_arrow_down,
// //                           color: Colors.grey[600],
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                 ),
// //                 if (showCalendar) _buildCalendarView(),
// //                 const SizedBox(height: 12),

// //                 GestureDetector(
// //                   onTap: _togglePassengers,
// //                   child: Container(
// //                     padding: const EdgeInsets.symmetric(
// //                         horizontal: 16, vertical: 14),
// //                     decoration: _inputBoxDecoration(),
// //                     child: Row(
// //                       children: [
// //                         const Icon(Icons.person_outline,
// //                             color: Colors.grey, size: 20),
// //                         const SizedBox(width: 12),
// //                         Expanded(
// //                           child: Text(
// //                             passengersText,
// //                             style: TextStyle(
// //                               color: showPassengers
// //                                   ? Colors.grey[600]
// //                                   : Colors.black,
// //                               fontSize: 16,
// //                             ),
// //                           ),
// //                         ),
// //                         Icon(
// //                           showPassengers
// //                               ? Icons.keyboard_arrow_up
// //                               : Icons.keyboard_arrow_down,
// //                           color: Colors.grey[600],
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                 ),
// //                 if (showPassengers) _buildPassengerCountersView(),
// //                 const SizedBox(height: 12),

// //                 GestureDetector(
// //                   onTap: _toggleCategories,
// //                   child: Container(
// //                     padding: const EdgeInsets.symmetric(
// //                         horizontal: 16, vertical: 14),
// //                     decoration: _inputBoxDecoration(),
// //                     child: Column(
// //                       crossAxisAlignment: CrossAxisAlignment.start,
// //                       children: [
// //                         Row(
// //                           children: [
// //                             const Icon(Icons.flight_class_outlined,
// //                                 color: Colors.grey, size: 20),
// //                             const SizedBox(width: 12),
// //                             Expanded(
// //                               child: Text(
// //                                 showCategories
// //                                     ? 'Select Flight Class'
// //                                     : selectedCategory,
// //                                 style: TextStyle(
// //                                   color: showCategories
// //                                       ? Colors.grey[600]
// //                                       : Colors.black,
// //                                   fontSize: 16,
// //                                 ),
// //                               ),
// //                             ),
// //                             Icon(
// //                               showCategories
// //                                   ? Icons.keyboard_arrow_up
// //                                   : Icons.keyboard_arrow_down,
// //                               color: Colors.grey[600],
// //                             ),
// //                           ],
// //                         ),
// //                         if (showCategories) ...[
// //                           const SizedBox(height: 12),
// //                           Divider(color: Colors.grey[300], height: 1),
// //                           const SizedBox(height: 12),
// //                           _buildCategoryChipsView(),
// //                         ],
// //                       ],
// //                     ),
// //                   ),
// //                 ),
// //                 const SizedBox(height: 40),

// //                 // --- زر البحث المحدث ---
// //                 SizedBox(
// //                   width: double.infinity,
// //                   child: ElevatedButton(
// //                     onPressed: _isLoading
// //                         ? null
// //                         : _handleSearch, // تعطيل الزر أثناء التحميل
// //                     style: ElevatedButton.styleFrom(
// //                       backgroundColor: const Color(0xFF4E7D96),
// //                       padding: const EdgeInsets.symmetric(vertical: 16),
// //                       shape: RoundedRectangleBorder(
// //                         borderRadius: BorderRadius.circular(12),
// //                       ),
// //                       elevation: 2,
// //                     ),
// //                     child: _isLoading
// //                         ? const SizedBox(
// //                             // إظهار مؤشر التحميل
// //                             width: 24,
// //                             height: 24,
// //                             child: CircularProgressIndicator(
// //                               color: Colors.white,
// //                               strokeWidth: 3,
// //                             ),
// //                           )
// //                         : const Text(
// //                             // إظهار النص في الحالة العادية
// //                             'Search Flights',
// //                             style: TextStyle(
// //                               fontSize: 18,
// //                               fontWeight: FontWeight.bold,
// //                               color: Colors.white,
// //                             ),
// //                           ),
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

// //   // --- باقي الودجت المساعدة (لم تتغير) ---
// //   InputDecoration _inputDecoration(
// //       {required String hintText, required IconData icon}) {
// //     return InputDecoration(
// //       hintText: hintText,
// //       hintStyle: TextStyle(color: Colors.grey[600], fontSize: 16),
// //       prefixIcon: Icon(icon, color: Colors.grey, size: 20),
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

// //   Widget _buildTopTab(IconData icon, String label, String tabKey) {
// //     final isSelected = selectedTopTab == tabKey;

// //     return GestureDetector(
// //       onTap: () {
// //         if (!isSelected) {
// //           Widget? destinationScreen;
// //           switch (tabKey) {
// //             case 'Flights':
// //               setState(() {
// //                 selectedTopTab = tabKey;
// //               });
// //               break;
// //             case 'Hotels':
// //               destinationScreen = const HotelsSearchScreen();
// //               break;
// //             case 'Car Rental':
// //               destinationScreen = const CarRentalScreen();
// //               break;
// //             case 'Taxi':
// //               destinationScreen = const TaxiSearchScreen();
// //               break;
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
// //           color: isSelected ? const Color(0xFF4E7D96) : Colors.transparent,
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
// //                   maxLines: 1,
// //                 ),
// //               ),
// //             ],
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   Widget _buildCalendarView() {
// //     return Container(
// //       margin: const EdgeInsets.only(top: 8),
// //       decoration: BoxDecoration(
// //           color: Colors.white,
// //           borderRadius: BorderRadius.circular(8),
// //           boxShadow: [
// //             BoxShadow(
// //               color: Colors.grey.withOpacity(0.2),
// //               spreadRadius: 1,
// //               blurRadius: 3,
// //               offset: const Offset(0, 2),
// //             ),
// //           ]),
// //       child: TableCalendar(
// //         firstDay: DateTime.now().subtract(const Duration(days: 30)),
// //         lastDay: DateTime.now().add(const Duration(days: 365 * 2)),
// //         focusedDay: selectedDate ?? DateTime.now(),
// //         currentDay: DateTime.now(),
// //         selectedDayPredicate: (day) => isSameDay(selectedDate, day),
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
// //           selectedDecoration: const BoxDecoration(
// //             color: Color(0xFF4E7D96),
// //             shape: BoxShape.circle,
// //           ),
// //           selectedTextStyle: const TextStyle(color: Colors.white),
// //           todayDecoration: BoxDecoration(
// //             color: const Color(0xFFADD8E6).withOpacity(0.6),
// //             shape: BoxShape.circle,
// //           ),
// //           todayTextStyle: const TextStyle(color: Colors.black),
// //           defaultTextStyle: const TextStyle(color: Colors.black),
// //           weekendTextStyle: const TextStyle(color: Colors.black54),
// //           outsideDaysVisible: false,
// //         ),
// //         onDaySelected: (selectedDay, focusedDay) {
// //           if (selectedDay
// //               .isBefore(DateTime.now().subtract(const Duration(days: 1)))) {
// //             ScaffoldMessenger.of(context).showSnackBar(
// //               const SnackBar(content: Text("Cannot select a past date")),
// //             );
// //             return;
// //           }
// //           setState(() {
// //             selectedDate = selectedDay;
// //             showCalendar = false;
// //           });
// //         },
// //         startingDayOfWeek: StartingDayOfWeek.sunday,
// //       ),
// //     );
// //   }

// //   Widget _buildPassengerCountersView() {
// //     return Container(
// //       margin: const EdgeInsets.only(top: 8),
// //       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
// //       decoration: BoxDecoration(
// //         color: const Color(0xFFEEEEEE),
// //         borderRadius: BorderRadius.circular(8),
// //       ),
// //       child: Column(
// //         children: [
// //           _buildPassengerCounter('Adults', adultCount,
// //               (val) => setState(() => adultCount = val), 1),
// //           const SizedBox(height: 10),
// //           _buildPassengerCounter('Children', childCount,
// //               (val) => setState(() => childCount = val), 0),
// //         ],
// //       ),
// //     );
// //   }

// //   Widget _buildPassengerCounter(
// //       String label, int count, ValueChanged<int> onChanged, int minValue) {
// //     bool canDecrease = count > minValue;

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
// //             children: [
// //               InkWell(
// //                 borderRadius: BorderRadius.circular(4),
// //                 onTap: canDecrease ? () => onChanged(count - 1) : null,
// //                 child: Padding(
// //                   padding: const EdgeInsets.all(6.0),
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
// //                 onTap: () => onChanged(count + 1),
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

// //   Widget _buildCategoryChipsView() {
// //     return Row(
// //       mainAxisAlignment: MainAxisAlignment.spaceAround,
// //       children: [
// //         _buildCategoryChip('Economy'),
// //         _buildCategoryChip('Business'),
// //         _buildCategoryChip('First class'),
// //       ],
// //     );
// //   }

// //   Widget _buildCategoryChip(String category) {
// //     final isSelected = selectedCategory == category;
// //     return ChoiceChip(
// //       label: Text(
// //         category,
// //         style: TextStyle(
// //           color: isSelected ? Colors.white : const Color(0xFF4E7D96),
// //           fontSize: 13,
// //           fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
// //         ),
// //       ),
// //       selected: isSelected,
// //       selectedColor: const Color(0xFF4E7D96),
// //       backgroundColor: Colors.white,
// //       side: isSelected ? BorderSide.none : BorderSide(color: Colors.grey[300]!),
// //       shape: RoundedRectangleBorder(
// //         borderRadius: BorderRadius.circular(8),
// //       ),
// //       padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
// //       onSelected: (bool selected) {
// //         if (selected) {
// //           setState(() {
// //             selectedCategory = category;
// //           });
// //         }
// //       },
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:table_calendar/table_calendar.dart';
// import 'package:intl/intl.dart';

// // --- استيراد الشاشات والخدمات ---
// import 'FlightResultsScreen.dart';
// import 'hotels_search_screen.dart';
// import 'car_rental_screen.dart';
// import 'taxi_search_screen.dart';
// import '../services/api_service.dart'; // <-- استيراد خدمة الـ API
// import '../models/api_flight.dart'; // <-- استيراد نموذج الـ API

// // --- شاشة الرحلات ---
// class FlightsScreen extends StatefulWidget {
//   const FlightsScreen({super.key});

//   @override
//   State<FlightsScreen> createState() => _FlightsScreenState();
// }

// class _FlightsScreenState extends State<FlightsScreen> {
//   // --- متغيرات الحالة ---
//   String selectedTopTab = 'Flights';
//   String selectedCategory = 'Economy';
//   DateTime? startDate;
//   DateTime? endDate;
//   int adultCount = 2;
//   int childCount = 1;
//   final TextEditingController _destinationController = TextEditingController();
//   final TextEditingController _originController =
//       TextEditingController(text: "Cairo"); // حقل جديد للمنطلق

//   bool showCalendar = false;
//   bool showCategories = false;
//   bool showPassengers = false;
//   bool _isLoading = false; // <-- متغير لتتبع حالة التحميل
//   final ApiService _apiService = ApiService(); // <-- إنشاء نسخة من خدمة الـ API

//   String get passengersText {
//     if (showPassengers) {
//       return 'Select Number of Passengers';
//     } else {
//       return 'Adult: $adultCount, Child: $childCount';
//     }
//   }

//   @override
//   void dispose() {
//     _destinationController.dispose();
//     _originController.dispose();
//     super.dispose();
//   }

//   // --- دوال تبديل العرض ---
//   void _toggleCalendar() {
//     setState(() {
//       showCalendar = !showCalendar;
//       showPassengers = false;
//       showCategories = false;
//     });
//   }

//   void _togglePassengers() {
//     setState(() {
//       showPassengers = !showPassengers;
//       showCalendar = false;
//       showCategories = false;
//     });
//   }

//   void _toggleCategories() {
//     setState(() {
//       showCategories = !showCategories;
//       showCalendar = false;
//       showPassengers = false;
//     });
//   }

//   // --- دالة البحث واستدعاء الـ API ---
//   void _handleSearch() async {
//     // التحقق من صحة المدخلات
//     if (_originController.text.isEmpty ||
//         _destinationController.text.isEmpty ||
//         startDate == null ||
//         endDate == null ||
//         endDate!.isBefore(startDate!)) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//             content: Text(
//                 'Please fill all fields: Origin, Destination, Start Date, and End Date. End date must be after start date.')),
//       );
//       return;
//     }

//     setState(() {
//       _isLoading = true; // بدء التحميل
//     });

//     try {
//       // استدعاء الـ API
//       final List<ApiFlight> apiFlights = await _apiService.searchFlights(
//         from: _originController.text,
//         to: _destinationController.text,
//         departureDate: startDate!,
//         returnDate: endDate!, // Added returnDate
//         category: selectedCategory,
//         adults: adultCount,
//         children: childCount,
//       );

//       // تحويل نتائج الـ API إلى نموذج العرض (FlightData)
//       final List<FlightData> flightDataList = apiFlights
//           .map((apiFlight) => FlightData.fromApiFlight(apiFlight))
//           .toList();

//       // الانتقال إلى شاشة النتائج مع تمرير البيانات الحقيقية
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (context) => FlightResultsScreen(
//             initialFlights: flightDataList,
//             destination: _destinationController.text,
//             origin: _originController.text,
//             date:
//                 '${DateFormat('EEE, d MMM yy').format(startDate!)} - ${DateFormat('EEE, d MMM yy').format(endDate!)}',
//             adults: adultCount,
//             children: childCount,
//             category: selectedCategory,
//           ),
//         ),
//       );
//     } catch (e) {
//       // إظهار رسالة خطأ في حالة فشل الطلب
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error: ${e.toString()}')),
//       );
//     } finally {
//       setState(() {
//         _isLoading = false; // إيقاف التحميل
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               children: [
//                 // ... (نفس ودجت سهم الرجوع والتبويبات العلوية)
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

//                 // حقل مكان الانطلاق
//                 TextField(
//                   controller: _originController,
//                   decoration: _inputDecoration(
//                       hintText: 'From', icon: Icons.flight_takeoff),
//                   style: const TextStyle(color: Colors.black, fontSize: 16),
//                 ),
//                 const SizedBox(height: 12),

//                 // حقل البحث عن الوجهة
//                 TextField(
//                   controller: _destinationController,
//                   decoration:
//                       _inputDecoration(hintText: 'To', icon: Icons.flight_land),
//                   style: const TextStyle(color: Colors.black, fontSize: 16),
//                 ),
//                 const SizedBox(height: 12),

//                 // اختيار التاريخ (بداية ونهاية)
//                 GestureDetector(
//                   onTap: _toggleCalendar,
//                   child: Container(
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 16, vertical: 14),
//                     decoration: _inputBoxDecoration(),
//                     child: Row(
//                       children: [
//                         const Icon(Icons.calendar_today,
//                             color: Colors.grey, size: 20),
//                         const SizedBox(width: 12),
//                         Expanded(
//                           child: Text(
//                             startDate != null && endDate != null
//                                 ? '${DateFormat('d/M/yyyy').format(startDate!)} - ${DateFormat('d/M/yyyy').format(endDate!)}'
//                                 : 'Select Date Range',
//                             style: TextStyle(
//                               color: startDate != null && endDate != null
//                                   ? Colors.black
//                                   : Colors.grey[600],
//                               fontSize: 16,
//                             ),
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

//                 GestureDetector(
//                   onTap: _togglePassengers,
//                   child: Container(
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 16, vertical: 14),
//                     decoration: _inputBoxDecoration(),
//                     child: Row(
//                       children: [
//                         const Icon(Icons.person_outline,
//                             color: Colors.grey, size: 20),
//                         const SizedBox(width: 12),
//                         Expanded(
//                           child: Text(
//                             passengersText,
//                             style: TextStyle(
//                               color: showPassengers
//                                   ? Colors.grey[600]
//                                   : Colors.black,
//                               fontSize: 16,
//                             ),
//                           ),
//                         ),
//                         Icon(
//                           showPassengers
//                               ? Icons.keyboard_arrow_up
//                               : Icons.keyboard_arrow_down,
//                           color: Colors.grey[600],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 if (showPassengers) _buildPassengerCountersView(),
//                 const SizedBox(height: 12),

//                 GestureDetector(
//                   onTap: _toggleCategories,
//                   child: Container(
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 16, vertical: 14),
//                     decoration: _inputBoxDecoration(),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           children: [
//                             const Icon(Icons.flight_class_outlined,
//                                 color: Colors.grey, size: 20),
//                             const SizedBox(width: 12),
//                             Expanded(
//                               child: Text(
//                                 showCategories
//                                     ? 'Select Flight Class'
//                                     : selectedCategory,
//                                 style: TextStyle(
//                                   color: showCategories
//                                       ? Colors.grey[600]
//                                       : Colors.black,
//                                   fontSize: 16,
//                                 ),
//                               ),
//                             ),
//                             Icon(
//                               showCategories
//                                   ? Icons.keyboard_arrow_up
//                                   : Icons.keyboard_arrow_down,
//                               color: Colors.grey[600],
//                             ),
//                           ],
//                         ),
//                         if (showCategories) ...[
//                           const SizedBox(height: 12),
//                           Divider(color: Colors.grey[300], height: 1),
//                           const SizedBox(height: 12),
//                           _buildCategoryChipsView(),
//                         ],
//                       ],
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 40),

//                 // --- زر البحث المحدث ---
//                 SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     onPressed: _isLoading
//                         ? null
//                         : _handleSearch, // تعطيل الزر أثناء التحميل
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: const Color(0xFF4E7D96),
//                       padding: const EdgeInsets.symmetric(vertical: 16),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       elevation: 2,
//                     ),
//                     child: _isLoading
//                         ? const SizedBox(
//                             // إظهار مؤشر التحميل
//                             width: 24,
//                             height: 24,
//                             child: CircularProgressIndicator(
//                               color: Colors.white,
//                               strokeWidth: 3,
//                             ),
//                           )
//                         : const Text(
//                             // إظهار النص في الحالة العادية
//                             'Search Flights',
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

//   // --- باقي الودجت المساعدة (محدثة) ---
//   InputDecoration _inputDecoration(
//       {required String hintText, required IconData icon}) {
//     return InputDecoration(
//       hintText: hintText,
//       hintStyle: TextStyle(color: Colors.grey[600], fontSize: 16),
//       prefixIcon: Icon(icon, color: Colors.grey, size: 20),
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

//     return GestureDetector(
//       onTap: () {
//         if (!isSelected) {
//           Widget? destinationScreen;
//           switch (tabKey) {
//             case 'Flights':
//               setState(() {
//                 selectedTopTab = tabKey;
//               });
//               break;
//             case 'Hotels':
//               destinationScreen = const HotelsSearchScreen();
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
//           color: isSelected ? const Color(0xFF4E7D96) : Colors.transparent,
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
//     return Container(
//       margin: const EdgeInsets.only(top: 8),
//       decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(8),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.withOpacity(0.2),
//               spreadRadius: 1,
//               blurRadius: 3,
//               offset: const Offset(0, 2),
//             ),
//           ]),
//       child: TableCalendar(
//         firstDay: DateTime.now().subtract(const Duration(days: 30)),
//         lastDay: DateTime.now().add(const Duration(days: 365 * 2)),
//         focusedDay: startDate ?? endDate ?? DateTime.now(),
//         currentDay: DateTime.now(),
//         rangeStartDay: startDate,
//         rangeEndDay: endDate,
//         rangeSelectionMode: RangeSelectionMode.toggledOn,
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
//           rangeStartDecoration: const BoxDecoration(
//             color: Color(0xFF4E7D96),
//             shape: BoxShape.circle,
//           ),
//           rangeEndDecoration: const BoxDecoration(
//             color: Color(0xFF4E7D96),
//             shape: BoxShape.circle,
//           ),
//           withinRangeDecoration: BoxDecoration(
//             color: const Color(0xFFADD8E6).withOpacity(0.3),
//             shape: BoxShape.circle,
//           ),
//           selectedDecoration: const BoxDecoration(
//             color: Color(0xFF4E7D96),
//             shape: BoxShape.circle,
//           ),
//           selectedTextStyle: const TextStyle(color: Colors.white),
//           todayDecoration: BoxDecoration(
//             color: const Color(0xFFADD8E6).withOpacity(0.6),
//             shape: BoxShape.circle,
//           ),
//           todayTextStyle: const TextStyle(color: Colors.black),
//           defaultTextStyle: const TextStyle(color: Colors.black),
//           weekendTextStyle: const TextStyle(color: Colors.black54),
//           outsideDaysVisible: false,
//         ),
//         onRangeSelected: (start, end, focusedDay) {
//           if (start != null && end != null) {
//             if (start
//                 .isBefore(DateTime.now().subtract(const Duration(days: 1)))) {
//               ScaffoldMessenger.of(context).showSnackBar(
//                 const SnackBar(content: Text("Cannot select a past date")),
//               );
//               return;
//             }
//             setState(() {
//               startDate = start;
//               endDate = end;
//               showCalendar = false;
//             });
//           }
//         },
//         startingDayOfWeek: StartingDayOfWeek.sunday,
//       ),
//     );
//   }

//   Widget _buildPassengerCountersView() {
//     return Container(
//       margin: const EdgeInsets.only(top: 8),
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//       decoration: BoxDecoration(
//         color: const Color(0xFFEEEEEE),
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: Column(
//         children: [
//           _buildPassengerCounter('Adults', adultCount,
//               (val) => setState(() => adultCount = val), 1),
//           const SizedBox(height: 10),
//           _buildPassengerCounter('Children', childCount,
//               (val) => setState(() => childCount = val), 0),
//         ],
//       ),
//     );
//   }

//   Widget _buildPassengerCounter(
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

//   Widget _buildCategoryChipsView() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceAround,
//       children: [
//         _buildCategoryChip('Economy'),
//         _buildCategoryChip('Business'),
//         _buildCategoryChip('First class'),
//       ],
//     );
//   }

//   Widget _buildCategoryChip(String category) {
//     final isSelected = selectedCategory == category;
//     return ChoiceChip(
//       label: Text(
//         category,
//         style: TextStyle(
//           color: isSelected ? Colors.white : const Color(0xFF4E7D96),
//           fontSize: 13,
//           fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
//         ),
//       ),
//       selected: isSelected,
//       selectedColor: const Color(0xFF4E7D96),
//       backgroundColor: Colors.white,
//       side: isSelected ? BorderSide.none : BorderSide(color: Colors.grey[300]!),
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(8),
//       ),
//       padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
//       onSelected: (bool selected) {
//         if (selected) {
//           setState(() {
//             selectedCategory = category;
//           });
//         }
//       },
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'package:apptravella/models/FlightData.dart';

// --- استيراد الشاشات والخدمات ---
import 'FlightResultsScreen.dart';
import 'hotels_search_screen.dart';
import 'car_rental_screen.dart';
import 'taxi_search_screen.dart';
import '../services/api_service.dart'; // <-- استيراد الخدمة المحدثة
import '../models/api_flight.dart'; // <-- استيراد نموذج الـ API

// --- شاشة الرحلات ---
class FlightsScreen extends StatefulWidget {
  const FlightsScreen({super.key});

  @override
  State<FlightsScreen> createState() => _FlightsScreenState();
}

class _FlightsScreenState extends State<FlightsScreen> {
  // --- متغيرات الحالة ---
  String selectedTopTab = 'Flights';
  String selectedCategory = 'Economy';
  DateTime? startDate;
  DateTime? endDate;
  int adultCount = 2;
  int childCount = 1;
  final TextEditingController _destinationController = TextEditingController();
  final TextEditingController _originController =
      TextEditingController(text: "Cairo"); // حقل جديد للمنطلق

  bool showCalendar = false;
  bool showCategories = false;
  bool showPassengers = false;
  bool _isLoading = false; // <-- متغير لتتبع حالة التحميل
  final ApiService _apiService = ApiService(); // <-- إنشاء نسخة من الخدمة

  String get passengersText {
    if (showPassengers) {
      return 'Select Number of Passengers';
    } else {
      return 'Adult: $adultCount, Child: $childCount';
    }
  }

  @override
  void dispose() {
    _destinationController.dispose();
    _originController.dispose();
    super.dispose();
  }

  // --- دوال تبديل العرض ---
  void _toggleCalendar() {
    setState(() {
      showCalendar = !showCalendar;
      showPassengers = false;
      showCategories = false;
    });
  }

  void _togglePassengers() {
    setState(() {
      showPassengers = !showPassengers;
      showCalendar = false;
      showCategories = false;
    });
  }

  void _toggleCategories() {
    setState(() {
      showCategories = !showCategories;
      showCalendar = false;
      showPassengers = false;
    });
  }

  // --- دالة البحث واستدعاء الـ API ---
  void _handleSearch() async {
    if (_originController.text.isEmpty ||
        _destinationController.text.isEmpty ||
        startDate == null ||
        endDate == null ||
        endDate!.isBefore(startDate!)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text(
                'Please fill all fields: Origin, Destination, Start Date, and End Date. End date must be after start date.')),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final List<ApiFlight> apiFlights = await _apiService.searchFlights(
        from: _originController.text,
        to: _destinationController.text,
        departureDate: startDate!,
        returnDate: endDate!,
        category: selectedCategory,
        adults: adultCount,
        children: childCount,
      );

      if (apiFlights.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No flights found for this search.')),
        );
      } else {
        final List<FlightData> flightDataList = apiFlights
            .map((apiFlight) => FlightData.fromApiFlight(apiFlight))
            .toList();

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FlightResultsScreen(
              initialFlights: flightDataList,
              destination: _destinationController.text,
              origin: _originController.text,
              date:
                  '${DateFormat('EEE, d MMM yy').format(startDate!)} - ${DateFormat('EEE, d MMM yy').format(endDate!)}',
              adults: adultCount,
              children: childCount,
              category: selectedCategory,
            ),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
      print('Search Error: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // --- سهم الرجوع والتبويبات العلوية ---
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

                // حقل مكان الانطلاق
                TextField(
                  controller: _originController,
                  decoration: _inputDecoration(
                      hintText: 'From', icon: Icons.flight_takeoff),
                  style: const TextStyle(color: Colors.black, fontSize: 16),
                ),
                const SizedBox(height: 12),

                // حقل البحث عن الوجهة
                TextField(
                  controller: _destinationController,
                  decoration:
                      _inputDecoration(hintText: 'To', icon: Icons.flight_land),
                  style: const TextStyle(color: Colors.black, fontSize: 16),
                ),
                const SizedBox(height: 12),

                // اختيار التاريخ (بداية ونهاية)
                GestureDetector(
                  onTap: _toggleCalendar,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 14),
                    decoration: _inputBoxDecoration(),
                    child: Row(
                      children: [
                        const Icon(Icons.calendar_today,
                            color: Colors.grey, size: 20),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            startDate != null && endDate != null
                                ? '${DateFormat('d/M/yyyy').format(startDate!)} - ${DateFormat('d/M/yyyy').format(endDate!)}'
                                : 'Select Date Range',
                            style: TextStyle(
                              color: startDate != null && endDate != null
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
                  onTap: _togglePassengers,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 14),
                    decoration: _inputBoxDecoration(),
                    child: Row(
                      children: [
                        const Icon(Icons.person_outline,
                            color: Colors.grey, size: 20),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            passengersText,
                            style: TextStyle(
                              color: showPassengers
                                  ? Colors.grey[600]
                                  : Colors.black,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Icon(
                          showPassengers
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down,
                          color: Colors.grey[600],
                        ),
                      ],
                    ),
                  ),
                ),
                if (showPassengers) _buildPassengerCountersView(),
                const SizedBox(height: 12),

                GestureDetector(
                  onTap: _toggleCategories,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 14),
                    decoration: _inputBoxDecoration(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.flight_class_outlined,
                                color: Colors.grey, size: 20),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                showCategories
                                    ? 'Select Flight Class'
                                    : selectedCategory,
                                style: TextStyle(
                                  color: showCategories
                                      ? Colors.grey[600]
                                      : Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Icon(
                              showCategories
                                  ? Icons.keyboard_arrow_up
                                  : Icons.keyboard_arrow_down,
                              color: Colors.grey[600],
                            ),
                          ],
                        ),
                        if (showCategories) ...[
                          const SizedBox(height: 12),
                          Divider(color: Colors.grey[300], height: 1),
                          const SizedBox(height: 12),
                          _buildCategoryChipsView(),
                        ],
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 40),

                // --- زر البحث المحدث ---
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _isLoading
                        ? null
                        : _handleSearch, // تعطيل الزر أثناء التحميل
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4E7D96),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 2,
                    ),
                    child: _isLoading
                        ? const SizedBox(
                            // إظهار مؤشر التحميل
                            width: 24,
                            height: 24,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 3,
                            ),
                          )
                        : const Text(
                            // إظهار النص في الحالة العادية
                            'Search Flights',
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

  // --- باقي الودجت المساعدة (محدثة) ---
  InputDecoration _inputDecoration(
      {required String hintText, required IconData icon}) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(color: Colors.grey[600], fontSize: 16),
      prefixIcon: Icon(icon, color: Colors.grey, size: 20),
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

    return GestureDetector(
      onTap: () {
        if (!isSelected) {
          Widget? destinationScreen;
          switch (tabKey) {
            case 'Flights':
              setState(() {
                selectedTopTab = tabKey;
              });
              break;
            case 'Hotels':
              destinationScreen = const HotelsSearchScreen();
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
          color: isSelected ? const Color(0xFF4E7D96) : Colors.transparent,
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
          ]),
      child: TableCalendar(
        firstDay: DateTime.now().subtract(const Duration(days: 30)),
        lastDay: DateTime.now().add(const Duration(days: 365 * 2)),
        focusedDay: startDate ?? endDate ?? DateTime.now(),
        currentDay: DateTime.now(),
        rangeStartDay: startDate,
        rangeEndDay: endDate,
        rangeSelectionMode: RangeSelectionMode.toggledOn,
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
          rangeStartDecoration: const BoxDecoration(
            color: Color(0xFF4E7D96),
            shape: BoxShape.circle,
          ),
          rangeEndDecoration: const BoxDecoration(
            color: Color(0xFF4E7D96),
            shape: BoxShape.circle,
          ),
          withinRangeDecoration: BoxDecoration(
            color: const Color(0xFFADD8E6).withOpacity(0.3),
            shape: BoxShape.circle,
          ),
          selectedDecoration: const BoxDecoration(
            color: Color(0xFF4E7D96),
            shape: BoxShape.circle,
          ),
          selectedTextStyle: const TextStyle(color: Colors.white),
          todayDecoration: BoxDecoration(
            color: const Color(0xFFADD8E6).withOpacity(0.6),
            shape: BoxShape.circle,
          ),
          todayTextStyle: const TextStyle(color: Colors.black),
          defaultTextStyle: const TextStyle(color: Colors.black),
          weekendTextStyle: const TextStyle(color: Colors.black54),
          outsideDaysVisible: false,
        ),
        onRangeSelected: (start, end, focusedDay) {
          if (start != null && end != null) {
            if (start
                .isBefore(DateTime.now().subtract(const Duration(days: 1)))) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Cannot select a past date")),
              );
              return;
            }
            setState(() {
              startDate = start;
              endDate = end;
              showCalendar = false;
            });
          }
        },
        startingDayOfWeek: StartingDayOfWeek.sunday,
      ),
    );
  }

  Widget _buildPassengerCountersView() {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFEEEEEE),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          _buildPassengerCounter('Adults', adultCount,
              (val) => setState(() => adultCount = val), 1),
          const SizedBox(height: 10),
          _buildPassengerCounter('Children', childCount,
              (val) => setState(() => childCount = val), 0),
        ],
      ),
    );
  }

  Widget _buildPassengerCounter(
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

  Widget _buildCategoryChipsView() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildCategoryChip('Economy'),
        _buildCategoryChip('Business'),
        _buildCategoryChip('First class'),
      ],
    );
  }

  Widget _buildCategoryChip(String category) {
    final isSelected = selectedCategory == category;
    return ChoiceChip(
      label: Text(
        category,
        style: TextStyle(
          color: isSelected ? Colors.white : const Color(0xFF4E7D96),
          fontSize: 13,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      selected: isSelected,
      selectedColor: const Color(0xFF4E7D96),
      backgroundColor: Colors.white,
      side: isSelected ? BorderSide.none : BorderSide(color: Colors.grey[300]!),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      onSelected: (bool selected) {
        if (selected) {
          setState(() {
            selectedCategory = category;
          });
        }
      },
    );
  }
}
