// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:travella/screens/HotelDetailsScreen.dart';
// import '../models/hotel_model.dart';
// import '../services/hotel_api_service.dart';
// import '../widgets/hotel_filter_screen.dart'; // تأكد من المسار
// import 'compare_hotels_screen.dart';

// // --- (الحل 1) تحديث كلاس الإعدادات ---
// class HotelFilterSettings {
//   RangeValues priceRange;
//   Set<String> selectedAmenities;
//   String? selectedRoomType; // --- إضافة نوع الغرفة
//   String? selectedCancellationPolicy;
//   double minRating;

//   HotelFilterSettings({
//     required this.priceRange,
//     required this.selectedAmenities,
//     this.selectedRoomType, // --- إضافة نوع الغرفة
//     this.selectedCancellationPolicy,
//     required this.minRating,
//   });

//   factory HotelFilterSettings.initial(double minPrice, double maxPrice) {
//     return HotelFilterSettings(
//       priceRange: RangeValues(minPrice, maxPrice),
//       selectedAmenities: {},
//       selectedRoomType: 'All', // --- قيمة افتراضية
//       selectedCancellationPolicy: 'All',
//       minRating: 0.0,
//     );
//   }
// }
// // --- نهاية الحل 1 ---

// // --- خيارات الترتيب للفنادق (لا تغيير) ---
// enum HotelSortOption {
//   highestRated,
//   lowestPrice,
//   highestPrice,
// }

// // --- شاشة عرض نتائج الفنادق (تعديلات) ---
// class HotelResultsScreen extends StatefulWidget {
//   final List<Hotel> initialHotels;
//   final String destination;
//   final DateTime checkInDate;
//   final DateTime checkOutDate;
//   final int nights;
//   final int adults;
//   final int children;

//   const HotelResultsScreen({
//     super.key,
//     required this.initialHotels,
//     required this.destination,
//     required this.checkInDate,
//     required this.checkOutDate,
//     required this.nights,
//     required this.adults,
//     required this.children,
//   });

//   @override
//   State<HotelResultsScreen> createState() => _HotelResultsScreenState();
// }

// class _HotelResultsScreenState extends State<HotelResultsScreen> {
//   final HotelApiService _hotelApiService = HotelApiService();
//   late List<Hotel> _originalHotelResults;
//   late List<Hotel> _displayHotelResults;
//   bool _isLoading = false;
//   HotelSortOption _selectedSortOption = HotelSortOption.highestRated;
//   late HotelFilterSettings _currentFilterSettings;
//   double _minPrice = 0;
//   double _maxPrice = 20000;

//   bool _isSortOverlayVisible = false;
//   final GlobalKey _sortButtonKey = GlobalKey();
//   OverlayEntry? _sortOverlayEntry;

//   @override
//   void initState() {
//     super.initState();
//     _originalHotelResults = List.from(widget.initialHotels);
//     _displayHotelResults = List.from(widget.initialHotels);
//     _updatePriceRange(_originalHotelResults);
//     // (الحل 2) التأكد من أن الإعدادات الأولية صحيحة
//     _currentFilterSettings = HotelFilterSettings.initial(_minPrice, _maxPrice);
//     _applySorting();
//   }

//   @override
//   void dispose() {
//     _removeSortOverlay();
//     super.dispose();
//   }

//   void _updatePriceRange(List<Hotel> data) {
//     if (data.isEmpty) {
//       _minPrice = 0;
//       _maxPrice = 20000;
//       return;
//     }
//     _minPrice = data.map((h) => h.price).reduce((a, b) => a < b ? a : b);
//     _maxPrice = data.map((h) => h.price).reduce((a, b) => a > b ? a : b);
//     if (_minPrice >= _maxPrice) {
//       _maxPrice = _minPrice + 500;
//     }
//   }

//   void _applySorting() {
//     List<Hotel> listToSort = List.from(_displayHotelResults);
//     switch (_selectedSortOption) {
//       case HotelSortOption.highestRated:
//         listToSort.sort((a, b) => b.rate.compareTo(a.rate));
//         break;
//       case HotelSortOption.lowestPrice:
//         listToSort.sort((a, b) => a.price.compareTo(b.price));
//         break;
//       case HotelSortOption.highestPrice:
//         listToSort.sort((a, b) => b.price.compareTo(a.price));
//         break;
//     }
//     setState(() {
//       _displayHotelResults = listToSort;
//     });
//   }

//   // (الحل 3) تعديل دالة تطبيق الفلاتر
//   Future<void> _applyFilters(HotelFilterSettings settings) async {
//     setState(() {
//       _isLoading = true;
//       _currentFilterSettings = settings;
//     });

//     try {
//       // Map amenities to boolean flags for the API
//       bool? hasWifi, hasPool, hasGym, hasSpa, hasRestaurant, hasParking;
//       if (settings.selectedAmenities.isNotEmpty &&
//           !settings.selectedAmenities.contains('All')) {
//         hasPool = settings.selectedAmenities.contains('Pool');
//         hasWifi = settings.selectedAmenities.contains('Free Wi-Fi');
//         hasParking = settings.selectedAmenities.contains('Parking');
//         // Note: 'Breakfast included' is not a direct boolean in your API, so we can't filter by it directly.
//         // You might need to adjust your API or amenities list.
//       }

//       final filteredList = await _hotelApiService.filterHotels(
//         minPrice: settings.priceRange.start,
//         maxPrice: settings.priceRange.end,
//         minRating: settings.minRating,
//         cancellationPolicy: settings.selectedCancellationPolicy,
//         roomType: settings.selectedRoomType, // Pass RoomType
//         hasPool: hasPool,
//         hasWifi: hasWifi,
//         hasParking: hasParking,
//         // ... pass other boolean flags if you add them
//       );

//       setState(() {
//         _originalHotelResults = filteredList;
//         _displayHotelResults = filteredList;
//         _applySorting();
//       });
//     } catch (e) {
//       if (mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("Filter failed: $e")),
//         );
//       }
//     } finally {
//       if (mounted) {
//         setState(() => _isLoading = false);
//       }
//     }
//   }

//   // --- دوال إدارة Overlay الترتيب (لا تغيير) ---
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
//         _buildSortOptionItem(HotelSortOption.highestRated, 'Highest rated',
//             Icons.star, selectedColor, iconColor),
//         _buildSortOptionItem(HotelSortOption.lowestPrice, 'Lowest price',
//             Icons.arrow_downward, selectedColor, iconColor),
//         _buildSortOptionItem(HotelSortOption.highestPrice, 'Highest price',
//             Icons.arrow_upward, selectedColor, iconColor),
//       ],
//     );
//   }

//   Widget _buildSortOptionItem(HotelSortOption option, String title,
//       IconData icon, Color selectedBgColor, Color iconColor) {
//     bool isSelected = _selectedSortOption == option;
//     return InkWell(
//       onTap: () {
//         setState(() {
//           _selectedSortOption = option;
//           _applySorting();
//         });
//         _toggleSortOverlay();
//       },
//       child: Container(
//         color: isSelected ? selectedBgColor : Colors.transparent,
//         padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
//         child: Row(
//           children: [
//             Icon(icon,
//                 size: 20,
//                 color: isSelected ? Theme.of(context).primaryColor : iconColor),
//             const SizedBox(width: 12),
//             Text(title,
//                 style: TextStyle(
//                     fontWeight:
//                         isSelected ? FontWeight.bold : FontWeight.normal,
//                     color: Colors.black87,
//                     fontSize: 14)),
//           ],
//         ),
//       ),
//     );
//   }

//   void _navigateToFilterScreen() async {
//     _removeSortOverlay();
//     setState(() {
//       _isSortOverlayVisible = false;
//     });

//     final result = await Navigator.push<HotelFilterSettings>(
//       context,
//       MaterialPageRoute(
//         builder: (context) => HotelFilterScreen(
//           initialSettings: _currentFilterSettings,
//           minPriceValue: _minPrice,
//           maxPriceValue: _maxPrice,
//         ),
//       ),
//     );

//     if (result != null) {
//       _applyFilters(result);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     // ... الكود البصري كما هو، لا تغييرات هنا
//     final DateFormat formatter = DateFormat('d MMM');
//     final String dateRangeString =
//         '${formatter.format(widget.checkInDate)} - ${formatter.format(widget.checkOutDate)}';
//     String guestString =
//         '${widget.adults} adult${widget.adults > 1 ? 's' : ''}';
//     if (widget.children > 0) {
//       guestString +=
//           ', ${widget.children} child${widget.children > 1 ? 'ren' : ''}';
//     }
//     int resultCount = _displayHotelResults.length;
//     int hotelsToCompareCount =
//         _originalHotelResults.where((h) => h.isCompared).length;

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
//             Text('${widget.destination} ($resultCount results)'),
//             const SizedBox(height: 2),
//             Text('$dateRangeString | $guestString',
//                 style: TextStyle(color: Colors.grey[600], fontSize: 12)),
//           ],
//         ),
//         centerTitle: false,
//         titleSpacing: 0,
//         actions: [
//           if (hotelsToCompareCount > 0)
//             Padding(
//               padding: const EdgeInsets.only(right: 8.0),
//               child: TextButton(
//                 onPressed: () {
//                   final selectedHotels =
//                       _originalHotelResults.where((h) => h.isCompared).toList();
//                   if (selectedHotels.isNotEmpty) {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (_) => CompareHotelsScreen(
//                                 hotelsToCompare: selectedHotels)));
//                   }
//                 },
//                 child: Text(
//                   'Compare ($hotelsToCompareCount)',
//                   style: TextStyle(
//                     color: Theme.of(context).primaryColor,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//         ],
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
//                 ),
//                 TextButton.icon(
//                   onPressed: _navigateToFilterScreen,
//                   icon: const Icon(Icons.filter_list,
//                       color: Colors.black54, size: 20),
//                   label: const Text('Filter',
//                       style: TextStyle(color: Colors.black87, fontSize: 14)),
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             child: _isLoading
//                 ? const Center(child: CircularProgressIndicator())
//                 : _displayHotelResults.isEmpty
//                     ? const Center(
//                         child: Text("No hotels found matching your criteria."))
//                     : ListView.builder(
//                         padding: const EdgeInsets.all(16.0),
//                         itemCount: _displayHotelResults.length,
//                         itemBuilder: (context, index) {
//                           return _buildHotelCard(_displayHotelResults[index]);
//                         },
//                       ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildHotelCard(Hotel hotel) {
//     // ... الكود البصري كما هو، لا تغييرات هنا
//     final Color themePrimaryColor = Theme.of(context).primaryColor;
//     const double borderRadiusValue = 12.0;

//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//             context,
//             MaterialPageRoute(
//                 builder: (context) => HotelDetailsScreen(
//                       hotelId: hotel.id,
//                       isGuestUser: false,
//                       // nights: widget.nights,
//                       // imageUrl: '',
//                       // hotelName: '',
//                       // location: '',
//                       // rating: 0,
//                       // reviewCount: 0,
//                       // description: '',
//                       // facilities: [],
//                       // price: 0,
//                     )));
//       },
//       child: Card(
//         margin: const EdgeInsets.only(bottom: 12.0),
//         elevation: 2.0,
//         shadowColor: Colors.grey.withOpacity(0.3),
//         shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(borderRadiusValue)),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Stack(
//               children: [
//                 ClipRRect(
//                   borderRadius: const BorderRadius.vertical(
//                       top: Radius.circular(borderRadiusValue)),
//                   child: Image.network(
//                     hotel.primaryImageUrl,
//                     height: 160,
//                     width: double.infinity,
//                     fit: BoxFit.cover,
//                     errorBuilder: (context, error, stackTrace) => Container(
//                       height: 160,
//                       color: Colors.grey[300],
//                       child: Center(
//                           child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Icon(Icons.broken_image,
//                               color: Colors.grey[600], size: 40),
//                           const SizedBox(height: 4),
//                           Text('Cannot load image',
//                               style: TextStyle(
//                                   fontSize: 10, color: Colors.grey[600])),
//                         ],
//                       )),
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   top: 8,
//                   right: 8,
//                   child: InkWell(
//                     onTap: () {
//                       setState(() {
//                         hotel.isCompared = !hotel.isCompared;
//                       });
//                     },
//                     child: Container(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 8, vertical: 4),
//                       decoration: BoxDecoration(
//                         color: hotel.isCompared
//                             ? themePrimaryColor
//                             : Colors.black.withOpacity(0.4),
//                         borderRadius: BorderRadius.circular(15),
//                       ),
//                       child: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Icon(
//                             hotel.isCompared
//                                 ? Icons.check_circle
//                                 : Icons.radio_button_unchecked,
//                             color: Colors.white,
//                             size: 16,
//                           ),
//                           const SizedBox(width: 4),
//                           const Text(
//                             'Compare',
//                             style: TextStyle(color: Colors.white, fontSize: 11),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             Padding(
//               padding: const EdgeInsets.all(12.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Expanded(
//                         child: Text(
//                           hotel.name,
//                           style: const TextStyle(
//                               fontSize: 16, fontWeight: FontWeight.bold),
//                           maxLines: 2,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ),
//                       const SizedBox(width: 8),
//                       Row(
//                         children: List.generate(5, (index) {
//                           return Icon(
//                             index < hotel.rate.floor()
//                                 ? Icons.star
//                                 : Icons.star_border,
//                             color: Colors.amber[600],
//                             size: 18,
//                           );
//                         }),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 6),
//                   Row(
//                     children: [
//                       Icon(Icons.location_on_outlined,
//                           size: 14, color: Colors.grey[600]),
//                       const SizedBox(width: 4),
//                       Expanded(
//                         child: Text(
//                           '${hotel.city}, ${hotel.countery}',
//                           style:
//                               TextStyle(fontSize: 12, color: Colors.grey[700]),
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 10),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     crossAxisAlignment: CrossAxisAlignment.baseline,
//                     textBaseline: TextBaseline.alphabetic,
//                     children: [
//                       Text(
//                         hotel.formattedPrice,
//                         style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                             color: themePrimaryColor),
//                       ),
//                       const SizedBox(width: 4),
//                       Padding(
//                         padding: const EdgeInsets.only(top: 4.0),
//                         child: Text(
//                           hotel.priceSubtitle(widget.nights),
//                           style:
//                               TextStyle(fontSize: 11, color: Colors.grey[600]),
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 10),
//                   Divider(color: Colors.grey[300]),
//                   const SizedBox(height: 6),
//                   Wrap(
//                     spacing: 12.0,
//                     runSpacing: 4.0,
//                     children: hotel.amenities.map((amenity) {
//                       IconData amenityIcon = Icons.check_circle_outline;
//                       if (amenity.toLowerCase().contains('wifi'))
//                         amenityIcon = Icons.wifi;
//                       if (amenity.toLowerCase().contains('breakfast'))
//                         amenityIcon = Icons.free_breakfast;
//                       if (amenity.toLowerCase().contains('cancellation'))
//                         amenityIcon = Icons.event_available;
//                       if (amenity.toLowerCase().contains('pool'))
//                         amenityIcon = Icons.pool;
//                       if (amenity.toLowerCase().contains('gym'))
//                         amenityIcon = Icons.fitness_center;

//                       return Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Icon(amenityIcon, size: 14, color: Colors.green[800]),
//                           const SizedBox(width: 4),
//                           Text(amenity,
//                               style: TextStyle(
//                                   fontSize: 11, color: Colors.grey[800])),
//                         ],
//                       );
//                     }).toList(),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:apptravella/screens/HotelDetailsScreen.dart';
import '../models/hotel_model.dart';
import '../services/hotel_api_service.dart';
import '../widgets/hotel_filter_screen.dart';
import 'compare_hotels_screen.dart';

// --- كلاس إعدادات الفلترة ---
class HotelFilterSettings {
  RangeValues priceRange;
  Set<String> selectedAmenities;
  String? selectedRoomType;
  String? selectedCancellationPolicy;
  double minRating;

  HotelFilterSettings({
    required this.priceRange,
    required this.selectedAmenities,
    this.selectedRoomType,
    this.selectedCancellationPolicy,
    required this.minRating,
  });

  factory HotelFilterSettings.initial(double minPrice, double maxPrice) {
    return HotelFilterSettings(
      priceRange: RangeValues(minPrice, maxPrice),
      selectedAmenities: {},
      selectedRoomType: 'All',
      selectedCancellationPolicy: 'All',
      minRating: 0.0,
    );
  }
}

// --- خيارات الترتيب للفنادق ---
enum HotelSortOption {
  highestRated,
  lowestPrice,
  highestPrice,
}

// --- شاشة عرض نتائج الفنادق ---
class HotelResultsScreen extends StatefulWidget {
  final List<Hotel> initialHotels;
  final String destination;
  final DateTime checkInDate;
  final DateTime checkOutDate;
  final int nights;
  final int adults;
  final int children;

  const HotelResultsScreen({
    super.key,
    required this.initialHotels,
    required this.destination,
    required this.checkInDate,
    required this.checkOutDate,
    required this.nights,
    required this.adults,
    required this.children,
  });

  @override
  State<HotelResultsScreen> createState() => _HotelResultsScreenState();
}

class _HotelResultsScreenState extends State<HotelResultsScreen> {
  final HotelApiService _hotelApiService = HotelApiService();
  late List<Hotel> _originalHotelResults;
  late List<Hotel> _displayHotelResults;
  bool _isLoading = false;
  HotelSortOption _selectedSortOption = HotelSortOption.highestRated;
  late HotelFilterSettings _currentFilterSettings;
  double _minPrice = 0;
  double _maxPrice = 20000;

  bool _isSortOverlayVisible = false;
  final GlobalKey _sortButtonKey = GlobalKey();
  OverlayEntry? _sortOverlayEntry;

  @override
  void initState() {
    super.initState();
    _originalHotelResults = List.from(widget.initialHotels);
    _displayHotelResults = List.from(widget.initialHotels);
    _updatePriceRange(_originalHotelResults);
    _currentFilterSettings = HotelFilterSettings.initial(_minPrice, _maxPrice);
    _applySorting();
  }

  @override
  void dispose() {
    _removeSortOverlay();
    super.dispose();
  }

  void _updatePriceRange(List<Hotel> data) {
    if (data.isEmpty) {
      _minPrice = 0;
      _maxPrice = 20000;
      return;
    }
    _minPrice = data.map((h) => h.price).reduce((a, b) => a < b ? a : b);
    _maxPrice = data.map((h) => h.price).reduce((a, b) => a > b ? a : b);
    if (_minPrice >= _maxPrice) {
      _maxPrice = _minPrice + 500;
    }
  }

  void _applySorting() {
    List<Hotel> listToSort = List.from(_displayHotelResults);
    switch (_selectedSortOption) {
      case HotelSortOption.highestRated:
        listToSort.sort((a, b) => b.rate.compareTo(a.rate));
        break;
      case HotelSortOption.lowestPrice:
        listToSort.sort((a, b) => a.price.compareTo(b.price));
        break;
      case HotelSortOption.highestPrice:
        listToSort.sort((a, b) => b.price.compareTo(a.price));
        break;
    }
    setState(() {
      _displayHotelResults = listToSort;
    });
  }

  Future<void> _applyFilters(HotelFilterSettings settings) async {
    setState(() {
      _isLoading = true;
      _currentFilterSettings = settings;
    });

    try {
      bool? hasWifi, hasPool, hasGym;
      if (settings.selectedAmenities.isNotEmpty &&
          !settings.selectedAmenities.contains('All')) {
        hasPool = settings.selectedAmenities.contains('Pool');
        hasWifi = settings.selectedAmenities.contains('Free Wi-Fi');
        hasGym = settings.selectedAmenities.contains('Gym');
      }

      final filteredList = await _hotelApiService.filterHotels(
        minPrice: settings.priceRange.start,
        maxPrice: settings.priceRange.end,
        minRating: settings.minRating,
        cancellationPolicy: settings.selectedCancellationPolicy,
        roomType: settings.selectedRoomType,
        hasPool: hasPool,
        hasWifi: hasWifi,
        hasGym: hasGym,
      );

      setState(() {
        _originalHotelResults = filteredList;
        _displayHotelResults = filteredList;
        _applySorting();
      });
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Filter failed: $e")),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
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
        _buildSortOptionItem(HotelSortOption.highestRated, 'Highest rated',
            Icons.star, selectedColor, iconColor),
        _buildSortOptionItem(HotelSortOption.lowestPrice, 'Lowest price',
            Icons.arrow_downward, selectedColor, iconColor),
        _buildSortOptionItem(HotelSortOption.highestPrice, 'Highest price',
            Icons.arrow_upward, selectedColor, iconColor),
      ],
    );
  }

  Widget _buildSortOptionItem(HotelSortOption option, String title,
      IconData icon, Color selectedBgColor, Color iconColor) {
    bool isSelected = _selectedSortOption == option;
    return InkWell(
      onTap: () {
        setState(() {
          _selectedSortOption = option;
          _applySorting();
        });
        _toggleSortOverlay();
      },
      child: Container(
        color: isSelected ? selectedBgColor : Colors.transparent,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: Row(
          children: [
            Icon(icon,
                size: 20,
                color: isSelected ? Theme.of(context).primaryColor : iconColor),
            const SizedBox(width: 12),
            Text(title,
                style: TextStyle(
                    fontWeight:
                        isSelected ? FontWeight.bold : FontWeight.normal,
                    color: Colors.black87,
                    fontSize: 14)),
          ],
        ),
      ),
    );
  }

  void _navigateToFilterScreen() async {
    _removeSortOverlay();
    setState(() {
      _isSortOverlayVisible = false;
    });

    final result = await Navigator.push<HotelFilterSettings>(
      context,
      MaterialPageRoute(
        builder: (context) => HotelFilterScreen(
          initialSettings: _currentFilterSettings,
          minPriceValue: _minPrice,
          maxPriceValue: _maxPrice,
        ),
      ),
    );

    if (result != null) {
      _applyFilters(result);
    }
  }

  @override
  Widget build(BuildContext context) {
    final DateFormat formatter = DateFormat('d MMM');
    final String dateRangeString =
        '${formatter.format(widget.checkInDate)} - ${formatter.format(widget.checkOutDate)}';
    String guestString =
        '${widget.adults} adult${widget.adults > 1 ? 's' : ''}';
    if (widget.children > 0) {
      guestString +=
          ', ${widget.children} child${widget.children > 1 ? 'ren' : ''}';
    }
    int resultCount = _displayHotelResults.length;
    int hotelsToCompareCount =
        _originalHotelResults.where((h) => h.isCompared).length;

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
            Text('${widget.destination} ($resultCount results)'),
            const SizedBox(height: 2),
            Text('$dateRangeString | $guestString',
                style: TextStyle(color: Colors.grey[600], fontSize: 12)),
          ],
        ),
        centerTitle: false,
        titleSpacing: 0,
        actions: [
          if (hotelsToCompareCount > 0)
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: TextButton(
                onPressed: () {
                  final selectedHotels =
                      _originalHotelResults.where((h) => h.isCompared).toList();
                  if (selectedHotels.isNotEmpty) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => CompareHotelsScreen(
                                hotelsToCompare: selectedHotels)));
                  }
                },
                child: Text(
                  'Compare ($hotelsToCompareCount)',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
        ],
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
                ),
                TextButton.icon(
                  onPressed: _navigateToFilterScreen,
                  icon: const Icon(Icons.filter_list,
                      color: Colors.black54, size: 20),
                  label: const Text('Filter',
                      style: TextStyle(color: Colors.black87, fontSize: 14)),
                ),
              ],
            ),
          ),
          Expanded(
            child: _isLoading
                ? const Center(child: CircularProgressIndicator())
                : _displayHotelResults.isEmpty
                    ? const Center(
                        child: Text("No hotels found matching your criteria."))
                    : ListView.builder(
                        padding: const EdgeInsets.all(16.0),
                        itemCount: _displayHotelResults.length,
                        itemBuilder: (context, index) {
                          return _buildHotelCard(_displayHotelResults[index]);
                        },
                      ),
          ),
        ],
      ),
    );
  }

  Widget _buildHotelCard(Hotel hotel) {
    final Color themePrimaryColor = Theme.of(context).primaryColor;
    const double borderRadiusValue = 12.0;

    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => HotelDetailsScreen(
                      hotelId: hotel.id,
                    )));
      },
      child: Card(
        margin: const EdgeInsets.only(bottom: 12.0),
        elevation: 2.0,
        shadowColor: Colors.grey.withOpacity(0.3),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadiusValue)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(borderRadiusValue)),
                  child: Image.network(
                    hotel.primaryImageUrl,
                    height: 160,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      height: 160,
                      color: Colors.grey[300],
                      child: Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.broken_image,
                              color: Colors.grey[600], size: 40),
                          const SizedBox(height: 4),
                          Text('Cannot load image',
                              style: TextStyle(
                                  fontSize: 10, color: Colors.grey[600])),
                        ],
                      )),
                    ),
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        hotel.isCompared = !hotel.isCompared;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: hotel.isCompared
                            ? themePrimaryColor
                            : Colors.black.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            hotel.isCompared
                                ? Icons.check_circle
                                : Icons.radio_button_unchecked,
                            color: Colors.white,
                            size: 16,
                          ),
                          const SizedBox(width: 4),
                          const Text(
                            'Compare',
                            style: TextStyle(color: Colors.white, fontSize: 11),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          hotel.name,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Row(
                        children: List.generate(5, (index) {
                          return Icon(
                            index < hotel.rate.floor()
                                ? Icons.star
                                : Icons.star_border,
                            color: Colors.amber[600],
                            size: 18,
                          );
                        }),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Icon(Icons.location_on_outlined,
                          size: 14, color: Colors.grey[600]),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          '${hotel.city}, ${hotel.countery}',
                          style:
                              TextStyle(fontSize: 12, color: Colors.grey[700]),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        hotel.formattedPrice,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: themePrimaryColor),
                      ),
                      const SizedBox(width: 4),
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Text(
                          hotel.priceSubtitle(widget.nights),
                          style:
                              TextStyle(fontSize: 11, color: Colors.grey[600]),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Divider(color: Colors.grey[300]),
                  const SizedBox(height: 6),
                  Wrap(
                    spacing: 12.0,
                    runSpacing: 4.0,
                    children: hotel.amenities.map((amenity) {
                      IconData amenityIcon = Icons.check_circle_outline;
                      if (amenity.toLowerCase().contains('wifi')) {
                        amenityIcon = Icons.wifi;
                      }
                      if (amenity.toLowerCase().contains('breakfast')) {
                        amenityIcon = Icons.free_breakfast;
                      }
                      if (amenity.toLowerCase().contains('cancellation')) {
                        amenityIcon = Icons.event_available;
                      }
                      if (amenity.toLowerCase().contains('pool')) {
                        amenityIcon = Icons.pool;
                      }
                      if (amenity.toLowerCase().contains('gym')) {
                        amenityIcon = Icons.fitness_center;
                      }

                      return Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(amenityIcon, size: 14, color: Colors.green[800]),
                          const SizedBox(width: 4),
                          Text(amenity,
                              style: TextStyle(
                                  fontSize: 11, color: Colors.grey[800])),
                        ],
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
