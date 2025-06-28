// // // // import 'package:flutter/material.dart';
// // // // // import 'dart:math'; // غير مستخدم حاليًا

// // // // // --- تأكد من صحة مسارات الاستيراد ---
// // // // import '../models/car.dart'; // يفترض وجود نموذج Car هنا
// // // // import '../widgets/car_filter_screen.dart'; // يفترض وجود شاشة وفلتر الإعدادات هنا
// // // // // --- !!! استيراد شاشة تفاصيل السيارة !!! ---
// // // // import 'car_details_screen.dart';

// // // // class CarSearchResultsScreen extends StatefulWidget {
// // // //   final String location;
// // // //   final DateTime date;
// // // //   final String rentType;

// // // //   // Constructor مع قيم افتراضية وتأمين null للتاريخ
// // // //   CarSearchResultsScreen({
// // // //     super.key,
// // // //     this.location = 'Default Location', // قيمة افتراضية
// // // //     DateTime? date, // السماح بأن يكون التاريخ اختياريًا
// // // //     this.rentType = 'Daily', // قيمة افتراضية
// // // //   }) : date = date ?? DateTime.now(); // تعيين التاريخ الحالي إذا لم يتم تمريره

// // // //   @override
// // // //   State<CarSearchResultsScreen> createState() => _CarSearchResultsScreenState();
// // // // }

// // // // class _CarSearchResultsScreenState extends State<CarSearchResultsScreen> {
// // // //   late List<Car> _originalCars;
// // // //   late List<Car> _filteredCars;
// // // //   String _sortBy = 'recommended'; // قيمة التصنيف الافتراضية

// // // //   // إعدادات الفلتر الافتراضية
// // // //   CarFilterSettings _filterSettings = CarFilterSettings(
// // // //     priceRange: const RangeValues(0, 5000),
// // // //     selectedTypes: {'All'},
// // // //     selectedTransmissions: {'All'},
// // // //     selectedBrands: {'All'},
// // // //     selectedEngines: {'All'},
// // // //     minRating: 0,
// // // //   );

// // // //   // تحديد الأسعار للفلتر
// // // //   final double _minPrice = 0;
// // // //   final double _maxPrice = 5000; // عدّل حسب بياناتك

// // // //   @override
// // // //   void initState() {
// // // //     super.initState();
// // // //     // تحميل البيانات الأولية (استبدل بمصدر بياناتك الفعلي)
// // // //     _originalCars = List<Car>.from(Car.getSampleCars());
// // // //     _filteredCars = List<Car>.from(_originalCars);
// // // //     _applyFiltersAndSorting(); // تطبيق الفلاتر والتصنيف الأولي
// // // //   }

// // // //   // دالة عرض شاشة الفلتر
// // // //   void _showFilterScreen() {
// // // //     showModalBottomSheet<CarFilterSettings>(
// // // //       context: context,
// // // //       isScrollControlled: true,
// // // //       backgroundColor: Colors.transparent,
// // // //       shape: const RoundedRectangleBorder(
// // // //         borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
// // // //       ),
// // // //       builder: (context) => CarFilterScreen(
// // // //         initialSettings: _filterSettings,
// // // //         minPriceValue: _minPrice,
// // // //         maxPriceValue: _maxPrice,
// // // //       ),
// // // //     ).then((newSettings) {
// // // //       if (newSettings != null) {
// // // //         setState(() {
// // // //           _filterSettings = newSettings;
// // // //           _applyFiltersAndSorting();
// // // //         });
// // // //       }
// // // //     });
// // // //   }

// // // //   // دالة عرض خيارات التصنيف
// // // //   void _showSortOptions() {
// // // //     final Map<String, String> sortOptions = {
// // // //       'recommended': 'Highest rated',
// // // //       'price_low': 'Lowest price',
// // // //       'price_high': 'Highest price'
// // // //     };
// // // //     showModalBottomSheet(
// // // //       context: context,
// // // //       shape: const RoundedRectangleBorder(
// // // //           borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
// // // //       builder: (context) => Container(
// // // //         padding: const EdgeInsets.symmetric(vertical: 16.0),
// // // //         child: Column(
// // // //           mainAxisSize: MainAxisSize.min,
// // // //           crossAxisAlignment: CrossAxisAlignment.start,
// // // //           children: [
// // // //             ...sortOptions.entries.map((entry) {
// // // //               final key = entry.key;
// // // //               final value = entry.value;
// // // //               final bool isSelected = _sortBy == key;
// // // //               return ListTile(
// // // //                 visualDensity: VisualDensity.compact,
// // // //                 title: Text(value,
// // // //                     style: TextStyle(
// // // //                         fontWeight:
// // // //                             isSelected ? FontWeight.w600 : FontWeight.normal,
// // // //                         color: isSelected
// // // //                             ? const Color(0xFF4E7D96)
// // // //                             : Colors.black87,
// // // //                         fontSize: 15)),
// // // //                 trailing: isSelected
// // // //                     ? const Icon(Icons.check,
// // // //                         color: Color(0xFF4E7D96), size: 20)
// // // //                     : null,
// // // //                 onTap: () {
// // // //                   if (_sortBy != key) {
// // // //                     setState(() {
// // // //                       _sortBy = key;
// // // //                       _applyFiltersAndSorting();
// // // //                     });
// // // //                   }
// // // //                   Navigator.pop(context);
// // // //                 },
// // // //               );
// // // //             }).toList(),
// // // //           ],
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }

// // // //   // دالة تطبيق الفلاتر والتصنيف
// // // //   void _applyFiltersAndSorting() {
// // // //     List<Car> currentlyFiltered = List<Car>.from(_originalCars);
// // // //     currentlyFiltered = currentlyFiltered.where((car) {
// // // //       bool matchesPrice = car.price >= _filterSettings.priceRange.start &&
// // // //           car.price <= _filterSettings.priceRange.end;
// // // //       bool matchesType = _filterSettings.selectedTypes.contains('All') ||
// // // //           _filterSettings.selectedTypes.contains(car.type);
// // // //       bool matchesTransmission =
// // // //           _filterSettings.selectedTransmissions.contains('All') ||
// // // //               _filterSettings.selectedTransmissions.contains(car.transmission);
// // // //       bool matchesBrand = _filterSettings.selectedBrands.contains('All') ||
// // // //           _filterSettings.selectedBrands.contains(car.brand);
// // // //       bool matchesEngine = _filterSettings.selectedEngines.contains('All') ||
// // // //           _filterSettings.selectedEngines.contains(car.fuelType);
// // // //       bool matchesRating = car.rating >= _filterSettings.minRating;
// // // //       return matchesPrice &&
// // // //           matchesType &&
// // // //           matchesTransmission &&
// // // //           matchesBrand &&
// // // //           matchesEngine &&
// // // //           matchesRating;
// // // //     }).toList();

// // // //     switch (_sortBy) {
// // // //       case 'price_low':
// // // //         currentlyFiltered.sort((a, b) => a.price.compareTo(b.price));
// // // //         break;
// // // //       case 'price_high':
// // // //         currentlyFiltered.sort((a, b) => b.price.compareTo(a.price));
// // // //         break;
// // // //       case 'recommended':
// // // //       default:
// // // //         currentlyFiltered.sort((a, b) => b.rating.compareTo(a.rating));
// // // //         break;
// // // //     }
// // // //     setState(() {
// // // //       _filteredCars = currentlyFiltered;
// // // //     });
// // // //   }

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     bool isFilterActive =
// // // //         _filterSettings.priceRange != const RangeValues(0, 5000) ||
// // // //             (_filterSettings.selectedTypes.length > 1 ||
// // // //                 !_filterSettings.selectedTypes.contains('All')) ||
// // // //             (_filterSettings.selectedTransmissions.length > 1 ||
// // // //                 !_filterSettings.selectedTransmissions.contains('All')) ||
// // // //             (_filterSettings.selectedBrands.length > 1 ||
// // // //                 !_filterSettings.selectedBrands.contains('All')) ||
// // // //             (_filterSettings.selectedEngines.length > 1 ||
// // // //                 !_filterSettings.selectedEngines.contains('All')) ||
// // // //             _filterSettings.minRating > 0;

// // // //     return Scaffold(
// // // //       backgroundColor: Colors.white,
// // // //       appBar: AppBar(
// // // //         scrolledUnderElevation: 1.0,
// // // //         backgroundColor: Colors.white,
// // // //         elevation: 0.5,
// // // //         shadowColor: Colors.grey.shade300,
// // // //         leading: IconButton(
// // // //             icon: const Icon(Icons.arrow_back, color: Colors.black),
// // // //             onPressed: () => Navigator.pop(context)),
// // // //         titleSpacing: 0,
// // // //         title: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
// // // //           Text(widget.location,
// // // //               style: const TextStyle(
// // // //                   color: Colors.black,
// // // //                   fontSize: 16,
// // // //                   fontWeight: FontWeight.bold),
// // // //               overflow: TextOverflow.ellipsis),
// // // //           const SizedBox(height: 2),
// // // //           Text('${_filteredCars.length} results found',
// // // //               style: TextStyle(color: Colors.grey[600], fontSize: 13))
// // // //         ]),
// // // //         actions: [
// // // //           TextButton.icon(
// // // //               onPressed: _showSortOptions,
// // // //               icon:
// // // //                   Icon(Icons.swap_vert, color: Colors.grey.shade700, size: 22),
// // // //               label: Text('Sort',
// // // //                   style: TextStyle(color: Colors.grey.shade700, fontSize: 14)),
// // // //               style:
// // // //                   TextButton.styleFrom(foregroundColor: Colors.grey.shade700)),
// // // //           TextButton.icon(
// // // //             onPressed: _showFilterScreen,
// // // //             icon: Stack(clipBehavior: Clip.none, children: [
// // // //               Icon(Icons.filter_list, color: Colors.grey.shade700, size: 22),
// // // //               if (isFilterActive)
// // // //                 Positioned(
// // // //                     top: -2,
// // // //                     right: -4,
// // // //                     child: Container(
// // // //                         padding: const EdgeInsets.all(3),
// // // //                         decoration: const BoxDecoration(
// // // //                             color: Color(0xFF4E7D96), shape: BoxShape.circle)))
// // // //             ]),
// // // //             label: Text('Filter',
// // // //                 style: TextStyle(color: Colors.grey.shade700, fontSize: 14)),
// // // //             style: TextButton.styleFrom(foregroundColor: Colors.grey.shade700),
// // // //           ),
// // // //           const SizedBox(width: 8),
// // // //         ],
// // // //       ),
// // // //       body: _filteredCars.isEmpty
// // // //           ? Center(
// // // //               child: Padding(
// // // //                   padding: const EdgeInsets.all(20.0),
// // // //                   child: Text(
// // // //                       'No cars found matching your criteria.\nTry adjusting the filters.',
// // // //                       style: TextStyle(
// // // //                           fontSize: 16, color: Colors.grey[600], height: 1.5),
// // // //                       textAlign: TextAlign.center)))
// // // //           : ListView.builder(
// // // //               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
// // // //               itemCount: _filteredCars.length,
// // // //               itemBuilder: (context, index) {
// // // //                 final car = _filteredCars[index];
// // // //                 // --- بناء بطاقة السيارة واستخدام الدالة المساعدة ---
// // // //                 return _buildCarCard(car);
// // // //               },
// // // //             ),
// // // //     );
// // // //   }

// // // //   // --- الدالة المساعدة لبناء بطاقة السيارة ---
// // // //   Widget _buildCarCard(Car car) {
// // // //     return Card(
// // // //       elevation: 2.0,
// // // //       margin: const EdgeInsets.only(bottom: 16),
// // // //       color: Colors.grey.shade50,
// // // //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
// // // //       child: InkWell(
// // // //         // لجعل البطاقة قابلة للنقر
// // // //         borderRadius: BorderRadius.circular(12),
// // // //         // --- !!! تعديل onTap للانتقال لشاشة التفاصيل !!! ---
// // // //         onTap: () {
// // // //           Navigator.push(
// // // //             context,
// // // //             MaterialPageRoute(
// // // //               // الانتقال وتمرير كائن السيارة المحدد
// // // //               builder: (context) => CarDetailsScreen(car: car),
// // // //             ),
// // // //           );
// // // //         },
// // // //         // --- !!! نهاية التعديل !!! ---
// // // //         child: Column(
// // // //           crossAxisAlignment: CrossAxisAlignment.start,
// // // //           children: [
// // // //             // قسم الصورة مع زر المفضلة
// // // //             Stack(
// // // //               children: [
// // // //                 ClipRRect(
// // // //                   borderRadius:
// // // //                       const BorderRadius.vertical(top: Radius.circular(12)),
// // // //                   child: Image.asset(
// // // //                     // أو Image.network
// // // //                     car.imageUrl,
// // // //                     height: 180, width: double.infinity, fit: BoxFit.cover,
// // // //                     errorBuilder: (context, error, stackTrace) => Container(
// // // //                         height: 180,
// // // //                         width: double.infinity,
// // // //                         decoration: BoxDecoration(
// // // //                             color: Colors.grey[300],
// // // //                             borderRadius: const BorderRadius.vertical(
// // // //                                 top: Radius.circular(12))),
// // // //                         child: Center(
// // // //                             child: Icon(Icons.directions_car_filled_outlined,
// // // //                                 size: 50, color: Colors.grey[500]))),
// // // //                   ),
// // // //                 ),
// // // //                 Positioned(
// // // //                   // زر المفضلة
// // // //                   top: 10, right: 10,
// // // //                   child: Material(
// // // //                     color: Colors.black.withOpacity(0.45),
// // // //                     shape: const CircleBorder(),
// // // //                     elevation: 1.0,
// // // //                     child: InkWell(
// // // //                       onTap: () {
// // // //                         setState(() {
// // // //                           final originalCarIndex =
// // // //                               _originalCars.indexWhere((c) => c.id == car.id);
// // // //                           if (originalCarIndex != -1) {
// // // //                             _originalCars[originalCarIndex].isFavorite =
// // // //                                 !_originalCars[originalCarIndex].isFavorite;
// // // //                           }
// // // //                           car.isFavorite = !car.isFavorite;
// // // //                         });
// // // //                       },
// // // //                       customBorder: const CircleBorder(),
// // // //                       child: Padding(
// // // //                           padding: const EdgeInsets.all(7),
// // // //                           child: Icon(
// // // //                               car.isFavorite
// // // //                                   ? Icons.favorite
// // // //                                   : Icons.favorite_border,
// // // //                               color: car.isFavorite
// // // //                                   ? Colors.redAccent[100]
// // // //                                   : Colors.white,
// // // //                               size: 20)),
// // // //                     ),
// // // //                   ),
// // // //                 ),
// // // //               ],
// // // //             ),
// // // //             // قسم التفاصيل
// // // //             Padding(
// // // //               padding: const EdgeInsets.all(12),
// // // //               child: Column(
// // // //                 crossAxisAlignment: CrossAxisAlignment.start,
// // // //                 children: [
// // // //                   Row(
// // // //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // //                       crossAxisAlignment: CrossAxisAlignment.start,
// // // //                       children: [
// // // //                         Expanded(
// // // //                             child: Text(car.name,
// // // //                                 style: const TextStyle(
// // // //                                     fontSize: 17,
// // // //                                     fontWeight: FontWeight.bold,
// // // //                                     color: Colors.black87),
// // // //                                 maxLines: 1,
// // // //                                 overflow: TextOverflow.ellipsis)),
// // // //                         const SizedBox(width: 8),
// // // //                         _buildRatingStars(car.rating)
// // // //                       ]),
// // // //                   const SizedBox(height: 8),
// // // //                   Column(
// // // //                       crossAxisAlignment: CrossAxisAlignment.start,
// // // //                       children: [
// // // //                         Text('EGP ${car.price.toStringAsFixed(0)}',
// // // //                             style: const TextStyle(
// // // //                                 fontSize: 16,
// // // //                                 fontWeight: FontWeight.bold,
// // // //                                 color: Color(0xFF4E7D96))),
// // // //                         const SizedBox(height: 2),
// // // //                         Text('per ${widget.rentType.toLowerCase()}',
// // // //                             style: TextStyle(
// // // //                                 color: Colors.grey[600], fontSize: 12))
// // // //                       ]),
// // // //                   const SizedBox(height: 12),
// // // //                   Row(children: [
// // // //                     _buildFeatureIcon(
// // // //                         Icons.settings_suggest_outlined, car.transmission),
// // // //                     const SizedBox(width: 16),
// // // //                     _buildFeatureIcon(
// // // //                         Icons.local_gas_station_outlined, car.fuelType),
// // // //                     const SizedBox(width: 16),
// // // //                     _buildFeatureIcon(
// // // //                         Icons.person_outline_rounded, '${car.seats} Seats')
// // // //                   ]),
// // // //                 ],
// // // //               ),
// // // //             ),
// // // //           ],
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }

// // // //   // الدالة المساعدة لنجوم التقييم
// // // //   Widget _buildRatingStars(double rating) {
// // // //     List<Widget> stars = [];
// // // //     int fullStars = rating.floor();
// // // //     for (int i = 0; i < 5; i++) {
// // // //       IconData iconData;
// // // //       Color color = Colors.amber.shade600;
// // // //       if (i < fullStars) {
// // // //         iconData = Icons.star_rounded;
// // // //       } else {
// // // //         iconData = Icons.star_border_rounded;
// // // //         color = Colors.grey.shade400;
// // // //       }
// // // //       stars.add(Icon(iconData, color: color, size: 18));
// // // //     }
// // // //     return Row(mainAxisSize: MainAxisSize.min, children: stars);
// // // //   }

// // // //   // الدالة المساعدة لأيقونات الميزات
// // // //   Widget _buildFeatureIcon(IconData icon, String text) {
// // // //     return Row(children: [
// // // //       Icon(icon, size: 18, color: Colors.grey.shade700),
// // // //       const SizedBox(width: 6),
// // // //       Text(text, style: TextStyle(color: Colors.grey.shade800, fontSize: 13))
// // // //     ]);
// // // //   }
// // // // }
// // // import 'package:flutter/material.dart';
// // // import 'package:travella/models/CarRental.dart';
// // // import 'package:travella/models/car.dart'; // Still needed for navigation to details
// // // import 'package:travella/services/Car/CarRentalService.dart';
// // // import 'package:travella/screens/car_details_screen.dart'; // Import details screen
// // // import '../widgets/car_filter_screen.dart';

// // // class CarSearchResultsScreen extends StatefulWidget {
// // //   final String location;
// // //   final DateTime date;
// // //   final String rentType;

// // //   CarSearchResultsScreen({
// // //     super.key,
// // //     this.location = 'Default Location',
// // //     DateTime? date,
// // //     this.rentType = 'Self-driver', // Updated default
// // //   }) : date = date ?? DateTime.now();

// // //   @override
// // //   State<CarSearchResultsScreen> createState() => _CarSearchResultsScreenState();
// // // }

// // // class _CarSearchResultsScreenState extends State<CarSearchResultsScreen> {
// // //   List<CarRental> _originalCars = [];
// // //   List<CarRental> _filteredCars = [];
// // //   String _sortBy = 'recommended';
// // //   bool _isLoading = true;
// // //   String? _errorMessage;

// // //   CarFilterSettings _filterSettings = CarFilterSettings(
// // //     priceRange: const RangeValues(0, 5000),
// // //     selectedTypes: {'All'},
// // //     selectedTransmissions: {'All'},
// // //     selectedBrands: {'All'},
// // //     selectedEngines: {'All'},
// // //     minRating: 0,
// // //   );

// // //   final double _minPrice = 0;
// // //   final double _maxPrice = 5000;

// // //   final CarRentalService _carRentalService = CarRentalService();
// // //   // IMPORTANT: Replace with a real token from your auth provider
// // //   final String token = 'YOUR_AUTH_TOKEN_HERE';

// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     _fetchCars();
// // //   }

// // //   // Fetches the initial list of cars from the API.
// // //   // This is called only once. Filtering and sorting are done client-side.
// // //   Future<void> _fetchCars() async {
// // //     setState(() {
// // //       _isLoading = true;
// // //       _errorMessage = null;
// // //     });
// // //     try {
// // //       _originalCars = await _carRentalService.searchCarRentals(
// // //         token: token,
// // //         pickUpLocation: widget.location,
// // //         date: widget.date,
// // //         rentType: widget.rentType,
// // //         driverAge: widget.rentType.contains('With') ? 30 : null,
// // //       );

// // //       _applyFiltersAndSorting(); // Apply initial filters
// // //     } catch (e) {
// // //       setState(() {
// // //         _errorMessage = e.toString();
// // //       });
// // //     } finally {
// // //       setState(() {
// // //         _isLoading = false;
// // //       });
// // //     }
// // //   }

// // //   // Applies filters and sorting to the original list of cars.
// // //   void _applyFiltersAndSorting() {
// // //     List<CarRental> currentlyFiltered = List.from(_originalCars);

// // //     // --- Client-Side Filtering ---
// // //     currentlyFiltered = currentlyFiltered.where((car) {
// // //       bool matchesPrice = car.price >= _filterSettings.priceRange.start &&
// // //           car.price <= _filterSettings.priceRange.end;

// // //       // Note: carType, brand, rating, and seats are not provided by the API.
// // //       // Filtering on them relies on the default values set in the CarRental model.
// // //       bool matchesType = _filterSettings.selectedTypes.contains('All') ||
// // //           _filterSettings.selectedTypes.contains(car.carType);

// // //       bool matchesTransmission =
// // //           _filterSettings.selectedTransmissions.contains('All') ||
// // //               _filterSettings.selectedTransmissions
// // //                   .contains(car.transmission ?? 'N/A');

// // //       bool matchesBrand = _filterSettings.selectedBrands.contains('All') ||
// // //           _filterSettings.selectedBrands.contains(car.company);

// // //       bool matchesEngine = _filterSettings.selectedEngines.contains('All') ||
// // //           _filterSettings.selectedEngines.contains(car.engineType ?? 'N/A');

// // //       bool matchesRating = car.rating >= _filterSettings.minRating;

// // //       return matchesPrice &&
// // //           matchesType &&
// // //           matchesTransmission &&
// // //           matchesBrand &&
// // //           matchesEngine &&
// // //           matchesRating;
// // //     }).toList();

// // //     // --- Sorting ---
// // //     switch (_sortBy) {
// // //       case 'price_low':
// // //         currentlyFiltered.sort((a, b) => a.price.compareTo(b.price));
// // //         break;
// // //       case 'price_high':
// // //         currentlyFiltered.sort((a, b) => b.price.compareTo(a.price));
// // //         break;
// // //       case 'recommended':
// // //       default:
// // //         // Sort by rating (descending). Relies on the default rating from the model.
// // //         currentlyFiltered.sort((a, b) => b.rating.compareTo(a.rating));
// // //         break;
// // //     }
// // //     setState(() {
// // //       _filteredCars = currentlyFiltered;
// // //     });
// // //   }

// // //   // Show filter screen
// // //   void _showFilterScreen() {
// // //     showModalBottomSheet<CarFilterSettings>(
// // //       context: context,
// // //       isScrollControlled: true,
// // //       backgroundColor: Colors.transparent,
// // //       builder: (context) => CarFilterScreen(
// // //         initialSettings: _filterSettings,
// // //         minPriceValue: _minPrice,
// // //         maxPriceValue: _maxPrice,
// // //       ),
// // //     ).then((newSettings) {
// // //       if (newSettings != null) {
// // //         setState(() {
// // //           _filterSettings = newSettings;
// // //           _applyFiltersAndSorting(); // Re-apply filters without a new API call
// // //         });
// // //       }
// // //     });
// // //   }

// // //   // Show sort options
// // //   void _showSortOptions() {
// // //     final Map<String, String> sortOptions = {
// // //       'recommended': 'Highest rated',
// // //       'price_low': 'Lowest price',
// // //       'price_high': 'Highest price'
// // //     };
// // //     showModalBottomSheet(
// // //       context: context,
// // //       shape: const RoundedRectangleBorder(
// // //           borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
// // //       builder: (context) => Container(
// // //         padding: const EdgeInsets.symmetric(vertical: 16.0),
// // //         child: Column(
// // //           mainAxisSize: MainAxisSize.min,
// // //           crossAxisAlignment: CrossAxisAlignment.start,
// // //           children: [
// // //             ...sortOptions.entries.map((entry) {
// // //               final key = entry.key;
// // //               final value = entry.value;
// // //               final bool isSelected = _sortBy == key;
// // //               return ListTile(
// // //                 title: Text(value,
// // //                     style: TextStyle(
// // //                         fontWeight:
// // //                             isSelected ? FontWeight.w600 : FontWeight.normal,
// // //                         color: isSelected
// // //                             ? const Color(0xFF4E7D96)
// // //                             : Colors.black87)),
// // //                 trailing: isSelected
// // //                     ? const Icon(Icons.check, color: Color(0xFF4E7D96))
// // //                     : null,
// // //                 onTap: () {
// // //                   if (_sortBy != key) {
// // //                     setState(() {
// // //                       _sortBy = key;
// // //                       _applyFiltersAndSorting();
// // //                     });
// // //                   }
// // //                   Navigator.pop(context);
// // //                 },
// // //               );
// // //             }).toList(),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     bool isFilterActive =
// // //         _filterSettings.priceRange != RangeValues(_minPrice, _maxPrice) ||
// // //             !_filterSettings.selectedTypes.contains('All') ||
// // //             !_filterSettings.selectedTransmissions.contains('All') ||
// // //             !_filterSettings.selectedBrands.contains('All') ||
// // //             !_filterSettings.selectedEngines.contains('All') ||
// // //             _filterSettings.minRating > 0;

// // //     return Scaffold(
// // //       backgroundColor: Colors.white,
// // //       appBar: AppBar(
// // //         backgroundColor: Colors.white,
// // //         elevation: 0.5,
// // //         leading: IconButton(
// // //             icon: const Icon(Icons.arrow_back, color: Colors.black),
// // //             onPressed: () => Navigator.pop(context)),
// // //         title: Column(
// // //           crossAxisAlignment: CrossAxisAlignment.start,
// // //           children: [
// // //             Text(widget.location,
// // //                 style: const TextStyle(
// // //                     color: Colors.black,
// // //                     fontSize: 16,
// // //                     fontWeight: FontWeight.bold)),
// // //             Text('${_filteredCars.length} results found',
// // //                 style: TextStyle(color: Colors.grey[600], fontSize: 13)),
// // //           ],
// // //         ),
// // //         actions: [
// // //           TextButton.icon(
// // //               onPressed: _showSortOptions,
// // //               icon: const Icon(Icons.swap_vert, size: 22),
// // //               label: const Text('Sort')),
// // //           TextButton.icon(
// // //             onPressed: _showFilterScreen,
// // //             icon: Stack(
// // //               clipBehavior: Clip.none,
// // //               children: [
// // //                 const Icon(Icons.filter_list, size: 22),
// // //                 if (isFilterActive)
// // //                   Positioned(
// // //                       top: -2,
// // //                       right: -4,
// // //                       child: Container(
// // //                           padding: const EdgeInsets.all(3),
// // //                           decoration: const BoxDecoration(
// // //                               color: Color(0xFF4E7D96),
// // //                               shape: BoxShape.circle))),
// // //               ],
// // //             ),
// // //             label: const Text('Filter'),
// // //           ),
// // //           const SizedBox(width: 8),
// // //         ],
// // //       ),
// // //       body: _isLoading
// // //           ? const Center(child: CircularProgressIndicator())
// // //           : _errorMessage != null
// // //               ? Center(child: Text(_errorMessage!))
// // //               : _filteredCars.isEmpty
// // //                   ? Center(
// // //                       child: Text('No cars found matching your criteria.',
// // //                           style: TextStyle(color: Colors.grey[600])))
// // //                   : ListView.builder(
// // //                       padding: const EdgeInsets.all(16),
// // //                       itemCount: _filteredCars.length,
// // //                       itemBuilder: (context, index) {
// // //                         final carRental = _filteredCars[index];
// // //                         return _buildCarCard(carRental);
// // //                       },
// // //                     ),
// // //     );
// // //   }

// // //   Widget _buildCarCard(CarRental car) {
// // //     return Card(
// // //       elevation: 2.0,
// // //       margin: const EdgeInsets.only(bottom: 16),
// // //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
// // //       child: InkWell(
// // //         borderRadius: BorderRadius.circular(12),
// // //         onTap: () {
// // //           // Convert CarRental to the old Car model for the details screen
// // //           final carToPass = Car(
// // //             id: car.id.toString(),
// // //             name: '${car.company} ${car.carModel}',
// // //             brand: car.company,
// // //             type: car.carType,
// // //             // Use the first network image URL, with a local fallback
// // //             imageUrl: car.imageUrls.isNotEmpty
// // //                 ? car.imageUrls.first
// // //                 : 'assets/car.jpeg',
// // //             price: car.price,
// // //             rating: car.rating,
// // //             transmission: car.transmission ?? 'Manual',
// // //             fuelType: car.engineType ?? 'Petrol',
// // //             seats: car.seats,
// // //             isFavorite: false, // You can manage favorite state separately
// // //           );
// // //           Navigator.push(
// // //             context,
// // //             MaterialPageRoute(
// // //               builder: (context) => CarDetailsScreen(car: carToPass),
// // //             ),
// // //           );
// // //         },
// // //         child: Column(
// // //           crossAxisAlignment: CrossAxisAlignment.start,
// // //           children: [
// // //             ClipRRect(
// // //               borderRadius:
// // //                   const BorderRadius.vertical(top: Radius.circular(12)),
// // //               child: Container(
// // //                 height: 180,
// // //                 width: double.infinity,
// // //                 color: Colors.grey[200],
// // //                 // Display the network image, or a placeholder if none is available
// // //                 child: car.imageUrls.isNotEmpty
// // //                     ? Image.network(
// // //                         car.imageUrls.first,
// // //                         fit: BoxFit.cover,
// // //                         errorBuilder: (context, error, stackTrace) =>
// // //                             const Icon(Icons.image_not_supported,
// // //                                 size: 50, color: Colors.grey),
// // //                         loadingBuilder: (context, child, progress) =>
// // //                             progress == null
// // //                                 ? child
// // //                                 : const Center(
// // //                                     child: CircularProgressIndicator()),
// // //                       )
// // //                     : const Icon(Icons.directions_car,
// // //                         size: 50, color: Colors.grey),
// // //               ),
// // //             ),
// // //             Padding(
// // //               padding: const EdgeInsets.all(12),
// // //               child: Column(
// // //                 crossAxisAlignment: CrossAxisAlignment.start,
// // //                 children: [
// // //                   Row(
// // //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // //                     children: [
// // //                       Expanded(
// // //                         child: Text(
// // //                           '${car.company} ${car.carModel}',
// // //                           style: const TextStyle(
// // //                               fontSize: 17, fontWeight: FontWeight.bold),
// // //                           overflow: TextOverflow.ellipsis,
// // //                         ),
// // //                       ),
// // //                       Row(
// // //                         children: [
// // //                           const Icon(Icons.star,
// // //                               color: Color(0xFF4E7D96), size: 18),
// // //                           const SizedBox(width: 4),
// // //                           Text(car.rating.toStringAsFixed(1),
// // //                               style: const TextStyle(
// // //                                   fontWeight: FontWeight.bold, fontSize: 14)),
// // //                         ],
// // //                       ),
// // //                     ],
// // //                   ),
// // //                   const SizedBox(height: 8),
// // //                   Text(
// // //                     'EGP ${car.price.toStringAsFixed(0)} / day',
// // //                     style: const TextStyle(
// // //                         fontSize: 16,
// // //                         fontWeight: FontWeight.bold,
// // //                         color: Color(0xFF4E7D96)),
// // //                   ),
// // //                   const SizedBox(height: 12),
// // //                   Row(
// // //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // //                     children: [
// // //                       _buildFeatureIcon(Icons.settings_suggest_outlined,
// // //                           car.transmission ?? 'N/A'),
// // //                       _buildFeatureIcon(Icons.local_gas_station_outlined,
// // //                           car.engineType ?? 'N/A'),
// // //                       _buildFeatureIcon(
// // //                           Icons.person_outline_rounded, '${car.seats} Seats'),
// // //                     ],
// // //                   ),
// // //                 ],
// // //               ),
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }

// // //   Widget _buildFeatureIcon(IconData icon, String text) {
// // //     return Row(
// // //       children: [
// // //         Icon(icon, size: 18, color: Colors.grey.shade700),
// // //         const SizedBox(width: 6),
// // //         Text(text, style: TextStyle(color: Colors.grey.shade800, fontSize: 13)),
// // //       ],
// // //     );
// // //   }
// // // }
// // // lib/screens/car_search_results_screen.dart

// // import 'package:flutter/material.dart';
// // import 'package:travella/models/CarRental.dart';
// // import 'package:travella/models/car.dart'; // Still needed for navigation to details
// // import 'package:travella/services/Car/CarRentalService.dart';
// // import 'package:travella/screens/car_details_screen.dart';
// // import 'package:travella/widgets/car_filter_screen.dart';

// // class CarSearchResultsScreen extends StatefulWidget {
// //   final String location;
// //   final DateTime date;
// //   final String rentType;

// //   CarSearchResultsScreen({
// //     super.key,
// //     required this.location,
// //     required this.date,
// //     required this.rentType,
// //   });

// //   @override
// //   State<CarSearchResultsScreen> createState() => _CarSearchResultsScreenState();
// // }

// // class _CarSearchResultsScreenState extends State<CarSearchResultsScreen> {
// //   List<CarRental> _originalCars = [];
// //   List<CarRental> _filteredCars = [];
// //   String _sortBy = 'recommended';
// //   bool _isLoading = true;
// //   String? _errorMessage;

// //   CarFilterSettings _filterSettings = CarFilterSettings(
// //     priceRange: const RangeValues(0, 5000),
// //     selectedTypes: {'All'},
// //     selectedTransmissions: {'All'},
// //     selectedBrands: {'All'},
// //     selectedEngines: {'All'},
// //     minRating: 0,
// //   );

// //   final double _minPrice = 0;
// //   final double _maxPrice = 5000;
// //   final CarRentalService _carRentalService = CarRentalService();
// //   final String token =
// //       'YOUR_AUTH_TOKEN_HERE'; // <--  مهم جدا: استبدل هذا بالتوكن الحقيقي

// //   @override
// //   void initState() {
// //     super.initState();
// //     _fetchCars();
// //   }

// //   Future<void> _fetchCars() async {
// //     setState(() {
// //       _isLoading = true;
// //       _errorMessage = null;
// //     });
// //     try {
// //       _originalCars = await _carRentalService.searchCarRentals(
// //         token: token,
// //         pickUpLocation: widget.location,
// //         date: widget.date,
// //         rentType: widget.rentType,
// //         driverAge: widget.rentType.contains('With') ? 30 : null,
// //       );
// //       _applyFiltersAndSorting();
// //     } catch (e) {
// //       setState(() {
// //         _errorMessage = e.toString();
// //       });
// //     } finally {
// //       setState(() {
// //         _isLoading = false;
// //       });
// //     }
// //   }

// //   void _applyFiltersAndSorting() {
// //     List<CarRental> currentlyFiltered = List.from(_originalCars);

// //     currentlyFiltered = currentlyFiltered.where((car) {
// //       bool matchesPrice = car.price >= _filterSettings.priceRange.start &&
// //           car.price <= _filterSettings.priceRange.end;
// //       bool matchesType = _filterSettings.selectedTypes.contains('All') ||
// //           _filterSettings.selectedTypes.contains(car.carType);
// //       bool matchesTransmission =
// //           _filterSettings.selectedTransmissions.contains('All') ||
// //               _filterSettings.selectedTransmissions
// //                   .contains(car.transmission ?? 'N/A');
// //       bool matchesBrand = _filterSettings.selectedBrands.contains('All') ||
// //           _filterSettings.selectedBrands.contains(car.company);
// //       bool matchesEngine = _filterSettings.selectedEngines.contains('All') ||
// //           _filterSettings.selectedEngines.contains(car.engineType ?? 'N/A');
// //       bool matchesRating = car.rating >= _filterSettings.minRating;
// //       return matchesPrice &&
// //           matchesType &&
// //           matchesTransmission &&
// //           matchesBrand &&
// //           matchesEngine &&
// //           matchesRating;
// //     }).toList();

// //     switch (_sortBy) {
// //       case 'price_low':
// //         currentlyFiltered.sort((a, b) => a.price.compareTo(b.price));
// //         break;
// //       case 'price_high':
// //         currentlyFiltered.sort((a, b) => b.price.compareTo(a.price));
// //         break;
// //       case 'recommended':
// //       default:
// //         currentlyFiltered.sort((a, b) => b.rating.compareTo(a.rating));
// //         break;
// //     }
// //     setState(() {
// //       _filteredCars = currentlyFiltered;
// //     });
// //   }

// //   void _showFilterScreen() {
// //     showModalBottomSheet<CarFilterSettings>(
// //       context: context,
// //       isScrollControlled: true,
// //       backgroundColor: Colors.transparent,
// //       builder: (context) => CarFilterScreen(
// //         initialSettings: _filterSettings,
// //         minPriceValue: _minPrice,
// //         maxPriceValue: _maxPrice,
// //       ),
// //     ).then((newSettings) {
// //       if (newSettings != null) {
// //         setState(() {
// //           _filterSettings = newSettings;
// //           _applyFiltersAndSorting();
// //         });
// //       }
// //     });
// //   }

// //   void _showSortOptions() {
// //     final Map<String, String> sortOptions = {
// //       'recommended': 'Highest rated',
// //       'price_low': 'Lowest price',
// //       'price_high': 'Highest price'
// //     };
// //     showModalBottomSheet(
// //       context: context,
// //       builder: (context) => Column(
// //         mainAxisSize: MainAxisSize.min,
// //         children: sortOptions.entries.map((entry) {
// //           bool isSelected = _sortBy == entry.key;
// //           return ListTile(
// //             title: Text(entry.value,
// //                 style: TextStyle(
// //                     fontWeight:
// //                         isSelected ? FontWeight.bold : FontWeight.normal,
// //                     color:
// //                         isSelected ? const Color(0xFF4E7D96) : Colors.black)),
// //             trailing: isSelected
// //                 ? const Icon(Icons.check, color: Color(0xFF4E7D96))
// //                 : null,
// //             onTap: () {
// //               setState(() {
// //                 _sortBy = entry.key;
// //                 _applyFiltersAndSorting();
// //               });
// //               Navigator.pop(context);
// //             },
// //           );
// //         }).toList(),
// //       ),
// //     );
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     bool isFilterActive = _filterSettings.minRating > 0 ||
// //         !_filterSettings.selectedTypes.contains('All') ||
// //         !_filterSettings.selectedBrands.contains('All') ||
// //         !_filterSettings.selectedEngines.contains('All') ||
// //         !_filterSettings.selectedTransmissions.contains('All') ||
// //         _filterSettings.priceRange != RangeValues(_minPrice, _maxPrice);

// //     return Scaffold(
// //       backgroundColor: Colors.white,
// //       appBar: AppBar(
// //         backgroundColor: Colors.white,
// //         elevation: 0.5,
// //         leading: IconButton(
// //             icon: const Icon(Icons.arrow_back, color: Colors.black),
// //             onPressed: () => Navigator.pop(context)),
// //         title: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             Text(widget.location,
// //                 style: const TextStyle(
// //                     color: Colors.black,
// //                     fontSize: 16,
// //                     fontWeight: FontWeight.bold)),
// //             Text('${_filteredCars.length} results found',
// //                 style: TextStyle(color: Colors.grey[600], fontSize: 13)),
// //           ],
// //         ),
// //         actions: [
// //           TextButton.icon(
// //               onPressed: _showSortOptions,
// //               icon: const Icon(Icons.swap_vert, size: 22),
// //               label: const Text('Sort')),
// //           TextButton.icon(
// //             onPressed: _showFilterScreen,
// //             icon: Stack(
// //               clipBehavior: Clip.none,
// //               children: [
// //                 const Icon(Icons.filter_list, size: 22),
// //                 if (isFilterActive)
// //                   Positioned(
// //                     top: -2,
// //                     right: -4,
// //                     child: Container(
// //                       padding: const EdgeInsets.all(3),
// //                       decoration: const BoxDecoration(
// //                           color: Color(0xFF4E7D96), shape: BoxShape.circle),
// //                     ),
// //                   ),
// //               ],
// //             ),
// //             label: const Text('Filter'),
// //           ),
// //           const SizedBox(width: 8),
// //         ],
// //       ),
// //       body: _isLoading
// //           ? const Center(child: CircularProgressIndicator())
// //           : _errorMessage != null
// //               ? Center(
// //                   child: Padding(
// //                       padding: const EdgeInsets.all(20.0),
// //                       child: Text(_errorMessage!,
// //                           textAlign: TextAlign.center,
// //                           style: TextStyle(color: Colors.red.shade700))))
// //               : _filteredCars.isEmpty
// //                   ? Center(
// //                       child: Text('No cars found matching your criteria.',
// //                           style: TextStyle(color: Colors.grey[600])))
// //                   : ListView.builder(
// //                       padding: const EdgeInsets.all(16),
// //                       itemCount: _filteredCars.length,
// //                       itemBuilder: (context, index) {
// //                         return _buildCarCard(_filteredCars[index]);
// //                       },
// //                     ),
// //     );
// //   }

// //   Widget _buildCarCard(CarRental car) {
// //     return Card(
// //       elevation: 2.0,
// //       margin: const EdgeInsets.only(bottom: 16),
// //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
// //       child: InkWell(
// //         borderRadius: BorderRadius.circular(12),
// //         onTap: () {
// //           final carToPass = Car(
// //             id: car.id.toString(),
// //             name: '${car.company} ${car.carModel}',
// //             brand: car.company,
// //             type: car.carType,
// //             imageUrl: car.imageUrls.isNotEmpty
// //                 ? car.imageUrls.first
// //                 : 'assets/car.jpeg',
// //             price: car.price,
// //             rating: car.rating,
// //             transmission: car.transmission ?? 'Manual',
// //             fuelType: car.engineType ?? 'Petrol',
// //             seats: car.seats,
// //           );
// //           Navigator.push(
// //             context,
// //             MaterialPageRoute(
// //                 builder: (context) => CarDetailsScreen(car: carToPass)),
// //           );
// //         },
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             ClipRRect(
// //               borderRadius:
// //                   const BorderRadius.vertical(top: Radius.circular(12)),
// //               child: Container(
// //                 height: 180,
// //                 width: double.infinity,
// //                 color: Colors.grey[200],
// //                 child: car.imageUrls.isNotEmpty
// //                     ? Image.network(
// //                         car.imageUrls.first,
// //                         fit: BoxFit.cover,
// //                         errorBuilder: (context, error, stackTrace) =>
// //                             const Icon(Icons.directions_car,
// //                                 size: 50, color: Colors.grey),
// //                         loadingBuilder: (context, child, progress) =>
// //                             progress == null
// //                                 ? child
// //                                 : const Center(
// //                                     child: CircularProgressIndicator()),
// //                       )
// //                     : const Icon(Icons.directions_car,
// //                         size: 50, color: Colors.grey),
// //               ),
// //             ),
// //             Padding(
// //               padding: const EdgeInsets.all(12),
// //               child: Column(
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 children: [
// //                   Row(
// //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                     children: [
// //                       Expanded(
// //                         child: Text('${car.company} ${car.carModel}',
// //                             style: const TextStyle(
// //                                 fontSize: 17, fontWeight: FontWeight.bold),
// //                             overflow: TextOverflow.ellipsis),
// //                       ),
// //                       Row(
// //                         children: [
// //                           const Icon(Icons.star,
// //                               color: Color(0xFF4E7D96), size: 18),
// //                           const SizedBox(width: 4),
// //                           Text(car.rating.toStringAsFixed(1),
// //                               style: const TextStyle(
// //                                   fontWeight: FontWeight.bold, fontSize: 14)),
// //                         ],
// //                       ),
// //                     ],
// //                   ),
// //                   const SizedBox(height: 8),
// //                   Text('EGP ${car.price.toStringAsFixed(0)} / day',
// //                       style: const TextStyle(
// //                           fontSize: 16,
// //                           fontWeight: FontWeight.bold,
// //                           color: Color(0xFF4E7D96))),
// //                   const SizedBox(height: 12),
// //                   Row(
// //                     children: [
// //                       _buildFeatureIcon(Icons.settings_suggest_outlined,
// //                           car.transmission ?? 'N/A'),
// //                       const SizedBox(width: 16),
// //                       _buildFeatureIcon(Icons.local_gas_station_outlined,
// //                           car.engineType ?? 'N/A'),
// //                       const SizedBox(width: 16),
// //                       _buildFeatureIcon(
// //                           Icons.person_outline_rounded, '${car.seats} Seats'),
// //                     ],
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   Widget _buildFeatureIcon(IconData icon, String text) {
// //     return Row(
// //       children: [
// //         Icon(icon, size: 18, color: Colors.grey.shade700),
// //         const SizedBox(width: 6),
// //         Text(text, style: TextStyle(color: Colors.grey.shade800, fontSize: 13)),
// //       ],
// //     );
// //   }
// // }
// // lib/screens/car_search_results_screen.dart

// import 'package:flutter/material.dart';
// import 'package:travella/models/CarRental.dart';
// import 'package:travella/models/car.dart'; // Still needed for navigation to details
// import 'package:travella/services/Car/CarRentalService.dart';
// import 'package:travella/screens/car_details_screen.dart';
// import 'package:travella/widgets/car_filter_screen.dart';

// class CarSearchResultsScreen extends StatefulWidget {
//   final String location;
//   final DateTime date;
//   final String rentType;

//   CarSearchResultsScreen({
//     super.key,
//     required this.location,
//     required this.date,
//     required this.rentType,
//   });

//   @override
//   State<CarSearchResultsScreen> createState() => _CarSearchResultsScreenState();
// }

// class _CarSearchResultsScreenState extends State<CarSearchResultsScreen> {
//   List<CarRental> _originalCars = [];
//   List<CarRental> _filteredCars = [];
//   String _sortBy = 'recommended';
//   bool _isLoading = true;
//   String? _errorMessage;

//   CarFilterSettings _filterSettings = CarFilterSettings(
//     priceRange: const RangeValues(0, 5000),
//     selectedTypes: {'All'},
//     selectedTransmissions: {'All'},
//     selectedBrands: {'All'},
//     selectedEngines: {'All'},
//     minRating: 0,
//   );

//   final double _minPrice = 0;
//   final double _maxPrice = 5000;
//   final CarRentalService _carRentalService = CarRentalService();

//   // مهم جدا: يجب الحصول على التوكن من SharedPreferences أو من مدير الحالة (State Management)
//   // سأضع قيمة مؤقتة هنا، يجب استبدالها بالتوكن الفعلي عند تشغيل التطبيق
//   final String token = 'YOUR_AUTH_TOKEN_HERE';

//   @override
//   void initState() {
//     super.initState();
//     _fetchCars();
//   }

//   Future<void> _fetchCars() async {
//     setState(() {
//       _isLoading = true;
//       _errorMessage = null;
//     });
//     try {
//       _originalCars = await _carRentalService.searchCarRentals(
//         token: token,
//         pickUpLocation: widget.location,
//         date: widget.date,
//         rentType: widget.rentType,
//       );
//       _applyFiltersAndSorting();
//     } catch (e) {
//       setState(() {
//         _errorMessage = e.toString();
//       });
//     } finally {
//       setState(() {
//         _isLoading = false;
//       });
//     }
//   }

//   void _applyFiltersAndSorting() {
//     List<CarRental> currentlyFiltered = List.from(_originalCars);

//     currentlyFiltered = currentlyFiltered.where((car) {
//       bool matchesPrice = car.price >= _filterSettings.priceRange.start &&
//           car.price <= _filterSettings.priceRange.end;
//       bool matchesType = _filterSettings.selectedTypes.contains('All') ||
//           _filterSettings.selectedTypes.contains(car.carType);
//       bool matchesTransmission =
//           _filterSettings.selectedTransmissions.contains('All') ||
//               _filterSettings.selectedTransmissions
//                   .contains(car.transmission ?? 'N/A');
//       bool matchesBrand = _filterSettings.selectedBrands.contains('All') ||
//           _filterSettings.selectedBrands.contains(car.company);
//       bool matchesEngine = _filterSettings.selectedEngines.contains('All') ||
//           _filterSettings.selectedEngines.contains(car.engineType ?? 'N/A');
//       bool matchesRating = car.rating >= _filterSettings.minRating;
//       return matchesPrice &&
//           matchesType &&
//           matchesTransmission &&
//           matchesBrand &&
//           matchesEngine &&
//           matchesRating;
//     }).toList();

//     switch (_sortBy) {
//       case 'price_low':
//         currentlyFiltered.sort((a, b) => a.price.compareTo(b.price));
//         break;
//       case 'price_high':
//         currentlyFiltered.sort((a, b) => b.price.compareTo(a.price));
//         break;
//       case 'recommended':
//       default:
//         currentlyFiltered.sort((a, b) => b.rating.compareTo(a.rating));
//         break;
//     }
//     setState(() {
//       _filteredCars = currentlyFiltered;
//     });
//   }

//   void _showFilterScreen() {
//     showModalBottomSheet<CarFilterSettings>(
//       context: context,
//       isScrollControlled: true,
//       backgroundColor: Colors.transparent,
//       builder: (context) => CarFilterScreen(
//         initialSettings: _filterSettings,
//         minPriceValue: _minPrice,
//         maxPriceValue: _maxPrice,
//       ),
//     ).then((newSettings) {
//       if (newSettings != null) {
//         setState(() {
//           _filterSettings = newSettings;
//           _applyFiltersAndSorting();
//         });
//       }
//     });
//   }

//   void _showSortOptions() {
//     final Map<String, String> sortOptions = {
//       'recommended': 'Highest rated',
//       'price_low': 'Lowest price',
//       'price_high': 'Highest price'
//     };
//     showModalBottomSheet(
//       context: context,
//       shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
//       builder: (context) => Column(
//         mainAxisSize: MainAxisSize.min,
//         children: sortOptions.entries.map((entry) {
//           bool isSelected = _sortBy == entry.key;
//           return ListTile(
//             title: Text(entry.value,
//                 style: TextStyle(
//                     fontWeight:
//                         isSelected ? FontWeight.bold : FontWeight.normal,
//                     color:
//                         isSelected ? const Color(0xFF4E7D96) : Colors.black)),
//             trailing: isSelected
//                 ? const Icon(Icons.check, color: Color(0xFF4E7D96))
//                 : null,
//             onTap: () {
//               setState(() {
//                 _sortBy = entry.key;
//                 _applyFiltersAndSorting();
//               });
//               Navigator.pop(context);
//             },
//           );
//         }).toList(),
//       ),
//     );
//   }

//   // =======================================================
//   // --- الكود الكامل لدالة build ---
//   // =======================================================
//   @override
//   Widget build(BuildContext context) {
//     bool isFilterActive = _filterSettings.minRating > 0 ||
//         !_filterSettings.selectedTypes.contains('All') ||
//         !_filterSettings.selectedBrands.contains('All') ||
//         !_filterSettings.selectedEngines.contains('All') ||
//         !_filterSettings.selectedTransmissions.contains('All') ||
//         _filterSettings.priceRange != RangeValues(_minPrice, _maxPrice);

//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0.5,
//         shadowColor: Colors.grey.shade300,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () => Navigator.pop(context),
//         ),
//         titleSpacing: 0,
//         title: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               widget.location,
//               style: const TextStyle(
//                   color: Colors.black,
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold),
//               overflow: TextOverflow.ellipsis,
//             ),
//             const SizedBox(height: 2),
//             Text(
//               // عرض عدد النتائج بناءً على الحالة الحالية
//               _isLoading
//                   ? 'Searching...'
//                   : '${_filteredCars.length} results found',
//               style: TextStyle(color: Colors.grey[600], fontSize: 13),
//             ),
//           ],
//         ),
//         actions: [
//           TextButton.icon(
//             onPressed: _showSortOptions,
//             icon: Icon(Icons.swap_vert, color: Colors.grey.shade700, size: 22),
//             label: Text('Sort',
//                 style: TextStyle(color: Colors.grey.shade700, fontSize: 14)),
//             style: TextButton.styleFrom(foregroundColor: Colors.grey.shade700),
//           ),
//           TextButton.icon(
//             onPressed: _showFilterScreen,
//             icon: Stack(
//               clipBehavior: Clip.none,
//               children: [
//                 Icon(Icons.filter_list, color: Colors.grey.shade700, size: 22),
//                 if (isFilterActive)
//                   Positioned(
//                     top: -2,
//                     right: -4,
//                     child: Container(
//                       padding: const EdgeInsets.all(3),
//                       decoration: const BoxDecoration(
//                           color: Color(0xFF4E7D96), shape: BoxShape.circle),
//                     ),
//                   ),
//               ],
//             ),
//             label: Text('Filter',
//                 style: TextStyle(color: Colors.grey.shade700, fontSize: 14)),
//             style: TextButton.styleFrom(foregroundColor: Colors.grey.shade700),
//           ),
//           const SizedBox(width: 8),
//         ],
//       ),
//       body: _buildBody(),
//     );
//   }

//   Widget _buildBody() {
//     if (_isLoading) {
//       return const Center(child: CircularProgressIndicator());
//     }

//     if (_errorMessage != null) {
//       return Center(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Text(
//             _errorMessage!,
//             textAlign: TextAlign.center,
//             style: TextStyle(
//                 color: Colors.red.shade700, fontSize: 16, height: 1.5),
//           ),
//         ),
//       );
//     }

//     if (_filteredCars.isEmpty) {
//       return Center(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Text(
//             'No cars found matching your criteria.\nTry adjusting the filters or search criteria.',
//             textAlign: TextAlign.center,
//             style:
//                 TextStyle(color: Colors.grey[600], fontSize: 16, height: 1.5),
//           ),
//         ),
//       );
//     }

//     return ListView.builder(
//       padding: const EdgeInsets.all(16),
//       itemCount: _filteredCars.length,
//       itemBuilder: (context, index) {
//         return _buildCarCard(_filteredCars[index]);
//       },
//     );
//   }

//   Widget _buildCarCard(CarRental car) {
//     return Card(
//       elevation: 2.0,
//       margin: const EdgeInsets.only(bottom: 16),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       child: InkWell(
//         borderRadius: BorderRadius.circular(12),
//         onTap: () {
//           final carToPass = Car(
//             id: car.id.toString(),
//             name: '${car.company} ${car.carModel}',
//             brand: car.company,
//             type: car.carType,
//             imageUrl: car.imageUrls.isNotEmpty
//                 ? car.imageUrls.first
//                 : 'assets/car.jpeg',
//             price: car.price,
//             rating: car.rating,
//             transmission: car.transmission ?? 'Manual',
//             fuelType: car.engineType ?? 'Petrol',
//             seats: car.seats,
//           );
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//                 builder: (context) => CarDetailsScreen(car: carToPass)),
//           );
//         },
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             ClipRRect(
//               borderRadius:
//                   const BorderRadius.vertical(top: Radius.circular(12)),
//               child: Container(
//                 height: 180,
//                 width: double.infinity,
//                 color: Colors.grey[200],
//                 child: car.imageUrls.isNotEmpty
//                     ? Image.network(
//                         car.imageUrls.first,
//                         fit: BoxFit.cover,
//                         errorBuilder: (context, error, stackTrace) =>
//                             const Icon(Icons.directions_car,
//                                 size: 50, color: Colors.grey),
//                         loadingBuilder: (context, child, progress) =>
//                             progress == null
//                                 ? child
//                                 : const Center(
//                                     child: CircularProgressIndicator()),
//                       )
//                     : const Icon(Icons.directions_car,
//                         size: 50, color: Colors.grey),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(12),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Expanded(
//                         child: Text('${car.company} ${car.carModel}',
//                             style: const TextStyle(
//                                 fontSize: 17, fontWeight: FontWeight.bold),
//                             overflow: TextOverflow.ellipsis),
//                       ),
//                       Row(
//                         children: [
//                           const Icon(Icons.star,
//                               color: Color(0xFF4E7D96), size: 18),
//                           const SizedBox(width: 4),
//                           Text(car.rating.toStringAsFixed(1),
//                               style: const TextStyle(
//                                   fontWeight: FontWeight.bold, fontSize: 14)),
//                         ],
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 8),
//                   Text('EGP ${car.price.toStringAsFixed(0)} / day',
//                       style: const TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                           color: Color(0xFF4E7D96))),
//                   const SizedBox(height: 12),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       _buildFeatureIcon(Icons.settings_suggest_outlined,
//                           car.transmission ?? 'N/A'),
//                       const SizedBox(width: 24),
//                       _buildFeatureIcon(Icons.local_gas_station_outlined,
//                           car.engineType ?? 'N/A'),
//                       const SizedBox(width: 24),
//                       _buildFeatureIcon(
//                           Icons.person_outline_rounded, '${car.seats} Seats'),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildFeatureIcon(IconData icon, String text) {
//     return Row(
//       children: [
//         Icon(icon, size: 18, color: Colors.grey.shade700),
//         const SizedBox(width: 6),
//         Text(text, style: TextStyle(color: Colors.grey.shade800, fontSize: 13)),
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:apptravella/models/CarRental.dart';
import 'package:apptravella/models/car.dart';
import 'package:apptravella/services/Car/CarRentalService.dart';
import 'package:apptravella/widgets/car_filter_screen.dart';
import 'car_details_screen.dart';

class CarSearchResultsScreen extends StatefulWidget {
  final String location;
  final DateTime date;
  final String rentType;

  CarSearchResultsScreen({
    super.key,
    required this.location,
    required this.date,
    required this.rentType,
  });

  @override
  State<CarSearchResultsScreen> createState() => _CarSearchResultsScreenState();
}

class _CarSearchResultsScreenState extends State<CarSearchResultsScreen> {
  List<CarRental> _originalCars = [];
  List<CarRental> _filteredCars = [];
  String _sortBy = 'recommended';
  bool _isLoading = true;
  String? _errorMessage;

  CarFilterSettings _filterSettings = CarFilterSettings(
    priceRange: const RangeValues(0, 5000),
    selectedTypes: {'All'},
    selectedTransmissions: {'All'},
    selectedBrands: {'All'},
    selectedEngines: {'All'},
    minRating: 0,
  );

  final double _minPrice = 0;
  final double _maxPrice = 5000;
  final CarRentalService _carRentalService = CarRentalService();

  @override
  void initState() {
    super.initState();
    _fetchCars();
  }

  Future<void> _fetchCars() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });
    try {
      _originalCars = await _carRentalService.searchCarRentals(
        pickUpLocation: widget.location,
        date: widget.date,
        rentType: widget.rentType,
      );
      _applyFiltersAndSorting();
    } catch (e) {
      setState(() {
        _errorMessage = e.toString();
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _applyFiltersAndSorting() {
    List<CarRental> currentlyFiltered = List.from(_originalCars);

    currentlyFiltered = currentlyFiltered.where((car) {
      bool matchesPrice = car.price >= _filterSettings.priceRange.start &&
          car.price <= _filterSettings.priceRange.end;
      bool matchesType = _filterSettings.selectedTypes.contains('All') ||
          _filterSettings.selectedTypes.contains(car.carType ?? '');
      bool matchesTransmission =
          _filterSettings.selectedTransmissions.contains('All') ||
              _filterSettings.selectedTransmissions
                  .contains(car.transmission ?? '');
      bool matchesBrand = _filterSettings.selectedBrands.contains('All') ||
          _filterSettings.selectedBrands.contains(car.brand ?? '');
      bool matchesEngine = _filterSettings.selectedEngines.contains('All') ||
          _filterSettings.selectedEngines.contains(car.engineType ?? '');
      return matchesPrice &&
          matchesType &&
          matchesTransmission &&
          matchesBrand &&
          matchesEngine;
    }).toList();

    switch (_sortBy) {
      case 'price_low':
        currentlyFiltered.sort((a, b) => a.price.compareTo(b.price));
        break;
      case 'price_high':
        currentlyFiltered.sort((a, b) => b.price.compareTo(a.price));
        break;
      case 'recommended':
      default:
        currentlyFiltered.sort((a, b) => a.id.compareTo(b.id)); // ترتيب افتراضي
        break;
    }
    setState(() {
      _filteredCars = currentlyFiltered;
    });
  }

  void _showFilterScreen() {
    showModalBottomSheet<CarFilterSettings>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => CarFilterScreen(
        initialSettings: _filterSettings,
        minPriceValue: _minPrice,
        maxPriceValue: _maxPrice,
      ),
    ).then((newSettings) {
      if (newSettings != null) {
        setState(() {
          _filterSettings = newSettings;
          _applyFiltersAndSorting();
        });
      }
    });
  }

  void _showSortOptions() {
    final Map<String, String> sortOptions = {
      'recommended': 'Recommended',
      'price_low': 'Lowest Price',
      'price_high': 'Highest Price'
    };
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: sortOptions.entries.map((entry) {
          bool isSelected = _sortBy == entry.key;
          return ListTile(
            title: Text(entry.value,
                style: TextStyle(
                    fontWeight:
                        isSelected ? FontWeight.bold : FontWeight.normal,
                    color:
                        isSelected ? const Color(0xFF4E7D96) : Colors.black)),
            trailing: isSelected
                ? const Icon(Icons.check, color: Color(0xFF4E7D96))
                : null,
            onTap: () {
              setState(() {
                _sortBy = entry.key;
                _applyFiltersAndSorting();
              });
              Navigator.pop(context);
            },
          );
        }).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isFilterActive = _filterSettings.minRating > 0 ||
        !_filterSettings.selectedTypes.contains('All') ||
        !_filterSettings.selectedBrands.contains('All') ||
        !_filterSettings.selectedEngines.contains('All') ||
        !_filterSettings.selectedTransmissions.contains('All') ||
        _filterSettings.priceRange != RangeValues(_minPrice, _maxPrice);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        shadowColor: Colors.grey.shade300,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        titleSpacing: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.location,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 2),
            Text(
              _isLoading
                  ? 'Searching...'
                  : '${_filteredCars.length} results found',
              style: TextStyle(color: Colors.grey[600], fontSize: 13),
            ),
          ],
        ),
        actions: [
          TextButton.icon(
            onPressed: _showSortOptions,
            icon: Icon(Icons.swap_vert, color: Colors.grey.shade700, size: 22),
            label: Text('Sort',
                style: TextStyle(color: Colors.grey.shade700, fontSize: 14)),
            style: TextButton.styleFrom(foregroundColor: Colors.grey.shade700),
          ),
          TextButton.icon(
            onPressed: _showFilterScreen,
            icon: Stack(
              clipBehavior: Clip.none,
              children: [
                Icon(Icons.filter_list, color: Colors.grey.shade700, size: 22),
                if (isFilterActive)
                  Positioned(
                    top: -2,
                    right: -4,
                    child: Container(
                      padding: const EdgeInsets.all(3),
                      decoration: const BoxDecoration(
                          color: Color(0xFF4E7D96), shape: BoxShape.circle),
                    ),
                  ),
              ],
            ),
            label: Text('Filter',
                style: TextStyle(color: Colors.grey.shade700, fontSize: 14)),
            style: TextButton.styleFrom(foregroundColor: Colors.grey.shade700),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_errorMessage != null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            _errorMessage!,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.red.shade700, fontSize: 16, height: 1.5),
          ),
        ),
      );
    }

    if (_filteredCars.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            'No cars found matching your criteria.\nTry adjusting the filters or search criteria.',
            textAlign: TextAlign.center,
            style:
                TextStyle(color: Colors.grey[600], fontSize: 16, height: 1.5),
          ),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: _filteredCars.length,
      itemBuilder: (context, index) {
        return _buildCarCard(_filteredCars[index]);
      },
    );
  }

  Widget _buildCarCard(CarRental car) {
    return Card(
      elevation: 2.0,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          final carToPass = Car(
            id: car.id.toString(),
            name: car.brand ?? 'Unknown Brand',
            brand: car.brand ?? 'Unknown Brand',
            type: car.carType ?? 'Unknown Type',
            imageUrl: car.imageUrls.isNotEmpty
                ? car.imageUrls.first
                : 'assets/car.jpeg',
            price: car.price,
            rating: 0.0, // لم يعد موجودًا في البيانات، يمكن إضافة قيمة افتراضية
            transmission: car.transmission ?? 'N/A',
            fuelType: car.engineType ?? 'N/A',
            seats: 5, // قيمة افتراضية
          );
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CarDetailsScreen(car: carToPass)),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(12)),
              child: Container(
                height: 180,
                width: double.infinity,
                color: Colors.grey[200],
                child: car.imageUrls.isNotEmpty
                    ? Image.network(
                        car.imageUrls.first,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.directions_car,
                                size: 50, color: Colors.grey),
                        loadingBuilder: (context, child, progress) =>
                            progress == null
                                ? child
                                : const Center(
                                    child: CircularProgressIndicator()),
                      )
                    : const Icon(Icons.directions_car,
                        size: 50, color: Colors.grey),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(car.brand ?? 'Unknown Brand',
                            style: const TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis),
                      ),
                      // لم يعد هناك تصنيف (rating) في البيانات
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text('EGP ${car.price.toStringAsFixed(0)} / day',
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF4E7D96))),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _buildFeatureIcon(Icons.settings_suggest_outlined,
                          car.transmission ?? 'N/A'),
                      const SizedBox(width: 24),
                      _buildFeatureIcon(Icons.local_gas_station_outlined,
                          car.engineType ?? 'N/A'),
                      const SizedBox(width: 24),
                      _buildFeatureIcon(Icons.person_outline_rounded,
                          '5 Seats'), // قيمة افتراضية
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureIcon(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 18, color: Colors.grey.shade700),
        const SizedBox(width: 6),
        Text(text, style: TextStyle(color: Colors.grey.shade800, fontSize: 13)),
      ],
    );
  }
}
