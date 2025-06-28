// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import '../screens/hotel_results_screen.dart';

// class HotelFilterScreen extends StatefulWidget {
//   final HotelFilterSettings initialSettings;
//   final double minPriceValue;
//   final double maxPriceValue;

//   const HotelFilterScreen({
//     super.key,
//     required this.initialSettings,
//     required this.minPriceValue,
//     required this.maxPriceValue,
//   });

//   @override
//   State<HotelFilterScreen> createState() => _HotelFilterScreenState();
// }

// class _HotelFilterScreenState extends State<HotelFilterScreen> {
//   // --- متغيرات الحالة المؤقتة ---
//   late RangeValues _tempPriceRange;
//   late String _tempSelectedRoomType;
//   late Set<String> _tempSelectedAmenities;
//   late String _tempSelectedCancellationPolicy;
//   late double _tempMinRating;

//   // --- قوائم الخيارات الثابتة ---
//   final List<String> _roomTypeOptions = [
//     'All',
//     'Single',
//     'Double',
//     'Suite',
//   ];
//   final List<String> _amenityOptions = ['All', 'Free Wi-Fi', 'Pool', 'Parking'];
//   final List<String> _cancellationPolicyOptions = [
//     'All',
//     'Free cancellation',
//     'Pay at hotel',
//   ];
//   final List<double> _reviewRatingThresholds = [
//     0.0,
//     4.5,
//     4.0,
//     3.5,
//     3.0,
//     2.5,
//     2.0,
//   ];

//   @override
//   void initState() {
//     super.initState();
//     // --- تهيئة الحالة المؤقتة ---
//     _tempPriceRange = RangeValues(
//       widget.initialSettings.priceRange.start
//           .clamp(widget.minPriceValue, widget.maxPriceValue),
//       widget.initialSettings.priceRange.end
//           .clamp(widget.minPriceValue, widget.maxPriceValue),
//     );
//     // تهيئة قيم الفلاتر من الإعدادات المستلمة
//     _tempSelectedRoomType = widget.initialSettings.selectedRoomType ?? 'All';
//     _tempSelectedAmenities = Set.from(widget.initialSettings.selectedAmenities);
//     if (_tempSelectedAmenities.isEmpty) _tempSelectedAmenities.add('All');
//     _tempSelectedCancellationPolicy =
//         widget.initialSettings.selectedCancellationPolicy ?? 'All';
//     _tempMinRating = widget.initialSettings.minRating;
//   }

//   @override
//   Widget build(BuildContext context) {
//     final Color themePrimaryColor = Theme.of(context).primaryColor;
//     final NumberFormat priceFormatter = NumberFormat("#,##0", "en_US");

//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 1.0,
//         leading: IconButton(
//           icon: const Icon(Icons.close, color: Colors.black),
//           onPressed: () => Navigator.pop(context),
//         ),
//         title: const Text('Filter',
//             style: TextStyle(
//                 color: Colors.black,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 18)),
//         centerTitle: true,
//         actions: [
//           TextButton(
//             onPressed: () {
//               final appliedFilters = HotelFilterSettings(
//                 priceRange: _tempPriceRange,
//                 selectedAmenities: _tempSelectedAmenities.contains('All')
//                     ? {}
//                     : _tempSelectedAmenities,
//                 selectedRoomType:
//                     _tempSelectedRoomType.toLowerCase(), // تحويل إلى صغير
//                 selectedCancellationPolicy: _tempSelectedCancellationPolicy
//                     .toLowerCase(), // تحويل إلى صغير
//                 minRating: _tempMinRating,
//               );
//               Navigator.pop(context, appliedFilters);
//             },
//             child: Text('Apply',
//                 style: TextStyle(
//                     color: themePrimaryColor,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 16)),
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             _buildFilterSectionTitle('Price range'),
//             const SizedBox(height: 10),
//             RangeSlider(
//               values: _tempPriceRange,
//               min: widget.minPriceValue,
//               max: widget.maxPriceValue,
//               activeColor: themePrimaryColor,
//               inactiveColor: themePrimaryColor.withOpacity(0.3),
//               labels: RangeLabels(
//                 'EGP${priceFormatter.format(_tempPriceRange.start.round())}',
//                 'EGP${priceFormatter.format(_tempPriceRange.end.round())}',
//               ),
//               onChanged: (RangeValues values) {
//                 setState(() {
//                   _tempPriceRange = values;
//                 });
//               },
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 10.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                       'EGP ${priceFormatter.format(_tempPriceRange.start.round())}',
//                       style: TextStyle(fontSize: 12, color: Colors.grey[600])),
//                   Text(
//                       'EGP ${priceFormatter.format(_tempPriceRange.end.round())}',
//                       style: TextStyle(fontSize: 12, color: Colors.grey[600])),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 25),
//             _buildFilterSectionTitle('Room Type'),
//             const SizedBox(height: 10),
//             Wrap(
//               spacing: 8.0,
//               runSpacing: 4.0,
//               children: _roomTypeOptions.map((option) {
//                 final isSelected = _tempSelectedRoomType == option;
//                 return ChoiceChip(
//                   label: Text(option),
//                   selected: isSelected,
//                   selectedColor: themePrimaryColor,
//                   backgroundColor: Colors.grey[200],
//                   labelStyle: TextStyle(
//                       color: isSelected ? Colors.white : Colors.black54,
//                       fontSize: 13),
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8.0)),
//                   side: BorderSide.none,
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
//                   onSelected: (bool selected) {
//                     if (selected) {
//                       setState(() {
//                         _tempSelectedRoomType = option;
//                       });
//                     }
//                   },
//                 );
//               }).toList(),
//             ),
//             const SizedBox(height: 25),
//             _buildFilterSectionTitle('Amenities'),
//             const SizedBox(height: 10),
//             Wrap(
//               spacing: 8.0,
//               runSpacing: 4.0,
//               children: _amenityOptions.map((option) {
//                 final isSelected = _tempSelectedAmenities.contains(option);
//                 return FilterChip(
//                   label: Text(option),
//                   selected: isSelected,
//                   selectedColor: themePrimaryColor,
//                   backgroundColor: Colors.grey[200],
//                   checkmarkColor: Colors.white,
//                   labelStyle: TextStyle(
//                       color: isSelected ? Colors.white : Colors.black54,
//                       fontSize: 13),
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8.0)),
//                   side: BorderSide.none,
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
//                   onSelected: (bool selected) {
//                     setState(() {
//                       if (option == 'All') {
//                         if (selected) {
//                           _tempSelectedAmenities.clear();
//                           _tempSelectedAmenities.add('All');
//                         } else {
//                           _tempSelectedAmenities.remove('All');
//                         }
//                       } else {
//                         _tempSelectedAmenities.remove('All');
//                         if (selected) {
//                           _tempSelectedAmenities.add(option);
//                         } else {
//                           _tempSelectedAmenities.remove(option);
//                         }
//                       }
//                       if (_tempSelectedAmenities.isEmpty) {
//                         _tempSelectedAmenities.add('All');
//                       }
//                     });
//                   },
//                 );
//               }).toList(),
//             ),
//             const SizedBox(height: 25),
//             _buildFilterSectionTitle('Cancellation Policy'),
//             const SizedBox(height: 10),
//             Wrap(
//               spacing: 8.0,
//               runSpacing: 4.0,
//               children: _cancellationPolicyOptions.map((option) {
//                 final isSelected = _tempSelectedCancellationPolicy == option;
//                 return ChoiceChip(
//                   label: Text(option),
//                   selected: isSelected,
//                   selectedColor: themePrimaryColor,
//                   backgroundColor: Colors.grey[200],
//                   labelStyle: TextStyle(
//                       color: isSelected ? Colors.white : Colors.black54,
//                       fontSize: 13),
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8.0)),
//                   side: BorderSide.none,
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
//                   onSelected: (bool selected) {
//                     if (selected) {
//                       setState(() {
//                         _tempSelectedCancellationPolicy = option;
//                       });
//                     }
//                   },
//                 );
//               }).toList(),
//             ),
//             const SizedBox(height: 25),
//             _buildFilterSectionTitle('Reviews'),
//             const SizedBox(height: 10),
//             Column(
//               children: _reviewRatingThresholds.map((threshold) {
//                 final bool isSelected = _tempMinRating == threshold;
//                 String label;
//                 if (threshold == 0.0) {
//                   label = 'All Reviews';
//                 } else {
//                   label = '${threshold.toStringAsFixed(1)} and above';
//                 }

//                 return InkWell(
//                   onTap: () {
//                     setState(() {
//                       _tempMinRating = threshold;
//                     });
//                   },
//                   child: Container(
//                     margin: const EdgeInsets.symmetric(vertical: 4.0),
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 12.0, vertical: 10.0),
//                     decoration: BoxDecoration(
//                         color: isSelected
//                             ? themePrimaryColor.withOpacity(0.15)
//                             : Colors.grey[100],
//                         borderRadius: BorderRadius.circular(8.0),
//                         border: Border.all(
//                           color: isSelected
//                               ? themePrimaryColor
//                               : Colors.grey[300]!,
//                           width: isSelected ? 1.5 : 1.0,
//                         )),
//                     child: Row(
//                       children: [
//                         Row(
//                           children: List.generate(5, (index) {
//                             bool filled = threshold == 0.0 ||
//                                 (index + 1.0) <= (threshold + 0.9);
//                             return Icon(
//                               filled ? Icons.star : Icons.star_border,
//                               color: isSelected
//                                   ? themePrimaryColor
//                                   : Colors.amber[600],
//                               size: 18,
//                             );
//                           }).toList(),
//                         ),
//                         const SizedBox(width: 12),
//                         Text(
//                           label,
//                           style: TextStyle(
//                             fontSize: 13,
//                             color:
//                                 isSelected ? themePrimaryColor : Colors.black87,
//                             fontWeight: isSelected
//                                 ? FontWeight.bold
//                                 : FontWeight.normal,
//                           ),
//                         ),
//                         const Spacer(),
//                         Icon(
//                           isSelected
//                               ? Icons.check_circle
//                               : Icons.radio_button_unchecked,
//                           color:
//                               isSelected ? themePrimaryColor : Colors.grey[400],
//                           size: 20,
//                         )
//                       ],
//                     ),
//                   ),
//                 );
//               }).toList(),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildFilterSectionTitle(String title) {
//     return Text(
//       title,
//       style: const TextStyle(
//           fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../screens/hotel_results_screen.dart';

class HotelFilterScreen extends StatefulWidget {
  final HotelFilterSettings initialSettings;
  final double minPriceValue;
  final double maxPriceValue;

  const HotelFilterScreen({
    super.key,
    required this.initialSettings,
    required this.minPriceValue,
    required this.maxPriceValue,
  });

  @override
  State<HotelFilterScreen> createState() => _HotelFilterScreenState();
}

class _HotelFilterScreenState extends State<HotelFilterScreen> {
  // --- متغيرات الحالة المؤقتة ---
  late RangeValues _tempPriceRange;
  late String _tempSelectedRoomType;
  late Set<String> _tempSelectedAmenities;
  late String _tempSelectedCancellationPolicy;
  late double _tempMinRating;

  // --- قوائم الخيارات الثابتة ---
  final List<String> _roomTypeOptions = [
    'All',
    'Single',
    'Double',
    'Suite',
  ];
  final List<String> _amenityOptions = ['All', 'Free Wi-Fi', 'Pool', 'Parking'];
  final List<String> _cancellationPolicyOptions = [
    'All',
    'Free cancellation',
    'Pay at hotel',
  ];
  final List<double> _reviewRatingThresholds = [
    0.0,
    4.5,
    4.0,
    3.5,
    3.0,
    2.5,
    2.0,
  ];

  @override
  void initState() {
    super.initState();
    // --- تهيئة الحالة المؤقتة ---
    _tempPriceRange = RangeValues(
      widget.initialSettings.priceRange.start
          .clamp(0, 5000), // نطاق من 0 إلى 5000
      widget.initialSettings.priceRange.end
          .clamp(0, 5000), // نطاق من 0 إلى 5000
    );
    // تهيئة قيم الفلاتر من الإعدادات المستلمة
    _tempSelectedRoomType = widget.initialSettings.selectedRoomType ?? 'All';
    _tempSelectedAmenities = Set.from(widget.initialSettings.selectedAmenities);
    if (_tempSelectedAmenities.isEmpty) _tempSelectedAmenities.add('All');
    _tempSelectedCancellationPolicy =
        widget.initialSettings.selectedCancellationPolicy ?? 'All';
    _tempMinRating = widget.initialSettings.minRating;
  }

  @override
  Widget build(BuildContext context) {
    final Color themePrimaryColor = Theme.of(context).primaryColor;
    final NumberFormat priceFormatter = NumberFormat("#,##0", "en_US");

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1.0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Filter',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18)),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              final appliedFilters = HotelFilterSettings(
                priceRange: _tempPriceRange,
                selectedAmenities: _tempSelectedAmenities.contains('All')
                    ? {}
                    : _tempSelectedAmenities,
                selectedRoomType: _tempSelectedRoomType.toLowerCase(),
                selectedCancellationPolicy:
                    _tempSelectedCancellationPolicy.toLowerCase(),
                minRating: _tempMinRating,
              );
              Navigator.pop(context, appliedFilters);
            },
            child: Text('Apply',
                style: TextStyle(
                    color: themePrimaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- Price Range (تعديل النطاق) ---
            _buildFilterSectionTitle('Price range'),
            const SizedBox(height: 10),
            RangeSlider(
              values: _tempPriceRange,
              min: 0, // الحد الأدنى
              max: 5000, // الحد الأقصى
              activeColor: themePrimaryColor,
              inactiveColor: themePrimaryColor.withOpacity(0.3),
              labels: RangeLabels(
                'EGP${priceFormatter.format(_tempPriceRange.start.round())}',
                'EGP${priceFormatter.format(_tempPriceRange.end.round())}',
              ),
              onChanged: (RangeValues values) {
                setState(() {
                  _tempPriceRange = RangeValues(
                    values.start.clamp(0, 5000),
                    values.end.clamp(0, 5000),
                  );
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      'EGP ${priceFormatter.format(_tempPriceRange.start.round())}',
                      style: TextStyle(fontSize: 12, color: Colors.grey[600])),
                  Text(
                      'EGP ${priceFormatter.format(_tempPriceRange.end.round())}',
                      style: TextStyle(fontSize: 12, color: Colors.grey[600])),
                ],
              ),
            ),
            const SizedBox(height: 25),

            // --- Room Type ---
            _buildFilterSectionTitle('Room Type'),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8.0,
              runSpacing: 4.0,
              children: _roomTypeOptions.map((option) {
                final isSelected = _tempSelectedRoomType == option;
                return ChoiceChip(
                  label: Text(option),
                  selected: isSelected,
                  selectedColor: themePrimaryColor,
                  backgroundColor: Colors.grey[200],
                  labelStyle: TextStyle(
                      color: isSelected ? Colors.white : Colors.black54,
                      fontSize: 13),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  side: BorderSide.none,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  onSelected: (bool selected) {
                    if (selected) {
                      setState(() {
                        _tempSelectedRoomType = option;
                      });
                    }
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 25),

            // --- Amenities ---
            _buildFilterSectionTitle('Amenities'),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8.0,
              runSpacing: 4.0,
              children: _amenityOptions.map((option) {
                final isSelected = _tempSelectedAmenities.contains(option);
                return FilterChip(
                  label: Text(option),
                  selected: isSelected,
                  selectedColor: themePrimaryColor,
                  backgroundColor: Colors.grey[200],
                  checkmarkColor: Colors.white,
                  labelStyle: TextStyle(
                      color: isSelected ? Colors.white : Colors.black54,
                      fontSize: 13),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  side: BorderSide.none,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  onSelected: (bool selected) {
                    setState(() {
                      if (option == 'All') {
                        if (selected) {
                          _tempSelectedAmenities.clear();
                          _tempSelectedAmenities.add('All');
                        } else {
                          _tempSelectedAmenities.remove('All');
                        }
                      } else {
                        _tempSelectedAmenities.remove('All');
                        if (selected) {
                          _tempSelectedAmenities.add(option);
                        } else {
                          _tempSelectedAmenities.remove(option);
                        }
                      }
                      if (_tempSelectedAmenities.isEmpty) {
                        _tempSelectedAmenities.add('All');
                      }
                    });
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 25),

            // --- Cancellation Policy ---
            _buildFilterSectionTitle('Cancellation Policy'),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8.0,
              runSpacing: 4.0,
              children: _cancellationPolicyOptions.map((option) {
                final isSelected = _tempSelectedCancellationPolicy == option;
                return ChoiceChip(
                  label: Text(option),
                  selected: isSelected,
                  selectedColor: themePrimaryColor,
                  backgroundColor: Colors.grey[200],
                  labelStyle: TextStyle(
                      color: isSelected ? Colors.white : Colors.black54,
                      fontSize: 13),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)),
                  side: BorderSide.none,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  onSelected: (bool selected) {
                    if (selected) {
                      setState(() {
                        _tempSelectedCancellationPolicy = option;
                      });
                    }
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 25),

            // --- Reviews ---
            _buildFilterSectionTitle('Reviews'),
            const SizedBox(height: 10),
            Column(
              children: _reviewRatingThresholds.map((threshold) {
                final bool isSelected = _tempMinRating == threshold;
                String label;
                if (threshold == 0.0) {
                  label = 'All Reviews';
                } else {
                  label = '${threshold.toStringAsFixed(1)} and above';
                }

                return InkWell(
                  onTap: () {
                    setState(() {
                      _tempMinRating = threshold;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 4.0),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 10.0),
                    decoration: BoxDecoration(
                        color: isSelected
                            ? themePrimaryColor.withOpacity(0.15)
                            : Colors.grey[100],
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(
                          color: isSelected
                              ? themePrimaryColor
                              : Colors.grey[300]!,
                          width: isSelected ? 1.5 : 1.0,
                        )),
                    child: Row(
                      children: [
                        Row(
                          children: List.generate(5, (index) {
                            bool filled = threshold == 0.0 ||
                                (index + 1.0) <= (threshold + 0.9);
                            return Icon(
                              filled ? Icons.star : Icons.star_border,
                              color: isSelected
                                  ? themePrimaryColor
                                  : Colors.amber[600],
                              size: 18,
                            );
                          }).toList(),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          label,
                          style: TextStyle(
                            fontSize: 13,
                            color:
                                isSelected ? themePrimaryColor : Colors.black87,
                            fontWeight: isSelected
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                        const Spacer(),
                        Icon(
                          isSelected
                              ? Icons.check_circle
                              : Icons.radio_button_unchecked,
                          color:
                              isSelected ? themePrimaryColor : Colors.grey[400],
                          size: 20,
                        )
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
          fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),
    );
  }
}
