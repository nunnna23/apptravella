// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:flutter/services.dart';
// import 'package:travella/services/api/ai_dio_client.dart';
// import 'package:travella/services/prediction_service.dart'; // <-- المصدر الوحيد للـ enum
// import 'flight_prediction_input_screen.dart';
// import 'hotel_prediction_input_screen.dart';

// class CarRentalPredictionInputScreen extends StatefulWidget {
//   final VoidCallback onComplete;
//   final bool isLastStep;
//   final Set<PredictionService> selectedServices;

//   const CarRentalPredictionInputScreen({
//     super.key,
//     required this.onComplete,
//     required this.isLastStep,
//     required this.selectedServices,
//   });

//   @override
//   State<CarRentalPredictionInputScreen> createState() =>
//       _CarRentalPredictionInputScreenState();
// }

// class _CarRentalPredictionInputScreenState
//     extends State<CarRentalPredictionInputScreen>
//     with SingleTickerProviderStateMixin {
//   final _destinationController = TextEditingController();
//   DateTime? _startDate;
//   DateTime? _endDate;
//   final _carModelController = TextEditingController();
//   final _seatsController = TextEditingController();
//   final _capacityController = TextEditingController();
//   String? _selectedTransmission;
//   bool _showTransmissionOptions = false;
//   bool _isPredicting = false;
//   late TabController _tabController;

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

//   // قائمة العربيات المضافة
//   final List<String> validCarModels = [
//     'Nissan Sunny',
//     'Opel Astra Estate',
//     'Nissan Sentra',
//     'Cupra Born',
//     'Volkswagen Jetta',
//     'Lancia Ypsilon',
//     'Skoda Karoq',
//     'Opel Mokka',
//     'Toyota Aygo X',
//     'Kia Picanto',
//     'Kia Cerato',
//     'Toyota RAV4',
//     'Kia Ceed',
//     'Fiat Panda',
//     'Mazda CX-3',
//     'Opel Corsa',
//     'Renault Kadjar GPS',
//     'Kia Pegas',
//     'Peugeot 208',
//     'Citroen C3 Aircross',
//     'Volkswagen Tiguan',
//     'Peugeot 5008',
//     'Fiat 500',
//     'Opel Grandland X',
//     'Volkswagen Polo',
//     'Renault Express',
//     'Toyota Corolla',
//     'Volkswagen T-Cross',
//     'Hyundai Santa Fe',
//     'Nissan Qashqai',
//     'Mini Cooper Cabrio',
//     'Fiat 500X',
//     'Toyota C-HR Hybrid',
//     'Chrysler Pacifica',
//     'Renault Megane',
//     'Volkswagen T-Roc',
//     'Fiat 500e',
//     'Skoda Scala',
//     'Kia Telluride',
//     'MG ZS',
//     'Hyundai Creta',
//     'Ford Taurus',
//     'Ford Fusion',
//     'Ford Fiesta',
//     'Audi Q2',
//     'Peugeot 2008',
//     'Renault Megane E-Tech',
//     'Nissan X-Trail',
//     'Opel Mokka-e GPS',
//     'Ford Focus',
//     'MG EHS',
//     'Tesla Model 3',
//     'Renault Captur',
//     'Peugeot 3008',
//     'Renault Duster',
//     'Dacia Duster',
//     'Toyota Yaris',
//     'Chevrolet Spark',
//     'Opel Astra',
//     'Suzuki DZire',
//     'Nissan Altima',
//     'Kia Sportage',
//     'Hyundai Kona',
//     'BMW X1',
//     'Mazda 6',
//     'Toyota Veloz',
//     'BMW 7 Series',
//     'BMW 5-Series',
//     'Peugeot e-208',
//     'Toyota Yaris Cross',
//     'Chevrolet Aveo',
//     'Hyundai Elantra',
//     'Volkswagen Golf',
//     'Audi A8',
//     'Hyundai i10',
//     'Renault Arkana',
//     'Audi A6',
//     'Toyota Fortuner',
//     'Nissan Juke',
//     'Tesla Model X',
//     'Chevrolet Malibu',
//     'Mercedes-Benz S-Class',
//     'Alfa Romeo Giulietta',
//     'Volvo EX30',
//     'Hyundai Tucson',
//     'Audi A5 Sportback',
//     'Suzuki Baleno',
//     'Jeep Renegade',
//     'Mercedes Vito',
//     'Nissan Rogue',
//     'Hyundai Grand i10',
//     'Opel Insignia Estate',
//     'Hyundai Accent',
//     'Opel Zafira',
//     'Buick Encore',
//     'Ford Focus Estate',
//     'Chevrolet Tahoe',
//     'Opel Grandland',
//     'Toyota Aygo',
//     'Mazda 2',
//     'Ford Puma',
//     'Toyota RAV4 Hybrid',
//     'Renault Twingo',
//     'Audi A4',
//     'Citroen C3',
//     'Fiat 500 Cabrio',
//     'Peugeot 308',
//     'Seat Arona',
//     'Wild Card',
//     'Opel Mokka-e',
//     'Ford Escape',
//     'Audi Q3',
//     'Vauxhall Crossland X',
//     'Hyundai i30',
//     'Kia Xceed',
//     'Proton Saga',
//     'BMW 1 Series',
//     'Skoda Fabia',
//     'Nissan Kicks',
//     'Kia Ceed Estate',
//     'Ford Mustang',
//     'Mercedes V-Class',
//     'Chevrolet Colorado',
//     'Ford Kuga',
//     'Seat Ibiza',
//     'Fiat 500C Cabrio',
//     'MG HS',
//     'Peugeot 108',
//     'DS DS4',
//     'Jaguar F-Pace',
//     'Skoda Octavia Estate',
//     'Peugeot 308 Estate',
//     'Toyota Prado',
//     'Fiat 500 Hybrid',
//     'Opel Mokka GPS',
//     'Dodge Grand Caravan',
//     'BMW X2',
//     'Chevrolet Suburban',
//     'GAC GS3',
//     'Volkswagen Teramont',
//     'Polestar 2',
//     'Jeep Wrangler',
//     'Fiat Tipo',
//     'Volkswagen Passat Estate',
//     'Citroen e-C3',
//     'Opel Karl',
//     'Kia Niro',
//     'Renault Duster 4x4',
//     'Kia Ceed Sportswagon',
//     'Opel Vivaro',
//     'Chrysler 300',
//     'Nissan Versa',
//     'Toyota Camry',
//     'Vauxhall Corsa',
//     'Honda Jazz',
//     'Jetour Dashing',
//     'Toyota Yaris Sedan',
//     'Citroen C1',
//     'BMW iX1',
//     'Hyundai Staria',
//     'Skoda Kodiaq',
//     'Volkswagen Taigo',
//     'Smart Fortwo',
//     'Nissan X-Trail Hybrid',
//     'Audi Q8',
//     'Range Rover Sport',
//     'Haval Jolion',
//     'Fiat Tipo Estate',
//     'Mitsubishi Pajero',
//     'Renault Kadjar AWD',
//     'Ford Tourneo Custom',
//     'Mitsubishi ASX',
//     'Seat Alhambra',
//     'DR 5',
//     'Kia Rio',
//     'BMW 2 Series',
//     'Toyota Yaris Hybrid',
//     'Hyundai I20',
//     'Audi A3',
//     'Toyota Proace',
//     'Peugeot 308 GPS',
//     'Nissan Micra',
//     'Renault Stepway',
//     'Skoda Kamiq',
//     'Dacia Sandero Stepway',
//     'Suzuki Dzire',
//     'BMW i3',
//     'Kia Stonic',
//     'Seat Leon',
//     'Renault Clio',
//     'Citroen C4 Cactus',
//     'GMC Acadia',
//     'Volkswagen Atlas',
//     'Volkswagen up!',
//     'Peugeot e-2008',
//     'Mitsubishi Mirage',
//     'Ford Ka',
//     'Ora Funky Cat',
//     'Chevrolet Blazer',
//     'Chevrolet Trailblazer',
//     'Hyundai i20',
//     'Geely Okavango',
//     'Citroen Berlingo',
//     'Mercedes C-Class',
//     'Dacia Jogger',
//     'Nissan Leaf',
//     'SEAT Leon Estate',
//     'Kia Carens',
//     'Audi A3 Sportback',
//     'Hyundai Grand I10',
//     'Lexus ES',
//     'Citroen e-C4',
//     'Vauxhall Grandland',
//     'Toyota Land Cruiser Prado 4x4',
//     'Toyota Rush',
//     'Kia Sorento',
//     'Hyundai I10',
//     'Peugeot 508 Estate',
//     'BMW 5 Series',
//     'Toyota Auris',
//     'MG 3',
//     'Buick LaCrosse',
//     'Jeep Avenger',
//     'Skoda Elroq',
//     'BMW 4 Series',
//     'Opel Crossland X',
//     'Ford Ecosport',
//     'Cadillac Escalade',
//     'Fiat 500 Cabrio Cabrio',
//     'Volkswagen UP!',
//     'Lynk & Co 01',
//     'Audi A1',
//     'Peugeot e-3008',
//     'Toyota Land Cruiser',
//     'Volkswagen Transporter',
//     'Seat Ateca',
//     'Nissan Pathfinder',
//     'BMW X3',
//     'Mercedes Citan',
//     'Renault Espace',
//     'Porsche Macan',
//     'Mercedes C-Class AWD',
//     'Ford Galaxy',
//     'Infiniti QX50',
//     'Land Rover Range Rover Sport',
//     'Toyota Landcruiser',
//     'SMART ForTwo',
//     'Renault Scenic',
//     'Toyota Rav 4',
//     'Mercedes A-Class',
//     'BMW X5',
//     'Citroen C4',
//     'Opel - Vauxhall Corsa',
//     'Ford Edge',
//     'Alfa Romeo Stelvio',
//     'Volkswagen Caravelle',
//     'Volkswagen Caddy',
//     'Volkswagen Up',
//     'Volkswagen Golf GPS',
//     'Renault Twingo Electric',
//     'Hyundai i30 Estate',
//     'BMW X5 4x4',
//     'Mini Cooper',
//     'Renault Zoe',
//     'Mini Countryman'
//   ];

//   @override
//   void initState() {
//     super.initState();
//     final filteredTabs = _tabs
//         .where((tab) => widget.selectedServices.contains(tab['service']))
//         .toList();
//     final initialIndex = filteredTabs
//         .indexWhere((tab) => tab['service'] == PredictionService.carRental);
//     _tabController = TabController(
//         length: filteredTabs.length,
//         vsync: this,
//         initialIndex: initialIndex >= 0 ? initialIndex : 0);
//   }

//   @override
//   void dispose() {
//     _destinationController.dispose();
//     _carModelController.dispose();
//     _seatsController.dispose();
//     _capacityController.dispose();
//     _tabController.dispose();
//     super.dispose();
//   }

//   Future<void> _handlePrediction() async {
//     FocusScope.of(context).unfocus();

//     if (_destinationController.text.isEmpty ||
//         _carModelController.text.isEmpty ||
//         _seatsController.text.isEmpty ||
//         _selectedTransmission == null ||
//         _startDate == null ||
//         _endDate == null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Please fill all required fields.')));
//       return;
//     }

//     // حساب عدد الأيام
//     final days = _endDate!.difference(_startDate!).inDays;
//     if (days <= 0) {
//       ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('End date must be after start date.')));
//       return;
//     }

//     setState(() {
//       _isPredicting = true;
//     });

//     try {
//       final result = await AiDioClient().predictCarRentalPrice(
//         carModel: _carModelController.text.trim(),
//         seats: int.tryParse(_seatsController.text) ?? 5,
//         transmission: _selectedTransmission!,
//         capacity: int.tryParse(_capacityController.text) ?? 1,
//         city: _destinationController.text.trim(),
//         date: DateFormat('yyyy-MM-dd').format(_startDate!),
//         days: days,
//         startDate: '',
//         endDate: '',
//       );

//       if (result.containsKey('predicted_prices') &&
//           result['predicted_prices'] is List &&
//           (result['predicted_prices'] as List).isNotEmpty) {
//         predictionResults[PredictionService.carRental] =
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
//     String startDateText = _startDate == null
//         ? 'Enter Pick-up Date'
//         : DateFormat('M/d/yyyy').format(_startDate!);
//     String endDateText = _endDate == null
//         ? 'Enter Drop-off Date'
//         : DateFormat('M/d/yyyy').format(_endDate!);
//     final filteredTabs = _tabs
//         .where((tab) => widget.selectedServices.contains(tab['service']))
//         .toList();

//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       appBar: AppBar(
//         title: const Text('Car Rental'),
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
//             if (selectedService != PredictionService.carRental) {
//               Widget nextScreen;
//               switch (selectedService) {
//                 case PredictionService.flights:
//                   nextScreen = FlightPredictionInputScreen(
//                       onComplete: widget.onComplete,
//                       isLastStep: widget.isLastStep,
//                       selectedServices: widget.selectedServices);
//                   break;
//                 case PredictionService.hotels:
//                   nextScreen = HotelPredictionInputScreen(
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
//                 hintText: 'Enter Destination City',
//                 icon: Icons.location_city_outlined),
//             const SizedBox(height: 15),
//             _buildTappableField(
//                 displayText: startDateText,
//                 icon: Icons.calendar_today_outlined,
//                 onTap: () => _selectStartDate(context),
//                 isHint: _startDate == null),
//             const SizedBox(height: 15),
//             _buildTappableField(
//                 displayText: endDateText,
//                 icon: Icons.calendar_today_outlined,
//                 onTap: () => _selectEndDate(context),
//                 isHint: _endDate == null),
//             const SizedBox(height: 15),
//             _buildSelectableInputField(
//                 controller: _carModelController,
//                 hintText: 'Car Model (e.g., Toyota Corolla)',
//                 icon: Icons.directions_car_outlined,
//                 onSelectIconTap: _selectCarModel,
//                 keyboardType: TextInputType.text),
//             const SizedBox(height: 15),
//             _buildSelectableInputField(
//                 controller: _seatsController,
//                 hintText: 'Number of seats',
//                 icon: Icons.event_seat_outlined,
//                 onSelectIconTap: _selectSeats,
//                 keyboardType: TextInputType.number,
//                 inputFormatters: [FilteringTextInputFormatter.digitsOnly]),
//             const SizedBox(height: 15),
//             _buildTappableField(
//                 displayText: _selectedTransmission ?? 'Transmission',
//                 icon: Icons.settings_input_component_outlined,
//                 onTap: _toggleTransmissionOptions,
//                 isHint: _selectedTransmission == null,
//                 trailingIcon: _showTransmissionOptions
//                     ? Icons.keyboard_arrow_up
//                     : Icons.keyboard_arrow_down),
//             if (_showTransmissionOptions)
//               _buildTransmissionSelectionRow(themeColor),
//             const SizedBox(height: 15),
//             _buildSelectableInputField(
//                 controller: _capacityController,
//                 hintText: 'Capacity (Number of Bags)',
//                 icon: Icons.luggage_outlined,
//                 onSelectIconTap: _selectCapacity,
//                 keyboardType: TextInputType.number,
//                 inputFormatters: [FilteringTextInputFormatter.digitsOnly]),
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

//   Future<void> _selectStartDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//         context: context,
//         firstDate: DateTime.now(),
//         lastDate: DateTime.now().add(const Duration(days: 365 * 2)));
//     if (picked != null && picked != _startDate)
//       setState(() => _startDate = picked);
//   }

//   Future<void> _selectEndDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//         context: context,
//         firstDate: _startDate ?? DateTime.now(),
//         lastDate: DateTime.now().add(const Duration(days: 365 * 2)));
//     if (picked != null &&
//         picked != _endDate &&
//         picked.isAfter(_startDate ?? DateTime.now()))
//       setState(() => _endDate = picked);
//   }

//   void _selectCarModel() {
//     showModalBottomSheet(
//         context: context,
//         builder: (context) => ListView.builder(
//             itemCount: validCarModels.length,
//             itemBuilder: (context, index) => ListTile(
//                 title: Text(validCarModels[index]),
//                 onTap: () {
//                   setState(
//                       () => _carModelController.text = validCarModels[index]);
//                   Navigator.pop(context);
//                 })));
//   }

//   void _selectSeats() {
//     final List<int> seatOptions = [2, 4, 5, 7];
//     showModalBottomSheet(
//         context: context,
//         builder: (context) => ListView.builder(
//             itemCount: seatOptions.length,
//             itemBuilder: (context, index) => ListTile(
//                 title: Text('${seatOptions[index]} Seats'),
//                 onTap: () {
//                   setState(() =>
//                       _seatsController.text = seatOptions[index].toString());
//                   Navigator.pop(context);
//                 })));
//   }

//   void _toggleTransmissionOptions() =>
//       setState(() => _showTransmissionOptions = !_showTransmissionOptions);

//   void _selectTransmission(String type) => setState(() {
//         _selectedTransmission = type;
//         _showTransmissionOptions = false;
//       });

//   void _selectCapacity() {
//     final List<int> capacities = [1, 2, 3, 4];
//     showModalBottomSheet(
//         context: context,
//         builder: (context) => ListView.builder(
//             itemCount: capacities.length,
//             itemBuilder: (context, index) => ListTile(
//                 title: Text('${capacities[index]} Bag(s)'),
//                 onTap: () {
//                   setState(() =>
//                       _capacityController.text = capacities[index].toString());
//                   Navigator.pop(context);
//                 })));
//   }

//   Widget _buildTransmissionSelectionRow(Color themeColor) {
//     const types = ['Manual', 'Automatic'];
//     return Padding(
//         padding: const EdgeInsets.only(top: 10.0, bottom: 5.0),
//         child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: types
//                 .map((typeName) => Expanded(
//                     child: Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 4.0),
//                         child: OutlinedButton(
//                           onPressed: () => _selectTransmission(typeName),
//                           style: OutlinedButton.styleFrom(
//                               foregroundColor: _selectedTransmission == typeName
//                                   ? Colors.white
//                                   : themeColor,
//                               backgroundColor: _selectedTransmission == typeName
//                                   ? themeColor
//                                   : Colors.white,
//                               side: BorderSide(
//                                   color: themeColor.withOpacity(0.5)),
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(8))),
//                           child: Text(typeName),
//                         ))))
//                 .toList()));
//   }

//   Widget _buildInputField(
//       {required TextEditingController controller,
//       required String hintText,
//       required IconData icon}) {
//     return TextField(
//         controller: controller,
//         decoration: InputDecoration(
//             prefixIcon: Icon(icon, color: Colors.grey[700]),
//             hintText: hintText,
//             hintStyle: TextStyle(color: Colors.grey[600]),
//             border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(10),
//                 borderSide: BorderSide.none),
//             fillColor: Colors.grey[200],
//             filled: true));
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
//             decoration: BoxDecoration(
//                 color: Colors.grey[200],
//                 borderRadius: BorderRadius.circular(10)),
//             padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
//             child: Row(children: [
//               Icon(icon, color: Colors.grey[700]),
//               const SizedBox(width: 12),
//               Expanded(
//                   child: Text(displayText,
//                       style: TextStyle(
//                           fontSize: 16,
//                           color: isHint ? Colors.grey[600] : Colors.black87),
//                       overflow: TextOverflow.ellipsis)),
//               if (trailingIcon != null)
//                 Icon(trailingIcon, color: Colors.grey[600], size: 24),
//             ])));
//   }

//   Widget _buildSelectableInputField(
//       {required TextEditingController controller,
//       required String hintText,
//       required IconData icon,
//       required VoidCallback onSelectIconTap,
//       TextInputType keyboardType = TextInputType.text,
//       List<TextInputFormatter>? inputFormatters}) {
//     return TextField(
//         controller: controller,
//         keyboardType: keyboardType,
//         inputFormatters: inputFormatters,
//         decoration: InputDecoration(
//             prefixIcon: Icon(icon, color: Colors.grey[700]),
//             hintText: hintText,
//             hintStyle: TextStyle(color: Colors.grey[600]),
//             suffixIcon: IconButton(
//                 icon: const Icon(Icons.arrow_drop_down_circle_outlined),
//                 color: Colors.grey[600],
//                 onPressed: onSelectIconTap),
//             border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(10),
//                 borderSide: BorderSide.none),
//             fillColor: Colors.grey[200],
//             filled: true));
//   }
// }
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';
import 'package:apptravella/services/api/ai_dio_client.dart';
import 'package:apptravella/services/prediction_service.dart';
import 'flight_prediction_input_screen.dart';
import 'hotel_prediction_input_screen.dart';

class CarRentalPredictionInputScreen extends StatefulWidget {
  final VoidCallback onComplete;
  final bool isLastStep;
  final Set<PredictionService> selectedServices;

  const CarRentalPredictionInputScreen({
    super.key,
    required this.onComplete,
    required this.isLastStep,
    required this.selectedServices,
  });

  @override
  State<CarRentalPredictionInputScreen> createState() =>
      _CarRentalPredictionInputScreenState();
}

class _CarRentalPredictionInputScreenState
    extends State<CarRentalPredictionInputScreen>
    with SingleTickerProviderStateMixin {
  final _destinationController = TextEditingController();
  DateTime? _startDate;
  DateTime? _endDate;
  final _carModelController = TextEditingController();
  final _seatsController = TextEditingController();
  final _capacityController = TextEditingController();
  String? _selectedTransmission;
  bool _showTransmissionOptions = false;
  bool _isPredicting = false;
  late TabController _tabController;

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

  final List<String> validCarModels = [
    'Nissan Sunny',
    'Opel Astra Estate',
    'Nissan Sentra',
    'Cupra Born',
    'Volkswagen Jetta',
    'Lancia Ypsilon',
    'Skoda Karoq',
    'Opel Mokka',
    'Toyota Aygo X',
    'Kia Picanto',
    'Kia Cerato',
    'Toyota RAV4',
    'Kia Ceed',
    'Fiat Panda',
    'Mazda CX-3',
    'Opel Corsa',
    'Renault Kadjar GPS',
    'Kia Pegas',
    'Peugeot 208',
    'Citroen C3 Aircross',
    'Volkswagen Tiguan',
    'Peugeot 5008',
    'Fiat 500',
    'Opel Grandland X',
    'Volkswagen Polo',
    'Renault Express',
    'Toyota Corolla',
    'Volkswagen T-Cross',
    'Hyundai Santa Fe',
    'Nissan Qashqai',
    'Mini Cooper Cabrio',
    'Fiat 500X',
    'Toyota C-HR Hybrid',
    'Chrysler Pacifica',
    'Renault Megane',
    'Volkswagen T-Roc',
    'Fiat 500e',
    'Skoda Scala',
    'Kia Telluride',
    'MG ZS',
    'Hyundai Creta',
    'Ford Taurus',
    'Ford Fusion',
    'Ford Fiesta',
    'Audi Q2',
    'Peugeot 2008',
    'Renault Megane E-Tech',
    'Nissan X-Trail',
    'Opel Mokka-e GPS',
    'Ford Focus',
    'MG EHS',
    'Tesla Model 3',
    'Renault Captur',
    'Peugeot 3008',
    'Renault Duster',
    'Dacia Duster',
    'Toyota Yaris',
    'Chevrolet Spark',
    'Opel Astra',
    'Suzuki DZire',
    'Nissan Altima',
    'Kia Sportage',
    'Hyundai Kona',
    'BMW X1',
    'Mazda 6',
    'Toyota Veloz',
    'BMW 7 Series',
    'BMW 5-Series',
    'Peugeot e-208',
    'Toyota Yaris Cross',
    'Chevrolet Aveo',
    'Hyundai Elantra',
    'Volkswagen Golf',
    'Audi A8',
    'Hyundai i10',
    'Renault Arkana',
    'Audi A6',
    'Toyota Fortuner',
    'Nissan Juke',
    'Tesla Model X',
    'Chevrolet Malibu',
    'Mercedes-Benz S-Class',
    'Alfa Romeo Giulietta',
    'Volvo EX30',
    'Hyundai Tucson',
    'Audi A5 Sportback',
    'Suzuki Baleno',
    'Jeep Renegade',
    'Mercedes Vito',
    'Nissan Rogue',
    'Hyundai Grand i10',
    'Opel Insignia Estate',
    'Hyundai Accent',
    'Opel Zafira',
    'Buick Encore',
    'Ford Focus Estate',
    'Chevrolet Tahoe',
    'Opel Grandland',
    'Toyota Aygo',
    'Mazda 2',
    'Ford Puma',
    'Toyota RAV4 Hybrid',
    'Renault Twingo',
    'Audi A4',
    'Citroen C3',
    'Fiat 500 Cabrio',
    'Peugeot 308',
    'Seat Arona',
    'Wild Card',
    'Opel Mokka-e',
    'Ford Escape',
    'Audi Q3',
    'Vauxhall Crossland X',
    'Hyundai i30',
    'Kia Xceed',
    'Proton Saga',
    'BMW 1 Series',
    'Skoda Fabia',
    'Nissan Kicks',
    'Kia Ceed Estate',
    'Ford Mustang',
    'Mercedes V-Class',
    'Chevrolet Colorado',
    'Ford Kuga',
    'Seat Ibiza',
    'Fiat 500C Cabrio',
    'MG HS',
    'Peugeot 108',
    'DS DS4',
    'Jaguar F-Pace',
    'Skoda Octavia Estate',
    'Peugeot 308 Estate',
    'Toyota Prado',
    'Fiat 500 Hybrid',
    'Opel Mokka GPS',
    'Dodge Grand Caravan',
    'BMW X2',
    'Chevrolet Suburban',
    'GAC GS3',
    'Volkswagen Teramont',
    'Polestar 2',
    'Jeep Wrangler',
    'Fiat Tipo',
    'Volkswagen Passat Estate',
    'Citroen e-C3',
    'Opel Karl',
    'Kia Niro',
    'Renault Duster 4x4',
    'Kia Ceed Sportswagon',
    'Opel Vivaro',
    'Chrysler 300',
    'Nissan Versa',
    'Toyota Camry',
    'Vauxhall Corsa',
    'Honda Jazz',
    'Jetour Dashing',
    'Toyota Yaris Sedan',
    'Citroen C1',
    'BMW iX1',
    'Hyundai Staria',
    'Skoda Kodiaq',
    'Volkswagen Taigo',
    'Smart Fortwo',
    'Nissan X-Trail Hybrid',
    'Audi Q8',
    'Range Rover Sport',
    'Haval Jolion',
    'Fiat Tipo Estate',
    'Mitsubishi Pajero',
    'Renault Kadjar AWD',
    'Ford Tourneo Custom',
    'Mitsubishi ASX',
    'Seat Alhambra',
    'DR 5',
    'Kia Rio',
    'BMW 2 Series',
    'Toyota Yaris Hybrid',
    'Hyundai I20',
    'Audi A3',
    'Toyota Proace',
    'Peugeot 308 GPS',
    'Nissan Micra',
    'Renault Stepway',
    'Skoda Kamiq',
    'Dacia Sandero Stepway',
    'Suzuki Dzire',
    'BMW i3',
    'Kia Stonic',
    'Seat Leon',
    'Renault Clio',
    'Citroen C4 Cactus',
    'GMC Acadia',
    'Volkswagen Atlas',
    'Volkswagen up!',
    'Peugeot e-2008',
    'Mitsubishi Mirage',
    'Ford Ka',
    'Ora Funky Cat',
    'Chevrolet Blazer',
    'Chevrolet Trailblazer',
    'Hyundai i20',
    'Geely Okavango',
    'Citroen Berlingo',
    'Mercedes C-Class',
    'Dacia Jogger',
    'Nissan Leaf',
    'SEAT Leon Estate',
    'Kia Carens',
    'Audi A3 Sportback',
    'Hyundai Grand I10',
    'Lexus ES',
    'Citroen e-C4',
    'Vauxhall Grandland',
    'Toyota Land Cruiser Prado 4x4',
    'Toyota Rush',
    'Kia Sorento',
    'Hyundai I10',
    'Peugeot 508 Estate',
    'BMW 5 Series',
    'Toyota Auris',
    'MG 3',
    'Buick LaCrosse',
    'Jeep Avenger',
    'Skoda Elroq',
    'BMW 4 Series',
    'Opel Crossland X',
    'Ford Ecosport',
    'Cadillac Escalade',
    'Fiat 500 Cabrio Cabrio',
    'Volkswagen UP!',
    'Lynk & Co 01',
    'Audi A1',
    'Peugeot e-3008',
    'Toyota Land Cruiser',
    'Volkswagen Transporter',
    'Seat Ateca',
    'Nissan Pathfinder',
    'BMW X3',
    'Mercedes Citan',
    'Renault Espace',
    'Porsche Macan',
    'Mercedes C-Class AWD',
    'Ford Galaxy',
    'Infiniti QX50',
    'Land Rover Range Rover Sport',
    'Toyota Landcruiser',
    'SMART ForTwo',
    'Renault Scenic',
    'Toyota Rav 4',
    'Mercedes A-Class',
    'BMW X5',
    'Citroen C4',
    'Opel - Vauxhall Corsa',
    'Ford Edge',
    'Alfa Romeo Stelvio',
    'Volkswagen Caravelle',
    'Volkswagen Caddy',
    'Volkswagen Up',
    'Volkswagen Golf GPS',
    'Renault Twingo Electric',
    'Hyundai i30 Estate',
    'BMW X5 4x4',
    'Mini Cooper',
    'Renault Zoe',
    'Mini Countryman'
  ];

  @override
  void initState() {
    super.initState();
    final filteredTabs = _tabs
        .where((tab) => widget.selectedServices.contains(tab['service']))
        .toList();
    final initialIndex = filteredTabs
        .indexWhere((tab) => tab['service'] == PredictionService.carRental);
    _tabController = TabController(
        length: filteredTabs.length,
        vsync: this,
        initialIndex: initialIndex >= 0 ? initialIndex : 0);
  }

  @override
  void dispose() {
    _destinationController.dispose();
    _carModelController.dispose();
    _seatsController.dispose();
    _capacityController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  Future<void> _handlePrediction() async {
    FocusScope.of(context).unfocus();

    if (_destinationController.text.isEmpty ||
        _carModelController.text.isEmpty ||
        _seatsController.text.isEmpty ||
        _selectedTransmission == null ||
        _startDate == null ||
        _endDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please fill all required fields.')));
      return;
    }

    setState(() {
      _isPredicting = true;
    });

    try {
      final result = await AiDioClient().predictCarRentalPrice(
        carModel: _carModelController.text.trim(),
        seats: int.tryParse(_seatsController.text) ?? 5,
        transmission: _selectedTransmission!,
        capacity: int.tryParse(_capacityController.text) ?? 1,
        city: _destinationController.text.trim(),
        startDate: DateFormat('yyyy-MM-dd').format(_startDate!),
        endDate: DateFormat('yyyy-MM-dd').format(_endDate!),
      );

      if (result.containsKey('predicted_prices') &&
          result['predicted_prices'] is List &&
          (result['predicted_prices'] as List).isNotEmpty) {
        predictionResults[PredictionService.carRental] =
            (result['predicted_prices'] as List).first.toString();
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
    String startDateText = _startDate == null
        ? 'Enter Pick-up Date'
        : DateFormat('M/d/yyyy').format(_startDate!);
    String endDateText = _endDate == null
        ? 'Enter Drop-off Date'
        : DateFormat('M/d/yyyy').format(_endDate!);
    final filteredTabs = _tabs
        .where((tab) => widget.selectedServices.contains(tab['service']))
        .toList();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Car Rental'),
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
            if (selectedService != PredictionService.carRental) {
              Widget nextScreen;
              switch (selectedService) {
                case PredictionService.flights:
                  nextScreen = FlightPredictionInputScreen(
                      onComplete: widget.onComplete,
                      isLastStep: widget.isLastStep,
                      selectedServices: widget.selectedServices);
                  break;
                case PredictionService.hotels:
                  nextScreen = HotelPredictionInputScreen(
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
                hintText: 'Enter Destination City',
                icon: Icons.location_city_outlined),
            const SizedBox(height: 15),
            _buildTappableField(
                displayText: startDateText,
                icon: Icons.calendar_today_outlined,
                onTap: () => _selectStartDate(context),
                isHint: _startDate == null),
            const SizedBox(height: 15),
            _buildTappableField(
                displayText: endDateText,
                icon: Icons.calendar_today_outlined,
                onTap: () => _selectEndDate(context),
                isHint: _endDate == null),
            const SizedBox(height: 15),
            _buildSelectableInputField(
                controller: _carModelController,
                hintText: 'Car Model (e.g., Toyota Corolla)',
                icon: Icons.directions_car_outlined,
                onSelectIconTap: _selectCarModel,
                keyboardType: TextInputType.text),
            const SizedBox(height: 15),
            _buildSelectableInputField(
                controller: _seatsController,
                hintText: 'Number of seats',
                icon: Icons.event_seat_outlined,
                onSelectIconTap: _selectSeats,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly]),
            const SizedBox(height: 15),
            _buildTappableField(
                displayText: _selectedTransmission ?? 'Transmission',
                icon: Icons.settings_input_component_outlined,
                onTap: _toggleTransmissionOptions,
                isHint: _selectedTransmission == null,
                trailingIcon: _showTransmissionOptions
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down),
            if (_showTransmissionOptions)
              _buildTransmissionSelectionRow(themeColor),
            const SizedBox(height: 15),
            _buildSelectableInputField(
                controller: _capacityController,
                hintText: 'Capacity (Number of Bags)',
                icon: Icons.luggage_outlined,
                onSelectIconTap: _selectCapacity,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly]),
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

  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 365 * 2)));
    if (picked != null && picked != _startDate)
      setState(() => _startDate = picked);
  }

  Future<void> _selectEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        firstDate: _startDate ?? DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 365 * 2)));
    if (picked != null &&
        picked != _endDate &&
        picked.isAfter(_startDate ?? DateTime.now()))
      setState(() => _endDate = picked);
  }

  void _selectCarModel() {
    showModalBottomSheet(
        context: context,
        builder: (context) => ListView.builder(
            itemCount: validCarModels.length,
            itemBuilder: (context, index) => ListTile(
                title: Text(validCarModels[index]),
                onTap: () {
                  setState(
                      () => _carModelController.text = validCarModels[index]);
                  Navigator.pop(context);
                })));
  }

  void _selectSeats() {
    final List<int> seatOptions = [2, 4, 5, 7];
    showModalBottomSheet(
        context: context,
        builder: (context) => ListView.builder(
            itemCount: seatOptions.length,
            itemBuilder: (context, index) => ListTile(
                title: Text('${seatOptions[index]} Seats'),
                onTap: () {
                  setState(() =>
                      _seatsController.text = seatOptions[index].toString());
                  Navigator.pop(context);
                })));
  }

  void _toggleTransmissionOptions() =>
      setState(() => _showTransmissionOptions = !_showTransmissionOptions);

  void _selectTransmission(String type) => setState(() {
        _selectedTransmission = type;
        _showTransmissionOptions = false;
      });

  void _selectCapacity() {
    final List<int> capacities = [1, 2, 3, 4];
    showModalBottomSheet(
        context: context,
        builder: (context) => ListView.builder(
            itemCount: capacities.length,
            itemBuilder: (context, index) => ListTile(
                title: Text('${capacities[index]} Bag(s)'),
                onTap: () {
                  setState(() =>
                      _capacityController.text = capacities[index].toString());
                  Navigator.pop(context);
                })));
  }

  Widget _buildTransmissionSelectionRow(Color themeColor) {
    const types = ['Manual', 'Automatic'];
    return Padding(
        padding: const EdgeInsets.only(top: 10.0, bottom: 5.0),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: types
                .map((typeName) => Expanded(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: OutlinedButton(
                          onPressed: () => _selectTransmission(typeName),
                          style: OutlinedButton.styleFrom(
                              foregroundColor: _selectedTransmission == typeName
                                  ? Colors.white
                                  : themeColor,
                              backgroundColor: _selectedTransmission == typeName
                                  ? themeColor
                                  : Colors.white,
                              side: BorderSide(
                                  color: themeColor.withOpacity(0.5)),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8))),
                          child: Text(typeName),
                        ))))
                .toList()));
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
            filled: true));
  }
}
