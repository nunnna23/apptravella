// // import 'package:flutter/material.dart';
// // // Assuming CarFilterSettings class is defined here or imported

// // // Data Class for Filter Settings
// // class CarFilterSettings {
// //   final RangeValues priceRange;
// //   final Set<String> selectedTypes;
// //   final Set<String> selectedTransmissions;
// //   final Set<String> selectedBrands;
// //   final Set<String> selectedEngines; // Corresponds to Fuel Type in Car model
// //   final double minRating; // Represents the minimum star rating selected

// //   CarFilterSettings({
// //     required this.priceRange,
// //     required this.selectedTypes,
// //     required this.selectedTransmissions,
// //     required this.selectedBrands,
// //     required this.selectedEngines,
// //     required this.minRating,
// //   });

// //   // Optional: Add a copyWith method for easier state updates if needed
// //   CarFilterSettings copyWith({
// //     RangeValues? priceRange,
// //     Set<String>? selectedTypes,
// //     Set<String>? selectedTransmissions,
// //     Set<String>? selectedBrands,
// //     Set<String>? selectedEngines,
// //     double? minRating,
// //   }) {
// //     return CarFilterSettings(
// //       priceRange: priceRange ?? this.priceRange,
// //       selectedTypes: selectedTypes ?? this.selectedTypes,
// //       selectedTransmissions:
// //           selectedTransmissions ?? this.selectedTransmissions,
// //       selectedBrands: selectedBrands ?? this.selectedBrands,
// //       selectedEngines: selectedEngines ?? this.selectedEngines,
// //       minRating: minRating ?? this.minRating,
// //     );
// //   }
// // }

// // class CarFilterScreen extends StatefulWidget {
// //   final CarFilterSettings initialSettings;
// //   final double minPriceValue; // Pass min possible price
// //   final double maxPriceValue; // Pass max possible price

// //   const CarFilterScreen({
// //     super.key,
// //     required this.initialSettings,
// //     required this.minPriceValue,
// //     required this.maxPriceValue,
// //   });

// //   @override
// //   State<CarFilterScreen> createState() => _CarFilterScreenState();
// // }

// // class _CarFilterScreenState extends State<CarFilterScreen> {
// //   // State variables holding the current selections
// //   late RangeValues _priceRange;
// //   late Set<String> _selectedTypes;
// //   late Set<String> _selectedTransmissions;
// //   late Set<String> _selectedBrands;
// //   late Set<String> _selectedEngines;
// //   late double
// //       _selectedMinRating; // Use a specific variable for the selected rating

// //   // --- Options based on the Figma Design ---
// //   // Add 'All' as the first option for multi-select sections
// //   final List<String> _typeOptions = ['All', 'Sedan', 'SUV', 'Hatchback'];
// //   final List<String> _transmissionOptions = [
// //     'All',
// //     'Manual',
// //     'Automatic',
// //     'CVT'
// //   ];
// //   // Ensure these brands match the 'brand' field in your Car model
// //   final List<String> _brandOptions = [
// //     'All',
// //     'Toyota',
// //     'Honda',
// //     'Hyundai',
// //     'Ford',
// //     'BMW',
// //     'Audi',
// //     'Suzuki'
// //   ]; // Added brands from sample data
// //   // Ensure these match the 'fuelType' field in your Car model
// //   final List<String> _engineOptions = ['All', 'Diesel', 'Petrol', 'Gas'];

// //   // Rating options exactly matching the design (Label and minimum value)
// //   final List<Map<String, dynamic>> _ratingOptions = [
// //     {'label': '4.5 and above', 'value': 4.5},
// //     {'label': '4.0 - 4.5', 'value': 4.0}, // Value is the minimum of the range
// //     {'label': '3.5 - 4.0', 'value': 3.5},
// //     {'label': '3.0 - 3.5', 'value': 3.0},
// //     {'label': '2.5 - 3.0', 'value': 2.5},
// //     {'label': '2.0 - 2.5', 'value': 2.0},
// //     // Optional: Add an 'All' or 'Any Rating' option if needed
// //     // {'label': 'Any Rating', 'value': 0.0},
// //   ];
// //   // --- End Options ---

// //   @override
// //   void initState() {
// //     super.initState();
// //     // Initialize state from the passed initialSettings
// //     _priceRange = widget.initialSettings.priceRange;
// //     _selectedTypes = Set.from(widget.initialSettings.selectedTypes);
// //     _selectedTransmissions =
// //         Set.from(widget.initialSettings.selectedTransmissions);
// //     _selectedBrands = Set.from(widget.initialSettings.selectedBrands);
// //     _selectedEngines = Set.from(widget.initialSettings.selectedEngines);
// //     _selectedMinRating = widget.initialSettings.minRating; // Initialize rating
// //   }

// //   // Handles selection for multi-select chips (Type, Transmission, Brand, Engine)
// //   void _handleMultiSelectChip(
// //       String option, Set<String> selectedSet, List<String> allOptions) {
// //     setState(() {
// //       // If 'All' is selected, clear others and select 'All'
// //       if (option == 'All') {
// //         selectedSet.clear();
// //         selectedSet.add('All');
// //       } else {
// //         // If a specific option is tapped
// //         selectedSet.remove('All'); // Remove 'All' if it was selected
// //         if (selectedSet.contains(option)) {
// //           selectedSet.remove(option); // Deselect if already selected
// //         } else {
// //           selectedSet.add(option); // Select if not selected
// //         }
// //         // If no specific options are selected, select 'All' again
// //         if (selectedSet.isEmpty) {
// //           selectedSet.add('All');
// //         }
// //         // Optional: If all specific options are selected, maybe just select 'All'
// //         // This depends on desired UX. The current logic allows selecting multiple specific items.
// //         // if (selectedSet.length == allOptions.length - 1) { // -1 for 'All'
// //         //   selectedSet.clear();
// //         //   selectedSet.add('All');
// //         // }
// //       }
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     // Define the accent color consistently
// //     const Color accentColor = Color(0xFF4E7D96);

// //     return Container(
// //       // Height based on screen size, matching the design's overlay feel
// //       height: MediaQuery.of(context).size.height * 0.9,
// //       padding:
// //           const EdgeInsets.only(top: 10), // Padding for top drag handle area
// //       decoration: const BoxDecoration(
// //         color: Colors.white,
// //         borderRadius: BorderRadius.vertical(
// //             top: Radius.circular(20)), // Rounded top corners
// //       ),
// //       child: Column(
// //         children: [
// //           // --- Header Row (Close, Title, Apply) ---
// //           Padding(
// //             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
// //             child: Row(
// //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //               children: [
// //                 IconButton(
// //                   icon: const Icon(Icons.close,
// //                       color: Colors.black54), // Close icon
// //                   onPressed: () =>
// //                       Navigator.pop(context), // Just close, don't apply changes
// //                 ),
// //                 const Text(
// //                   'Filter',
// //                   style: TextStyle(
// //                       fontSize: 18,
// //                       fontWeight: FontWeight.bold,
// //                       color: Colors.black),
// //                 ),
// //                 TextButton(
// //                   onPressed: () {
// //                     // Create the settings object with current selections
// //                     final resultSettings = CarFilterSettings(
// //                       priceRange: _priceRange,
// //                       selectedTypes: _selectedTypes,
// //                       selectedTransmissions: _selectedTransmissions,
// //                       selectedBrands: _selectedBrands,
// //                       selectedEngines: _selectedEngines,
// //                       minRating:
// //                           _selectedMinRating, // Pass the selected minimum rating
// //                     );
// //                     // Pop the screen and return the selected settings
// //                     Navigator.pop(context, resultSettings);
// //                   },
// //                   style: TextButton.styleFrom(
// //                       foregroundColor: accentColor, // Text color
// //                       padding: EdgeInsets.zero, // Remove default padding
// //                       minimumSize:
// //                           const Size(50, 30) // Ensure reasonable tap area
// //                       ),
// //                   child: const Text(
// //                     'Apply',
// //                     style: TextStyle(
// //                       // Use the accent color from the design
// //                       color: accentColor,
// //                       fontWeight: FontWeight.bold,
// //                       fontSize: 16,
// //                     ),
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //           const Divider(
// //               height: 1,
// //               thickness: 1,
// //               color: Color(0xFFEEEEEE)), // Subtle divider

// //           // --- Scrollable Filter Options ---
// //           Expanded(
// //             child: ListView(
// //               padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
// //               children: [
// //                 // --- Price Range Section ---
// //                 _buildSectionTitle('Price range'),
// //                 RangeSlider(
// //                   values: _priceRange,
// //                   min: widget.minPriceValue, // Use passed min value
// //                   max: widget.maxPriceValue, // Use passed max value
// //                   divisions:
// //                       50, // Optional: More divisions for smoother sliding
// //                   activeColor: accentColor, // Accent color for active part
// //                   inactiveColor: Colors.grey[300], // Lighter grey for inactive
// //                   labels: RangeLabels(
// //                     // Show labels on interaction
// //                     'EGP ${_priceRange.start.round()}',
// //                     'EGP ${_priceRange.end.round()}',
// //                   ),
// //                   onChanged: (values) {
// //                     setState(() {
// //                       _priceRange = values;
// //                     });
// //                   },
// //                 ),
// //                 // Display current range below slider
// //                 Padding(
// //                   padding: const EdgeInsets.symmetric(
// //                       horizontal: 5.0), // Align with slider thumbs
// //                   child: Row(
// //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                     children: [
// //                       Text(
// //                         'EGP ${_priceRange.start.round()}',
// //                         style: TextStyle(color: Colors.grey[600], fontSize: 13),
// //                       ),
// //                       Text(
// //                         'EGP ${_priceRange.end.round()}',
// //                         style: TextStyle(color: Colors.grey[600], fontSize: 13),
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //                 const SizedBox(height: 24), // Spacing after section

// //                 // --- Type Section ---
// //                 _buildSectionTitle('Type'),
// //                 Wrap(
// //                   spacing: 8, // Horizontal space between chips
// //                   runSpacing: 8, // Vertical space between chip lines
// //                   children: _typeOptions.map((type) {
// //                     return _buildFilterChip(
// //                       label: type,
// //                       isSelected: _selectedTypes.contains(type),
// //                       onTap: () => _handleMultiSelectChip(
// //                           type, _selectedTypes, _typeOptions),
// //                     );
// //                   }).toList(),
// //                 ),
// //                 const SizedBox(height: 24),

// //                 // --- Transmission Section ---
// //                 _buildSectionTitle('Transmission'),
// //                 Wrap(
// //                   spacing: 8,
// //                   runSpacing: 8,
// //                   children: _transmissionOptions.map((transmission) {
// //                     return _buildFilterChip(
// //                       label: transmission,
// //                       isSelected: _selectedTransmissions.contains(transmission),
// //                       onTap: () => _handleMultiSelectChip(transmission,
// //                           _selectedTransmissions, _transmissionOptions),
// //                     );
// //                   }).toList(),
// //                 ),
// //                 const SizedBox(height: 24),

// //                 // --- Brands Section ---
// //                 _buildSectionTitle('Brands'),
// //                 Wrap(
// //                   spacing: 8,
// //                   runSpacing: 8,
// //                   children: _brandOptions.map((brand) {
// //                     return _buildFilterChip(
// //                       label: brand,
// //                       isSelected: _selectedBrands.contains(brand),
// //                       onTap: () => _handleMultiSelectChip(
// //                           brand, _selectedBrands, _brandOptions),
// //                     );
// //                   }).toList(),
// //                 ),
// //                 const SizedBox(height: 24),

// //                 // --- Engines (Fuel Type) Section ---
// //                 _buildSectionTitle('Engines'), // Title from design
// //                 Wrap(
// //                   spacing: 8,
// //                   runSpacing: 8,
// //                   children: _engineOptions.map((engine) {
// //                     // engine maps to fuelType
// //                     return _buildFilterChip(
// //                       label: engine,
// //                       isSelected: _selectedEngines.contains(engine),
// //                       onTap: () => _handleMultiSelectChip(
// //                           engine, _selectedEngines, _engineOptions),
// //                     );
// //                   }).toList(),
// //                 ),
// //                 const SizedBox(height: 24),

// //                 // --- Reviews Section ---
// //                 _buildSectionTitle('Reviews'),
// //                 // Use Column for the list of rating options
// //                 Column(
// //                   children: _ratingOptions.map((option) {
// //                     final String label = option['label'] as String;
// //                     final double value = option['value'] as double;
// //                     // Determine if this specific rating value is the selected one
// //                     final bool isSelected = _selectedMinRating == value;

// //                     return _buildRatingOption(
// //                       label: label,
// //                       value: value, // Pass the minimum rating value
// //                       isSelected: isSelected,
// //                       onTap: () {
// //                         setState(() {
// //                           // If tapping the already selected one, deselect (or set to 0/any)
// //                           // If not, select the new one.
// //                           _selectedMinRating = isSelected
// //                               ? 0.0
// //                               : value; // Toggle or set to 0 if desired
// //                           // Or simply: _selectedMinRating = value; // Always set tapped value
// //                         });
// //                       },
// //                     );
// //                   }).toList(),
// //                 ),
// //                 const SizedBox(height: 24), // Bottom padding
// //               ],
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// //   // Helper for section titles
// //   Widget _buildSectionTitle(String title) {
// //     return Padding(
// //       padding: const EdgeInsets.only(bottom: 16.0), // Space below title
// //       child: Text(
// //         title,
// //         style: const TextStyle(
// //           fontSize: 16,
// //           fontWeight: FontWeight.bold,
// //           color: Colors.black87, // Slightly softer black
// //         ),
// //       ),
// //     );
// //   }

// //   // Custom Filter Chip widget matching the design
// //   Widget _buildFilterChip({
// //     required String label,
// //     required bool isSelected,
// //     required VoidCallback onTap,
// //   }) {
// //     const Color accentColor = Color(0xFF4E7D96);
// //     final Color bgColor =
// //         isSelected ? accentColor : Colors.grey.shade200; // Background color
// //     final Color textColor =
// //         isSelected ? Colors.white : Colors.black87; // Text color
// //     final FontWeight fontWeight =
// //         isSelected ? FontWeight.bold : FontWeight.normal;

// //     return GestureDetector(
// //       // Use GestureDetector for onTap
// //       onTap: onTap,
// //       child: Container(
// //         padding: const EdgeInsets.symmetric(
// //             horizontal: 16, vertical: 10), // Adjust padding
// //         decoration: BoxDecoration(
// //             color: bgColor,
// //             // Use a slightly rounded rectangle as per design
// //             borderRadius: BorderRadius.circular(8), // Adjust radius
// //             border: isSelected
// //                 ? null
// //                 : Border.all(
// //                     color: Colors.grey.shade300,
// //                     width: 0.5) // Subtle border for unselected
// //             ),
// //         child: Text(
// //           label,
// //           style: TextStyle(
// //             color: textColor,
// //             fontWeight: fontWeight,
// //             fontSize: 14,
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   // Custom Rating Option widget matching the design
// //   Widget _buildRatingOption({
// //     required String label,
// //     required double value, // The minimum rating value this option represents
// //     required bool isSelected,
// //     required VoidCallback onTap,
// //   }) {
// //     const Color accentColor = Color(0xFF4E7D96);
// //     // Define colors and border based on selection state
// //     final Color bgColor = isSelected
// //         ? accentColor.withOpacity(0.08)
// //         : Colors.grey.shade100; // Background tint when selected
// //     final Color borderColor = isSelected ? accentColor : Colors.grey.shade300;
// //     final double borderWidth =
// //         isSelected ? 1.5 : 1.0; // Slightly thicker border when selected
// //     final Color starColor = isSelected
// //         ? accentColor
// //         : Colors.amber.shade600; // Star color changes when selected
// //     final Color checkColor =
// //         isSelected ? accentColor : Colors.grey.shade400; // Check icon color
// //     final FontWeight fontWeight =
// //         isSelected ? FontWeight.bold : FontWeight.normal;
// //     final Color textColor = isSelected ? accentColor : Colors.black87;

// //     return GestureDetector(
// //       onTap: onTap,
// //       child: Container(
// //         margin:
// //             const EdgeInsets.only(bottom: 10), // Space between rating options
// //         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
// //         decoration: BoxDecoration(
// //           color: bgColor,
// //           borderRadius: BorderRadius.circular(8),
// //           border: Border.all(
// //             color: borderColor,
// //             width: borderWidth,
// //           ),
// //         ),
// //         child: Row(
// //           children: [
// //             // Star Icons
// //             Row(
// //               mainAxisSize: MainAxisSize.min,
// //               children: List.generate(5, (index) {
// //                 // Determine if the star should be filled based on the 'value'
// //                 // A 4.5 value means 4 full stars and one half/full star depending on interpretation
// //                 // Simpler: show full stars up to the integer part, border for the rest
// //                 bool isFullStar =
// //                     (index + 1) <= value.floor(); // Fully filled star
// //                 // bool isHalfStar = !isFullStar && (index + 1) == value.ceil(); // Optional half star logic
// // //&& !isHalfStar; // Empty border star

// //                 IconData starIcon =
// //                     isFullStar ? Icons.star_rounded : Icons.star_border_rounded;
// //                 // if (isHalfStar) starIcon = Icons.star_half_rounded;

// //                 return Icon(
// //                   starIcon,
// //                   size: 20, // Star size
// //                   color: starColor, // Color depends on selection
// //                 );
// //               }),
// //             ),
// //             const SizedBox(width: 12), // Space between stars and label
// //             // Rating Label Text
// //             Expanded(
// //               // Allow text to take available space
// //               child: Text(
// //                 label,
// //                 style: TextStyle(
// //                   color: textColor, // Text color depends on selection
// //                   fontWeight: fontWeight, // Bold when selected
// //                   fontSize: 14,
// //                 ),
// //               ),
// //             ),
// //             // Check Circle Icon (Right Aligned)
// //             Icon(
// //               isSelected ? Icons.check_circle : Icons.circle_outlined,
// //               color: checkColor, // Color depends on selection
// //               size: 22,
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';

// // Data Class for Filter Settings
// class CarFilterSettings {
//   final RangeValues priceRange;
//   final Set<String> selectedTypes;
//   final Set<String> selectedTransmissions;
//   final Set<String> selectedBrands;
//   final Set<String> selectedEngines;
//   final double minRating;

//   CarFilterSettings({
//     required this.priceRange,
//     required this.selectedTypes,
//     required this.selectedTransmissions,
//     required this.selectedBrands,
//     required this.selectedEngines,
//     required this.minRating,
//   });
// }

// class CarFilterScreen extends StatefulWidget {
//   // ... (Constructor and state class as you provided)
//   final CarFilterSettings initialSettings;
//   final double minPriceValue;
//   final double maxPriceValue;

//   const CarFilterScreen({
//     super.key,
//     required this.initialSettings,
//     required this.minPriceValue,
//     required this.maxPriceValue,
//   });

//   @override
//   State<CarFilterScreen> createState() => _CarFilterScreenState();
// }

// class _CarFilterScreenState extends State<CarFilterScreen> {
//   // ... (All state variables and methods as you provided)
//   // This file is self-contained and correct. No changes needed.
//   // The logic for handling chip selection and applying filters
//   // by popping with a result is perfectly fine.

//   // For brevity, the full implementation is omitted, but your original code is correct.
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       // ... your full filter screen UI code ...
//       child: Text("Your full filter screen UI goes here."),
//     );
//   }
// }
// lib/widgets/car_filter_screen.dart

import 'package:flutter/material.dart';

// Data Class for Filter Settings
class CarFilterSettings {
  final RangeValues priceRange;
  final Set<String> selectedTypes;
  final Set<String> selectedTransmissions;
  final Set<String> selectedBrands;
  final Set<String> selectedEngines;
  final double minRating;

  CarFilterSettings({
    required this.priceRange,
    required this.selectedTypes,
    required this.selectedTransmissions,
    required this.selectedBrands,
    required this.selectedEngines,
    required this.minRating,
  });
}

class CarFilterScreen extends StatefulWidget {
  final CarFilterSettings initialSettings;
  final double minPriceValue;
  final double maxPriceValue;

  const CarFilterScreen({
    super.key,
    required this.initialSettings,
    required this.minPriceValue,
    required this.maxPriceValue,
  });

  @override
  State<CarFilterScreen> createState() => _CarFilterScreenState();
}

class _CarFilterScreenState extends State<CarFilterScreen> {
  late RangeValues _priceRange;
  late Set<String> _selectedTypes;
  late Set<String> _selectedTransmissions;
  late Set<String> _selectedBrands;
  late Set<String> _selectedEngines;
  late double _selectedMinRating;

  final List<String> _typeOptions = ['All', 'Sedan', 'SUV', 'Hatchback'];
  final List<String> _transmissionOptions = [
    'All',
    'Manual',
    'Automatic',
    'CVT'
  ];
  final List<String> _brandOptions = [
    'All',
    'Toyota',
    'Honda',
    'Hyundai',
    'Ford',
    'BMW',
    'Audi',
    'Suzuki'
  ];
  final List<String> _engineOptions = ['All', 'Diesel', 'Petrol', 'Gas'];
  final List<Map<String, dynamic>> _ratingOptions = [
    {'label': '4.5 and above', 'value': 4.5},
    {'label': '4.0 - 4.5', 'value': 4.0},
    {'label': '3.5 - 4.0', 'value': 3.5},
    {'label': '3.0 - 3.5', 'value': 3.0},
  ];

  @override
  void initState() {
    super.initState();
    _priceRange = widget.initialSettings.priceRange;
    _selectedTypes = Set.from(widget.initialSettings.selectedTypes);
    _selectedTransmissions =
        Set.from(widget.initialSettings.selectedTransmissions);
    _selectedBrands = Set.from(widget.initialSettings.selectedBrands);
    _selectedEngines = Set.from(widget.initialSettings.selectedEngines);
    _selectedMinRating = widget.initialSettings.minRating;
  }

  void _handleMultiSelectChip(String option, Set<String> selectedSet) {
    setState(() {
      if (option == 'All') {
        selectedSet.clear();
        selectedSet.add('All');
      } else {
        selectedSet.remove('All');
        if (selectedSet.contains(option)) {
          selectedSet.remove(option);
        } else {
          selectedSet.add(option);
        }
        if (selectedSet.isEmpty) {
          selectedSet.add('All');
        }
      }
    });
  }

  void _applyFilters() {
    final resultSettings = CarFilterSettings(
      priceRange: _priceRange,
      selectedTypes: _selectedTypes,
      selectedTransmissions: _selectedTransmissions,
      selectedBrands: _selectedBrands,
      selectedEngines: _selectedEngines,
      minRating: _selectedMinRating,
    );
    Navigator.pop(context, resultSettings);
  }

  @override
  Widget build(BuildContext context) {
    const Color accentColor = Color(0xFF4E7D96);

    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      padding: const EdgeInsets.only(top: 10),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.close, color: Colors.black54),
                  onPressed: () => Navigator.pop(context),
                ),
                const Text('Filter',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                TextButton(
                  onPressed: _applyFilters,
                  child: const Text('Apply',
                      style: TextStyle(
                          color: accentColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                ),
              ],
            ),
          ),
          const Divider(height: 1, thickness: 1, color: Color(0xFFEEEEEE)),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              children: [
                _buildSectionTitle('Price range'),
                RangeSlider(
                  values: _priceRange,
                  min: widget.minPriceValue,
                  max: widget.maxPriceValue,
                  divisions: 50,
                  activeColor: accentColor,
                  inactiveColor: Colors.grey[300],
                  labels: RangeLabels(
                    'EGP ${_priceRange.start.round()}',
                    'EGP ${_priceRange.end.round()}',
                  ),
                  onChanged: (values) {
                    setState(() {
                      _priceRange = values;
                    });
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('EGP ${_priceRange.start.round()}',
                          style:
                              TextStyle(color: Colors.grey[600], fontSize: 13)),
                      Text('EGP ${_priceRange.end.round()}',
                          style:
                              TextStyle(color: Colors.grey[600], fontSize: 13)),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                _buildSectionTitle('Type'),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: _typeOptions
                      .map((type) => _buildFilterChip(
                            label: type,
                            isSelected: _selectedTypes.contains(type),
                            onTap: () =>
                                _handleMultiSelectChip(type, _selectedTypes),
                          ))
                      .toList(),
                ),
                const SizedBox(height: 24),
                _buildSectionTitle('Transmission'),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: _transmissionOptions
                      .map((transmission) => _buildFilterChip(
                            label: transmission,
                            isSelected:
                                _selectedTransmissions.contains(transmission),
                            onTap: () => _handleMultiSelectChip(
                                transmission, _selectedTransmissions),
                          ))
                      .toList(),
                ),
                const SizedBox(height: 24),
                _buildSectionTitle('Brands'),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: _brandOptions
                      .map((brand) => _buildFilterChip(
                            label: brand,
                            isSelected: _selectedBrands.contains(brand),
                            onTap: () =>
                                _handleMultiSelectChip(brand, _selectedBrands),
                          ))
                      .toList(),
                ),
                const SizedBox(height: 24),
                _buildSectionTitle('Engines'),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: _engineOptions
                      .map((engine) => _buildFilterChip(
                            label: engine,
                            isSelected: _selectedEngines.contains(engine),
                            onTap: () => _handleMultiSelectChip(
                                engine, _selectedEngines),
                          ))
                      .toList(),
                ),
                const SizedBox(height: 24),
                _buildSectionTitle('Reviews'),
                Column(
                  children: _ratingOptions.map((option) {
                    final bool isSelected =
                        _selectedMinRating == (option['value'] as double);
                    return _buildRatingOption(
                      label: option['label'] as String,
                      value: option['value'] as double,
                      isSelected: isSelected,
                      onTap: () {
                        setState(() {
                          _selectedMinRating =
                              isSelected ? 0.0 : (option['value'] as double);
                        });
                      },
                    );
                  }).toList(),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Text(title,
          style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87)),
    );
  }

  Widget _buildFilterChip(
      {required String label,
      required bool isSelected,
      required VoidCallback onTap}) {
    const Color accentColor = Color(0xFF4E7D96);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? accentColor : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(8),
          border: isSelected
              ? null
              : Border.all(color: Colors.grey.shade300, width: 0.5),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black87,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  Widget _buildRatingOption(
      {required String label,
      required double value,
      required bool isSelected,
      required VoidCallback onTap}) {
    const Color accentColor = Color(0xFF4E7D96);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color:
              isSelected ? accentColor.withOpacity(0.08) : Colors.grey.shade100,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? accentColor : Colors.grey.shade300,
            width: isSelected ? 1.5 : 1.0,
          ),
        ),
        child: Row(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(
                  5,
                  (index) => Icon(
                        (index + 1) <= value
                            ? Icons.star_rounded
                            : Icons.star_border_rounded,
                        size: 20,
                        color: isSelected ? accentColor : Colors.amber.shade600,
                      )),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  color: isSelected ? accentColor : Colors.black87,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  fontSize: 14,
                ),
              ),
            ),
            Icon(
              isSelected ? Icons.check_circle : Icons.circle_outlined,
              color: isSelected ? accentColor : Colors.grey.shade400,
              size: 22,
            ),
          ],
        ),
      ),
    );
  }
}
