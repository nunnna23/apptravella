// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'dart:math'; // لاستخدام Random للتقييم الوهمي

// // --- استيراد الملفات الضرورية ---
// import 'package:travella/widgets/filter_screen.dart';
// import '../models/api_flight.dart'; // <-- استيراد نموذج الـ API
// import 'FlightDetailsScreen.dart'; // <-- تأكد من أن هذا الملف موجود

// // دالة مساعدة لجعل الحرف الأول كبيراً
// extension StringExtension on String {
//   String capitalize() {
//     if (this.isEmpty) {
//       return this;
//     }
//     return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
//   }
// }

// // نموذج بيانات العرض (UI Data Model)
// class FlightData {
//   final String airlineName;
//   final String logoAsset;
//   final String fromCity;
//   final String toCity;
//   final String duration;
//   final String departureTime;
//   final String arrivalTime;
//   final String price; // السعر كنص منسق للعرض
//   final double priceValue; // القيمة الرقمية للفرز والفلترة
//   final int stops;
//   final TimeOfDay departureTimeOfDay;
//   final double rating;
//   final String category;

//   FlightData({
//     required this.airlineName,
//     required this.logoAsset,
//     required this.fromCity,
//     required this.toCity,
//     required this.duration,
//     required this.departureTime,
//     required this.arrivalTime,
//     required this.price,
//     required this.priceValue,
//     required this.stops,
//     required this.rating,
//     required this.category,
//   }) : departureTimeOfDay = _parseTimeOfDay(departureTime);

//   factory FlightData.fromApiFlight(ApiFlight apiFlight) {
//     // حساب مدة الرحلة
//     final flightDuration =
//         apiFlight.arrivalTime.difference(apiFlight.departureTime);
//     final hours = flightDuration.inHours;
//     final minutes = flightDuration.inMinutes.remainder(60);
//     final durationString = '${hours}h ${minutes}m';

//     // تنسيق الوقت
//     final timeFormat = DateFormat('h:mm a');
//     final departureTimeString = timeFormat.format(apiFlight.departureTime);
//     final arrivalTimeString = timeFormat.format(apiFlight.arrivalTime);

//     // تنسيق السعر
//     final priceFormatter = NumberFormat("#,##0", "en_US");
//     final priceString = priceFormatter.format(apiFlight.price);

//     // إنشاء تقييم وهمي (لأن الـ API لا يوفره)
//     final dummyRating = 3.5 + Random().nextDouble() * 1.5;

//     return
//     FlightData(
//       airlineName: apiFlight.airline,
//       logoAsset: _getLogoForAirline(apiFlight.airline),
//       fromCity: apiFlight.fromLocation.capitalize(),
//       toCity: apiFlight.destination.capitalize(),
//       duration: durationString,
//       departureTime: departureTimeString,
//       arrivalTime: arrivalTimeString,
//       price: priceString,
//       priceValue: apiFlight.price.toDouble(),
//       stops: apiFlight.stops,
//       rating: dummyRating,
//       category: apiFlight.category.capitalize(),
//     );
//   }

//   static String _getLogoForAirline(String airlineName) {
//     final name = airlineName.toLowerCase();
//     if (name.contains('egyptair') || name.contains('egypt air')) {
//       return 'assets/egyptair_logo.png';
//     } else if (name.contains('turkish')) {
//       return 'assets/turkish_airlines_logo.png';
//     } else if (name.contains('united')) {
//       return 'assets/united_logo.png';
//     } else if (name.contains('emirates')) {
//       return 'assets/emirates_logo.png';
//     } else if (name.contains('british')) {
//       return 'assets/ba_logo.png';
//     } else if (name.contains('qatar')) {
//       return 'assets/qatar_logo.png';
//     }
//     return 'assets/default_logo.png';
//   }

//   static TimeOfDay _parseTimeOfDay(String timeString) {
//     try {
//       final format = DateFormat("h:mm a");
//       final dt = format.parseStrict(timeString);
//       return TimeOfDay.fromDateTime(dt);
//     } catch (e) {
//       print("Error parsing time: '$timeString', Error: $e");
//       return const TimeOfDay(hour: 0, minute: 0);
//     }
//   }
// }

// enum SortOption { highestRated, lowestPrice, highestPrice, lowestPriceAgain }

// class FilterSettings {
//   RangeValues priceRange;
//   int? selectedStops;
//   String? selectedDepartureTime;
//   Set<String> selectedAirlines;

//   FilterSettings({
//     required this.priceRange,
//     this.selectedStops,
//     this.selectedDepartureTime,
//     required this.selectedAirlines,
//   });

//   factory FilterSettings.initial(double minPrice, double maxPrice) {
//     return FilterSettings(
//       priceRange: RangeValues(minPrice, maxPrice),
//       selectedStops: null,
//       selectedDepartureTime: null,
//       selectedAirlines: {},
//     );
//   }
// }

// class FlightResultsScreen extends StatefulWidget {
//   final List<FlightData> initialFlights;
//   final String destination;
//   final String origin;
//   final String date;
//   final int adults;
//   final int children;
//   final String category;

//   const FlightResultsScreen({
//     super.key,
//     required this.initialFlights,
//     required this.destination,
//     required this.origin,
//     required this.date,
//     required this.adults,
//     required this.children,
//     required this.category,
//   });

//   @override
//   State<FlightResultsScreen> createState() => _FlightResultsScreenState();
// }

// class _FlightResultsScreenState extends State<FlightResultsScreen> {
//   late List<FlightData> _originalFlightResults;
//   late List<FlightData> _displayFlightResults;
//   bool _isSortOverlayVisible = false;
//   SortOption _selectedSortOption = SortOption.highestRated;
//   final GlobalKey _sortButtonKey = GlobalKey();
//   OverlayEntry? _sortOverlayEntry;
//   late FilterSettings _currentFilterSettings;
//   double _minPrice = 0;
//   double _maxPrice = 10000;

//   @override
//   void initState() {
//     super.initState();
//     _originalFlightResults =
//         List.from(widget.initialFlights); // نسخة من البيانات
//     _updatePriceRange(_originalFlightResults);
//     _currentFilterSettings = FilterSettings.initial(_minPrice, _maxPrice);
//     _applySortingAndFiltering();
//   }

//   @override
//   void didUpdateWidget(covariant FlightResultsScreen oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     if (widget.initialFlights != oldWidget.initialFlights) {
//       _originalFlightResults = List.from(widget.initialFlights);
//       _updatePriceRange(_originalFlightResults);
//       _currentFilterSettings = FilterSettings.initial(_minPrice, _maxPrice);
//       _applySortingAndFiltering();
//     }
//   }

//   @override
//   void dispose() {
//     _removeSortOverlay();
//     super.dispose();
//   }

//   void _updatePriceRange(List<FlightData> data) {
//     if (data.isEmpty) {
//       _minPrice = 0;
//       _maxPrice = 10000;
//       return;
//     }
//     _minPrice = data.map((f) => f.priceValue).reduce((a, b) => a < b ? a : b);
//     _maxPrice = data.map((f) => f.priceValue).reduce((a, b) => a > b ? a : b);
//     if (_minPrice >= _maxPrice) {
//       _maxPrice = _minPrice + 100;
//     }
//   }

//   void _applySortingAndFiltering() {
//     List<FlightData> filteredList = List.from(_originalFlightResults);

//     filteredList = filteredList.where((flight) {
//       bool priceMatch =
//           flight.priceValue >= _currentFilterSettings.priceRange.start &&
//               flight.priceValue <= _currentFilterSettings.priceRange.end;

//       bool stopsMatch = _currentFilterSettings.selectedStops == null ||
//           flight.stops == _currentFilterSettings.selectedStops;

//       bool timeMatch = _currentFilterSettings.selectedDepartureTime == null ||
//           (_currentFilterSettings.selectedDepartureTime == "Before 11AM" &&
//               flight.departureTimeOfDay.hour < 11) ||
//           (_currentFilterSettings.selectedDepartureTime == "11AM-5PM" &&
//               flight.departureTimeOfDay.hour >= 11 &&
//               flight.departureTimeOfDay.hour < 17);

//       bool airlineMatch = _currentFilterSettings.selectedAirlines.isEmpty ||
//           _currentFilterSettings.selectedAirlines.contains(flight.airlineName);

//       return priceMatch && stopsMatch && timeMatch && airlineMatch;
//     }).toList();

//     switch (_selectedSortOption) {
//       case SortOption.highestRated:
//         filteredList.sort((a, b) => b.rating.compareTo(a.rating));
//         break;
//       case SortOption.lowestPrice:
//       case SortOption.lowestPriceAgain:
//         filteredList.sort((a, b) => a.priceValue.compareTo(b.priceValue));
//         break;
//       case SortOption.highestPrice:
//         filteredList.sort((a, b) => b.priceValue.compareTo(b.priceValue));
//         break;
//     }

//     setState(() {
//       _displayFlightResults = filteredList;
//     });
//   }

//   void _toggleSortOverlay() {
//     if (_isSortOverlayVisible) {
//       _removeSortOverlay();
//     } else {
//       _showSortOverlay();
//     }
//     setState(() {
//       _isSortOverlayVisible = !_isSortOverlayVisible;
//     });
//   }

//   void _showSortOverlay() {
//     _removeSortOverlay();

//     final RenderBox renderBox =
//         _sortButtonKey.currentContext!.findRenderObject() as RenderBox;
//     final size = renderBox.size;
//     final position = renderBox.localToGlobal(Offset.zero);

//     _sortOverlayEntry = OverlayEntry(
//       builder: (context) => Positioned(
//         left: position.dx - 10,
//         top: position.dy + size.height + 5,
//         width: 180,
//         child: Material(
//           elevation: 4.0,
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(12.0),
//           child: _buildSortOverlayContent(),
//         ),
//       ),
//     );

//     Overlay.of(context).insert(_sortOverlayEntry!);
//   }

//   void _removeSortOverlay() {
//     _sortOverlayEntry?.remove();
//     _sortOverlayEntry = null;
//   }

//   Widget _buildSortOverlayContent() {
//     Color selectedColor = const Color(0xFFE0EAF1);
//     Color iconColor = Colors.grey.shade600;

//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         _buildSortOptionItem(SortOption.highestRated, 'Highest rated',
//             Icons.star_border, selectedColor, iconColor),
//         _buildSortOptionItem(SortOption.lowestPrice, 'Lowest price',
//             Icons.arrow_downward, selectedColor, iconColor),
//         _buildSortOptionItem(SortOption.highestPrice, 'Highest price',
//             Icons.arrow_upward, selectedColor, iconColor),
//         _buildSortOptionItem(SortOption.lowestPriceAgain, 'Lowest price',
//             Icons.arrow_downward, selectedColor, iconColor),
//       ],
//     );
//   }

//   Widget _buildSortOptionItem(SortOption option, String title, IconData icon,
//       Color selectedBgColor, Color iconColor) {
//     bool isSelected = _selectedSortOption == option;
//     return InkWell(
//       onTap: () {
//         setState(() {
//           _selectedSortOption = option;
//           _applySortingAndFiltering();
//         });
//         _toggleSortOverlay();
//       },
//       child: Container(
//         color: isSelected ? selectedBgColor : Colors.transparent,
//         padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
//         child: Row(
//           children: [
//             Icon(
//               icon,
//               size: 20,
//               color: isSelected ? Theme.of(context).primaryColor : iconColor,
//             ),
//             const SizedBox(width: 12),
//             Text(
//               title,
//               style: TextStyle(
//                 fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
//                 color: Colors.black87,
//                 fontSize: 14,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void _navigateToFilterScreen() async {
//     if (_isSortOverlayVisible) {
//       _toggleSortOverlay();
//     }

//     final uniqueAirlines =
//         _originalFlightResults.map((f) => f.airlineName).toSet();

//     final result = await Navigator.push<FilterSettings>(
//       context,
//       MaterialPageRoute(
//         builder: (context) => FilterScreen(
//           initialSettings: _currentFilterSettings,
//           availableAirlines: uniqueAirlines.toList(),
//           maxPriceValue: _maxPrice,
//           minPriceValue: _minPrice,
//         ),
//       ),
//     );

//     if (result != null) {
//       setState(() {
//         _currentFilterSettings = result;
//         _applySortingAndFiltering();
//       });
//     }
//   }

//   void _navigateToDetailsScreen(FlightData flight) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => FlightDetailsScreen(
//           flight: flight,
//           isGuestUser: false, adults: 0, children: 0, // يمكن تعديله بناءً على الحالة
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     String passengerInfo =
//         '${widget.adults} Adult${widget.adults > 1 ? 's' : ''}';
//     if (widget.children > 0) {
//       passengerInfo +=
//           ', ${widget.children} Child${widget.children > 1 ? 'ren' : ''}';
//     }
//     int resultCount = _displayFlightResults.length;

//     return Scaffold(
//       backgroundColor: const Color(0xFFF4F4F4),
//       appBar: AppBar(
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () => Navigator.pop(context),
//         ),
//         title: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//                 '${widget.origin} → ${widget.destination} ($resultCount results)'),
//             const SizedBox(height: 2),
//             Text(
//               '${widget.date} - $passengerInfo',
//               style: TextStyle(color: Colors.grey[600], fontSize: 12),
//             ),
//           ],
//         ),
//         centerTitle: false,
//         titleSpacing: 0,
//       ),
//       body: Column(
//         children: [
//           Container(
//             key: _sortButtonKey,
//             color: Colors.white,
//             padding:
//                 const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 TextButton.icon(
//                   onPressed: _toggleSortOverlay,
//                   icon: const Icon(Icons.sort, color: Colors.black54, size: 20),
//                   label: const Text('Sort',
//                       style: TextStyle(color: Colors.black87, fontSize: 14)),
//                   style: TextButton.styleFrom(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 12, vertical: 6),
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8))),
//                 ),
//                 TextButton.icon(
//                   onPressed: _navigateToFilterScreen,
//                   icon: const Icon(Icons.filter_list,
//                       color: Colors.black54, size: 20),
//                   label: const Text('Filter',
//                       style: TextStyle(color: Colors.black87, fontSize: 14)),
//                   style: TextButton.styleFrom(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 12, vertical: 6),
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8))),
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             child: _displayFlightResults.isEmpty
//                 ? const Center(
//                     child:
//                         Text("No flights found matching your search criteria."))
//                 : ListView.builder(
//                     padding: const EdgeInsets.only(top: 8.0, bottom: 16.0),
//                     itemCount: _displayFlightResults.length,
//                     itemBuilder: (context, index) {
//                       final flight = _displayFlightResults[index];
//                       return GestureDetector(
//                         onTap: () => _navigateToDetailsScreen(flight),
//                         child: _buildFlightCard(flight),
//                       );
//                     },
//                   ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildFlightCard(FlightData flight) {
//     const double cardPadding = 16.0;
//     const double borderRadius = 12.0;
//     const Color greyTextColor = Color(0xFF6E6E6E);
//     final Color themeBlue = Theme.of(context).primaryColor;

// ignore_for_file: unused_import

//     return Card(
//       margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
//       elevation: 1.5,
//       shadowColor: Colors.grey.withOpacity(0.3),
//       shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(borderRadius)),
//       color: Colors.white,
//       child: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(
//                 left: cardPadding,
//                 right: cardPadding,
//                 top: cardPadding,
//                 bottom: 10),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//                   const Text('From',
//                       style: TextStyle(color: greyTextColor, fontSize: 12)),
//                   const SizedBox(height: 2),
//                   Text(flight.fromCity,
//                       style: const TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 16,
//                           color: Colors.black)),
//                 ]),
//                 SizedBox(
//                   height: 24,
//                   width: 80,
//                   child: Image.asset(
//                     flight.logoAsset,
//                     fit: BoxFit.contain,
//                     errorBuilder: (context, error, stackTrace) => Text(
//                       flight.airlineName.split(' ').first,
//                       style: const TextStyle(fontSize: 10, color: Colors.red),
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                 ),
//                 Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
//                   const Text('To',
//                       style: TextStyle(color: greyTextColor, fontSize: 12)),
//                   const SizedBox(height: 2),
//                   Text(flight.toCity,
//                       style: const TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 16,
//                           color: Colors.black)),
//                 ]),
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: cardPadding + 8),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Icon(Icons.circle, size: 8, color: Colors.grey[300]),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Text(
//                         '· ' * 15,
//                         maxLines: 1,
//                         overflow: TextOverflow.clip,
//                         style: TextStyle(
//                             fontSize: 10,
//                             color: Colors.grey[400],
//                             letterSpacing: 2),
//                       ),
//                       const SizedBox(height: 0),
//                       Text(flight.duration,
//                           style: const TextStyle(
//                               fontSize: 11, color: greyTextColor)),
//                     ],
//                   ),
//                 ),
//                 Icon(Icons.flight, size: 20, color: themeBlue),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Text(
//                         '· ' * 15,
//                         maxLines: 1,
//                         overflow: TextOverflow.clip,
//                         style: TextStyle(
//                             fontSize: 10,
//                             color: Colors.grey[400],
//                             letterSpacing: 2),
//                       ),
//                       const SizedBox(height: 16),
//                     ],
//                   ),
//                 ),
//                 Icon(Icons.circle, size: 8, color: Colors.grey[300]),
//               ],
//             ),
//           ),
//           const SizedBox(height: 5),
//           Container(
//             padding: const EdgeInsets.symmetric(
//                 horizontal: cardPadding, vertical: 12),
//             decoration: BoxDecoration(
//               color: Colors.grey[100]?.withOpacity(0.5),
//               borderRadius: const BorderRadius.only(
//                 bottomLeft: Radius.circular(borderRadius),
//                 bottomRight: Radius.circular(borderRadius),
//               ),
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//                   const Text('Depart',
//                       style: TextStyle(color: greyTextColor, fontSize: 12)),
//                   const SizedBox(height: 2),
//                   Text(flight.departureTime,
//                       style: const TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 16,
//                           color: Colors.black)),
//                 ]),
//                 Text(
//                   'EGP ${flight.price}',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 16,
//                     color: themeBlue,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:apptravella/models/FlightData.dart';

// --- استيراد الملفات الضرورية ---
import 'package:apptravella/widgets/filter_screen.dart';
import 'FlightDetailsScreen.dart';

// --- !!! الخطوة الأهم: استيراد نموذج البيانات الصحيح !!! ---

// --- (تم حذف تعريف كلاس FlightData القديم من هنا بالكامل) ---

enum SortOption { highestRated, lowestPrice, highestPrice, lowestPriceAgain }

class FilterSettings {
  RangeValues priceRange;
  int? selectedStops;
  String? selectedDepartureTime;
  Set<String> selectedAirlines;

  FilterSettings({
    required this.priceRange,
    this.selectedStops,
    this.selectedDepartureTime,
    required this.selectedAirlines,
  });

  factory FilterSettings.initial(double minPrice, double maxPrice) {
    return FilterSettings(
      priceRange: RangeValues(minPrice, maxPrice),
      selectedStops: null,
      selectedDepartureTime: null,
      selectedAirlines: {},
    );
  }
}

class FlightResultsScreen extends StatefulWidget {
  final List<FlightData> initialFlights;
  final String destination;
  final String origin;
  final String date;
  final int adults;
  final int children;
  final String category;

  const FlightResultsScreen({
    super.key,
    required this.initialFlights,
    required this.destination,
    required this.origin,
    required this.date,
    required this.adults,
    required this.children,
    required this.category,
  });

  @override
  State<FlightResultsScreen> createState() => _FlightResultsScreenState();
}

class _FlightResultsScreenState extends State<FlightResultsScreen> {
  late List<FlightData> _originalFlightResults;
  late List<FlightData> _displayFlightResults;
  bool _isSortOverlayVisible = false;
  SortOption _selectedSortOption = SortOption.highestRated;
  final GlobalKey _sortButtonKey = GlobalKey();
  OverlayEntry? _sortOverlayEntry;
  late FilterSettings _currentFilterSettings;
  double _minPrice = 0;
  double _maxPrice = 10000;

  @override
  void initState() {
    super.initState();
    _originalFlightResults = List.from(widget.initialFlights);
    _displayFlightResults = []; // سيتم ملؤها بواسطة _applySortingAndFiltering
    _updatePriceRange(_originalFlightResults);
    _currentFilterSettings = FilterSettings.initial(_minPrice, _maxPrice);
    _applySortingAndFiltering();
  }

  @override
  void dispose() {
    _removeSortOverlay();
    super.dispose();
  }

  void _updatePriceRange(List<FlightData> data) {
    if (data.isEmpty) {
      _minPrice = 0;
      _maxPrice = 10000;
      return;
    }
    _minPrice = data.map((f) => f.priceValue).reduce((a, b) => a < b ? a : b);
    _maxPrice = data.map((f) => f.priceValue).reduce((a, b) => a > b ? a : b);
    if (_minPrice >= _maxPrice) {
      _maxPrice = _minPrice + 100;
    }
  }

  void _applySortingAndFiltering() {
    List<FlightData> filteredList = List.from(_originalFlightResults);

    filteredList = filteredList.where((flight) {
      bool priceMatch =
          flight.priceValue >= _currentFilterSettings.priceRange.start &&
              flight.priceValue <= _currentFilterSettings.priceRange.end;

      bool stopsMatch = _currentFilterSettings.selectedStops == null ||
          flight.stops == _currentFilterSettings.selectedStops;

      bool timeMatch = _currentFilterSettings.selectedDepartureTime == null ||
          (_currentFilterSettings.selectedDepartureTime == "Before 11AM" &&
              flight.departureTimeOfDay.hour < 11) ||
          (_currentFilterSettings.selectedDepartureTime == "11AM-5PM" &&
              flight.departureTimeOfDay.hour >= 11 &&
              flight.departureTimeOfDay.hour < 17);

      bool airlineMatch = _currentFilterSettings.selectedAirlines.isEmpty ||
          _currentFilterSettings.selectedAirlines.contains(flight.airlineName);

      return priceMatch && stopsMatch && timeMatch && airlineMatch;
    }).toList();

    switch (_selectedSortOption) {
      case SortOption.highestRated:
        filteredList.sort((a, b) => b.rating.compareTo(a.rating));
        break;
      case SortOption.lowestPrice:
      case SortOption.lowestPriceAgain:
        filteredList.sort((a, b) => a.priceValue.compareTo(b.priceValue));
        break;
      case SortOption.highestPrice:
        filteredList.sort((a, b) => b.priceValue.compareTo(b.priceValue));
        break;
    }

    setState(() {
      _displayFlightResults = filteredList;
    });
  }

  void _toggleSortOverlay() {
    if (_isSortOverlayVisible) {
      _removeSortOverlay();
    } else {
      _showSortOverlay();
    }
    setState(() {
      _isSortOverlayVisible = !_isSortOverlayVisible;
    });
  }

  void _showSortOverlay() {
    _removeSortOverlay();

    final RenderBox renderBox =
        _sortButtonKey.currentContext!.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final position = renderBox.localToGlobal(Offset.zero);

    _sortOverlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        left: position.dx - 10,
        top: position.dy + size.height + 5,
        width: 180,
        child: Material(
          elevation: 4.0,
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          child: _buildSortOverlayContent(),
        ),
      ),
    );

    Overlay.of(context).insert(_sortOverlayEntry!);
  }

  void _removeSortOverlay() {
    _sortOverlayEntry?.remove();
    _sortOverlayEntry = null;
  }

  Widget _buildSortOverlayContent() {
    Color selectedColor = const Color(0xFFE0EAF1);
    Color iconColor = Colors.grey.shade600;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildSortOptionItem(SortOption.highestRated, 'Highest rated',
            Icons.star_border, selectedColor, iconColor),
        _buildSortOptionItem(SortOption.lowestPrice, 'Lowest price',
            Icons.arrow_downward, selectedColor, iconColor),
        _buildSortOptionItem(SortOption.highestPrice, 'Highest price',
            Icons.arrow_upward, selectedColor, iconColor),
        _buildSortOptionItem(SortOption.lowestPriceAgain, 'Lowest price',
            Icons.arrow_downward, selectedColor, iconColor),
      ],
    );
  }

  Widget _buildSortOptionItem(SortOption option, String title, IconData icon,
      Color selectedBgColor, Color iconColor) {
    bool isSelected = _selectedSortOption == option;
    return InkWell(
      onTap: () {
        setState(() {
          _selectedSortOption = option;
          _applySortingAndFiltering();
        });
        _toggleSortOverlay();
      },
      child: Container(
        color: isSelected ? selectedBgColor : Colors.transparent,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: Row(
          children: [
            Icon(
              icon,
              size: 20,
              color: isSelected ? Theme.of(context).primaryColor : iconColor,
            ),
            const SizedBox(width: 12),
            Text(
              title,
              style: TextStyle(
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                color: Colors.black87,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToFilterScreen() async {
    if (_isSortOverlayVisible) {
      _toggleSortOverlay();
    }

    final uniqueAirlines =
        _originalFlightResults.map((f) => f.airlineName).toSet();

    final result = await Navigator.push<FilterSettings>(
      context,
      MaterialPageRoute(
        builder: (context) => FilterScreen(
          initialSettings: _currentFilterSettings,
          availableAirlines: uniqueAirlines.toList(),
          maxPriceValue: _maxPrice,
          minPriceValue: _minPrice,
        ),
      ),
    );

    if (result != null) {
      setState(() {
        _currentFilterSettings = result;
        _applySortingAndFiltering();
      });
    }
  }

  void _navigateToDetailsScreen(FlightData flight) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FlightDetailsScreen(
          flight: flight,
          isGuestUser: false,
          adults: widget.adults, // <-- تصحيح مهم
          children: widget.children, // <-- تصحيح مهم
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String passengerInfo =
        '${widget.adults} Adult${widget.adults > 1 ? 's' : ''}';
    if (widget.children > 0) {
      passengerInfo +=
          ', ${widget.children} Child${widget.children > 1 ? 'ren' : ''}';
    }
    int resultCount = _displayFlightResults.length;

    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F4),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                '${widget.origin} → ${widget.destination} ($resultCount results)'),
            const SizedBox(height: 2),
            Text(
              '${widget.date} - $passengerInfo',
              style: TextStyle(color: Colors.grey[600], fontSize: 12),
            ),
          ],
        ),
        centerTitle: false,
        titleSpacing: 0,
      ),
      body: Column(
        children: [
          Container(
            key: _sortButtonKey,
            color: Colors.white,
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton.icon(
                  onPressed: _toggleSortOverlay,
                  icon: const Icon(Icons.sort, color: Colors.black54, size: 20),
                  label: const Text('Sort',
                      style: TextStyle(color: Colors.black87, fontSize: 14)),
                  style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                ),
                TextButton.icon(
                  onPressed: _navigateToFilterScreen,
                  icon: const Icon(Icons.filter_list,
                      color: Colors.black54, size: 20),
                  label: const Text('Filter',
                      style: TextStyle(color: Colors.black87, fontSize: 14)),
                  style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                ),
              ],
            ),
          ),
          Expanded(
            child: _displayFlightResults.isEmpty
                ? const Center(
                    child:
                        Text("No flights found matching your search criteria."))
                : ListView.builder(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 16.0),
                    itemCount: _displayFlightResults.length,
                    itemBuilder: (context, index) {
                      final flight = _displayFlightResults[index];
                      return GestureDetector(
                        onTap: () => _navigateToDetailsScreen(flight),
                        child: _buildFlightCard(flight),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildFlightCard(FlightData flight) {
    const double cardPadding = 16.0;
    const double borderRadius = 12.0;
    const Color greyTextColor = Color(0xFF6E6E6E);
    final Color themeBlue = Theme.of(context).primaryColor;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
      elevation: 1.5,
      shadowColor: Colors.grey.withOpacity(0.3),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius)),
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: cardPadding,
                right: cardPadding,
                top: cardPadding,
                bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const Text('From',
                      style: TextStyle(color: greyTextColor, fontSize: 12)),
                  const SizedBox(height: 2),
                  Text(flight.fromCity,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black)),
                ]),
                SizedBox(
                  height: 24,
                  width: 80,
                  child: Image.asset(
                    flight.logoAsset,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) => Text(
                      flight.airlineName.split(' ').first,
                      style: const TextStyle(fontSize: 10, color: Colors.red),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                  const Text('To',
                      style: TextStyle(color: greyTextColor, fontSize: 12)),
                  const SizedBox(height: 2),
                  Text(flight.toCity,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black)),
                ]),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: cardPadding + 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.circle, size: 8, color: Colors.grey[300]),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '· ' * 15,
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey[400],
                            letterSpacing: 2),
                      ),
                      const SizedBox(height: 0),
                      Text(flight.duration,
                          style: const TextStyle(
                              fontSize: 11, color: greyTextColor)),
                    ],
                  ),
                ),
                Icon(Icons.flight, size: 20, color: themeBlue),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '· ' * 15,
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                            fontSize: 10,
                            color: Colors.grey[400],
                            letterSpacing: 2),
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
                Icon(Icons.circle, size: 8, color: Colors.grey[300]),
              ],
            ),
          ),
          const SizedBox(height: 5),
          Container(
            padding: const EdgeInsets.symmetric(
                horizontal: cardPadding, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.grey[100]?.withOpacity(0.5),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(borderRadius),
                bottomRight: Radius.circular(borderRadius),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const Text('Depart',
                      style: TextStyle(color: greyTextColor, fontSize: 12)),
                  const SizedBox(height: 2),
                  Text(flight.departureTime,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black)),
                ]),
                Text(
                  'EGP ${flight.price}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: themeBlue,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
