// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:travella/services/api/ai_dio_client.dart';
// import 'package:travella/services/prediction_service.dart'; // <-- المصدر الوحيد للـ enum
// import 'hotel_prediction_input_screen.dart';
// import 'car_rental_prediction_input_screen.dart';

// class FlightPredictionInputScreen extends StatefulWidget {
//   final VoidCallback onComplete;
//   final bool isLastStep;
//   final Set<PredictionService> selectedServices;

//   const FlightPredictionInputScreen({
//     super.key,
//     required this.onComplete,
//     required this.isLastStep,
//     required this.selectedServices,
//   });

//   @override
//   State<FlightPredictionInputScreen> createState() =>
//       _FlightPredictionInputScreenState();
// }

// class _FlightPredictionInputScreenState
//     extends State<FlightPredictionInputScreen>
//     with SingleTickerProviderStateMixin {
//   final _fromController = TextEditingController();
//   final _toController = TextEditingController();
//   DateTime? _selectedDate;
//   int _adults = 1;
//   int _children = 0;
//   String? _selectedClass;
//   bool _showClassOptions = false;
//   String? _selectedAirline;
//   String? _selectedStops;
//   bool _isPredicting = false;
//   late TabController _tabController;

//   final List<String> _airlines = [
//     'EgyptAir',
//     'Turkish Airlines',
//     'Lufthansa',
//     'Emirates',
//     'Qatar Airways',
//     'Saudia',
//     'British Airways',
//     'Air France'
//   ];
//   final List<String> _stopOptions = ['Non-stop', '1 Stop', '2 Stops', 'Any'];
//   final List<String> _classOptions = [
//     'Economy',
//     'Premium Economy',
//     'Business',
//     'First'
//   ];

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
//         .indexWhere((tab) => tab['service'] == PredictionService.flights);
//     _tabController = TabController(
//         length: filteredTabs.length,
//         vsync: this,
//         initialIndex: initialIndex >= 0 ? initialIndex : 0);
//   }

//   @override
//   void dispose() {
//     _fromController.dispose();
//     _toController.dispose();
//     _tabController.dispose();
//     super.dispose();
//   }

//   Future<void> _handlePrediction() async {
//     FocusScope.of(context).unfocus();

//     if (_fromController.text.isEmpty ||
//         _toController.text.isEmpty ||
//         _selectedClass == null ||
//         _selectedAirline == null ||
//         _selectedStops == null ||
//         _selectedDate == null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Please fill all required fields.')));
//       return;
//     }
//     setState(() {
//       _isPredicting = true;
//     });

//     try {
//       String apiClass =
//           _selectedClass == 'First class' ? 'First' : _selectedClass!;

//       final result = await AiDioClient().predictFlightPrice(
//         from: _fromController.text.trim(),
//         to: _toController.text.trim(),
//         adults: _adults,
//         children: _children,
//         flightClass: apiClass,
//         numStops: _selectedStops!,
//         airline: _selectedAirline!,
//         date: DateFormat('yyyy-MM-dd').format(_selectedDate!),
//       );

//       if (result.containsKey('predicted_prices') &&
//           result['predicted_prices'] is List &&
//           (result['predicted_prices'] as List).isNotEmpty) {
//         predictionResults[PredictionService.flights] =
//             (result['predicted_prices'] as List).first.toString();
//       }
//       widget.onComplete();
//     } catch (e) {
//       ScaffoldMessenger.of(context)
//           .showSnackBar(SnackBar(content: Text('Prediction failed: $e')));
//     } finally {
//       if (mounted) setState(() => _isPredicting = false);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final themeColor = Theme.of(context).primaryColor;
//     String dateText = _selectedDate == null
//         ? 'Enter Date of Departure'
//         : DateFormat('d/M/y').format(_selectedDate!);
//     String passengerText =
//         '$_adults Adult${_adults > 1 ? 's' : ''}${_children > 0 ? ', $_children Child${_children > 1 ? 'ren' : ''}' : ''}';

//     final filteredTabs = _tabs
//         .where((tab) => widget.selectedServices.contains(tab['service']))
//         .toList();

//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       appBar: AppBar(
//         title: const Text('Flights'),
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
//             if (selectedService != PredictionService.flights) {
//               Widget nextScreen;
//               switch (selectedService) {
//                 case PredictionService.hotels:
//                   nextScreen = HotelPredictionInputScreen(
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
//                 controller: _fromController,
//                 hintText: 'From',
//                 icon: Icons.flight_takeoff_outlined),
//             const SizedBox(height: 15),
//             _buildInputField(
//                 controller: _toController,
//                 hintText: 'To',
//                 icon: Icons.flight_land_outlined),
//             const SizedBox(height: 15),
//             _buildTappableField(
//                 displayText: dateText,
//                 icon: Icons.calendar_today_outlined,
//                 onTap: () => _selectDate(context),
//                 isHint: _selectedDate == null),
//             const SizedBox(height: 15),
//             _buildTappableField(
//                 displayText: passengerText,
//                 icon: Icons.person_outline,
//                 onTap: _showPassengerDialog),
//             const SizedBox(height: 15),
//             _buildTappableField(
//                 displayText: _selectedClass ?? 'Choose class',
//                 icon: Icons.airline_seat_recline_normal_outlined,
//                 onTap: _toggleClassOptions,
//                 isHint: _selectedClass == null,
//                 trailingIcon: _showClassOptions
//                     ? Icons.keyboard_arrow_up
//                     : Icons.keyboard_arrow_down),
//             if (_showClassOptions) _buildClassSelectionRow(themeColor),
//             const SizedBox(height: 15),
//             _buildTappableField(
//                 displayText: _selectedAirline ?? 'Airline',
//                 icon: Icons.airplane_ticket_outlined,
//                 onTap: _selectAirline,
//                 isHint: _selectedAirline == null,
//                 trailingIcon: Icons.keyboard_arrow_down),
//             const SizedBox(height: 15),
//             _buildTappableField(
//                 displayText: _selectedStops ?? 'Number of stops',
//                 icon: Icons.compare_arrows_outlined,
//                 onTap: _selectStops,
//                 isHint: _selectedStops == null,
//                 trailingIcon: Icons.keyboard_arrow_down),
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

//   void _showPassengerDialog() {
//     showDialog(
//         context: context,
//         builder: (context) => StatefulBuilder(
//             builder: (context, setDialogState) => AlertDialog(
//                   title: const Text("Select Passengers"),
//                   content: Column(mainAxisSize: MainAxisSize.min, children: [
//                     _buildPassengerCounter("Adults", _adults,
//                         (val) => setDialogState(() => _adults = val), 1),
//                     const SizedBox(height: 10),
//                     _buildPassengerCounter("Children", _children,
//                         (val) => setDialogState(() => _children = val), 0),
//                   ]),
//                   actions: [
//                     TextButton(
//                         onPressed: () {
//                           Navigator.of(context).pop();
//                           setState(() {});
//                         },
//                         child: const Text("Done"))
//                   ],
//                 )));
//   }

//   Widget _buildPassengerCounter(
//       String label, int value, ValueChanged<int> onChanged, int minValue) {
//     return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//       Text(label, style: const TextStyle(fontSize: 16)),
//       Row(children: [
//         IconButton(
//             icon: const Icon(Icons.remove_circle_outline),
//             color: value > minValue ? Colors.black54 : Colors.grey.shade300,
//             onPressed: value > minValue ? () => onChanged(value - 1) : null),
//         Text('$value',
//             style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//         IconButton(
//             icon: const Icon(Icons.add_circle_outline),
//             color: Colors.black54,
//             onPressed: () => onChanged(value + 1)),
//       ])
//     ]);
//   }

//   void _toggleClassOptions() =>
//       setState(() => _showClassOptions = !_showClassOptions);

//   void _selectClass(String className) => setState(() {
//         _selectedClass = className;
//         _showClassOptions = false;
//       });

//   void _selectAirline() {
//     showModalBottomSheet(
//         context: context,
//         builder: (context) => ListView.builder(
//               itemCount: _airlines.length,
//               itemBuilder: (context, index) => ListTile(
//                   title: Text(_airlines[index]),
//                   onTap: () {
//                     setState(() => _selectedAirline = _airlines[index]);
//                     Navigator.pop(context);
//                   }),
//             ));
//   }

//   void _selectStops() {
//     showModalBottomSheet(
//         context: context,
//         builder: (context) => ListView.builder(
//               itemCount: _stopOptions.length,
//               itemBuilder: (context, index) => ListTile(
//                   title: Text(_stopOptions[index]),
//                   onTap: () {
//                     setState(() => _selectedStops = _stopOptions[index]);
//                     Navigator.pop(context);
//                   }),
//             ));
//   }

//   Widget _buildClassSelectionRow(Color themeColor) {
//     return Padding(
//         padding: const EdgeInsets.only(top: 10.0, bottom: 5.0),
//         child: Wrap(
//           spacing: 8.0,
//           runSpacing: 8.0,
//           children: _classOptions
//               .map((className) => OutlinedButton(
//                     onPressed: () => _selectClass(className),
//                     style: OutlinedButton.styleFrom(
//                       foregroundColor: _selectedClass == className
//                           ? Colors.white
//                           : themeColor,
//                       backgroundColor: _selectedClass == className
//                           ? themeColor
//                           : Colors.white,
//                       side: BorderSide(color: themeColor.withOpacity(0.5)),
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(8)),
//                     ),
//                     child: Text(className),
//                   ))
//               .toList(),
//         ));
//   }

//   Widget _buildInputField(
//       {required TextEditingController controller,
//       required String hintText,
//       required IconData icon}) {
//     return TextField(
//         controller: controller,
//         decoration:
//             InputDecoration(prefixIcon: Icon(icon), hintText: hintText));
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
//               color: Theme.of(context).inputDecorationTheme.fillColor,
//               borderRadius: BorderRadius.circular(10)),
//           padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
//           child: Row(children: [
//             Icon(icon, color: Theme.of(context).inputDecorationTheme.iconColor),
//             const SizedBox(width: 12),
//             Expanded(
//                 child: Text(displayText,
//                     style: TextStyle(
//                         fontSize: 16,
//                         color: isHint
//                             ? Theme.of(context)
//                                 .inputDecorationTheme
//                                 .hintStyle
//                                 ?.color
//                             : Colors.black87),
//                     overflow: TextOverflow.ellipsis)),
//             if (trailingIcon != null)
//               Icon(trailingIcon, color: Colors.grey[600], size: 24),
//           ]),
//         ));
//   }
// }
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:apptravella/services/api/ai_dio_client.dart';
import 'package:apptravella/services/prediction_service.dart';
import 'hotel_prediction_input_screen.dart';
import 'car_rental_prediction_input_screen.dart';

class FlightPredictionInputScreen extends StatefulWidget {
  final VoidCallback onComplete;
  final bool isLastStep;
  final Set<PredictionService> selectedServices;

  const FlightPredictionInputScreen({
    super.key,
    required this.onComplete,
    required this.isLastStep,
    required this.selectedServices,
  });

  @override
  State<FlightPredictionInputScreen> createState() =>
      _FlightPredictionInputScreenState();
}

class _FlightPredictionInputScreenState
    extends State<FlightPredictionInputScreen>
    with SingleTickerProviderStateMixin {
  final _fromController = TextEditingController();
  final _toController = TextEditingController();
  DateTime? _selectedDate;
  int _adults = 1;
  int _children = 0;
  String? _selectedClass;
  bool _showClassOptions = false;
  String? _selectedAirline;
  String? _selectedStops;
  bool _isPredicting = false;
  late TabController _tabController;

  final List<String> _airlines = [
    'EgyptAir',
    'Turkish Airlines',
    'Lufthansa',
    'Emirates',
    'Qatar Airways',
    'Saudia',
    'British Airways',
    'Air France'
  ];
  final List<String> _stopOptions = ['Non-stop', '1 Stop', '2 Stops', 'Any'];
  final List<String> _classOptions = [
    'Economy',
    'Premium Economy',
    'Business',
    'First'
  ];

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
        .indexWhere((tab) => tab['service'] == PredictionService.flights);
    _tabController = TabController(
        length: filteredTabs.length,
        vsync: this,
        initialIndex: initialIndex >= 0 ? initialIndex : 0);
  }

  @override
  void dispose() {
    _fromController.dispose();
    _toController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _handlePrediction() async {
    FocusScope.of(context).unfocus();

    if (_fromController.text.isEmpty ||
        _toController.text.isEmpty ||
        _selectedClass == null ||
        _selectedAirline == null ||
        _selectedStops == null ||
        _selectedDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please fill all required fields.')));
      return;
    }

    setState(() {
      _isPredicting = true;
    });

    try {
      String apiClass =
          _selectedClass!.toLowerCase(); // تحويل الكلاس إلى صيغة صغيرة

      final result = await AiDioClient().predictFlightPrice(
        from: _fromController.text.trim(),
        to: _toController.text.trim(),
        adults: _adults,
        children: _children,
        flightClass: apiClass,
        numStops: _selectedStops!,
        airline: _selectedAirline!,
        date: DateFormat('yyyy-MM-dd').format(_selectedDate!),
      );

      if (result.containsKey('predicted_prices') &&
          result['predicted_prices'] is List &&
          (result['predicted_prices'] as List).isNotEmpty) {
        final price = (result['predicted_prices'] as List).first;
        predictionResults[PredictionService.flights] = price is String
            ? price // الاحتفاظ بالصيغة النصية مثل "37,801 EGP"
            : price.toString(); // تحويل إلى سلسلة إذا كان عددًا
      } else {
        predictionResults[PredictionService.flights] = 'No price available';
      }
      widget.onComplete();
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Prediction failed: $e')));
    } finally {
      if (mounted) setState(() => _isPredicting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeColor = Theme.of(context).primaryColor;
    String dateText = _selectedDate == null
        ? 'Enter Date of Departure'
        : DateFormat('d/M/y').format(_selectedDate!);
    String passengerText =
        '$_adults Adult${_adults > 1 ? 's' : ''}${_children > 0 ? ', $_children Child${_children > 1 ? 'ren' : ''}' : ''}';

    final filteredTabs = _tabs
        .where((tab) => widget.selectedServices.contains(tab['service']))
        .toList();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Flights'),
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
            if (selectedService != PredictionService.flights) {
              Widget nextScreen;
              switch (selectedService) {
                case PredictionService.hotels:
                  nextScreen = HotelPredictionInputScreen(
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
                controller: _fromController,
                hintText: 'From',
                icon: Icons.flight_takeoff_outlined),
            const SizedBox(height: 15),
            _buildInputField(
                controller: _toController,
                hintText: 'To',
                icon: Icons.flight_land_outlined),
            const SizedBox(height: 15),
            _buildTappableField(
                displayText: dateText,
                icon: Icons.calendar_today_outlined,
                onTap: () => _selectDate(context),
                isHint: _selectedDate == null),
            const SizedBox(height: 15),
            _buildTappableField(
                displayText: passengerText,
                icon: Icons.person_outline,
                onTap: _showPassengerDialog),
            const SizedBox(height: 15),
            _buildTappableField(
                displayText: _selectedClass ?? 'Choose class',
                icon: Icons.airline_seat_recline_normal_outlined,
                onTap: _toggleClassOptions,
                isHint: _selectedClass == null,
                trailingIcon: _showClassOptions
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down),
            if (_showClassOptions) _buildClassSelectionRow(themeColor),
            const SizedBox(height: 15),
            _buildTappableField(
                displayText: _selectedAirline ?? 'Airline',
                icon: Icons.airplane_ticket_outlined,
                onTap: _selectAirline,
                isHint: _selectedAirline == null,
                trailingIcon: Icons.keyboard_arrow_down),
            const SizedBox(height: 15),
            _buildTappableField(
                displayText: _selectedStops ?? 'Number of stops',
                icon: Icons.compare_arrows_outlined,
                onTap: _selectStops,
                isHint: _selectedStops == null,
                trailingIcon: Icons.keyboard_arrow_down),
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

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 365 * 2)));
    if (picked != null && picked != _selectedDate)
      setState(() => _selectedDate = picked);
  }

  void _showPassengerDialog() {
    showDialog(
        context: context,
        builder: (context) => StatefulBuilder(
            builder: (context, setDialogState) => AlertDialog(
                  title: const Text("Select Passengers"),
                  content: Column(mainAxisSize: MainAxisSize.min, children: [
                    _buildPassengerCounter("Adults", _adults,
                        (val) => setDialogState(() => _adults = val), 1),
                    const SizedBox(height: 10),
                    _buildPassengerCounter("Children", _children,
                        (val) => setDialogState(() => _children = val), 0),
                  ]),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          setState(() {});
                        },
                        child: const Text("Done"))
                  ],
                )));
  }

  Widget _buildPassengerCounter(
      String label, int value, ValueChanged<int> onChanged, int minValue) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(label, style: const TextStyle(fontSize: 16)),
      Row(children: [
        IconButton(
            icon: const Icon(Icons.remove_circle_outline),
            color: value > minValue ? Colors.black54 : Colors.grey.shade300,
            onPressed: value > minValue ? () => onChanged(value - 1) : null),
        Text('$value',
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        IconButton(
            icon: const Icon(Icons.add_circle_outline),
            color: Colors.black54,
            onPressed: () => onChanged(value + 1)),
      ])
    ]);
  }

  void _toggleClassOptions() =>
      setState(() => _showClassOptions = !_showClassOptions);

  void _selectClass(String className) => setState(() {
        _selectedClass = className;
        _showClassOptions = false;
      });

  void _selectAirline() {
    showModalBottomSheet(
        context: context,
        builder: (context) => ListView.builder(
              itemCount: _airlines.length,
              itemBuilder: (context, index) => ListTile(
                  title: Text(_airlines[index]),
                  onTap: () {
                    setState(() => _selectedAirline = _airlines[index]);
                    Navigator.pop(context);
                  }),
            ));
  }

  void _selectStops() {
    showModalBottomSheet(
        context: context,
        builder: (context) => ListView.builder(
              itemCount: _stopOptions.length,
              itemBuilder: (context, index) => ListTile(
                  title: Text(_stopOptions[index]),
                  onTap: () {
                    setState(() => _selectedStops = _stopOptions[index]);
                    Navigator.pop(context);
                  }),
            ));
  }

  Widget _buildClassSelectionRow(Color themeColor) {
    return Padding(
        padding: const EdgeInsets.only(top: 10.0, bottom: 5.0),
        child: Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: _classOptions
              .map((className) => OutlinedButton(
                    onPressed: () => _selectClass(className),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: _selectedClass == className
                          ? Colors.white
                          : themeColor,
                      backgroundColor: _selectedClass == className
                          ? themeColor
                          : Colors.white,
                      side: BorderSide(color: themeColor.withOpacity(0.5)),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    child: Text(className),
                  ))
              .toList(),
        ));
  }

  Widget _buildInputField(
      {required TextEditingController controller,
      required String hintText,
      required IconData icon}) {
    return TextField(
        controller: controller,
        decoration: InputDecoration(
            prefixIcon: Icon(icon),
            hintText: hintText,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none),
            fillColor: Colors.grey[200],
            filled: true));
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
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10)),
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
            ])));
  }
}
