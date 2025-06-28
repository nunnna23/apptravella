// // import 'package:flutter/material.dart';

// // class TaxiFilterScreen extends StatefulWidget {
// //   const TaxiFilterScreen({super.key});

// //   @override
// //   State<TaxiFilterScreen> createState() => _TaxiFilterScreenState();
// // }

// // class _TaxiFilterScreenState extends State<TaxiFilterScreen> {
// //   // --- State Variables ---
// //   RangeValues _priceRange =
// //       const RangeValues(0, 1850); // Figma shows ~1850 initially
// //   String _selectedTime = 'All';
// //   String _selectedDriverAge = 'All';
// //   String _selectedDistance = 'All';
// //   double _selectedReview = 4.5; // Figma shows 4.5 selected initially

// //   // --- Filter Options ---
// //   final List<String> timeOptions = [
// //     'All',
// //     '1-5 minutes',
// //     '5-10 minutes'
// //   ]; // Corrected "minutes"
// //   final List<String> ageOptions = [
// //     'All',
// //     '25-30',
// //     '30-35',
// //     '35-40',
// //     '40+'
// //   ]; // Added 40+ based on visual hint
// //   final List<String> distanceOptions = ['All', '0-1 Km', '1-5 Km'];
// //   final List<double> reviewOptions = [
// //     4.5,
// //     4.0,
// //     3.5,
// //     3.0,
// //     2.5
// //   ]; // Removed 2.0 based on Figma view

// //   // --- Constants ---
// //   static const Color _themeColor = Color(0xFF4E7D96);
// //   static const Color _lightGreyBackground =
// //       Color(0xFFF5F5F5); // Or Colors.grey[100]
// //   static const Color _chipBackgroundColor =
// //       Color(0xFFEEEEEE); // Or Colors.grey[200]
// //   static const Color _unselectedChipTextColor =
// //       Color(0xFF616161); // Darker Grey

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: _lightGreyBackground, // Use defined light grey
// //       appBar: AppBar(
// //         elevation: 0.5, // Subtle elevation
// //         shadowColor: Colors.grey.shade300,
// //         backgroundColor: Colors.white,
// //         leading: IconButton(
// //           // Changed to back arrow as is more common for filter screens than close
// //           icon: const Icon(Icons.arrow_back, color: Colors.black),
// //           onPressed: () => Navigator.of(context).pop(),
// //         ),
// //         title: const Text(
// //           'Filter',
// //           style: TextStyle(
// //               color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
// //         ),
// //         centerTitle: true,
// //       ),
// //       body: SingleChildScrollView(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             // --- Price Range ---
// //             _buildFilterSectionTitle('Price range'),
// //             Container(
// //               padding: const EdgeInsets.symmetric(
// //                   horizontal: 16, vertical: 8), // Adjusted padding
// //               decoration: BoxDecoration(
// //                 color: Colors.white,
// //                 borderRadius: BorderRadius.circular(12),
// //               ),
// //               child: Column(
// //                 children: [
// //                   // Apply custom SliderTheme
// //                   SliderTheme(
// //                     data: SliderTheme.of(context).copyWith(
// //                       activeTrackColor: _themeColor,
// //                       inactiveTrackColor: Colors.grey[300],
// //                       thumbColor: _themeColor, // Solid blue thumb like Figma
// //                       overlayColor:
// //                           _themeColor.withOpacity(0.15), // Subtle overlay
// //                       valueIndicatorShape:
// //                           const PaddleSliderValueIndicatorShape(), // More rectangular
// //                       valueIndicatorColor: _themeColor,
// //                       valueIndicatorTextStyle: const TextStyle(
// //                         color: Colors.white,
// //                         fontSize: 12, // Smaller text in indicator
// //                       ),
// //                       trackHeight: 2.0, // Thinner track
// //                     ),
// //                     child: RangeSlider(
// //                       values: _priceRange,
// //                       min: 0,
// //                       max: 2000, // Keep max reasonable
// //                       divisions: 40, // More divisions for smoother feel
// //                       labels: RangeLabels(
// //                         'EGP ${_priceRange.start.round()}',
// //                         'EGP ${_priceRange.end.round()}',
// //                       ),
// //                       onChanged: (RangeValues values) {
// //                         setState(() {
// //                           _priceRange = values;
// //                         });
// //                       },
// //                     ),
// //                   ),
// //                   const SizedBox(height: 4), // Space before text labels
// //                   Row(
// //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                     children: [
// //                       // Use Containers for rounded border text like Figma
// //                       _buildPriceLabel('EGP ${_priceRange.start.round()}'),
// //                       const Text('-',
// //                           style:
// //                               TextStyle(color: Colors.grey)), // Dash separator
// //                       _buildPriceLabel('EGP ${_priceRange.end.round()}'),
// //                     ],
// //                   ),
// //                   const SizedBox(height: 8), // Padding at the bottom
// //                 ],
// //               ),
// //             ),
// //             const SizedBox(height: 24),

// //             // --- Time ---
// //             _buildFilterSectionTitle('Time'),
// //             _buildChoiceChipGroup<String>(
// //               options: timeOptions,
// //               selectedOption: _selectedTime,
// //               onSelected: (value) => setState(() => _selectedTime = value),
// //             ),
// //             const SizedBox(height: 24),

// //             // --- Driver's Age ---
// //             _buildFilterSectionTitle("Driver's age"),
// //             _buildChoiceChipGroup<String>(
// //               options: ageOptions,
// //               selectedOption: _selectedDriverAge,
// //               onSelected: (value) => setState(() => _selectedDriverAge = value),
// //             ),
// //             const SizedBox(height: 24),

// //             // --- Distance ---
// //             _buildFilterSectionTitle('Distance'),
// //             _buildChoiceChipGroup<String>(
// //               options: distanceOptions,
// //               selectedOption: _selectedDistance,
// //               onSelected: (value) => setState(() => _selectedDistance = value),
// //             ),
// //             const SizedBox(height: 24),

// //             // --- Reviews ---
// //             _buildFilterSectionTitle('Reviews'),
// //             Container(
// //               padding: const EdgeInsets.symmetric(
// //                   vertical: 4), // Less vertical padding needed
// //               decoration: BoxDecoration(
// //                 color: Colors.white,
// //                 borderRadius: BorderRadius.circular(12),
// //               ),
// //               child: Column(
// //                 // Use map to generate list tiles or similar
// //                 children: reviewOptions.map((rating) {
// //                   bool isSelected = _selectedReview == rating;
// //                   return InkWell(
// //                     onTap: () => setState(() => _selectedReview = rating),
// //                     borderRadius:
// //                         BorderRadius.circular(12), // Match container radius
// //                     child: Container(
// //                       // Use container for padding and selected bg
// //                       padding: const EdgeInsets.symmetric(
// //                           horizontal: 16.0, vertical: 12.0), // Standard padding
// //                       decoration: BoxDecoration(
// //                         color: isSelected
// //                             ? _themeColor.withOpacity(0.08)
// //                             : Colors
// //                                 .transparent, // Subtle background if selected
// //                         // Ensure border radius matches if using InkWell highlight
// //                         borderRadius: (rating == reviewOptions.first &&
// //                                 rating == reviewOptions.last)
// //                             ? BorderRadius.circular(12)
// //                             : (rating == reviewOptions.first)
// //                                 ? const BorderRadius.vertical(
// //                                     top: Radius.circular(12))
// //                                 : (rating == reviewOptions.last)
// //                                     ? const BorderRadius.vertical(
// //                                         bottom: Radius.circular(12))
// //                                     : null,
// //                       ),
// //                       child: Row(
// //                         children: [
// //                           _buildStarRating(rating),
// //                           const SizedBox(width: 12), // More space after stars
// //                           Text(
// //                             _getReviewRangeText(rating), // Use helper for text
// //                             style: TextStyle(
// //                               fontSize: 14,
// //                               // Use theme color only for selected text, not background
// //                               color: isSelected ? _themeColor : Colors.black87,
// //                               fontWeight: isSelected
// //                                   ? FontWeight.bold
// //                                   : FontWeight.normal,
// //                             ),
// //                           ),
// //                           const Spacer(),
// //                           // Use Radio button style checkmark like Figma
// //                           if (isSelected)
// //                             const Icon(Icons.radio_button_checked,
// //                                 color: _themeColor, size: 22),
// //                           // Optional: Show unchecked radio for unselected
// //                           // else
// //                           //   Icon(Icons.radio_button_unchecked, color: Colors.grey[400], size: 22),
// //                         ],
// //                       ),
// //                     ),
// //                   );
// //                 }).toList(),
// //               ),
// //             ),

// //             const SizedBox(height: 30), // Space before buttons

// //             // --- Action Buttons ---
// //             ElevatedButton(
// //               onPressed: () {
// //                 // TODO: Implement filter application logic
// //                 final Map<String, dynamic> appliedFilters = {
// //                   'price_start': _priceRange.start,
// //                   'price_end': _priceRange.end,
// //                   'time': _selectedTime,
// //                   'driver_age': _selectedDriverAge,
// //                   'distance': _selectedDistance,
// //                   'review': _selectedReview,
// //                 };
// //                 print('Applying Filters: $appliedFilters');
// //                 // Pass data back if needed: Navigator.pop(context, appliedFilters);
// //                 Navigator.pop(context);
// //               },
// //               style: ElevatedButton.styleFrom(
// //                 backgroundColor: _themeColor, // Use theme color
// //                 minimumSize: const Size(double.infinity, 50),
// //                 shape: RoundedRectangleBorder(
// //                   borderRadius:
// //                       BorderRadius.circular(12), // Consistent rounding
// //                 ),
// //                 elevation: 2, // Subtle elevation
// //               ),
// //               child: const Text('Apply Filters',
// //                   style: TextStyle(fontSize: 18, color: Colors.white)),
// //             ),
// //             const SizedBox(height: 8), // Less space before reset
// //             Center(
// //               child: TextButton(
// //                 onPressed: () {
// //                   // Reset state variables to default values
// //                   setState(() {
// //                     _priceRange = const RangeValues(0, 1850);
// //                     _selectedTime = 'All';
// //                     _selectedDriverAge = 'All';
// //                     _selectedDistance = 'All';
// //                     _selectedReview = 4.5;
// //                   });
// //                 },
// //                 style: TextButton.styleFrom(
// //                   foregroundColor:
// //                       Colors.grey[600], // Foreground color for text/icon
// //                 ),
// //                 child: const Text('Reset', style: TextStyle(fontSize: 15)),
// //               ),
// //             )
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   // --- Helper Widgets ---

// //   // Helper for Price Labels like Figma
// //   Widget _buildPriceLabel(String text) {
// //     return Container(
// //       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
// //       decoration: BoxDecoration(
// //         color: Colors.white,
// //         borderRadius: BorderRadius.circular(20), // Highly rounded
// //         border: Border.all(color: Colors.grey.shade300, width: 1),
// //       ),
// //       child: Text(
// //         text,
// //         style: TextStyle(color: Colors.grey[700], fontSize: 14),
// //       ),
// //     );
// //   }

// //   // Helper to build section titles consistently
// //   Widget _buildFilterSectionTitle(String title) {
// //     return Padding(
// //       padding: const EdgeInsets.only(bottom: 10.0, top: 4.0), // Adjust padding
// //       child: Text(
// //         title,
// //         style: const TextStyle(
// //             fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black87),
// //       ),
// //     );
// //   }

// //   // Helper for Review Range Text
// //   String _getReviewRangeText(double rating) {
// //     if (rating == 4.5) return '4.5 and above';
// //     if (rating == 4.0) return '4.0 - 4.5';
// //     if (rating == 3.5) return '3.5 - 4.0';
// //     if (rating == 3.0) return '3.0 - 3.5';
// //     if (rating == 2.5) return '2.5 - 3.0';
// //     return ''; // Should not happen with current options
// //   }

// //   // Helper to build star ratings display (Minor color tweak)
// //   Widget _buildStarRating(double rating) {
// //     // This logic seems fine, maybe adjust star color/size if needed
// //     int fullStars = rating.floor();
// //     bool hasHalfStar = (rating - fullStars) >= 0.5; // Use >= 0.5 for half star
// //     List<Widget> stars = [];
// //     for (int i = 0; i < 5; i++) {
// //       if (i < fullStars) {
// //         // Figma stars look solid yellow/amber
// //         stars.add(const Icon(Icons.star, color: Colors.amber, size: 18));
// //       } else if (i == fullStars && hasHalfStar) {
// //         // Keep half star logic if applicable, though Figma doesn't show it here
// //         stars.add(const Icon(Icons.star_half, color: Colors.amber, size: 18));
// //       } else {
// //         // Bordered star for empty ones
// //         stars.add(Icon(Icons.star_border, color: Colors.grey[400], size: 18));
// //       }
// //     }
// //     return Row(mainAxisSize: MainAxisSize.min, children: stars);
// //   }

// //   // Generic helper for creating ChoiceChip groups (Style adjustments)
// //   Widget _buildChoiceChipGroup<T>({
// //     required List<T> options,
// //     required T selectedOption,
// //     required ValueChanged<T> onSelected,
// //   }) {
// //     return Container(
// //       // Removed internal padding/decoration, Wrap handles layout
// //       child: Wrap(
// //         spacing: 8.0, // Horizontal space
// //         runSpacing: 8.0, // Vertical space if chips wrap
// //         children: options.map((option) {
// //           final bool isSelected = selectedOption == option;
// //           return ChoiceChip(
// //             label: Text(option.toString()),
// //             selected: isSelected,
// //             onSelected: (bool selected) {
// //               if (selected) {
// //                 onSelected(option);
// //               }
// //             },
// //             selectedColor: _themeColor, // Use theme color for selected BG
// //             labelStyle: TextStyle(
// //               color: isSelected
// //                   ? Colors.white
// //                   : _unselectedChipTextColor, // White text when selected
// //               fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
// //               fontSize: 13, // Slightly smaller chip text
// //             ),
// //             backgroundColor: _chipBackgroundColor, // Consistent light grey BG
// //             shape: RoundedRectangleBorder(
// //                 borderRadius: BorderRadius.circular(8), // Standard radius
// //                 // Use border only for unselected or always? Figma looks borderless mostly
// //                 side: BorderSide(
// //                   color: isSelected
// //                       ? _themeColor
// //                       : Colors.grey.shade300, // Border color change
// //                   width: 1.0,
// //                 )),
// //             padding: const EdgeInsets.symmetric(
// //                 horizontal: 14, vertical: 8), // Adjust padding
// //             showCheckmark: false,
// //             elevation: isSelected ? 1 : 0, // Slight elevation if selected
// //             selectedShadowColor: Colors.black.withOpacity(0.1),
// //           );
// //         }).toList(),
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';

// class TaxiFilterScreen extends StatefulWidget {
//   const TaxiFilterScreen({super.key});

//   @override
//   State<TaxiFilterScreen> createState() => _TaxiFilterScreenState();
// }

// class _TaxiFilterScreenState extends State<TaxiFilterScreen> {
//   RangeValues _priceRange = const RangeValues(0, 1850);
//   String _selectedTime = 'All';
//   String _selectedDriverAge = 'All';
//   String _selectedDistance = 'All';
//   double _selectedReview = 4.5;

//   final List<String> timeOptions = ['All', '1-5 minutes', '5-10 minutes'];
//   final List<String> ageOptions = ['All', '25-30', '30-35', '35-40', '40+'];
//   final List<String> distanceOptions = ['All', '0-1 Km', '1-5 Km'];
//   final List<double> reviewOptions = [4.5, 4.0, 3.5, 3.0, 2.5];

//   static const Color _themeColor = Color(0xFF4E7D96);
//   static const Color _lightGreyBackground = Color(0xFFF5F5F5);
//   static const Color _chipBackgroundColor = Color(0xFFEEEEEE);
//   static const Color _unselectedChipTextColor = Color(0xFF616161);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: _lightGreyBackground,
//       appBar: AppBar(
//         elevation: 0.5,
//         shadowColor: Colors.grey.shade300,
//         backgroundColor: Colors.white,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//         title: const Text(
//           'Filter',
//           style: TextStyle(
//               color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
//         ),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             _buildFilterSectionTitle('Price range'),
//             Container(
//               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Column(
//                 children: [
//                   SliderTheme(
//                     data: SliderTheme.of(context).copyWith(
//                       activeTrackColor: _themeColor,
//                       inactiveTrackColor: Colors.grey[300],
//                       thumbColor: _themeColor,
//                       overlayColor: _themeColor.withOpacity(0.15),
//                       valueIndicatorShape:
//                           const PaddleSliderValueIndicatorShape(),
//                       valueIndicatorColor: _themeColor,
//                       valueIndicatorTextStyle:
//                           const TextStyle(color: Colors.white, fontSize: 12),
//                       trackHeight: 2.0,
//                     ),
//                     child: RangeSlider(
//                       values: _priceRange,
//                       min: 0,
//                       max: 2000,
//                       divisions: 40,
//                       labels: RangeLabels(
//                         'EGP ${_priceRange.start.round()}',
//                         'EGP ${_priceRange.end.round()}',
//                       ),
//                       onChanged: (RangeValues values) {
//                         setState(() {
//                           _priceRange = values;
//                         });
//                       },
//                     ),
//                   ),
//                   const SizedBox(height: 4),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       _buildPriceLabel('EGP ${_priceRange.start.round()}'),
//                       const Text('-', style: TextStyle(color: Colors.grey)),
//                       _buildPriceLabel('EGP ${_priceRange.end.round()}'),
//                     ],
//                   ),
//                   const SizedBox(height: 8),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 24),
//             _buildFilterSectionTitle('Time'),
//             _buildChoiceChipGroup<String>(
//               options: timeOptions,
//               selectedOption: _selectedTime,
//               onSelected: (value) => setState(() => _selectedTime = value),
//             ),
//             const SizedBox(height: 24),
//             _buildFilterSectionTitle("Driver's age"),
//             _buildChoiceChipGroup<String>(
//               options: ageOptions,
//               selectedOption: _selectedDriverAge,
//               onSelected: (value) => setState(() => _selectedDriverAge = value),
//             ),
//             const SizedBox(height: 24),
//             _buildFilterSectionTitle('Distance'),
//             _buildChoiceChipGroup<String>(
//               options: distanceOptions,
//               selectedOption: _selectedDistance,
//               onSelected: (value) => setState(() => _selectedDistance = value),
//             ),
//             const SizedBox(height: 24),
//             _buildFilterSectionTitle('Reviews'),
//             Container(
//               padding: const EdgeInsets.symmetric(vertical: 4),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Column(
//                 children: reviewOptions.map((rating) {
//                   bool isSelected = _selectedReview == rating;
//                   return InkWell(
//                     onTap: () => setState(() => _selectedReview = rating),
//                     borderRadius: BorderRadius.circular(12),
//                     child: Container(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 16.0, vertical: 12.0),
//                       decoration: BoxDecoration(
//                         color: isSelected
//                             ? _themeColor.withOpacity(0.08)
//                             : Colors.transparent,
//                         borderRadius: (rating == reviewOptions.first &&
//                                 rating == reviewOptions.last)
//                             ? BorderRadius.circular(12)
//                             : (rating == reviewOptions.first)
//                                 ? const BorderRadius.vertical(
//                                     top: Radius.circular(12))
//                                 : (rating == reviewOptions.last)
//                                     ? const BorderRadius.vertical(
//                                         bottom: Radius.circular(12))
//                                     : null,
//                       ),
//                       child: Row(
//                         children: [
//                           _buildStarRating(rating),
//                           const SizedBox(width: 12),
//                           Text(
//                             _getReviewRangeText(rating),
//                             style: TextStyle(
//                               fontSize: 14,
//                               color: isSelected ? _themeColor : Colors.black87,
//                               fontWeight: isSelected
//                                   ? FontWeight.bold
//                                   : FontWeight.normal,
//                             ),
//                           ),
//                           const Spacer(),
//                           if (isSelected)
//                             const Icon(Icons.radio_button_checked,
//                                 color: _themeColor, size: 22),
//                         ],
//                       ),
//                     ),
//                   );
//                 }).toList(),
//               ),
//             ),
//             const SizedBox(height: 30),
//             ElevatedButton(
//               onPressed: () {
//                 final appliedFilters = {
//                   'price_start': _priceRange.start,
//                   'price_end': _priceRange.end,
//                   'time': _selectedTime,
//                   'driver_age': _selectedDriverAge,
//                   'distance': _selectedDistance,
//                   'review': _selectedReview,
//                 };
//                 Navigator.pop(context, appliedFilters);
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: _themeColor,
//                 minimumSize: const Size(double.infinity, 50),
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(12)),
//                 elevation: 2,
//               ),
//               child: const Text('Apply Filters',
//                   style: TextStyle(fontSize: 18, color: Colors.white)),
//             ),
//             const SizedBox(height: 8),
//             Center(
//               child: TextButton(
//                 onPressed: () {
//                   setState(() {
//                     _priceRange = const RangeValues(0, 1850);
//                     _selectedTime = 'All';
//                     _selectedDriverAge = 'All';
//                     _selectedDistance = 'All';
//                     _selectedReview = 4.5;
//                   });
//                 },
//                 style: TextButton.styleFrom(foregroundColor: Colors.grey[600]),
//                 child: const Text('Reset', style: TextStyle(fontSize: 15)),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildPriceLabel(String text) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(20),
//         border: Border.all(color: Colors.grey.shade300, width: 1),
//       ),
//       child:
//           Text(text, style: TextStyle(color: Colors.grey[700], fontSize: 14)),
//     );
//   }

//   Widget _buildFilterSectionTitle(String title) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 10.0, top: 4.0),
//       child: Text(title,
//           style: const TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.bold,
//               color: Colors.black87)),
//     );
//   }

//   String _getReviewRangeText(double rating) {
//     if (rating == 4.5) return '4.5 and above';
//     if (rating == 4.0) return '4.0 - 4.5';
//     if (rating == 3.5) return '3.5 - 4.0';
//     if (rating == 3.0) return '3.0 - 3.5';
//     if (rating == 2.5) return '2.5 - 3.0';
//     return '';
//   }

//   Widget _buildStarRating(double rating) {
//     int fullStars = rating.floor();
//     bool hasHalfStar = (rating - fullStars) >= 0.5;
//     List<Widget> stars = [];
//     for (int i = 0; i < 5; i++) {
//       if (i < fullStars) {
//         stars.add(const Icon(Icons.star, color: Colors.amber, size: 18));
//       } else if (i == fullStars && hasHalfStar) {
//         stars.add(const Icon(Icons.star_half, color: Colors.amber, size: 18));
//       } else {
//         stars.add(Icon(Icons.star_border, color: Colors.grey[400], size: 18));
//       }
//     }
//     return Row(mainAxisSize: MainAxisSize.min, children: stars);
//   }

//   Widget _buildChoiceChipGroup<T>({
//     required List<T> options,
//     required T selectedOption,
//     required ValueChanged<T> onSelected,
//   }) {
//     return Container(
//       child: Wrap(
//         spacing: 8.0,
//         runSpacing: 8.0,
//         children: options.map((option) {
//           final bool isSelected = selectedOption == option;
//           return ChoiceChip(
//             label: Text(option.toString()),
//             selected: isSelected,
//             onSelected: (bool selected) {
//               if (selected) {
//                 onSelected(option);
//               }
//             },
//             selectedColor: _themeColor,
//             labelStyle: TextStyle(
//               color: isSelected ? Colors.white : _unselectedChipTextColor,
//               fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
//               fontSize: 13,
//             ),
//             backgroundColor: _chipBackgroundColor,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(8),
//               side: BorderSide(
//                   color: isSelected ? _themeColor : Colors.grey.shade300,
//                   width: 1.0),
//             ),
//             padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
//             showCheckmark: false,
//             elevation: isSelected ? 1 : 0,
//             selectedShadowColor: Colors.black.withOpacity(0.1),
//           );
//         }).toList(),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class TaxiFilterScreen extends StatefulWidget {
  const TaxiFilterScreen({super.key});

  @override
  State<TaxiFilterScreen> createState() => _TaxiFilterScreenState();
}

class _TaxiFilterScreenState extends State<TaxiFilterScreen> {
  RangeValues _priceRange = const RangeValues(0, 2000); // زيادة الحد الأقصى
  String _selectedTime = 'All';
  String _selectedDriverAge = 'All';
  String _selectedDistance = 'All'; // زيادة المسافة الافتراضية
  double _selectedReview = 4.0; // تقليل التقييم الأدنى

  final List<String> timeOptions = ['All', '1-5 minutes', '5-10 minutes'];
  final List<String> ageOptions = ['All', '25-30', '30-35', '35-40', '40+'];
  final List<String> distanceOptions = [
    'All',
    '0-1 Km',
    '1-5 Km',
    '5-10 Km'
  ]; // خيار إضافي
  final List<double> reviewOptions = [4.5, 4.0, 3.5, 3.0, 2.5];

  static const Color _themeColor = Color(0xFF4E7D96);
  static const Color _lightGreyBackground = Color(0xFFF5F5F5);
  static const Color _chipBackgroundColor = Color(0xFFEEEEEE);
  static const Color _unselectedChipTextColor = Color(0xFF616161);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _lightGreyBackground,
      appBar: AppBar(
        elevation: 0.5,
        shadowColor: Colors.grey.shade300,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Filter',
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildFilterSectionTitle('Price range'),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: _themeColor,
                      inactiveTrackColor: Colors.grey[300],
                      thumbColor: _themeColor,
                      overlayColor: _themeColor.withOpacity(0.15),
                      valueIndicatorShape:
                          const PaddleSliderValueIndicatorShape(),
                      valueIndicatorColor: _themeColor,
                      valueIndicatorTextStyle:
                          const TextStyle(color: Colors.white, fontSize: 12),
                      trackHeight: 2.0,
                    ),
                    child: RangeSlider(
                      values: _priceRange,
                      min: 0,
                      max: 2000,
                      divisions: 40,
                      labels: RangeLabels(
                        'EGP ${_priceRange.start.round()}',
                        'EGP ${_priceRange.end.round()}',
                      ),
                      onChanged: (RangeValues values) {
                        setState(() {
                          _priceRange = values;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildPriceLabel('EGP ${_priceRange.start.round()}'),
                      const Text('-', style: TextStyle(color: Colors.grey)),
                      _buildPriceLabel('EGP ${_priceRange.end.round()}'),
                    ],
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
            const SizedBox(height: 24),
            _buildFilterSectionTitle('Time'),
            _buildChoiceChipGroup<String>(
              options: timeOptions,
              selectedOption: _selectedTime,
              onSelected: (value) => setState(() => _selectedTime = value),
            ),
            const SizedBox(height: 24),
            _buildFilterSectionTitle("Driver's age"),
            _buildChoiceChipGroup<String>(
              options: ageOptions,
              selectedOption: _selectedDriverAge,
              onSelected: (value) => setState(() => _selectedDriverAge = value),
            ),
            const SizedBox(height: 24),
            _buildFilterSectionTitle('Distance'),
            _buildChoiceChipGroup<String>(
              options: distanceOptions,
              selectedOption: _selectedDistance,
              onSelected: (value) => setState(() => _selectedDistance = value),
            ),
            const SizedBox(height: 24),
            _buildFilterSectionTitle('Reviews'),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: reviewOptions.map((rating) {
                  bool isSelected = _selectedReview == rating;
                  return InkWell(
                    onTap: () => setState(() => _selectedReview = rating),
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 12.0),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? _themeColor.withOpacity(0.08)
                            : Colors.transparent,
                        borderRadius: (rating == reviewOptions.first &&
                                rating == reviewOptions.last)
                            ? BorderRadius.circular(12)
                            : (rating == reviewOptions.first)
                                ? const BorderRadius.vertical(
                                    top: Radius.circular(12))
                                : (rating == reviewOptions.last)
                                    ? const BorderRadius.vertical(
                                        bottom: Radius.circular(12))
                                    : null,
                      ),
                      child: Row(
                        children: [
                          _buildStarRating(rating),
                          const SizedBox(width: 12),
                          Text(
                            _getReviewRangeText(rating),
                            style: TextStyle(
                              fontSize: 14,
                              color: isSelected ? _themeColor : Colors.black87,
                              fontWeight: isSelected
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                          ),
                          const Spacer(),
                          if (isSelected)
                            const Icon(Icons.radio_button_checked,
                                color: _themeColor, size: 22),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                final appliedFilters = {
                  'price_start': _priceRange.start,
                  'price_end': _priceRange.end,
                  'time': _selectedTime,
                  'driver_age': _selectedDriverAge,
                  'distance': _selectedDistance,
                  'review': _selectedReview,
                };
                Navigator.pop(context, appliedFilters);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: _themeColor,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                elevation: 2,
              ),
              child: const Text('Apply Filters',
                  style: TextStyle(fontSize: 18, color: Colors.white)),
            ),
            const SizedBox(height: 8),
            Center(
              child: TextButton(
                onPressed: () {
                  setState(() {
                    _priceRange = const RangeValues(0, 2000);
                    _selectedTime = 'All';
                    _selectedDriverAge = 'All';
                    _selectedDistance = 'All';
                    _selectedReview = 4.0;
                  });
                },
                style: TextButton.styleFrom(foregroundColor: Colors.grey[600]),
                child: const Text('Reset', style: TextStyle(fontSize: 15)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPriceLabel(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade300, width: 1),
      ),
      child:
          Text(text, style: TextStyle(color: Colors.grey[700], fontSize: 14)),
    );
  }

  Widget _buildFilterSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0, top: 4.0),
      child: Text(title,
          style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87)),
    );
  }

  String _getReviewRangeText(double rating) {
    if (rating == 4.5) return '4.5 and above';
    if (rating == 4.0) return '4.0 - 4.5';
    if (rating == 3.5) return '3.5 - 4.0';
    if (rating == 3.0) return '3.0 - 3.5';
    if (rating == 2.5) return '2.5 - 3.0';
    return '';
  }

  Widget _buildStarRating(double rating) {
    int fullStars = rating.floor();
    bool hasHalfStar = (rating - fullStars) >= 0.5;
    List<Widget> stars = [];
    for (int i = 0; i < 5; i++) {
      if (i < fullStars) {
        stars.add(const Icon(Icons.star, color: Colors.amber, size: 18));
      } else if (i == fullStars && hasHalfStar) {
        stars.add(const Icon(Icons.star_half, color: Colors.amber, size: 18));
      } else {
        stars.add(Icon(Icons.star_border, color: Colors.grey[400], size: 18));
      }
    }
    return Row(mainAxisSize: MainAxisSize.min, children: stars);
  }

  Widget _buildChoiceChipGroup<T>({
    required List<T> options,
    required T selectedOption,
    required ValueChanged<T> onSelected,
  }) {
    return Container(
      child: Wrap(
        spacing: 8.0,
        runSpacing: 8.0,
        children: options.map((option) {
          final bool isSelected = selectedOption == option;
          return ChoiceChip(
            label: Text(option.toString()),
            selected: isSelected,
            onSelected: (bool selected) {
              if (selected) {
                onSelected(option);
              }
            },
            selectedColor: _themeColor,
            labelStyle: TextStyle(
              color: isSelected ? Colors.white : _unselectedChipTextColor,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              fontSize: 13,
            ),
            backgroundColor: _chipBackgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide(
                  color: isSelected ? _themeColor : Colors.grey.shade300,
                  width: 1.0),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            showCheckmark: false,
            elevation: isSelected ? 1 : 0,
            selectedShadowColor: Colors.black.withOpacity(0.1),
          );
        }).toList(),
      ),
    );
  }
}
