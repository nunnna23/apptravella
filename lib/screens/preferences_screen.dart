// // // // import 'package:flutter/material.dart';
// // // // import 'package:travella/screens/home_screen.dart';

// // // // class PreferencesScreen extends StatefulWidget {
// // // //   const PreferencesScreen({super.key});

// // // //   @override
// // // //   State<PreferencesScreen> createState() => _PreferencesScreenState();
// // // // }

// // // // class _PreferencesScreenState extends State<PreferencesScreen> {
// // // //   final List<String> _selectedTravelStyles = [];
// // // //   final List<String> _selectedSeasons = [];
// // // //   final List<String> _selectedTransportation = [];
// // // //   final List<String> _selectedFlightClass = [];
// // // //   final List<String> _selectedTransmission = [];
// // // //   final List<String> _selectedFoodPreferences = [];
// // // //   final List<bool> _ecoFriendlyOptions = [false, false, false];

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Scaffold(
// // // //       backgroundColor: Colors.white,
// // // //       appBar: AppBar(
// // // //         backgroundColor: Colors.white,
// // // //         elevation: 0,
// // // //         title: const Text(
// // // //           'Preferences',
// // // //           style: TextStyle(
// // // //             color: Colors.black,
// // // //             fontSize: 18,
// // // //             fontWeight: FontWeight.w600,
// // // //           ),
// // // //         ),
// // // //         centerTitle: true,
// // // //         actions: [
// // // //           TextButton(
// // // //             onPressed: () {
// // // //               // جمع التفضيلات في userTags
// // // //               final userTags = [
// // // //                 if (_selectedTravelStyles.isNotEmpty)
// // // //                   _selectedTravelStyles.join(', '),
// // // //                 if (_selectedSeasons.isNotEmpty) _selectedSeasons.join(', '),
// // // //                 if (_selectedFoodPreferences.isNotEmpty)
// // // //                   _selectedFoodPreferences.join(', '),
// // // //                 if (_ecoFriendlyOptions.contains(true)) 'Eco-Friendly',
// // // //                 // ignore: unnecessary_null_comparison
// // // //               ].where((tag) => tag != null && tag.isNotEmpty).join(', ');

// // // //               Navigator.pushAndRemoveUntil(
// // // //                 context,
// // // //                 MaterialPageRoute(
// // // //                   builder: (context) => HomeScreen(userTags: userTags),
// // // //                 ),
// // // //                 (route) => false,
// // // //               );
// // // //             },
// // // //             child: const Text(
// // // //               'Apply',
// // // //               style: TextStyle(
// // // //                 color: Color(0xFF4E7D96),
// // // //                 fontSize: 16,
// // // //                 fontWeight: FontWeight.w600,
// // // //               ),
// // // //             ),
// // // //           ),
// // // //         ],
// // // //       ),
// // // //       body: SingleChildScrollView(
// // // //         padding: const EdgeInsets.all(24),
// // // //         child: Column(
// // // //           crossAxisAlignment: CrossAxisAlignment.start,
// // // //           children: [
// // // //             _buildSectionTitle('Travel style'),
// // // //             _buildChipGroup(
// // // //               options: [
// // // //                 'Family Trip',
// // // //                 'Adventure Trip',
// // // //                 'Solo Trip',
// // // //                 'Relaxation',
// // // //                 'Business Trip'
// // // //               ],
// // // //               selectedItems: _selectedTravelStyles,
// // // //               onSelected: (value, isSelected) {
// // // //                 setState(() {
// // // //                   if (isSelected) {
// // // //                     _selectedTravelStyles.add(value);
// // // //                   } else {
// // // //                     _selectedTravelStyles.remove(value);
// // // //                   }
// // // //                 });
// // // //               },
// // // //             ),
// // // //             const SizedBox(height: 24),
// // // //             _buildSectionTitle('Preferred travel season'),
// // // //             _buildChipGroup(
// // // //               options: ['Spring', 'Summer', 'Winter', 'Autumn'],
// // // //               selectedItems: _selectedSeasons,
// // // //               onSelected: (value, isSelected) {
// // // //                 setState(() {
// // // //                   if (isSelected) {
// // // //                     _selectedSeasons.add(value);
// // // //                   } else {
// // // //                     _selectedSeasons.remove(value);
// // // //                   }
// // // //                 });
// // // //               },
// // // //             ),
// // // //             const SizedBox(height: 24),
// // // //             _buildSectionTitle('Eco-Friendly Options'),
// // // //             _buildEcoFriendlyOption(
// // // //               'Highlight airlines offering carbon offset programs',
// // // //               0,
// // // //             ),
// // // //             const SizedBox(height: 12),
// // // //             _buildEcoFriendlyOption(
// // // //               'Show hotels certified with eco-labels',
// // // //               1,
// // // //             ),
// // // //             const SizedBox(height: 12),
// // // //             _buildEcoFriendlyOption(
// // // //               'Prioritize electric or hybrid car rentals',
// // // //               2,
// // // //             ),
// // // //             const SizedBox(height: 24),
// // // //             _buildSectionTitle('Preferred Modes of travel'),
// // // //             _buildChipGroup(
// // // //               options: ['Flights', 'Trains', 'Taxi', 'Car rental'],
// // // //               selectedItems: _selectedTransportation,
// // // //               onSelected: (value, isSelected) {
// // // //                 setState(() {
// // // //                   if (isSelected) {
// // // //                     _selectedTransportation.add(value);
// // // //                   } else {
// // // //                     _selectedTransportation.remove(value);
// // // //                   }
// // // //                 });
// // // //               },
// // // //             ),
// // // //             const SizedBox(height: 24),
// // // //             _buildSectionTitle('Flight class'),
// // // //             _buildChipGroup(
// // // //               options: ['Economy', 'Business', 'First class'],
// // // //               selectedItems: _selectedFlightClass,
// // // //               onSelected: (value, isSelected) {
// // // //                 setState(() {
// // // //                   if (isSelected) {
// // // //                     _selectedFlightClass.add(value);
// // // //                   } else {
// // // //                     _selectedFlightClass.remove(value);
// // // //                   }
// // // //                 });
// // // //               },
// // // //             ),
// // // //             const SizedBox(height: 24),
// // // //             _buildSectionTitle('Car Transmission'),
// // // //             _buildChipGroup(
// // // //               options: ['Manual', 'Automatic', 'CVT'],
// // // //               selectedItems: _selectedTransmission,
// // // //               onSelected: (value, isSelected) {
// // // //                 setState(() {
// // // //                   if (isSelected) {
// // // //                     _selectedTransmission.add(value);
// // // //                   } else {
// // // //                     _selectedTransmission.remove(value);
// // // //                   }
// // // //                 });
// // // //               },
// // // //             ),
// // // //             const SizedBox(height: 24),
// // // //             _buildSectionTitle('Food Preference'),
// // // //             _buildChipGroup(
// // // //               options: ['Vegetarian', 'Vegan', 'Halal', 'No Preference'],
// // // //               selectedItems: _selectedFoodPreferences,
// // // //               onSelected: (value, isSelected) {
// // // //                 setState(() {
// // // //                   if (isSelected) {
// // // //                     _selectedFoodPreferences.add(value);
// // // //                   } else {
// // // //                     _selectedFoodPreferences.remove(value);
// // // //                   }
// // // //                 });
// // // //               },
// // // //             ),
// // // //           ],
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }

// // // //   Widget _buildSectionTitle(String title) {
// // // //     return Padding(
// // // //       padding: const EdgeInsets.only(bottom: 16),
// // // //       child: Text(
// // // //         title,
// // // //         style: const TextStyle(
// // // //           fontSize: 20,
// // // //           fontWeight: FontWeight.w600,
// // // //           color: Colors.black,
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }

// // // //   Widget _buildChipGroup({
// // // //     required List<String> options,
// // // //     required List<String> selectedItems,
// // // //     required Function(String, bool) onSelected,
// // // //   }) {
// // // //     return Wrap(
// // // //       spacing: 8,
// // // //       runSpacing: 8,
// // // //       children: options.map((option) {
// // // //         final isSelected = selectedItems.contains(option);
// // // //         return FilterChip(
// // // //           label: Row(
// // // //             mainAxisSize: MainAxisSize.min,
// // // //             children: [
// // // //               if (!isSelected)
// // // //                 const Padding(
// // // //                   padding: EdgeInsets.only(right: 4),
// // // //                   child: Icon(Icons.add, size: 18, color: Colors.black87),
// // // //                 ),
// // // //               Text(
// // // //                 option,
// // // //                 style: TextStyle(
// // // //                   color: isSelected ? Colors.white : Colors.black87,
// // // //                   fontSize: 14,
// // // //                   fontWeight: FontWeight.w500,
// // // //                 ),
// // // //               ),
// // // //             ],
// // // //           ),
// // // //           selected: isSelected,
// // // //           onSelected: (bool selected) => onSelected(option, selected),
// // // //           backgroundColor: Colors.white,
// // // //           selectedColor: const Color(0xFF4E7D96),
// // // //           checkmarkColor: Colors.white,
// // // //           side: BorderSide(
// // // //             color: isSelected ? const Color(0xFF4E7D96) : Colors.black87,
// // // //           ),
// // // //           shape: RoundedRectangleBorder(
// // // //             borderRadius: BorderRadius.circular(8),
// // // //           ),
// // // //           padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
// // // //           showCheckmark: false,
// // // //         );
// // // //       }).toList(),
// // // //     );
// // // //   }

// // // //   Widget _buildEcoFriendlyOption(String title, int index) {
// // // //     final isSelected = _ecoFriendlyOptions[index];
// // // //     return InkWell(
// // // //       onTap: () {
// // // //         setState(() {
// // // //           _ecoFriendlyOptions[index] = !_ecoFriendlyOptions[index];
// // // //         });
// // // //       },
// // // //       child: Container(
// // // //         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
// // // //         decoration: BoxDecoration(
// // // //           border: Border.all(
// // // //             color: isSelected ? const Color(0xFF4E7D96) : Colors.black87,
// // // //           ),
// // // //           borderRadius: BorderRadius.circular(8),
// // // //           color: isSelected ? const Color(0xFF4E7D96) : Colors.white,
// // // //         ),
// // // //         child: Row(
// // // //           children: [
// // // //             if (!isSelected)
// // // //               const Padding(
// // // //                 padding: EdgeInsets.only(right: 8),
// // // //                 child: Icon(Icons.add, size: 18, color: Colors.black87),
// // // //               ),
// // // //             Expanded(
// // // //               child: Text(
// // // //                 title,
// // // //                 style: TextStyle(
// // // //                   fontSize: 14,
// // // //                   fontWeight: FontWeight.w500,
// // // //                   color: isSelected ? Colors.white : Colors.black87,
// // // //                 ),
// // // //               ),
// // // //             ),
// // // //           ],
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }
// // // // }
// // // import 'package:flutter/material.dart';
// // // import 'package:travella/screens/home_screen.dart';

// // // class PreferencesScreen extends StatefulWidget {
// // //   const PreferencesScreen({super.key});

// // //   @override
// // //   State<PreferencesScreen> createState() => _PreferencesScreenState();
// // // }

// // // class _PreferencesScreenState extends State<PreferencesScreen> {
// // //   final List<String> _selectedTravelStyles = [];
// // //   final List<String> _selectedSeasons = [];
// // //   final List<String> _selectedTransportation = [];
// // //   final List<String> _selectedFlightClass = [];
// // //   final List<String> _selectedTransmission = [];
// // //   final List<String> _selectedFoodPreferences = [];

// // //   // Eco-Friendly options as Yes/No
// // //   Map<String, bool> _ecoFriendlyOptions = {
// // //     'Gym': false,
// // //     'Spa': false,
// // //   };

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       backgroundColor: Colors.white,
// // //       appBar: AppBar(
// // //         backgroundColor: Colors.white,
// // //         elevation: 0,
// // //         title: const Text(
// // //           'Preferences',
// // //           style: TextStyle(
// // //             color: Colors.black,
// // //             fontSize: 18,
// // //             fontWeight: FontWeight.w600,
// // //           ),
// // //         ),
// // //         centerTitle: true,
// // //         actions: [
// // //           TextButton(
// // //             onPressed: () {
// // //               // جمع التفضيلات في userTags
// // //               final userTags = [
// // //                 if (_selectedTravelStyles.isNotEmpty)
// // //                   _selectedTravelStyles.join(', '),
// // //                 if (_selectedSeasons.isNotEmpty) _selectedSeasons.join(', '),
// // //                 if (_ecoFriendlyOptions['Gym'] == true) 'Gym',
// // //                 if (_ecoFriendlyOptions['Spa'] == true) 'Spa',
// // //                 if (_selectedTransportation.isNotEmpty)
// // //                   _selectedTransportation.join(', '),
// // //                 if (_selectedFlightClass.isNotEmpty)
// // //                   _selectedFlightClass.join(', '),
// // //                 if (_selectedTransmission.isNotEmpty)
// // //                   _selectedTransmission.join(', '),
// // //                 if (_selectedFoodPreferences.isNotEmpty)
// // //                   _selectedFoodPreferences.join(', '),
// // //                 // ignore: unnecessary_null_comparison
// // //               ].where((tag) => tag != null && tag.isNotEmpty).join(', ');

// // //               Navigator.pushAndRemoveUntil(
// // //                 context,
// // //                 MaterialPageRoute(
// // //                   builder: (context) => HomeScreen(userTags: userTags),
// // //                 ),
// // //                 (route) => false,
// // //               );
// // //             },
// // //             child: const Text(
// // //               'Apply',
// // //               style: TextStyle(
// // //                 color: Color(0xFF4E7D96),
// // //                 fontSize: 16,
// // //                 fontWeight: FontWeight.w600,
// // //               ),
// // //             ),
// // //           ),
// // //         ],
// // //       ),
// // //       body: SingleChildScrollView(
// // //         padding: const EdgeInsets.all(24),
// // //         child: Column(
// // //           crossAxisAlignment: CrossAxisAlignment.start,
// // //           children: [
// // //             _buildSectionTitle('Travel Style'),
// // //             _buildChipGroup(
// // //               options: [
// // //                 'Luxury',
// // //                 'Business',
// // //                 'Romantic',
// // //                 'Adventure',
// // //                 'Budget'
// // //               ],
// // //               selectedItems: _selectedTravelStyles,
// // //               onSelected: (value, isSelected) {
// // //                 setState(() {
// // //                   if (isSelected) {
// // //                     _selectedTravelStyles.add(value);
// // //                   } else {
// // //                     _selectedTravelStyles.remove(value);
// // //                   }
// // //                 });
// // //               },
// // //             ),
// // //             const SizedBox(height: 24),
// // //             _buildSectionTitle('Preferred Travel Season'),
// // //             _buildChipGroup(
// // //               options: ['Summer', 'Winter', 'Autumn', 'Spring'],
// // //               selectedItems: _selectedSeasons,
// // //               onSelected: (value, isSelected) {
// // //                 setState(() {
// // //                   if (isSelected) {
// // //                     _selectedSeasons.add(value);
// // //                   } else {
// // //                     _selectedSeasons.remove(value);
// // //                   }
// // //                 });
// // //               },
// // //             ),
// // //             const SizedBox(height: 24),
// // //             _buildSectionTitle('Eco-Friendly Options'),
// // //             _buildEcoFriendlyOption('Gym', 'Gym'),
// // //             const SizedBox(height: 12),
// // //             _buildEcoFriendlyOption('Spa', 'Spa'),
// // //             const SizedBox(height: 24),
// // //             _buildSectionTitle('Preferred Modes of Travel'),
// // //             _buildChipGroup(
// // //               options: ['Flights', 'Trains', 'Taxi', 'Car rental'],
// // //               selectedItems: _selectedTransportation,
// // //               onSelected: (value, isSelected) {
// // //                 setState(() {
// // //                   if (isSelected) {
// // //                     _selectedTransportation.add(value);
// // //                   } else {
// // //                     _selectedTransportation.remove(value);
// // //                   }
// // //                 });
// // //               },
// // //             ),
// // //             const SizedBox(height: 24),
// // //             _buildSectionTitle('Flight Class'),
// // //             _buildChipGroup(
// // //               options: ['Economy', 'Business', 'First class'],
// // //               selectedItems: _selectedFlightClass,
// // //               onSelected: (value, isSelected) {
// // //                 setState(() {
// // //                   if (isSelected) {
// // //                     _selectedFlightClass.add(value);
// // //                   } else {
// // //                     _selectedFlightClass.remove(value);
// // //                   }
// // //                 });
// // //               },
// // //             ),
// // //             const SizedBox(height: 24),
// // //             _buildSectionTitle('Car Transmission'),
// // //             _buildChipGroup(
// // //               options: ['Manual', 'Automatic', 'CVT'],
// // //               selectedItems: _selectedTransmission,
// // //               onSelected: (value, isSelected) {
// // //                 setState(() {
// // //                   if (isSelected) {
// // //                     _selectedTransmission.add(value);
// // //                   } else {
// // //                     _selectedTransmission.remove(value);
// // //                   }
// // //                 });
// // //               },
// // //             ),
// // //             const SizedBox(height: 24),
// // //             _buildSectionTitle('Food Preference'),
// // //             _buildChipGroup(
// // //               options: ['Vegetarian', 'Vegan', 'Halal', 'No Preference'],
// // //               selectedItems: _selectedFoodPreferences,
// // //               onSelected: (value, isSelected) {
// // //                 setState(() {
// // //                   if (isSelected) {
// // //                     _selectedFoodPreferences.add(value);
// // //                   } else {
// // //                     _selectedFoodPreferences.remove(value);
// // //                   }
// // //                 });
// // //               },
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }

// // //   Widget _buildSectionTitle(String title) {
// // //     return Padding(
// // //       padding: const EdgeInsets.only(bottom: 16),
// // //       child: Text(
// // //         title,
// // //         style: const TextStyle(
// // //           fontSize: 20,
// // //           fontWeight: FontWeight.w600,
// // //           color: Colors.black,
// // //         ),
// // //       ),
// // //     );
// // //   }

// // //   Widget _buildChipGroup({
// // //     required List<String> options,
// // //     required List<String> selectedItems,
// // //     required Function(String, bool) onSelected,
// // //   }) {
// // //     return Wrap(
// // //       spacing: 8,
// // //       runSpacing: 8,
// // //       children: options.map((option) {
// // //         final isSelected = selectedItems.contains(option);
// // //         return FilterChip(
// // //           label: Row(
// // //             mainAxisSize: MainAxisSize.min,
// // //             children: [
// // //               if (!isSelected)
// // //                 const Padding(
// // //                   padding: EdgeInsets.only(right: 4),
// // //                   child: Icon(Icons.add, size: 18, color: Colors.black87),
// // //                 ),
// // //               Text(
// // //                 option,
// // //                 style: TextStyle(
// // //                   color: isSelected ? Colors.white : Colors.black87,
// // //                   fontSize: 14,
// // //                   fontWeight: FontWeight.w500,
// // //                 ),
// // //               ),
// // //             ],
// // //           ),
// // //           selected: isSelected,
// // //           onSelected: (bool selected) => onSelected(option, selected),
// // //           backgroundColor: Colors.white,
// // //           selectedColor: const Color(0xFF4E7D96),
// // //           checkmarkColor: Colors.white,
// // //           side: BorderSide(
// // //             color: isSelected ? const Color(0xFF4E7D96) : Colors.black87,
// // //           ),
// // //           shape: RoundedRectangleBorder(
// // //             borderRadius: BorderRadius.circular(8),
// // //           ),
// // //           padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
// // //           showCheckmark: false,
// // //         );
// // //       }).toList(),
// // //     );
// // //   }

// // //   Widget _buildEcoFriendlyOption(String title, String key) {
// // //     final isSelected = _ecoFriendlyOptions[key] ?? false;
// // //     return InkWell(
// // //       onTap: () {
// // //         setState(() {
// // //           _ecoFriendlyOptions[key] = !(_ecoFriendlyOptions[key] ?? false);
// // //         });
// // //       },
// // //       child: Container(
// // //         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
// // //         decoration: BoxDecoration(
// // //           border: Border.all(
// // //             color: isSelected ? const Color(0xFF4E7D96) : Colors.black87,
// // //           ),
// // //           borderRadius: BorderRadius.circular(8),
// // //           color: isSelected ? const Color(0xFF4E7D96) : Colors.white,
// // //         ),
// // //         child: Row(
// // //           children: [
// // //             if (!isSelected)
// // //               const Padding(
// // //                 padding: EdgeInsets.only(right: 8),
// // //                 child: Icon(Icons.add, size: 18, color: Colors.black87),
// // //               ),
// // //             Expanded(
// // //               child: Text(
// // //                 title,
// // //                 style: TextStyle(
// // //                   fontSize: 14,
// // //                   fontWeight: FontWeight.w500,
// // //                   color: isSelected ? Colors.white : Colors.black87,
// // //                 ),
// // //               ),
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }
// // import 'package:flutter/material.dart';
// // import 'package:shared_preferences/shared_preferences.dart';
// // import 'home_screen.dart'; // Assuming you have this screen

// // class PreferencesScreen extends StatefulWidget {
// //   const PreferencesScreen({super.key});

// //   @override
// //   State<PreferencesScreen> createState() => _PreferencesScreenState();
// // }

// // class _PreferencesScreenState extends State<PreferencesScreen> {
// //   final List<String> _selectedTravelStyles = [];
// //   final List<String> _selectedSeasons = [];
// //   final List<String> _selectedFoodPreferences = [];
// //   bool _isEcoFriendly = false;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _loadPreferences();
// //   }

// //   Future<void> _loadPreferences() async {
// //     final prefs = await SharedPreferences.getInstance();
// //     final tagsString = prefs.getString('user_tags') ?? '';
// //     final tags = tagsString.split(', ').where((s) => s.isNotEmpty).toList();

// //     setState(() {
// //       _selectedTravelStyles.addAll(tags.where((tag) => [
// //             'family trip', 'adventure trip', 'solo trip',
// //             'relaxation', 'business trip', 'luxury', 'romantic'
// //           ].contains(tag)));
// //       _selectedSeasons.addAll(tags.where((tag) =>
// //           ['spring', 'summer', 'winter', 'autumn'].contains(tag)));
// //       _selectedFoodPreferences.addAll(tags.where((tag) =>
// //           ['vegetarian', 'vegan', 'halal', 'seafood'].contains(tag)));
// //       _isEcoFriendly = tags.contains('eco-friendly');
// //     });
// //   }

// //   Future<void> _applyPreferences() async {
// //     final prefs = await SharedPreferences.getInstance();
// //     List<String> allPreferences = [];

// //     allPreferences.addAll(_selectedTravelStyles);
// //     allPreferences.addAll(_selectedSeasons);
// //     allPreferences.addAll(_selectedFoodPreferences);
// //     if (_isEcoFriendly) {
// //       allPreferences.add('eco-friendly');
// //     }

// //     // Convert to lowercase and join into a single string
// //     String userTags = allPreferences.map((e) => e.toLowerCase()).join(', ');
// //     await prefs.setString('user_tags', userTags);

// //     ScaffoldMessenger.of(context).showSnackBar(
// //       const SnackBar(content: Text('Preferences saved!')),
// //     );

// //     Navigator.pushAndRemoveUntil(
// //       context,
// //       MaterialPageRoute(
// //         builder: (context) => const HomeScreen(),
// //       ),
// //       (route) => false,
// //     );
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.white,
// //       appBar: AppBar(
// //         backgroundColor: Colors.white,
// //         elevation: 0,
// //         title: const Text(
// //           'Hotel Preferences',
// //           style: TextStyle(
// //             color: Colors.black,
// //             fontSize: 18,
// //             fontWeight: FontWeight.w600,
// //           ),
// //         ),
// //         centerTitle: true,
// //         actions: [
// //           TextButton(
// //             onPressed: _applyPreferences,
// //             child: const Text(
// //               'Apply',
// //               style: TextStyle(
// //                 color: Color(0xFF4E7D96),
// //                 fontSize: 16,
// //                 fontWeight: FontWeight.w600,
// //               ),
// //             ),
// //           ),
// //         ],
// //       ),
// //       body: SingleChildScrollView(
// //         padding: const EdgeInsets.all(24),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             _buildSectionTitle('Travel style'),
// //             _buildChipGroup(
// //               options: [
// //                 'Family Trip', 'Adventure Trip', 'Solo Trip', 'Relaxation',
// //                 'Business Trip', 'Luxury', 'Romantic'
// //               ],
// //               selectedItems: _selectedTravelStyles,
// //               onSelected: (value, isSelected) {
// //                 setState(() {
// //                   if (isSelected) {
// //                     _selectedTravelStyles.add(value);
// //                   } else {
// //                     _selectedTravelStyles.remove(value);
// //                   }
// //                 });
// //               },
// //             ),
// //             const SizedBox(height: 24),
// //             _buildSectionTitle('Preferred travel season'),
// //             _buildChipGroup(
// //               options: ['Spring', 'Summer', 'Winter', 'Autumn'],
// //               selectedItems: _selectedSeasons,
// //               onSelected: (value, isSelected) {
// //                 setState(() {
// //                   if (isSelected) {
// //                     _selectedSeasons.add(value);
// //                   } else {
// //                     _selectedSeasons.remove(value);
// //                   }
// //                 });
// //               },
// //             ),
// //             const SizedBox(height: 24),
// //             _buildSectionTitle('Food Preference'),
// //             _buildChipGroup(
// //               options: ['Vegetarian', 'Vegan', 'Halal', 'Seafood'],
// //               selectedItems: _selectedFoodPreferences,
// //               onSelected: (value, isSelected) {
// //                 setState(() {
// //                   if (isSelected) {
// //                     _selectedFoodPreferences.add(value);
// //                   } else {
// //                     _selectedFoodPreferences.remove(value);
// //                   }
// //                 });
// //               },
// //             ),
// //             const SizedBox(height: 24),
// //             _buildSectionTitle('Other Options'),
// //             Wrap(
// //               spacing: 8,
// //               children: [
// //                 FilterChip(
// //                   label: const Text('Eco-Friendly'),
// //                   selected: _isEcoFriendly,
// //                   onSelected: (selected) {
// //                     setState(() {
// //                       _isEcoFriendly = selected;
// //                     });
// //                   },
// //                   // ... styling for the eco-friendly chip
// //                    backgroundColor: Colors.white,
// //                    selectedColor: const Color(0xFF4E7D96),
// //                    labelStyle: TextStyle(
// //                      color: _isEcoFriendly ? Colors.white : Colors.black87,
// //                    ),
// //                    side: BorderSide(
// //                      color: _isEcoFriendly ? const Color(0xFF4E7D96) : Colors.black87,
// //                    ),
// //                 ),
// //               ],
// //             )
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   Widget _buildSectionTitle(String title) {
// //     return Padding(
// //       padding: const EdgeInsets.only(bottom: 16),
// //       child: Text(
// //         title,
// //         style: const TextStyle(
// //           fontSize: 20,
// //           fontWeight: FontWeight.w600,
// //           color: Colors.black,
// //         ),
// //       ),
// //     );
// //   }

// //   Widget _buildChipGroup({
// //     required List<String> options,
// //     required List<String> selectedItems,
// //     required Function(String, bool) onSelected,
// //   }) {
// //     return Wrap(
// //       spacing: 8,
// //       runSpacing: 8,
// //       children: options.map((option) {
// //         final isSelected = selectedItems.contains(option);
// //         return FilterChip(
// //           label: Text(
// //             option,
// //             style: TextStyle(
// //               color: isSelected ? Colors.white : Colors.black87,
// //             ),
// //           ),
// //           selected: isSelected,
// //           onSelected: (bool selected) => onSelected(option, selected),
// //           backgroundColor: Colors.white,
// //           selectedColor: const Color(0xFF4E7D96),
// //           side: BorderSide(
// //             color: isSelected ? const Color(0xFF4E7D96) : Colors.black87,
// //           ),
// //         );
// //       }).toList(),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'home_screen.dart'; // تأكد من وجود هذا الملف

// class PreferencesScreen extends StatefulWidget {
//   const PreferencesScreen({super.key});

//   @override
//   State<PreferencesScreen> createState() => _PreferencesScreenState();
// }

// class _PreferencesScreenState extends State<PreferencesScreen> {
//   final List<String> _selectedTravelStyles = [];
//   final List<String> _selectedSeasons = [];
//   final List<String> _selectedFoodPreferences = [];
//   bool _isEcoFriendly = false;

//   @override
//   void initState() {
//     super.initState();
//     _loadPreferences();
//   }

//   // هذه الدالة تقرأ التفضيلات المحفوظة لتعرضها للمستخدم عند فتح الشاشة
//   Future<void> _loadPreferences() async {
//     final prefs = await SharedPreferences.getInstance();
//     // --- تم حذف user_tags من هنا لأننا لم نعد نمررها ---
//     // سيتم قراءتها مباشرة من SharedPreferences في شاشة Favorites
//     final tagsString = prefs.getString('user_preferences') ?? '';
//     final tags = tagsString.split(',').where((s) => s.isNotEmpty).toList();

//     setState(() {
//       // بناءً على ما هو محفوظ، نحدد الخيارات المختارة
//       _selectedTravelStyles.addAll(tags.where((tag) => [
//             'family trip',
//             'adventure trip',
//             'solo trip',
//             'relaxation',
//             'business trip',
//             'luxury',
//             'romantic'
//           ].contains(tag)));
//       _selectedSeasons.addAll(tags.where(
//           (tag) => ['spring', 'summer', 'winter', 'autumn'].contains(tag)));
//       _selectedFoodPreferences.addAll(tags.where(
//           (tag) => ['vegetarian', 'vegan', 'halal', 'seafood'].contains(tag)));
//       _isEcoFriendly = tags.contains('eco-friendly');
//     });
//   }

//   // هذه الدالة تحفظ التفضيلات عند الضغط على "Apply"
//   Future<void> _applyPreferences() async {
//     final prefs = await SharedPreferences.getInstance();
//     List<String> allPreferences = [];

//     allPreferences.addAll(_selectedTravelStyles);
//     allPreferences.addAll(_selectedSeasons);
//     allPreferences.addAll(_selectedFoodPreferences);
//     if (_isEcoFriendly) {
//       allPreferences.add('eco-friendly');
//     }

//     // نحولها إلى نص واحد ونحفظها
//     String preferencesToSave =
//         allPreferences.map((e) => e.toLowerCase()).join(',');
//     await prefs.setString('user_preferences', preferencesToSave);

//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(content: Text('Preferences saved!')),
//     );

//     // نعود إلى الشاشة الرئيسية
//     Navigator.pushAndRemoveUntil(
//       context,
//       MaterialPageRoute(
//         builder: (context) => const HomeScreen(),
//       ),
//       (route) => false,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     // واجهة المستخدم تبقى كما هي بدون تغيير
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         title: const Text(
//           'Hotel Preferences',
//           style: TextStyle(
//             color: Colors.black,
//             fontSize: 18,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         centerTitle: true,
//         actions: [
//           TextButton(
//             onPressed: _applyPreferences,
//             child: const Text(
//               'Apply',
//               style: TextStyle(
//                 color: Color(0xFF4E7D96),
//                 fontSize: 16,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(24),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             _buildSectionTitle('Travel style'),
//             _buildChipGroup(
//               options: [
//                 'Family Trip',
//                 'Adventure Trip',
//                 'Solo Trip',
//                 'Relaxation',
//                 'Business Trip',
//                 'Luxury',
//                 'Romantic'
//               ],
//               selectedItems: _selectedTravelStyles,
//               onSelected: (value, isSelected) {
//                 setState(() {
//                   if (isSelected) {
//                     _selectedTravelStyles.add(value);
//                   } else {
//                     _selectedTravelStyles.remove(value);
//                   }
//                 });
//               },
//             ),
//             const SizedBox(height: 24),
//             _buildSectionTitle('Preferred travel season'),
//             _buildChipGroup(
//               options: ['Spring', 'Summer', 'Winter', 'Autumn'],
//               selectedItems: _selectedSeasons,
//               onSelected: (value, isSelected) {
//                 setState(() {
//                   if (isSelected) {
//                     _selectedSeasons.add(value);
//                   } else {
//                     _selectedSeasons.remove(value);
//                   }
//                 });
//               },
//             ),
//             const SizedBox(height: 24),
//             _buildSectionTitle('Food Preference'),
//             _buildChipGroup(
//               options: ['Vegetarian', 'Vegan', 'Halal', 'Seafood'],
//               selectedItems: _selectedFoodPreferences,
//               onSelected: (value, isSelected) {
//                 setState(() {
//                   if (isSelected) {
//                     _selectedFoodPreferences.add(value);
//                   } else {
//                     _selectedFoodPreferences.remove(value);
//                   }
//                 });
//               },
//             ),
//             const SizedBox(height: 24),
//             _buildSectionTitle('Other Options'),
//             Wrap(
//               spacing: 8,
//               children: [
//                 FilterChip(
//                   label: const Text('Eco-Friendly'),
//                   selected: _isEcoFriendly,
//                   onSelected: (selected) {
//                     setState(() {
//                       _isEcoFriendly = selected;
//                     });
//                   },
//                   backgroundColor: Colors.white,
//                   selectedColor: const Color(0xFF4E7D96),
//                   labelStyle: TextStyle(
//                     color: _isEcoFriendly ? Colors.white : Colors.black87,
//                   ),
//                   side: BorderSide(
//                     color: _isEcoFriendly
//                         ? const Color(0xFF4E7D96)
//                         : Colors.black87,
//                   ),
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   // دوال الـ build تبقى كما هي
//   Widget _buildSectionTitle(String title) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 16),
//       child: Text(
//         title,
//         style: const TextStyle(
//           fontSize: 20,
//           fontWeight: FontWeight.w600,
//           color: Colors.black,
//         ),
//       ),
//     );
//   }

//   Widget _buildChipGroup({
//     required List<String> options,
//     required List<String> selectedItems,
//     required Function(String, bool) onSelected,
//   }) {
//     return Wrap(
//       spacing: 8,
//       runSpacing: 8,
//       children: options.map((option) {
//         final isSelected = selectedItems.contains(option);
//         return FilterChip(
//           label: Text(
//             option,
//             style: TextStyle(
//               color: isSelected ? Colors.white : Colors.black87,
//             ),
//           ),
//           selected: isSelected,
//           onSelected: (bool selected) => onSelected(option, selected),
//           backgroundColor: Colors.white,
//           selectedColor: const Color(0xFF4E7D96),
//           side: BorderSide(
//             color: isSelected ? const Color(0xFF4E7D96) : Colors.black87,
//           ),
//         );
//       }).toList(),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_screen.dart'; // تأكد من وجود هذا الملف

class PreferencesScreen extends StatefulWidget {
  const PreferencesScreen({super.key});

  @override
  State<PreferencesScreen> createState() => _PreferencesScreenState();
}

class _PreferencesScreenState extends State<PreferencesScreen> {
  final List<String> _selectedTravelStyles = [];
  final List<String> _selectedSeasons = [];
  final List<String> _selectedFoodPreferences = [];
  bool _isEcoFriendly = false;
  bool _hasGym = false;
  bool _hasSpa = false;

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  // هذه الدالة تقرأ التفضيلات المحفوظة لتعرضها للمستخدم عند فتح الشاشة
  Future<void> _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final tagsString = prefs.getString('user_preferences') ?? '';
    final tags = tagsString.split(',').where((s) => s.isNotEmpty).toList();

    setState(() {
      // تحديد الخيارات المختارة بناءً على التفضيلات المحفوظة
      _selectedTravelStyles.addAll(tags.where((tag) => [
            'luxury',
            'business',
            'romantic',
            'adventure',
            'budget'
          ].contains(tag.toLowerCase())));
      _selectedSeasons.addAll(tags.where((tag) => [
            'spring',
            'summer',
            'winter',
            'autumn'
          ].contains(tag.toLowerCase())));
      _selectedFoodPreferences.addAll(tags.where((tag) => [
            'vegetarian',
            'vegan',
            'halal',
            'seafood'
          ].contains(tag.toLowerCase())));
      _isEcoFriendly = tags.contains('eco-friendly');
      _hasGym = tags.contains('gym');
      _hasSpa = tags.contains('spa');
    });
  }

  // هذه الدالة تحفظ التفضيلات عند الضغط على "Apply"
  Future<void> _applyPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> allPreferences = [];

    allPreferences.addAll(_selectedTravelStyles);
    allPreferences.addAll(_selectedSeasons);
    allPreferences.addAll(_selectedFoodPreferences);
    if (_isEcoFriendly) allPreferences.add('eco-friendly');
    if (_hasGym) allPreferences.add('gym');
    if (_hasSpa) allPreferences.add('spa');

    // نحولها إلى نص واحد ونحفظها
    String preferencesToSave =
        allPreferences.map((e) => e.toLowerCase()).join(',');
    await prefs.setString('user_preferences', preferencesToSave);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Preferences saved!')),
    );

    // نعود إلى الشاشة الرئيسية
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Hotel Preferences',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: _applyPreferences,
            child: const Text(
              'Apply',
              style: TextStyle(
                color: Color(0xFF4E7D96),
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle('Travel Style'),
            _buildChipGroup(
              options: [
                'Luxury',
                'Business',
                'Romantic',
                'Adventure',
                'Budget'
              ],
              selectedItems: _selectedTravelStyles,
              onSelected: (value, isSelected) {
                setState(() {
                  if (isSelected) {
                    _selectedTravelStyles.add(value.toLowerCase());
                  } else {
                    _selectedTravelStyles.remove(value.toLowerCase());
                  }
                });
              },
            ),
            const SizedBox(height: 24),
            _buildSectionTitle('Preferred Travel Season'),
            _buildChipGroup(
              options: ['Spring', 'Summer', 'Winter', 'Autumn'],
              selectedItems: _selectedSeasons,
              onSelected: (value, isSelected) {
                setState(() {
                  if (isSelected) {
                    _selectedSeasons.add(value.toLowerCase());
                  } else {
                    _selectedSeasons.remove(value.toLowerCase());
                  }
                });
              },
            ),
            const SizedBox(height: 24),
            _buildSectionTitle('Food Preference'),
            _buildChipGroup(
              options: ['Vegetarian', 'Vegan', 'Halal', 'Seafood'],
              selectedItems: _selectedFoodPreferences,
              onSelected: (value, isSelected) {
                setState(() {
                  if (isSelected) {
                    _selectedFoodPreferences.add(value.toLowerCase());
                  } else {
                    _selectedFoodPreferences.remove(value.toLowerCase());
                  }
                });
              },
            ),
            const SizedBox(height: 24),
            _buildSectionTitle('Hotel Features'),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                ChoiceChip(
                  label: const Text('Eco-Friendly'),
                  selected: _isEcoFriendly,
                  onSelected: (selected) {
                    setState(() {
                      _isEcoFriendly = selected;
                    });
                  },
                  backgroundColor: Colors.white,
                  selectedColor: const Color(0xFF4E7D96),
                  labelStyle: TextStyle(
                    color: _isEcoFriendly ? Colors.white : Colors.black87,
                  ),
                  side: BorderSide(
                    color: _isEcoFriendly
                        ? const Color(0xFF4E7D96)
                        : Colors.black87,
                  ),
                ),
                ChoiceChip(
                  label: const Text('Gym'),
                  selected: _hasGym,
                  onSelected: (selected) {
                    setState(() {
                      _hasGym = selected;
                    });
                  },
                  backgroundColor: Colors.white,
                  selectedColor: const Color(0xFF4E7D96),
                  labelStyle:
                      TextStyle(color: _hasGym ? Colors.white : Colors.black87),
                  side: BorderSide(
                    color: _hasGym ? const Color(0xFF4E7D96) : Colors.black87,
                  ),
                ),
                ChoiceChip(
                  label: const Text('Spa'),
                  selected: _hasSpa,
                  onSelected: (selected) {
                    setState(() {
                      _hasSpa = selected;
                    });
                  },
                  backgroundColor: Colors.white,
                  selectedColor: const Color(0xFF4E7D96),
                  labelStyle:
                      TextStyle(color: _hasSpa ? Colors.white : Colors.black87),
                  side: BorderSide(
                    color: _hasSpa ? const Color(0xFF4E7D96) : Colors.black87,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // دوال الـ build
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget _buildChipGroup({
    required List<String> options,
    required List<String> selectedItems,
    required Function(String, bool) onSelected,
  }) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: options.map((option) {
        final isSelected = selectedItems.contains(option.toLowerCase());
        return FilterChip(
          label: Text(
            option,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black87,
            ),
          ),
          selected: isSelected,
          onSelected: (bool selected) => onSelected(option, selected),
          backgroundColor: Colors.white,
          selectedColor: const Color(0xFF4E7D96),
          side: BorderSide(
            color: isSelected ? const Color(0xFF4E7D96) : Colors.black87,
          ),
        );
      }).toList(),
    );
  }
}
