// // // import 'package:flutter/material.dart';
// // // import 'package:intl/intl.dart';
// // // import 'package:flutter/services.dart';
// // // import 'package:travella/services/api/ai_dio_client.dart';
// // // import 'package:travella/services/prediction_service.dart';
// // // import 'flight_prediction_input_screen.dart';
// // // import 'car_rental_prediction_input_screen.dart';

// // // class HotelPredictionInputScreen extends StatefulWidget {
// // //   final VoidCallback onComplete;
// // //   final bool isLastStep;
// // //   final Set<PredictionService> selectedServices;

// // //   const HotelPredictionInputScreen({
// // //     super.key,
// // //     required this.onComplete,
// // //     required this.isLastStep,
// // //     required this.selectedServices,
// // //   });

// // //   @override
// // //   State<HotelPredictionInputScreen> createState() =>
// // //       _HotelPredictionInputScreenState();
// // // }

// // // class _HotelPredictionInputScreenState extends State<HotelPredictionInputScreen>
// // //     with SingleTickerProviderStateMixin {
// // //   final _destinationController = TextEditingController();
// // //   DateTimeRange? _selectedDateRange;
// // //   int _adults = 1;
// // //   int _children = 0;
// // //   bool _showGuestOptions = false;
// // //   final _roomsController = TextEditingController(text: '1');
// // //   String? _selectedCategory;
// // //   String? _selectedRoomType;
// // //   bool _isPredicting = false;
// // //   late TabController _tabController;

// // //   final List<String> _categories = ['Budget', 'Standard', 'Luxury'];
// // //   final List<String> _roomTypes = ['Standard', 'Suite'];

// // //   final List<Map<String, dynamic>> _tabs = [
// // //     {
// // //       'service': PredictionService.flights,
// // //       'icon': Icons.flight_takeoff,
// // //       'text': 'Flights'
// // //     },
// // //     {
// // //       'service': PredictionService.hotels,
// // //       'icon': Icons.hotel,
// // //       'text': 'Hotels'
// // //     },
// // //     {
// // //       'service': PredictionService.carRental,
// // //       'icon': Icons.directions_car,
// // //       'text': 'Car Rental'
// // //     },
// // //   ];

// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     final filteredTabs = _tabs
// // //         .where((tab) => widget.selectedServices.contains(tab['service']))
// // //         .toList();
// // //     final initialIndex = filteredTabs
// // //         .indexWhere((tab) => tab['service'] == PredictionService.hotels);
// // //     _tabController = TabController(
// // //         length: filteredTabs.length,
// // //         vsync: this,
// // //         initialIndex: initialIndex >= 0 ? initialIndex : 0);
// // //   }

// // //   @override
// // //   void dispose() {
// // //     _destinationController.dispose();
// // //     _roomsController.dispose();
// // //     _tabController.dispose();
// // //     super.dispose();
// // //   }

// // //   Future<void> _handlePrediction() async {
// // //     if (_destinationController.text.isEmpty ||
// // //         _selectedDateRange == null ||
// // //         _selectedCategory == null ||
// // //         _selectedRoomType == null ||
// // //         _roomsController.text.isEmpty) {
// // //       ScaffoldMessenger.of(context).showSnackBar(
// // //           const SnackBar(content: Text('Please fill all required fields.')));
// // //       return;
// // //     }
// // //     setState(() {
// // //       _isPredicting = true;
// // //     });

// // //     try {
// // //       final result = await AiDioClient().predictHotelPrice(
// // //         city: _destinationController.text.trim(),
// // //         adults: _adults,
// // //         children: _children,
// // //         rooms: int.tryParse(_roomsController.text) ?? 1,
// // //         category: _selectedCategory!,
// // //         roomType: _selectedRoomType!,
// // //         checkinDate: DateFormat('yyyy-MM-dd').format(_selectedDateRange!.start),
// // //         checkoutDate: DateFormat('yyyy-MM-dd').format(_selectedDateRange!.end),
// // //       );
// // //       if (result.containsKey('predicted_price')) {
// // //         predictionResults[PredictionService.hotels] = result['predicted_price'];
// // //       }
// // //       widget.onComplete();
// // //     } catch (e) {
// // //       ScaffoldMessenger.of(context)
// // //           .showSnackBar(SnackBar(content: Text('Prediction failed: $e')));
// // //     } finally {
// // //       if (mounted)
// // //         setState(() {
// // //           _isPredicting = false;
// // //         });
// // //     }
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     final themeColor = Theme.of(context).primaryColor;
// // //     String dateText = _selectedDateRange == null
// // //         ? 'Enter Date of Check-in and Check-out'
// // //         : '${DateFormat('M/d/yyyy').format(_selectedDateRange!.start)} - ${DateFormat('M/d/yyyy').format(_selectedDateRange!.end)}';
// // //     String guestText =
// // //         '$_adults Adult${_adults > 1 ? 's' : ''}${_children > 0 ? ', $_children Child${_children > 1 ? 'ren' : ''}' : ''}';
// // //     final filteredTabs = _tabs
// // //         .where((tab) => widget.selectedServices.contains(tab['service']))
// // //         .toList();

// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: const Text('Hotels'),
// // //         leading: IconButton(
// // //             icon: const Icon(Icons.arrow_back),
// // //             onPressed: () => Navigator.pop(context)),
// // //         bottom: TabBar(
// // //           controller: _tabController,
// // //           indicatorColor: themeColor,
// // //           labelColor: themeColor,
// // //           unselectedLabelColor: Colors.grey[600],
// // //           tabs: filteredTabs
// // //               .map((tab) => Tab(icon: Icon(tab['icon']), text: tab['text']))
// // //               .toList(),
// // //           onTap: (index) {
// // //             final selectedService = filteredTabs[index]['service'];
// // //             if (selectedService != PredictionService.hotels) {
// // //               Widget nextScreen;
// // //               switch (selectedService) {
// // //                 case PredictionService.flights:
// // //                   nextScreen = FlightPredictionInputScreen(
// // //                       onComplete: widget.onComplete,
// // //                       isLastStep: widget.isLastStep,
// // //                       selectedServices: widget.selectedServices);
// // //                   break;
// // //                 case PredictionService.carRental:
// // //                   nextScreen = CarRentalPredictionInputScreen(
// // //                       onComplete: widget.onComplete,
// // //                       isLastStep: widget.isLastStep,
// // //                       selectedServices: widget.selectedServices);
// // //                   break;
// // //                 default:
// // //                   return;
// // //               }
// // //               Navigator.pushReplacement(
// // //                   context, MaterialPageRoute(builder: (context) => nextScreen));
// // //             }
// // //           },
// // //         ),
// // //       ),
// // //       body: SingleChildScrollView(
// // //         padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 100.0),
// // //         child: Column(
// // //           crossAxisAlignment: CrossAxisAlignment.start,
// // //           children: [
// // //             _buildInputField(
// // //                 controller: _destinationController,
// // //                 hintText: 'Enter Destination',
// // //                 icon: Icons.search),
// // //             const SizedBox(height: 15),
// // //             _buildTappableField(
// // //                 displayText: dateText,
// // //                 icon: Icons.calendar_today_outlined,
// // //                 onTap: () => _selectDateRange(context),
// // //                 isHint: _selectedDateRange == null),
// // //             const SizedBox(height: 15),
// // //             _buildTappableField(
// // //                 displayText:
// // //                     _showGuestOptions ? 'Adjust guests below' : guestText,
// // //                 icon: Icons.person_outline,
// // //                 onTap: _toggleGuestOptions,
// // //                 isHint: !_showGuestOptions && _adults == 1 && _children == 0,
// // //                 trailingIcon: _showGuestOptions
// // //                     ? Icons.keyboard_arrow_up
// // //                     : Icons.keyboard_arrow_down),
// // //             if (_showGuestOptions) _buildGuestSelectionRow(),
// // //             const SizedBox(height: 15),
// // //             _buildSelectableInputField(
// // //                 controller: _roomsController,
// // //                 hintText: 'Number Of Rooms',
// // //                 icon: Icons.king_bed_outlined,
// // //                 onSelectIconTap: _selectNumberOfRooms,
// // //                 keyboardType: TextInputType.number,
// // //                 inputFormatters: [FilteringTextInputFormatter.digitsOnly]),
// // //             const SizedBox(height: 15),
// // //             _buildTappableField(
// // //                 displayText:
// // //                     _selectedCategory ?? 'Category (Budget/Standard/Luxury)',
// // //                 icon: Icons.category_outlined,
// // //                 onTap: _selectCategory,
// // //                 isHint: _selectedCategory == null,
// // //                 trailingIcon: Icons.arrow_drop_down),
// // //             const SizedBox(height: 15),
// // //             _buildTappableField(
// // //                 displayText: _selectedRoomType ?? 'Room Type (Standard/Suite)',
// // //                 icon: Icons.room_preferences_outlined,
// // //                 onTap: _selectRoomType,
// // //                 isHint: _selectedRoomType == null,
// // //                 trailingIcon: Icons.arrow_drop_down),
// // //             const SizedBox(height: 40),
// // //           ],
// // //         ),
// // //       ),
// // //       floatingActionButton: Padding(
// // //         padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
// // //         child: SizedBox(
// // //           width: double.infinity,
// // //           child: ElevatedButton(
// // //             onPressed: _isPredicting ? null : _handlePrediction,
// // //             child: _isPredicting
// // //                 ? const SizedBox(
// // //                     height: 20,
// // //                     width: 20,
// // //                     child: CircularProgressIndicator(
// // //                         color: Colors.white, strokeWidth: 3))
// // //                 : Text(widget.isLastStep ? 'Predict' : 'Continue'),
// // //           ),
// // //         ),
// // //       ),
// // //     );
// // //   }

// // //   Future<void> _selectDateRange(BuildContext context) async {
// // //     final DateTimeRange? picked = await showDateRangePicker(
// // //         context: context,
// // //         firstDate: DateTime.now(),
// // //         lastDate: DateTime.now().add(const Duration(days: 365 * 2)));
// // //     if (picked != null && picked != _selectedDateRange)
// // //       setState(() => _selectedDateRange = picked);
// // //   }

// // //   void _toggleGuestOptions() =>
// // //       setState(() => _showGuestOptions = !_showGuestOptions);

// // //   void _selectNumberOfRooms() {
// // //     showDialog(
// // //         context: context,
// // //         builder: (context) => AlertDialog(
// // //               title: const Text("Select Rooms"),
// // //               content: DropdownButton<int>(
// // //                 value: int.tryParse(_roomsController.text) ?? 1,
// // //                 items: List.generate(10, (index) => index + 1)
// // //                     .map((n) => DropdownMenuItem(
// // //                         value: n, child: Text('$n Room${n > 1 ? 's' : ''}')))
// // //                     .toList(),
// // //                 onChanged: (value) {
// // //                   if (value != null)
// // //                     setState(() => _roomsController.text = value.toString());
// // //                   Navigator.pop(context);
// // //                 },
// // //               ),
// // //             ));
// // //   }

// // //   void _selectCategory() {
// // //     showModalBottomSheet(
// // //         context: context,
// // //         builder: (context) => Column(
// // //             mainAxisSize: MainAxisSize.min,
// // //             children: _categories
// // //                 .map((category) => ListTile(
// // //                       title: Text(category),
// // //                       onTap: () {
// // //                         setState(() => _selectedCategory = category);
// // //                         Navigator.pop(context);
// // //                       },
// // //                     ))
// // //                 .toList()));
// // //   }

// // //   void _selectRoomType() {
// // //     showModalBottomSheet(
// // //         context: context,
// // //         builder: (context) => Column(
// // //             mainAxisSize: MainAxisSize.min,
// // //             children: _roomTypes
// // //                 .map((type) => ListTile(
// // //                       title: Text(type),
// // //                       onTap: () {
// // //                         setState(() => _selectedRoomType = type);
// // //                         Navigator.pop(context);
// // //                       },
// // //                     ))
// // //                 .toList()));
// // //   }

// // //   Widget _buildGuestSelectionRow() {
// // //     return Container(
// // //       padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
// // //       margin: const EdgeInsets.only(top: 8.0),
// // //       decoration: BoxDecoration(
// // //           color: Colors.white,
// // //           borderRadius: BorderRadius.circular(10),
// // //           boxShadow: [
// // //             BoxShadow(
// // //                 color: Colors.grey.withOpacity(0.1),
// // //                 blurRadius: 4,
// // //                 offset: const Offset(0, 2))
// // //           ]),
// // //       child: Column(children: [
// // //         _buildInlineCounter(
// // //             "Adult", _adults, (val) => setState(() => _adults = val), 1),
// // //         const Divider(height: 15),
// // //         _buildInlineCounter(
// // //             "Child", _children, (val) => setState(() => _children = val), 0),
// // //       ]),
// // //     );
// // //   }

// // //   Widget _buildInlineCounter(
// // //       String label, int value, ValueChanged<int> onChanged, int minValue) {
// // //     return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
// // //       Text(label,
// // //           style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
// // //       Row(children: [
// // //         OutlinedButton(
// // //             onPressed: value > minValue ? () => onChanged(value - 1) : null,
// // //             style: OutlinedButton.styleFrom(
// // //                 shape: const CircleBorder(),
// // //                 padding: const EdgeInsets.all(8),
// // //                 side: BorderSide(color: Colors.grey.shade400)),
// // //             child: const Icon(Icons.remove, size: 18)),
// // //         SizedBox(
// // //             width: 40,
// // //             child: Text('$value',
// // //                 textAlign: TextAlign.center,
// // //                 style: const TextStyle(
// // //                     fontSize: 16, fontWeight: FontWeight.bold))),
// // //         OutlinedButton(
// // //             onPressed: () => onChanged(value + 1),
// // //             style: OutlinedButton.styleFrom(
// // //                 shape: const CircleBorder(),
// // //                 padding: const EdgeInsets.all(8),
// // //                 side: BorderSide(color: Colors.grey.shade400)),
// // //             child: const Icon(Icons.add, size: 18)),
// // //       ])
// // //     ]);
// // //   }

// // //   Widget _buildInputField(
// // //       {required TextEditingController controller,
// // //       required String hintText,
// // //       required IconData icon}) {
// // //     return TextField(
// // //       controller: controller,
// // //       decoration: InputDecoration(
// // //         prefixIcon: Icon(icon, color: Colors.grey[700]),
// // //         hintText: hintText,
// // //         hintStyle: TextStyle(color: Colors.grey[600]),
// // //         border: OutlineInputBorder(
// // //             borderRadius: BorderRadius.circular(10),
// // //             borderSide: BorderSide.none),
// // //         fillColor: Colors.grey[200],
// // //         filled: true,
// // //       ),
// // //     );
// // //   }

// // //   Widget _buildTappableField(
// // //       {required String displayText,
// // //       required IconData icon,
// // //       required VoidCallback onTap,
// // //       IconData? trailingIcon,
// // //       bool isHint = false}) {
// // //     return InkWell(
// // //         onTap: onTap,
// // //         child: Container(
// // //           decoration: BoxDecoration(
// // //               color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
// // //           padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
// // //           child: Row(children: [
// // //             Icon(icon, color: Colors.grey[700]),
// // //             const SizedBox(width: 12),
// // //             Expanded(
// // //                 child: Text(displayText,
// // //                     style: TextStyle(
// // //                         fontSize: 16,
// // //                         color: isHint ? Colors.grey[600] : Colors.black87),
// // //                     overflow: TextOverflow.ellipsis)),
// // //             if (trailingIcon != null)
// // //               Icon(trailingIcon, color: Colors.grey[600], size: 24),
// // //           ]),
// // //         ));
// // //   }

// // //   Widget _buildSelectableInputField(
// // //       {required TextEditingController controller,
// // //       required String hintText,
// // //       required IconData icon,
// // //       required VoidCallback onSelectIconTap,
// // //       TextInputType keyboardType = TextInputType.text,
// // //       List<TextInputFormatter>? inputFormatters}) {
// // //     return TextField(
// // //       controller: controller,
// // //       keyboardType: keyboardType,
// // //       inputFormatters: inputFormatters,
// // //       decoration: InputDecoration(
// // //         prefixIcon: Icon(icon, color: Colors.grey[700]),
// // //         hintText: hintText,
// // //         hintStyle: TextStyle(color: Colors.grey[600]),
// // //         suffixIcon: IconButton(
// // //             icon: const Icon(Icons.arrow_drop_down_circle_outlined),
// // //             color: Colors.grey[600],
// // //             onPressed: onSelectIconTap),
// // //         border: OutlineInputBorder(
// // //             borderRadius: BorderRadius.circular(10),
// // //             borderSide: BorderSide.none),
// // //         fillColor: Colors.grey[200],
// // //         filled: true,
// // //       ),
// // //     );
// // //   }
// // // }
// // import 'package:flutter/material.dart';
// // import 'package:intl/intl.dart';
// // import 'package:flutter/services.dart';
// // import 'package:travella/services/api/ai_dio_client.dart';
// // import 'package:travella/services/prediction_service.dart';
// // import 'flight_prediction_input_screen.dart';
// // import 'car_rental_prediction_input_screen.dart';

// // class HotelPredictionInputScreen extends StatefulWidget {
// //   final VoidCallback onComplete;
// //   final bool isLastStep;
// //   final Set<PredictionService> selectedServices;

// //   const HotelPredictionInputScreen({
// //     super.key,
// //     required this.onComplete,
// //     required this.isLastStep,
// //     required this.selectedServices,
// //   });

// //   @override
// //   State<HotelPredictionInputScreen> createState() =>
// //       _HotelPredictionInputScreenState();
// // }

// // class _HotelPredictionInputScreenState extends State<HotelPredictionInputScreen>
// //     with SingleTickerProviderStateMixin {
// //   final _destinationController = TextEditingController();
// //   DateTime? _selectedDate; // تاريخ واحد فقط
// //   int _adults = 1;
// //   int _children = 0;
// //   bool _showGuestOptions = false;
// //   final _roomsController = TextEditingController(text: '1');
// //   String? _selectedCategory;
// //   String? _selectedRoomType;
// //   bool _isPredicting = false;
// //   late TabController _tabController;

// //   final List<String> _categories = ['Budget', 'Standard', 'Luxury'];
// //   final List<String> _roomTypes = ['Standard', 'Suite'];

// //   final List<Map<String, dynamic>> _tabs = [
// //     {
// //       'service': PredictionService.flights,
// //       'icon': Icons.flight_takeoff,
// //       'text': 'Flights'
// //     },
// //     {
// //       'service': PredictionService.hotels,
// //       'icon': Icons.hotel,
// //       'text': 'Hotels'
// //     },
// //     {
// //       'service': PredictionService.carRental,
// //       'icon': Icons.directions_car,
// //       'text': 'Car Rental'
// //     },
// //   ];

// //   @override
// //   void initState() {
// //     super.initState();
// //     final filteredTabs = _tabs
// //         .where((tab) => widget.selectedServices.contains(tab['service']))
// //         .toList();
// //     final initialIndex = filteredTabs
// //         .indexWhere((tab) => tab['service'] == PredictionService.hotels);
// //     _tabController = TabController(
// //         length: filteredTabs.length,
// //         vsync: this,
// //         initialIndex: initialIndex >= 0 ? initialIndex : 0);
// //   }

// //   @override
// //   void dispose() {
// //     _destinationController.dispose();
// //     _roomsController.dispose();
// //     _tabController.dispose();
// //     super.dispose();
// //   }

// //   Future<void> _handlePrediction() async {
// //     if (_destinationController.text.isEmpty ||
// //         _selectedDate == null ||
// //         _selectedCategory == null ||
// //         _selectedRoomType == null ||
// //         _roomsController.text.isEmpty) {
// //       ScaffoldMessenger.of(context).showSnackBar(
// //           const SnackBar(content: Text('Please fill all required fields.')));
// //       return;
// //     }
// //     setState(() {
// //       _isPredicting = true;
// //     });

// //     try {
// //       final result = await AiDioClient().predictHotelPrice(
// //         city: _destinationController.text.trim(),
// //         adults: _adults,
// //         children: _children,
// //         rooms: int.tryParse(_roomsController.text) ?? 1,
// //         category: _selectedCategory!,
// //         roomType: _selectedRoomType!,
// //         checkinDate: DateFormat('yyyy-MM-dd').format(_selectedDate!),
// //         checkoutDate: '', // تاريخ واحد فقط
// //         // إزالة checkoutDate لأنه لم يعد مطلوبًا
// //       );
// //       if (result.containsKey('predicted_price')) {
// //         predictionResults[PredictionService.hotels] = result['predicted_price'];
// //       }
// //       widget.onComplete();
// //     } catch (e) {
// //       ScaffoldMessenger.of(context)
// //           .showSnackBar(SnackBar(content: Text('Prediction failed: $e')));
// //     } finally {
// //       if (mounted)
// //         setState(() {
// //           _isPredicting = false;
// //         });
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     final themeColor = Theme.of(context).primaryColor;
// //     String dateText = _selectedDate == null
// //         ? 'Enter Date of Stay'
// //         : DateFormat('M/d/yyyy').format(_selectedDate!);
// //     String guestText =
// //         '$_adults Adult${_adults > 1 ? 's' : ''}${_children > 0 ? ', $_children Child${_children > 1 ? 'ren' : ''}' : ''}';
// //     final filteredTabs = _tabs
// //         .where((tab) => widget.selectedServices.contains(tab['service']))
// //         .toList();

// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('Hotels'),
// //         leading: IconButton(
// //             icon: const Icon(Icons.arrow_back),
// //             onPressed: () => Navigator.pop(context)),
// //         bottom: TabBar(
// //           controller: _tabController,
// //           indicatorColor: themeColor,
// //           labelColor: themeColor,
// //           unselectedLabelColor: Colors.grey[600],
// //           tabs: filteredTabs
// //               .map((tab) => Tab(icon: Icon(tab['icon']), text: tab['text']))
// //               .toList(),
// //           onTap: (index) {
// //             final selectedService = filteredTabs[index]['service'];
// //             if (selectedService != PredictionService.hotels) {
// //               Widget nextScreen;
// //               switch (selectedService) {
// //                 case PredictionService.flights:
// //                   nextScreen = FlightPredictionInputScreen(
// //                       onComplete: widget.onComplete,
// //                       isLastStep: widget.isLastStep,
// //                       selectedServices: widget.selectedServices);
// //                   break;
// //                 case PredictionService.carRental:
// //                   nextScreen = CarRentalPredictionInputScreen(
// //                       onComplete: widget.onComplete,
// //                       isLastStep: widget.isLastStep,
// //                       selectedServices: widget.selectedServices);
// //                   break;
// //                 default:
// //                   return;
// //               }
// //               Navigator.pushReplacement(
// //                   context, MaterialPageRoute(builder: (context) => nextScreen));
// //             }
// //           },
// //         ),
// //       ),
// //       body: SingleChildScrollView(
// //         padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 100.0),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             _buildInputField(
// //                 controller: _destinationController,
// //                 hintText: 'Enter Destination',
// //                 icon: Icons.search),
// //             const SizedBox(height: 15),
// //             _buildTappableField(
// //                 displayText: dateText,
// //                 icon: Icons.calendar_today_outlined,
// //                 onTap: () => _selectDateRange(context),
// //                 isHint: _selectedDate == null),
// //             const SizedBox(height: 15),
// //             _buildTappableField(
// //                 displayText:
// //                     _showGuestOptions ? 'Adjust guests below' : guestText,
// //                 icon: Icons.person_outline,
// //                 onTap: _toggleGuestOptions,
// //                 isHint: !_showGuestOptions && _adults == 1 && _children == 0,
// //                 trailingIcon: _showGuestOptions
// //                     ? Icons.keyboard_arrow_up
// //                     : Icons.keyboard_arrow_down),
// //             if (_showGuestOptions) _buildGuestSelectionRow(),
// //             const SizedBox(height: 15),
// //             _buildSelectableInputField(
// //                 controller: _roomsController,
// //                 hintText: 'Number Of Rooms',
// //                 icon: Icons.king_bed_outlined,
// //                 onSelectIconTap: _selectNumberOfRooms,
// //                 keyboardType: TextInputType.number,
// //                 inputFormatters: [FilteringTextInputFormatter.digitsOnly]),
// //             const SizedBox(height: 15),
// //             _buildTappableField(
// //                 displayText:
// //                     _selectedCategory ?? 'Category (Budget/Standard/Luxury)',
// //                 icon: Icons.category_outlined,
// //                 onTap: _selectCategory,
// //                 isHint: _selectedCategory == null,
// //                 trailingIcon: Icons.arrow_drop_down),
// //             const SizedBox(height: 15),
// //             _buildTappableField(
// //                 displayText: _selectedRoomType ?? 'Room Type (Standard/Suite)',
// //                 icon: Icons.room_preferences_outlined,
// //                 onTap: _selectRoomType,
// //                 isHint: _selectedRoomType == null,
// //                 trailingIcon: Icons.arrow_drop_down),
// //             const SizedBox(height: 40),
// //           ],
// //         ),
// //       ),
// //       floatingActionButton: Padding(
// //         padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
// //         child: SizedBox(
// //           width: double.infinity,
// //           child: ElevatedButton(
// //             onPressed: _isPredicting ? null : _handlePrediction,
// //             child: _isPredicting
// //                 ? const SizedBox(
// //                     height: 20,
// //                     width: 20,
// //                     child: CircularProgressIndicator(
// //                         color: Colors.white, strokeWidth: 3))
// //                 : Text(widget.isLastStep ? 'Predict' : 'Continue'),
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   Future<void> _selectDateRange(BuildContext context) async {
// //     final DateTime? picked = await showDatePicker(
// //         context: context,
// //         firstDate: DateTime.now(),
// //         lastDate: DateTime.now().add(const Duration(days: 365 * 2)));
// //     if (picked != null && picked != _selectedDate)
// //       setState(() => _selectedDate = picked);
// //   }

// //   void _toggleGuestOptions() =>
// //       setState(() => _showGuestOptions = !_showGuestOptions);

// //   void _selectNumberOfRooms() {
// //     showDialog(
// //         context: context,
// //         builder: (context) => AlertDialog(
// //               title: const Text("Select Rooms"),
// //               content: DropdownButton<int>(
// //                 value: int.tryParse(_roomsController.text) ?? 1,
// //                 items: List.generate(10, (index) => index + 1)
// //                     .map((n) => DropdownMenuItem(
// //                         value: n, child: Text('$n Room${n > 1 ? 's' : ''}')))
// //                     .toList(),
// //                 onChanged: (value) {
// //                   if (value != null)
// //                     setState(() => _roomsController.text = value.toString());
// //                   Navigator.pop(context);
// //                 },
// //               ),
// //             ));
// //   }

// //   void _selectCategory() {
// //     showModalBottomSheet(
// //         context: context,
// //         builder: (context) => Column(
// //             mainAxisSize: MainAxisSize.min,
// //             children: _categories
// //                 .map((category) => ListTile(
// //                       title: Text(category),
// //                       onTap: () {
// //                         setState(() => _selectedCategory = category);
// //                         Navigator.pop(context);
// //                       },
// //                     ))
// //                 .toList()));
// //   }

// //   void _selectRoomType() {
// //     showModalBottomSheet(
// //         context: context,
// //         builder: (context) => Column(
// //             mainAxisSize: MainAxisSize.min,
// //             children: _roomTypes
// //                 .map((type) => ListTile(
// //                       title: Text(type),
// //                       onTap: () {
// //                         setState(() => _selectedRoomType = type);
// //                         Navigator.pop(context);
// //                       },
// //                     ))
// //                 .toList()));
// //   }

// //   Widget _buildGuestSelectionRow() {
// //     return Container(
// //       padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
// //       margin: const EdgeInsets.only(top: 8.0),
// //       decoration: BoxDecoration(
// //           color: Colors.white,
// //           borderRadius: BorderRadius.circular(10),
// //           boxShadow: [
// //             BoxShadow(
// //                 color: Colors.grey.withOpacity(0.1),
// //                 blurRadius: 4,
// //                 offset: const Offset(0, 2))
// //           ]),
// //       child: Column(children: [
// //         _buildInlineCounter(
// //             "Adult", _adults, (val) => setState(() => _adults = val), 1),
// //         const Divider(height: 15),
// //         _buildInlineCounter(
// //             "Child", _children, (val) => setState(() => _children = val), 0),
// //       ]),
// //     );
// //   }

// //   Widget _buildInlineCounter(
// //       String label, int value, ValueChanged<int> onChanged, int minValue) {
// //     return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
// //       Text(label,
// //           style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
// //       Row(children: [
// //         OutlinedButton(
// //             onPressed: value > minValue ? () => onChanged(value - 1) : null,
// //             style: OutlinedButton.styleFrom(
// //                 shape: const CircleBorder(),
// //                 padding: const EdgeInsets.all(8),
// //                 side: BorderSide(color: Colors.grey.shade400)),
// //             child: const Icon(Icons.remove, size: 18)),
// //         SizedBox(
// //             width: 40,
// //             child: Text('$value',
// //                 textAlign: TextAlign.center,
// //                 style: const TextStyle(
// //                     fontSize: 16, fontWeight: FontWeight.bold))),
// //         OutlinedButton(
// //             onPressed: () => onChanged(value + 1),
// //             style: OutlinedButton.styleFrom(
// //                 shape: const CircleBorder(),
// //                 padding: const EdgeInsets.all(8),
// //                 side: BorderSide(color: Colors.grey.shade400)),
// //             child: const Icon(Icons.add, size: 18)),
// //       ])
// //     ]);
// //   }

// //   Widget _buildInputField(
// //       {required TextEditingController controller,
// //       required String hintText,
// //       required IconData icon}) {
// //     return TextField(
// //       controller: controller,
// //       decoration: InputDecoration(
// //         prefixIcon: Icon(icon, color: Colors.grey[700]),
// //         hintText: hintText,
// //         hintStyle: TextStyle(color: Colors.grey[600]),
// //         border: OutlineInputBorder(
// //             borderRadius: BorderRadius.circular(10),
// //             borderSide: BorderSide.none),
// //         fillColor: Colors.grey[200],
// //         filled: true,
// //       ),
// //     );
// //   }

// //   Widget _buildTappableField(
// //       {required String displayText,
// //       required IconData icon,
// //       required VoidCallback onTap,
// //       IconData? trailingIcon,
// //       bool isHint = false}) {
// //     return InkWell(
// //         onTap: onTap,
// //         child: Container(
// //           decoration: BoxDecoration(
// //               color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
// //           padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
// //           child: Row(children: [
// //             Icon(icon, color: Colors.grey[700]),
// //             const SizedBox(width: 12),
// //             Expanded(
// //                 child: Text(displayText,
// //                     style: TextStyle(
// //                         fontSize: 16,
// //                         color: isHint ? Colors.grey[600] : Colors.black87),
// //                     overflow: TextOverflow.ellipsis)),
// //             if (trailingIcon != null)
// //               Icon(trailingIcon, color: Colors.grey[600], size: 24),
// //           ]),
// //         ));
// //   }

// //   Widget _buildSelectableInputField(
// //       {required TextEditingController controller,
// //       required String hintText,
// //       required IconData icon,
// //       required VoidCallback onSelectIconTap,
// //       TextInputType keyboardType = TextInputType.text,
// //       List<TextInputFormatter>? inputFormatters}) {
// //     return TextField(
// //       controller: controller,
// //       keyboardType: keyboardType,
// //       inputFormatters: inputFormatters,
// //       decoration: InputDecoration(
// //         prefixIcon: Icon(icon, color: Colors.grey[700]),
// //         hintText: hintText,
// //         hintStyle: TextStyle(color: Colors.grey[600]),
// //         suffixIcon: IconButton(
// //             icon: const Icon(Icons.arrow_drop_down_circle_outlined),
// //             color: Colors.grey[600],
// //             onPressed: onSelectIconTap),
// //         border: OutlineInputBorder(
// //             borderRadius: BorderRadius.circular(10),
// //             borderSide: BorderSide.none),
// //         fillColor: Colors.grey[200],
// //         filled: true,
// //       ),
// //     );
// //   }
// // // }
// // import 'package:flutter/material.dart';
// // import 'package:intl/intl.dart';
// // import 'package:flutter/services.dart';
// // import 'package:travella/services/api/ai_dio_client.dart';
// // import 'package:travella/services/prediction_service.dart';
// // import 'flight_prediction_input_screen.dart';
// // import 'car_rental_prediction_input_screen.dart';

// // // هذا مثال لتعريف متغير النتائج، يجب أن يكون موجودًا في مكان مشترك في تطبيقك
// // // Map<PredictionService, String> predictionResults = {};

// // class HotelPredictionInputScreen extends StatefulWidget {
// //   final VoidCallback onComplete;
// //   final bool isLastStep;
// //   final Set<PredictionService> selectedServices;

// //   const HotelPredictionInputScreen({
// //     super.key,
// //     required this.onComplete,
// //     required this.isLastStep,
// //     required this.selectedServices,
// //   });

// //   @override
// //   State<HotelPredictionInputScreen> createState() =>
// //       _HotelPredictionInputScreenState();
// // }

// // class _HotelPredictionInputScreenState extends State<HotelPredictionInputScreen>
// //     with SingleTickerProviderStateMixin {
// //   final _destinationController = TextEditingController();
// //   DateTime? _selectedDate; // تاريخ واحد فقط
// //   int _adults = 1;
// //   int _children = 0;
// //   bool _showGuestOptions = false;
// //   final _roomsController = TextEditingController(text: '1');
// //   String? _selectedCategory;
// //   String? _selectedRoomType;
// //   bool _isPredicting = false;
// //   late TabController _tabController;

// //   final List<String> _categories = ['Budget', 'Standard', 'Luxury'];
// //   final List<String> _roomTypes = ['Standard', 'Suite'];

// //   final List<Map<String, dynamic>> _tabs = [
// //     {
// //       'service': PredictionService.flights,
// //       'icon': Icons.flight_takeoff,
// //       'text': 'Flights'
// //     },
// //     {
// //       'service': PredictionService.hotels,
// //       'icon': Icons.hotel,
// //       'text': 'Hotels'
// //     },
// //     {
// //       'service': PredictionService.carRental,
// //       'icon': Icons.directions_car,
// //       'text': 'Car Rental'
// //     },
// //   ];

// //   @override
// //   void initState() {
// //     super.initState();
// //     final filteredTabs = _tabs
// //         .where((tab) => widget.selectedServices.contains(tab['service']))
// //         .toList();
// //     final initialIndex = filteredTabs
// //         .indexWhere((tab) => tab['service'] == PredictionService.hotels);
// //     _tabController = TabController(
// //         length: filteredTabs.length,
// //         vsync: this,
// //         initialIndex: initialIndex >= 0 ? initialIndex : 0);
// //   }

// //   @override
// //   void dispose() {
// //     _destinationController.dispose();
// //     _roomsController.dispose();
// //     _tabController.dispose();
// //     super.dispose();
// //   }

// //   Future<void> _handlePrediction() async {
// //     FocusScope.of(context).unfocus(); // إخفاء الكيبورد

// //     if (_destinationController.text.isEmpty ||
// //         _selectedDate == null ||
// //         _selectedCategory == null ||
// //         _selectedRoomType == null ||
// //         _roomsController.text.isEmpty) {
// //       ScaffoldMessenger.of(context).showSnackBar(
// //           const SnackBar(content: Text('Please fill all required fields.')));
// //       return;
// //     }
// //     setState(() {
// //       _isPredicting = true;
// //     });

// //     try {
// //       final result = await AiDioClient().predictHotelPrice(
// //         city: _destinationController.text.trim(),
// //         adults: _adults,
// //         children: _children,
// //         rooms: int.tryParse(_roomsController.text) ?? 1,
// //         category: _selectedCategory!,
// //         roomType: _selectedRoomType!,
// //         checkinDate: DateFormat('yyyy-MM-dd').format(_selectedDate!),
// //         checkoutDate: '', // تاريخ واحد فقط
// //       );
// //       if (result.containsKey('predicted_price')) {
// //         // predictionResults[PredictionService.hotels] = result['predicted_price'];
// //       }
// //       widget.onComplete();
// //     } catch (e) {
// //       ScaffoldMessenger.of(context)
// //           .showSnackBar(SnackBar(content: Text('Prediction failed: $e')));
// //     } finally {
// //       if (mounted) {
// //         setState(() {
// //           _isPredicting = false;
// //         });
// //       }
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     final themeColor = Theme.of(context).primaryColor;
// //     String dateText = _selectedDate == null
// //         ? 'Enter Date of Stay'
// //         : DateFormat('M/d/yyyy').format(_selectedDate!);
// //     String guestText =
// //         '$_adults Adult${_adults > 1 ? 's' : ''}${_children > 0 ? ', $_children Child${_children > 1 ? 'ren' : ''}' : ''}';
// //     final filteredTabs = _tabs
// //         .where((tab) => widget.selectedServices.contains(tab['service']))
// //         .toList();

// //     return Scaffold(
// //       // ======================= التعديلات هنا =======================
// //       resizeToAvoidBottomInset: false,
// //       // ==========================================================
// //       appBar: AppBar(
// //         title: const Text('Hotels'),
// //         leading: IconButton(
// //             icon: const Icon(Icons.arrow_back),
// //             onPressed: () => Navigator.pop(context)),
// //         bottom: TabBar(
// //           controller: _tabController,
// //           indicatorColor: themeColor,
// //           labelColor: themeColor,
// //           unselectedLabelColor: Colors.grey[600],
// //           tabs: filteredTabs
// //               .map((tab) => Tab(icon: Icon(tab['icon']), text: tab['text']))
// //               .toList(),
// //           onTap: (index) {
// //             final selectedService = filteredTabs[index]['service'];
// //             if (selectedService != PredictionService.hotels) {
// //               Widget nextScreen;
// //               switch (selectedService) {
// //                 case PredictionService.flights:
// //                   nextScreen = FlightPredictionInputScreen(
// //                       onComplete: widget.onComplete,
// //                       isLastStep: widget.isLastStep,
// //                       selectedServices: widget.selectedServices);
// //                   break;
// //                 case PredictionService.carRental:
// //                   nextScreen = CarRentalPredictionInputScreen(
// //                       onComplete: widget.onComplete,
// //                       isLastStep: widget.isLastStep,
// //                       selectedServices: widget.selectedServices);
// //                   break;
// //                 default:
// //                   return;
// //               }
// //               Navigator.pushReplacement(
// //                   context, MaterialPageRoute(builder: (context) => nextScreen));
// //             }
// //           },
// //         ),
// //       ),
// //       body: SingleChildScrollView(
// //         padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 100.0),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             _buildInputField(
// //                 controller: _destinationController,
// //                 hintText: 'Enter Destination',
// //                 icon: Icons.search),
// //             const SizedBox(height: 15),
// //             _buildTappableField(
// //                 displayText: dateText,
// //                 icon: Icons.calendar_today_outlined,
// //                 onTap: () => _selectDate(context),
// //                 isHint: _selectedDate == null),
// //             const SizedBox(height: 15),
// //             _buildTappableField(
// //                 displayText:
// //                     _showGuestOptions ? 'Adjust guests below' : guestText,
// //                 icon: Icons.person_outline,
// //                 onTap: _toggleGuestOptions,
// //                 isHint: !_showGuestOptions && _adults == 1 && _children == 0,
// //                 trailingIcon: _showGuestOptions
// //                     ? Icons.keyboard_arrow_up
// //                     : Icons.keyboard_arrow_down),
// //             if (_showGuestOptions) _buildGuestSelectionRow(),
// //             const SizedBox(height: 15),
// //             _buildSelectableInputField(
// //                 controller: _roomsController,
// //                 hintText: 'Number Of Rooms',
// //                 icon: Icons.king_bed_outlined,
// //                 onSelectIconTap: _selectNumberOfRooms,
// //                 keyboardType: TextInputType.number,
// //                 inputFormatters: [FilteringTextInputFormatter.digitsOnly]),
// //             const SizedBox(height: 15),
// //             _buildTappableField(
// //                 displayText:
// //                     _selectedCategory ?? 'Category (Budget/Standard/Luxury)',
// //                 icon: Icons.category_outlined,
// //                 onTap: _selectCategory,
// //                 isHint: _selectedCategory == null,
// //                 trailingIcon: Icons.arrow_drop_down),
// //             const SizedBox(height: 15),
// //             _buildTappableField(
// //                 displayText: _selectedRoomType ?? 'Room Type (Standard/Suite)',
// //                 icon: Icons.room_preferences_outlined,
// //                 onTap: _selectRoomType,
// //                 isHint: _selectedRoomType == null,
// //                 trailingIcon: Icons.arrow_drop_down),
// //             const SizedBox(height: 40),
// //           ],
// //         ),
// //       ),
// //       floatingActionButton: Padding(
// //         padding: const EdgeInsets.symmetric(horizontal: 20.0),
// //         child: SizedBox(
// //           width: double.infinity,
// //           child: ElevatedButton(
// //             onPressed: _isPredicting ? null : _handlePrediction,
// //             style: ElevatedButton.styleFrom(
// //               padding: const EdgeInsets.symmetric(vertical: 16),
// //               textStyle:
// //                   const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
// //             ),
// //             child: _isPredicting
// //                 ? const SizedBox(
// //                     height: 20,
// //                     width: 20,
// //                     child: CircularProgressIndicator(
// //                         color: Colors.white, strokeWidth: 3))
// //                 : Text(widget.isLastStep ? 'Predict' : 'Continue'),
// //           ),
// //         ),
// //       ),
// //       // ======================= التعديلات هنا =======================
// //       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
// //       // ==========================================================
// //     );
// //   }

// //   Future<void> _selectDate(BuildContext context) async {
// //     final DateTime? picked = await showDatePicker(
// //         context: context,
// //         firstDate: DateTime.now(),
// //         lastDate: DateTime.now().add(const Duration(days: 365 * 2)));
// //     if (picked != null && picked != _selectedDate)
// //       setState(() => _selectedDate = picked);
// //   }

// //   void _toggleGuestOptions() =>
// //       setState(() => _showGuestOptions = !_showGuestOptions);

// //   void _selectNumberOfRooms() {
// //     showDialog(
// //         context: context,
// //         builder: (context) => AlertDialog(
// //               title: const Text("Select Rooms"),
// //               content: DropdownButton<int>(
// //                 value: int.tryParse(_roomsController.text) ?? 1,
// //                 items: List.generate(10, (index) => index + 1)
// //                     .map((n) => DropdownMenuItem(
// //                         value: n, child: Text('$n Room${n > 1 ? 's' : ''}')))
// //                     .toList(),
// //                 onChanged: (value) {
// //                   if (value != null) {
// //                     setState(() => _roomsController.text = value.toString());
// //                   }
// //                   Navigator.pop(context);
// //                 },
// //               ),
// //             ));
// //   }

// //   void _selectCategory() {
// //     showModalBottomSheet(
// //         context: context,
// //         builder: (context) => Column(
// //             mainAxisSize: MainAxisSize.min,
// //             children: _categories
// //                 .map((category) => ListTile(
// //                       title: Text(category),
// //                       onTap: () {
// //                         setState(() => _selectedCategory = category);
// //                         Navigator.pop(context);
// //                       },
// //                     ))
// //                 .toList()));
// //   }

// //   void _selectRoomType() {
// //     showModalBottomSheet(
// //         context: context,
// //         builder: (context) => Column(
// //             mainAxisSize: MainAxisSize.min,
// //             children: _roomTypes
// //                 .map((type) => ListTile(
// //                       title: Text(type),
// //                       onTap: () {
// //                         setState(() => _selectedRoomType = type);
// //                         Navigator.pop(context);
// //                       },
// //                     ))
// //                 .toList()));
// //   }

// //   Widget _buildGuestSelectionRow() {
// //     return Container(
// //       padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
// //       margin: const EdgeInsets.only(top: 8.0),
// //       decoration: BoxDecoration(
// //           color: Colors.white,
// //           borderRadius: BorderRadius.circular(10),
// //           boxShadow: [
// //             BoxShadow(
// //                 color: Colors.grey.withOpacity(0.1),
// //                 blurRadius: 4,
// //                 offset: const Offset(0, 2))
// //           ]),
// //       child: Column(children: [
// //         _buildInlineCounter(
// //             "Adult", _adults, (val) => setState(() => _adults = val), 1),
// //         const Divider(height: 15),
// //         _buildInlineCounter(
// //             "Child", _children, (val) => setState(() => _children = val), 0),
// //       ]),
// //     );
// //   }

// //   Widget _buildInlineCounter(
// //       String label, int value, ValueChanged<int> onChanged, int minValue) {
// //     return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
// //       Text(label,
// //           style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
// //       Row(children: [
// //         OutlinedButton(
// //             onPressed: value > minValue ? () => onChanged(value - 1) : null,
// //             style: OutlinedButton.styleFrom(
// //                 shape: const CircleBorder(),
// //                 padding: const EdgeInsets.all(8),
// //                 side: BorderSide(color: Colors.grey.shade400)),
// //             child: const Icon(Icons.remove, size: 18)),
// //         SizedBox(
// //             width: 40,
// //             child: Text('$value',
// //                 textAlign: TextAlign.center,
// //                 style: const TextStyle(
// //                     fontSize: 16, fontWeight: FontWeight.bold))),
// //         OutlinedButton(
// //             onPressed: () => onChanged(value + 1),
// //             style: OutlinedButton.styleFrom(
// //                 shape: const CircleBorder(),
// //                 padding: const EdgeInsets.all(8),
// //                 side: BorderSide(color: Colors.grey.shade400)),
// //             child: const Icon(Icons.add, size: 18)),
// //       ])
// //     ]);
// //   }

// //   Widget _buildInputField(
// //       {required TextEditingController controller,
// //       required String hintText,
// //       required IconData icon}) {
// //     return TextField(
// //       controller: controller,
// //       decoration: InputDecoration(
// //         prefixIcon: Icon(icon, color: Colors.grey[700]),
// //         hintText: hintText,
// //         hintStyle: TextStyle(color: Colors.grey[600]),
// //         border: OutlineInputBorder(
// //             borderRadius: BorderRadius.circular(10),
// //             borderSide: BorderSide.none),
// //         fillColor: Colors.grey[200],
// //         filled: true,
// //       ),
// //     );
// //   }

// //   Widget _buildTappableField(
// //       {required String displayText,
// //       required IconData icon,
// //       required VoidCallback onTap,
// //       IconData? trailingIcon,
// //       bool isHint = false}) {
// //     return InkWell(
// //         onTap: onTap,
// //         child: Container(
// //           decoration: BoxDecoration(
// //               color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
// //           padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
// //           child: Row(children: [
// //             Icon(icon, color: Colors.grey[700]),
// //             const SizedBox(width: 12),
// //             Expanded(
// //                 child: Text(displayText,
// //                     style: TextStyle(
// //                         fontSize: 16,
// //                         color: isHint ? Colors.grey[600] : Colors.black87),
// //                     overflow: TextOverflow.ellipsis)),
// //             if (trailingIcon != null)
// //               Icon(trailingIcon, color: Colors.grey[600], size: 24),
// //           ]),
// //         ));
// //   }

// //   Widget _buildSelectableInputField(
// //       {required TextEditingController controller,
// //       required String hintText,
// //       required IconData icon,
// //       required VoidCallback onSelectIconTap,
// //       TextInputType keyboardType = TextInputType.text,
// //       List<TextInputFormatter>? inputFormatters}) {
// //     return TextField(
// //       controller: controller,
// //       keyboardType: keyboardType,
// //       inputFormatters: inputFormatters,
// //       decoration: InputDecoration(
// //         prefixIcon: Icon(icon, color: Colors.grey[700]),
// //         hintText: hintText,
// //         hintStyle: TextStyle(color: Colors.grey[600]),
// //         suffixIcon: IconButton(
// //             icon: const Icon(Icons.arrow_drop_down_circle_outlined),
// //             color: Colors.grey[600],
// //             onPressed: onSelectIconTap),
// //         border: OutlineInputBorder(
// //             borderRadius: BorderRadius.circular(10),
// //             borderSide: BorderSide.none),
// //         fillColor: Colors.grey[200],
// //         filled: true,
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:flutter/services.dart';
// import 'package:travella/services/api/ai_dio_client.dart';
// import 'package:travella/services/prediction_service.dart';
// import 'flight_prediction_input_screen.dart';
// import 'car_rental_prediction_input_screen.dart';

// // هذا مثال لتعريف متغير النتائج، يجب أن يكون موجودًا في مكان مشترك في تطبيقك
// // Map<PredictionService, String> predictionResults = {};

// class HotelPredictionInputScreen extends StatefulWidget {
//   final VoidCallback onComplete;
//   final bool isLastStep;
//   final Set<PredictionService> selectedServices;

//   const HotelPredictionInputScreen({
//     super.key,
//     required this.onComplete,
//     required this.isLastStep,
//     required this.selectedServices,
//   });

//   @override
//   State<HotelPredictionInputScreen> createState() =>
//       _HotelPredictionInputScreenState();
// }

// class _HotelPredictionInputScreenState extends State<HotelPredictionInputScreen>
//     with SingleTickerProviderStateMixin {
//   final _destinationController = TextEditingController();
//   DateTime? _selectedDate; // تاريخ واحد فقط
//   int _adults = 1;
//   int _children = 0;
//   bool _showGuestOptions = false;
//   final _roomsController = TextEditingController(text: '1');
//   String? _selectedCategory;
//   String? _selectedRoomType;
//   bool _isPredicting = false;
//   late TabController _tabController;

//   final List<String> _categories = ['Budget', 'Standard', 'Luxury'];
//   final List<String> _roomTypes = ['Standard', 'Suite'];

//   final List<Map<String, dynamic>> _tabs = [
//     {
//       'service': PredictionService.flights,
//       'icon': Icons.flight_takeoff,
//       'text': 'Flights'
//     },
//     {
//       'service': PredictionService.hotels,
//       'icon': Icons.hotel,
//       'text': 'Hotels'
//     },
//     {
//       'service': PredictionService.carRental,
//       'icon': Icons.directions_car,
//       'text': 'Car Rental'
//     },
//   ];

//   @override
//   void initState() {
//     super.initState();
//     final filteredTabs = _tabs
//         .where((tab) => widget.selectedServices.contains(tab['service']))
//         .toList();
//     final initialIndex = filteredTabs
//         .indexWhere((tab) => tab['service'] == PredictionService.hotels);
//     _tabController = TabController(
//         length: filteredTabs.length,
//         vsync: this,
//         initialIndex: initialIndex >= 0 ? initialIndex : 0);
//   }

//   @override
//   void dispose() {
//     _destinationController.dispose();
//     _roomsController.dispose();
//     _tabController.dispose();
//     super.dispose();
//   }

//   Future<void> _handlePrediction() async {
//     FocusScope.of(context).unfocus(); // إخفاء الكيبورد

//     if (_destinationController.text.isEmpty ||
//         _selectedDate == null ||
//         _selectedCategory == null ||
//         _selectedRoomType == null ||
//         _roomsController.text.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Please fill all required fields.')));
//       return;
//     }
//     setState(() {
//       _isPredicting = true;
//     });

//     try {
//       // تحديد تاريخ الخروج افتراضيًا بإضافة يوم واحد
//       final checkOutDate = _selectedDate!.add(const Duration(days: 1));
//       final result = await AiDioClient().predictHotelPrice(
//         city: _destinationController.text.trim(),
//         adults: _adults,
//         children: _children,
//         rooms: int.tryParse(_roomsController.text) ?? 1,
//         category: _selectedCategory!,
//         roomType: _selectedRoomType!,
//         checkinDate: DateFormat('yyyy-MM-dd').format(_selectedDate!),
//         checkoutDate: DateFormat('yyyy-MM-dd').format(checkOutDate),
//       );

//       if (result.containsKey('predicted_price')) {
//         predictionResults[PredictionService.hotels] =
//             result['predicted_price'].toString();
//       }
//       widget.onComplete();
//     } catch (e) {
//       ScaffoldMessenger.of(context)
//           .showSnackBar(SnackBar(content: Text('Prediction failed: $e')));
//     } finally {
//       if (mounted) {
//         setState(() {
//           _isPredicting = false;
//         });
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final themeColor = Theme.of(context).primaryColor;
//     String dateText = _selectedDate == null
//         ? 'Enter Date of Stay'
//         : DateFormat('M/d/yyyy').format(_selectedDate!);
//     String guestText =
//         '$_adults Adult${_adults > 1 ? 's' : ''}${_children > 0 ? ', $_children Child${_children > 1 ? 'ren' : ''}' : ''}';
//     final filteredTabs = _tabs
//         .where((tab) => widget.selectedServices.contains(tab['service']))
//         .toList();

//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       appBar: AppBar(
//         title: const Text('Hotels'),
//         leading: IconButton(
//             icon: const Icon(Icons.arrow_back),
//             onPressed: () => Navigator.pop(context)),
//         bottom: TabBar(
//           controller: _tabController,
//           indicatorColor: themeColor,
//           labelColor: themeColor,
//           unselectedLabelColor: Colors.grey[600],
//           tabs: filteredTabs
//               .map((tab) => Tab(icon: Icon(tab['icon']), text: tab['text']))
//               .toList(),
//           onTap: (index) {
//             final selectedService = filteredTabs[index]['service'];
//             if (selectedService != PredictionService.hotels) {
//               Widget nextScreen;
//               switch (selectedService) {
//                 case PredictionService.flights:
//                   nextScreen = FlightPredictionInputScreen(
//                       onComplete: widget.onComplete,
//                       isLastStep: widget.isLastStep,
//                       selectedServices: widget.selectedServices);
//                   break;
//                 case PredictionService.carRental:
//                   nextScreen = CarRentalPredictionInputScreen(
//                       onComplete: widget.onComplete,
//                       isLastStep: widget.isLastStep,
//                       selectedServices: widget.selectedServices);
//                   break;
//                 default:
//                   return;
//               }
//               Navigator.pushReplacement(
//                   context, MaterialPageRoute(builder: (context) => nextScreen));
//             }
//           },
//         ),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 100.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             _buildInputField(
//                 controller: _destinationController,
//                 hintText: 'Enter Destination',
//                 icon: Icons.search),
//             const SizedBox(height: 15),
//             _buildTappableField(
//                 displayText: dateText,
//                 icon: Icons.calendar_today_outlined,
//                 onTap: () => _selectDate(context),
//                 isHint: _selectedDate == null),
//             const SizedBox(height: 15),
//             _buildTappableField(
//                 displayText:
//                     _showGuestOptions ? 'Adjust guests below' : guestText,
//                 icon: Icons.person_outline,
//                 onTap: _toggleGuestOptions,
//                 isHint: !_showGuestOptions && _adults == 1 && _children == 0,
//                 trailingIcon: _showGuestOptions
//                     ? Icons.keyboard_arrow_up
//                     : Icons.keyboard_arrow_down),
//             if (_showGuestOptions) _buildGuestSelectionRow(),
//             const SizedBox(height: 15),
//             _buildSelectableInputField(
//                 controller: _roomsController,
//                 hintText: 'Number Of Rooms',
//                 icon: Icons.king_bed_outlined,
//                 onSelectIconTap: _selectNumberOfRooms,
//                 keyboardType: TextInputType.number,
//                 inputFormatters: [FilteringTextInputFormatter.digitsOnly]),
//             const SizedBox(height: 15),
//             _buildTappableField(
//                 displayText:
//                     _selectedCategory ?? 'Category (Budget/Standard/Luxury)',
//                 icon: Icons.category_outlined,
//                 onTap: _selectCategory,
//                 isHint: _selectedCategory == null,
//                 trailingIcon: Icons.arrow_drop_down),
//             const SizedBox(height: 15),
//             _buildTappableField(
//                 displayText: _selectedRoomType ?? 'Room Type (Standard/Suite)',
//                 icon: Icons.room_preferences_outlined,
//                 onTap: _selectRoomType,
//                 isHint: _selectedRoomType == null,
//                 trailingIcon: Icons.arrow_drop_down),
//             const SizedBox(height: 40),
//           ],
//         ),
//       ),
//       floatingActionButton: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20.0),
//         child: SizedBox(
//           width: double.infinity,
//           child: ElevatedButton(
//             onPressed: _isPredicting ? null : _handlePrediction,
//             style: ElevatedButton.styleFrom(
//               padding: const EdgeInsets.symmetric(vertical: 16),
//               textStyle:
//                   const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//             child: _isPredicting
//                 ? const SizedBox(
//                     height: 20,
//                     width: 20,
//                     child: CircularProgressIndicator(
//                         color: Colors.white, strokeWidth: 3))
//                 : Text(widget.isLastStep ? 'Predict' : 'Continue'),
//           ),
//         ),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//     );
//   }

//   Future<void> _selectDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//         context: context,
//         firstDate: DateTime.now(),
//         lastDate: DateTime.now().add(const Duration(days: 365 * 2)));
//     if (picked != null && picked != _selectedDate)
//       setState(() => _selectedDate = picked);
//   }

//   void _toggleGuestOptions() =>
//       setState(() => _showGuestOptions = !_showGuestOptions);

//   void _selectNumberOfRooms() {
//     showDialog(
//         context: context,
//         builder: (context) => AlertDialog(
//               title: const Text("Select Rooms"),
//               content: DropdownButton<int>(
//                 value: int.tryParse(_roomsController.text) ?? 1,
//                 items: List.generate(10, (index) => index + 1)
//                     .map((n) => DropdownMenuItem(
//                         value: n, child: Text('$n Room${n > 1 ? 's' : ''}')))
//                     .toList(),
//                 onChanged: (value) {
//                   if (value != null) {
//                     setState(() => _roomsController.text = value.toString());
//                   }
//                   Navigator.pop(context);
//                 },
//               ),
//             ));
//   }

//   void _selectCategory() {
//     showModalBottomSheet(
//         context: context,
//         builder: (context) => Column(
//             mainAxisSize: MainAxisSize.min,
//             children: _categories
//                 .map((category) => ListTile(
//                       title: Text(category),
//                       onTap: () {
//                         setState(() => _selectedCategory = category);
//                         Navigator.pop(context);
//                       },
//                     ))
//                 .toList()));
//   }

//   void _selectRoomType() {
//     showModalBottomSheet(
//         context: context,
//         builder: (context) => Column(
//             mainAxisSize: MainAxisSize.min,
//             children: _roomTypes
//                 .map((type) => ListTile(
//                       title: Text(type),
//                       onTap: () {
//                         setState(() => _selectedRoomType = type);
//                         Navigator.pop(context);
//                       },
//                     ))
//                 .toList()));
//   }

//   Widget _buildGuestSelectionRow() {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
//       margin: const EdgeInsets.only(top: 8.0),
//       decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(10),
//           boxShadow: [
//             BoxShadow(
//                 color: Colors.grey.withOpacity(0.1),
//                 blurRadius: 4,
//                 offset: const Offset(0, 2))
//           ]),
//       child: Column(children: [
//         _buildInlineCounter(
//             "Adult", _adults, (val) => setState(() => _adults = val), 1),
//         const Divider(height: 15),
//         _buildInlineCounter(
//             "Child", _children, (val) => setState(() => _children = val), 0),
//       ]),
//     );
//   }

//   Widget _buildInlineCounter(
//       String label, int value, ValueChanged<int> onChanged, int minValue) {
//     return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//       Text(label,
//           style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
//       Row(children: [
//         OutlinedButton(
//             onPressed: value > minValue ? () => onChanged(value - 1) : null,
//             style: OutlinedButton.styleFrom(
//                 shape: const CircleBorder(),
//                 padding: const EdgeInsets.all(8),
//                 side: BorderSide(color: Colors.grey.shade400)),
//             child: const Icon(Icons.remove, size: 18)),
//         SizedBox(
//             width: 40,
//             child: Text('$value',
//                 textAlign: TextAlign.center,
//                 style: const TextStyle(
//                     fontSize: 16, fontWeight: FontWeight.bold))),
//         OutlinedButton(
//             onPressed: () => onChanged(value + 1),
//             style: OutlinedButton.styleFrom(
//                 shape: const CircleBorder(),
//                 padding: const EdgeInsets.all(8),
//                 side: BorderSide(color: Colors.grey.shade400)),
//             child: const Icon(Icons.add, size: 18)),
//       ])
//     ]);
//   }

//   Widget _buildInputField(
//       {required TextEditingController controller,
//       required String hintText,
//       required IconData icon}) {
//     return TextField(
//       controller: controller,
//       decoration: InputDecoration(
//         prefixIcon: Icon(icon, color: Colors.grey[700]),
//         hintText: hintText,
//         hintStyle: TextStyle(color: Colors.grey[600]),
//         border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//             borderSide: BorderSide.none),
//         fillColor: Colors.grey[200],
//         filled: true,
//       ),
//     );
//   }

//   Widget _buildTappableField(
//       {required String displayText,
//       required IconData icon,
//       required VoidCallback onTap,
//       IconData? trailingIcon,
//       bool isHint = false}) {
//     return InkWell(
//         onTap: onTap,
//         child: Container(
//           decoration: BoxDecoration(
//               color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
//           padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
//           child: Row(children: [
//             Icon(icon, color: Colors.grey[700]),
//             const SizedBox(width: 12),
//             Expanded(
//                 child: Text(displayText,
//                     style: TextStyle(
//                         fontSize: 16,
//                         color: isHint ? Colors.grey[600] : Colors.black87),
//                     overflow: TextOverflow.ellipsis)),
//             if (trailingIcon != null)
//               Icon(trailingIcon, color: Colors.grey[600], size: 24),
//           ]),
//         ));
//   }

//   Widget _buildSelectableInputField(
//       {required TextEditingController controller,
//       required String hintText,
//       required IconData icon,
//       required VoidCallback onSelectIconTap,
//       TextInputType keyboardType = TextInputType.text,
//       List<TextInputFormatter>? inputFormatters}) {
//     return TextField(
//       controller: controller,
//       keyboardType: keyboardType,
//       inputFormatters: inputFormatters,
//       decoration: InputDecoration(
//         prefixIcon: Icon(icon, color: Colors.grey[700]),
//         hintText: hintText,
//         hintStyle: TextStyle(color: Colors.grey[600]),
//         suffixIcon: IconButton(
//             icon: const Icon(Icons.arrow_drop_down_circle_outlined),
//             color: Colors.grey[600],
//             onPressed: onSelectIconTap),
//         border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(10),
//             borderSide: BorderSide.none),
//         fillColor: Colors.grey[200],
//         filled: true,
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';
import 'package:apptravella/services/api/ai_dio_client.dart';
import 'package:apptravella/services/prediction_service.dart';
import 'flight_prediction_input_screen.dart';
import 'car_rental_prediction_input_screen.dart';

// هذا مثال لتعريف متغير النتائج، يجب أن يكون موجودًا في مكان مشترك في تطبيقك
// Map<PredictionService, String> predictionResults = {};

class HotelPredictionInputScreen extends StatefulWidget {
  final VoidCallback onComplete;
  final bool isLastStep;
  final Set<PredictionService> selectedServices;

  const HotelPredictionInputScreen({
    super.key,
    required this.onComplete,
    required this.isLastStep,
    required this.selectedServices,
  });

  @override
  State<HotelPredictionInputScreen> createState() =>
      _HotelPredictionInputScreenState();
}

class _HotelPredictionInputScreenState extends State<HotelPredictionInputScreen>
    with SingleTickerProviderStateMixin {
  final _destinationController = TextEditingController();
  DateTime? _checkinDate; // تاريخ الدخول
  DateTime? _checkoutDate; // تاريخ الخروج
  int _adults = 1;
  int _children = 0;
  bool _showGuestOptions = false;
  final _roomsController = TextEditingController(text: '1');
  String? _selectedCategory;
  String? _selectedRoomType;
  bool _isPredicting = false;
  late TabController _tabController;

  final List<String> _categories = ['Budget', 'Standard', 'Luxury'];
  final List<String> _roomTypes = ['Standard', 'Suite'];

  final List<Map<String, dynamic>> _tabs = [
    {
      'service': PredictionService.flights,
      'icon': Icons.flight_takeoff,
      'text': 'Flights'
    },
    {
      'service': PredictionService.hotels,
      'icon': Icons.hotel,
      'text': 'Hotels'
    },
    {
      'service': PredictionService.carRental,
      'icon': Icons.directions_car,
      'text': 'Car Rental'
    },
  ];

  @override
  void initState() {
    super.initState();
    final filteredTabs = _tabs
        .where((tab) => widget.selectedServices.contains(tab['service']))
        .toList();
    final initialIndex = filteredTabs
        .indexWhere((tab) => tab['service'] == PredictionService.hotels);
    _tabController = TabController(
        length: filteredTabs.length,
        vsync: this,
        initialIndex: initialIndex >= 0 ? initialIndex : 0);
  }

  @override
  void dispose() {
    _destinationController.dispose();
    _roomsController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _handlePrediction() async {
    FocusScope.of(context).unfocus(); // إخفاء الكيبورد

    if (_destinationController.text.isEmpty ||
        _checkinDate == null ||
        _checkoutDate == null ||
        _selectedCategory == null ||
        _selectedRoomType == null ||
        _roomsController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please fill all required fields.')));
      return;
    }

    // تحقق من أن تاريخ الخروج يأتي بعد تاريخ الدخول
    if (_checkoutDate!.isBefore(_checkinDate!)) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Checkout date must be after checkin date.')));
      return;
    }

    setState(() {
      _isPredicting = true;
    });

    try {
      final result = await AiDioClient().predictHotelPrice(
        city: _destinationController.text.trim(),
        adults: _adults,
        children: _children,
        rooms: int.tryParse(_roomsController.text) ?? 1,
        category: _selectedCategory!,
        roomType: _selectedRoomType!,
        checkinDate: DateFormat('yyyy-MM-dd').format(_checkinDate!),
        checkoutDate: DateFormat('yyyy-MM-dd').format(_checkoutDate!),
      );

      if (result.containsKey('predicted_price')) {
        predictionResults[PredictionService.hotels] =
            result['predicted_price'].toString();
      }
      widget.onComplete();
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Prediction failed: $e')));
    } finally {
      if (mounted) {
        setState(() {
          _isPredicting = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeColor = Theme.of(context).primaryColor;
    String checkinDateText = _checkinDate == null
        ? 'Enter Check-in Date'
        : DateFormat('M/d/yyyy').format(_checkinDate!);
    String checkoutDateText = _checkoutDate == null
        ? 'Enter Check-out Date'
        : DateFormat('M/d/yyyy').format(_checkoutDate!);
    String guestText =
        '$_adults Adult${_adults > 1 ? 's' : ''}${_children > 0 ? ', $_children Child${_children > 1 ? 'ren' : ''}' : ''}';
    final filteredTabs = _tabs
        .where((tab) => widget.selectedServices.contains(tab['service']))
        .toList();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Hotels'),
        leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context)),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: themeColor,
          labelColor: themeColor,
          unselectedLabelColor: Colors.grey[600],
          tabs: filteredTabs
              .map((tab) => Tab(icon: Icon(tab['icon']), text: tab['text']))
              .toList(),
          onTap: (index) {
            final selectedService = filteredTabs[index]['service'];
            if (selectedService != PredictionService.hotels) {
              Widget nextScreen;
              switch (selectedService) {
                case PredictionService.flights:
                  nextScreen = FlightPredictionInputScreen(
                      onComplete: widget.onComplete,
                      isLastStep: widget.isLastStep,
                      selectedServices: widget.selectedServices);
                  break;
                case PredictionService.carRental:
                  nextScreen = CarRentalPredictionInputScreen(
                      onComplete: widget.onComplete,
                      isLastStep: widget.isLastStep,
                      selectedServices: widget.selectedServices);
                  break;
                default:
                  return;
              }
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => nextScreen));
            }
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 100.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInputField(
                controller: _destinationController,
                hintText: 'Enter Destination',
                icon: Icons.search),
            const SizedBox(height: 15),
            _buildTappableField(
                displayText: checkinDateText,
                icon: Icons.calendar_today_outlined,
                onTap: () => _selectCheckinDate(context),
                isHint: _checkinDate == null),
            const SizedBox(height: 15),
            _buildTappableField(
                displayText: checkoutDateText,
                icon: Icons.calendar_today_outlined,
                onTap: () => _selectCheckoutDate(context),
                isHint: _checkoutDate == null),
            const SizedBox(height: 15),
            _buildTappableField(
                displayText:
                    _showGuestOptions ? 'Adjust guests below' : guestText,
                icon: Icons.person_outline,
                onTap: _toggleGuestOptions,
                isHint: !_showGuestOptions && _adults == 1 && _children == 0,
                trailingIcon: _showGuestOptions
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down),
            if (_showGuestOptions) _buildGuestSelectionRow(),
            const SizedBox(height: 15),
            _buildSelectableInputField(
                controller: _roomsController,
                hintText: 'Number Of Rooms',
                icon: Icons.king_bed_outlined,
                onSelectIconTap: _selectNumberOfRooms,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly]),
            const SizedBox(height: 15),
            _buildTappableField(
                displayText:
                    _selectedCategory ?? 'Category (Budget/Standard/Luxury)',
                icon: Icons.category_outlined,
                onTap: _selectCategory,
                isHint: _selectedCategory == null,
                trailingIcon: Icons.arrow_drop_down),
            const SizedBox(height: 15),
            _buildTappableField(
                displayText: _selectedRoomType ?? 'Room Type (Standard/Suite)',
                icon: Icons.room_preferences_outlined,
                onTap: _selectRoomType,
                isHint: _selectedRoomType == null,
                trailingIcon: Icons.arrow_drop_down),
            const SizedBox(height: 40),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: _isPredicting ? null : _handlePrediction,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              textStyle:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            child: _isPredicting
                ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                        color: Colors.white, strokeWidth: 3))
                : Text(widget.isLastStep ? 'Predict' : 'Continue'),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Future<void> _selectCheckinDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 365 * 2)));
    if (picked != null && picked != _checkinDate)
      setState(() => _checkinDate = picked);
  }

  Future<void> _selectCheckoutDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        firstDate: _checkinDate ?? DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 365 * 2)));
    if (picked != null &&
        picked != _checkoutDate &&
        (picked.isAfter(_checkinDate ?? DateTime.now())))
      setState(() => _checkoutDate = picked);
  }

  void _toggleGuestOptions() =>
      setState(() => _showGuestOptions = !_showGuestOptions);

  void _selectNumberOfRooms() {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text("Select Rooms"),
              content: DropdownButton<int>(
                value: int.tryParse(_roomsController.text) ?? 1,
                items: List.generate(10, (index) => index + 1)
                    .map((n) => DropdownMenuItem(
                        value: n, child: Text('$n Room${n > 1 ? 's' : ''}')))
                    .toList(),
                onChanged: (value) {
                  if (value != null) {
                    setState(() => _roomsController.text = value.toString());
                  }
                  Navigator.pop(context);
                },
              ),
            ));
  }

  void _selectCategory() {
    showModalBottomSheet(
        context: context,
        builder: (context) => Column(
            mainAxisSize: MainAxisSize.min,
            children: _categories
                .map((category) => ListTile(
                      title: Text(category),
                      onTap: () {
                        setState(() => _selectedCategory = category);
                        Navigator.pop(context);
                      },
                    ))
                .toList()));
  }

  void _selectRoomType() {
    showModalBottomSheet(
        context: context,
        builder: (context) => Column(
            mainAxisSize: MainAxisSize.min,
            children: _roomTypes
                .map((type) => ListTile(
                      title: Text(type),
                      onTap: () {
                        setState(() => _selectedRoomType = type);
                        Navigator.pop(context);
                      },
                    ))
                .toList()));
  }

  Widget _buildGuestSelectionRow() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      margin: const EdgeInsets.only(top: 8.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                blurRadius: 4,
                offset: const Offset(0, 2))
          ]),
      child: Column(children: [
        _buildInlineCounter(
            "Adult", _adults, (val) => setState(() => _adults = val), 1),
        const Divider(height: 15),
        _buildInlineCounter(
            "Child", _children, (val) => setState(() => _children = val), 0),
      ]),
    );
  }

  Widget _buildInlineCounter(
      String label, int value, ValueChanged<int> onChanged, int minValue) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
      Row(children: [
        OutlinedButton(
            onPressed: value > minValue ? () => onChanged(value - 1) : null,
            style: OutlinedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(8),
                side: BorderSide(color: Colors.grey.shade400)),
            child: const Icon(Icons.remove, size: 18)),
        SizedBox(
            width: 40,
            child: Text('$value',
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 16, fontWeight: FontWeight.bold))),
        OutlinedButton(
            onPressed: () => onChanged(value + 1),
            style: OutlinedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(8),
                side: BorderSide(color: Colors.grey.shade400)),
            child: const Icon(Icons.add, size: 18)),
      ])
    ]);
  }

  Widget _buildInputField(
      {required TextEditingController controller,
      required String hintText,
      required IconData icon}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.grey[700]),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey[600]),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none),
        fillColor: Colors.grey[200],
        filled: true,
      ),
    );
  }

  Widget _buildTappableField(
      {required String displayText,
      required IconData icon,
      required VoidCallback onTap,
      IconData? trailingIcon,
      bool isHint = false}) {
    return InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Row(children: [
            Icon(icon, color: Colors.grey[700]),
            const SizedBox(width: 12),
            Expanded(
                child: Text(displayText,
                    style: TextStyle(
                        fontSize: 16,
                        color: isHint ? Colors.grey[600] : Colors.black87),
                    overflow: TextOverflow.ellipsis)),
            if (trailingIcon != null)
              Icon(trailingIcon, color: Colors.grey[600], size: 24),
          ]),
        ));
  }

  Widget _buildSelectableInputField(
      {required TextEditingController controller,
      required String hintText,
      required IconData icon,
      required VoidCallback onSelectIconTap,
      TextInputType keyboardType = TextInputType.text,
      List<TextInputFormatter>? inputFormatters}) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.grey[700]),
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey[600]),
        suffixIcon: IconButton(
            icon: const Icon(Icons.arrow_drop_down_circle_outlined),
            color: Colors.grey[600],
            onPressed: onSelectIconTap),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none),
        fillColor: Colors.grey[200],
        filled: true,
      ),
    );
  }
}
