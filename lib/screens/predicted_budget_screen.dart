// // //
// // // lib/screens/predicted_budget_screen.dart

// // import 'package:flutter/material.dart';
// // import 'package:travella/services/prediction_service.dart'; // <-- استيراد الملف المركزي
// // import 'flight_prediction_input_screen.dart';
// // import 'hotel_prediction_input_screen.dart';
// // import 'car_rental_prediction_input_screen.dart';
// // import 'finance_report_screen.dart';

// // class PredictedBudgetScreen extends StatefulWidget {
// //   const PredictedBudgetScreen({super.key});

// //   @override
// //   State<PredictedBudgetScreen> createState() => _PredictedBudgetScreenState();
// // }

// // class _PredictedBudgetScreenState extends State<PredictedBudgetScreen> {
// //   // Set to store selected services
// //   final Set<PredictionService> _selectedServices = {};

// //   // Function to toggle service selection
// //   void _toggleSelection(PredictionService service) {
// //     setState(() {
// //       if (_selectedServices.contains(service)) {
// //         _selectedServices.remove(service);
// //       } else {
// //         _selectedServices.add(service);
// //       }
// //     });
// //   }

// //   // Function called when the 'Predict' button is pressed
// //   void _handlePrediction() {
// //     if (_selectedServices.isEmpty) {
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         const SnackBar(content: Text('Please select at least one service.')),
// //       );
// //       return;
// //     }

// //     // تنظيف النتائج السابقة قبل بدء عملية توقع جديدة
// //     predictionResults.clear();

// //     // Define the sequence based on a standard order (e.g., Flights, Hotels, Car)
// //     // Filter the standard order based on selection.
// //     const standardOrder = [
// //       PredictionService.flights,
// //       PredictionService.hotels,
// //       PredictionService.carRental,
// //     ];
// //     final List<PredictionService> servicesSequence =
// //         standardOrder.where((s) => _selectedServices.contains(s)).toList();

// //     // Start the sequential navigation flow from the first step (index 0)
// //     _navigateToNextPredictionStep(0, servicesSequence);
// //   }

// //   Future<void> _navigateToNextPredictionStep(
// //       int currentIndex, List<PredictionService> servicesSequence) async {
// //     if (currentIndex >= servicesSequence.length) {
// //       Navigator.pushReplacement(
// //         context,
// //         MaterialPageRoute(
// //           builder: (context) =>
// //               FinanceReportScreen(predictedServices: _selectedServices),
// //         ),
// //       );
// //       return;
// //     }

// //     PredictionService currentService = servicesSequence[currentIndex];
// //     bool isLast = currentIndex == servicesSequence.length - 1;

// //     onStepComplete() {
// //       _navigateToNextPredictionStep(currentIndex + 1, servicesSequence);
// //     }

// //     Widget nextScreen;
// //     switch (currentService) {
// //       case PredictionService.flights:
// //         nextScreen = FlightPredictionInputScreen(
// //           onComplete: onStepComplete,
// //           isLastStep: isLast,
// //           selectedServices: _selectedServices,
// //         );
// //         break;
// //       case PredictionService.hotels:
// //         nextScreen = HotelPredictionInputScreen(
// //           onComplete: onStepComplete,
// //           isLastStep: isLast,
// //           selectedServices: _selectedServices,
// //         );
// //         break;
// //       case PredictionService.carRental:
// //         nextScreen = CarRentalPredictionInputScreen(
// //           onComplete: onStepComplete,
// //           isLastStep: isLast,
// //           selectedServices: _selectedServices,
// //         );
// //         break;
// //     }

// //     Navigator.push(
// //         context, MaterialPageRoute(builder: (context) => nextScreen));
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     final themeColor = Theme.of(context).primaryColor;

// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('Predicted Budget'),
// //         elevation: 0,
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.all(20.0),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             const Text(
// //               'Select what you want to predict',
// //               style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
// //             ),
// //             const SizedBox(height: 25),
// //             _buildPredictionOption(
// //               icon: Icons.flight_takeoff,
// //               label: 'Flights',
// //               service: PredictionService.flights,
// //               isSelected: _selectedServices.contains(PredictionService.flights),
// //               themeColor: themeColor,
// //               onTap: () => _toggleSelection(PredictionService.flights),
// //             ),
// //             const SizedBox(height: 15),
// //             _buildPredictionOption(
// //               icon: Icons.hotel,
// //               label: 'Hotels',
// //               service: PredictionService.hotels,
// //               isSelected: _selectedServices.contains(PredictionService.hotels),
// //               themeColor: themeColor,
// //               onTap: () => _toggleSelection(PredictionService.hotels),
// //             ),
// //             const SizedBox(height: 15),
// //             _buildPredictionOption(
// //               icon: Icons.directions_car,
// //               label: 'Car Rental',
// //               service: PredictionService.carRental,
// //               isSelected:
// //                   _selectedServices.contains(PredictionService.carRental),
// //               themeColor: themeColor,
// //               onTap: () => _toggleSelection(PredictionService.carRental),
// //             ),
// //             const Spacer(),
// //             SizedBox(
// //               width: double.infinity,
// //               child: ElevatedButton(
// //                 onPressed: _selectedServices.isEmpty ? null : _handlePrediction,
// //                 child: const Text('Predict'),
// //               ),
// //             ),
// //             const SizedBox(height: 20),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   Widget _buildPredictionOption({
// //     required IconData icon,
// //     required String label,
// //     required PredictionService service,
// //     required bool isSelected,
// //     required Color themeColor,
// //     required VoidCallback onTap,
// //   }) {
// //     return GestureDetector(
// //       onTap: onTap,
// //       child: Container(
// //         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
// //         decoration: BoxDecoration(
// //           color: isSelected ? themeColor : Colors.grey[200],
// //           borderRadius: BorderRadius.circular(12),
// //           boxShadow: isSelected
// //               ? [
// //                   BoxShadow(
// //                     color: themeColor.withOpacity(0.3),
// //                     blurRadius: 5,
// //                     offset: const Offset(0, 2),
// //                   )
// //                 ]
// //               : [],
// //         ),
// //         child: Row(
// //           children: [
// //             Icon(
// //               icon,
// //               color: isSelected ? Colors.white : Colors.grey[800],
// //               size: 28,
// //             ),
// //             const SizedBox(width: 15),
// //             Text(
// //               label,
// //               style: TextStyle(
// //                 fontSize: 18,
// //                 fontWeight: FontWeight.w500,
// //                 color: isSelected ? Colors.white : Colors.black87,
// //               ),
// //             ),
// //             const Spacer(),
// //             if (isSelected)
// //               const Icon(Icons.check_circle, color: Colors.white, size: 24)
// //             else
// //               Icon(Icons.arrow_forward_ios, color: Colors.grey[600], size: 18),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:travella/services/prediction_service.dart'; // <-- استيراد الملف المركزي
// import 'flight_prediction_input_screen.dart';
// import 'hotel_prediction_input_screen.dart';
// import 'car_rental_prediction_input_screen.dart';
// import 'finance_report_screen.dart';

// class PredictedBudgetScreen extends StatefulWidget {
//   const PredictedBudgetScreen({super.key});

//   @override
//   State<PredictedBudgetScreen> createState() => _PredictedBudgetScreenState();
// }

// class _PredictedBudgetScreenState extends State<PredictedBudgetScreen> {
//   // Set to store selected services
//   final Set<PredictionService> _selectedServices = {};

//   // Function to toggle service selection
//   void _toggleSelection(PredictionService service) {
//     setState(() {
//       if (_selectedServices.contains(service)) {
//         _selectedServices.remove(service);
//       } else {
//         _selectedServices.add(service);
//       }
//     });
//   }

//   // Function called when the 'Predict' button is pressed
//   void _handlePrediction() {
//     if (_selectedServices.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Please select at least one service.')),
//       );
//       return;
//     }

//     // تنظيف النتائج السابقة قبل بدء عملية توقع جديدة
//     predictionResults.clear();

//     // Define the sequence based on a standard order (e.g., Flights, Hotels, Car)
//     // Filter the standard order based on selection.
//     const standardOrder = [
//       PredictionService.flights,
//       PredictionService.hotels,
//       PredictionService.carRental,
//     ];
//     final List<PredictionService> servicesSequence =
//         standardOrder.where((s) => _selectedServices.contains(s)).toList();

//     // Start the sequential navigation flow from the first step (index 0)
//     _navigateToNextPredictionStep(0, servicesSequence);
//   }

//   Future<void> _navigateToNextPredictionStep(
//       int currentIndex, List<PredictionService> servicesSequence) async {
//     if (currentIndex >= servicesSequence.length) {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//           builder: (context) =>
//               FinanceReportScreen(predictedServices: _selectedServices),
//         ),
//       );
//       return;
//     }

//     PredictionService currentService = servicesSequence[currentIndex];
//     bool isLast = currentIndex == servicesSequence.length - 1;

//     onStepComplete() {
//       _navigateToNextPredictionStep(currentIndex + 1, servicesSequence);
//     }

//     Widget nextScreen;
//     switch (currentService) {
//       case PredictionService.flights:
//         nextScreen = FlightPredictionInputScreen(
//           onComplete: onStepComplete,
//           isLastStep: isLast,
//           selectedServices: _selectedServices,
//         );
//         break;
//       case PredictionService.hotels:
//         nextScreen = HotelPredictionInputScreen(
//           onComplete: onStepComplete,
//           isLastStep: isLast,
//           selectedServices: _selectedServices,
//         );
//         break;
//       case PredictionService.carRental:
//         nextScreen = CarRentalPredictionInputScreen(
//           onComplete: onStepComplete,
//           isLastStep: isLast,
//           selectedServices: _selectedServices,
//         );
//         break;
//     }

//     Navigator.push(
//         context, MaterialPageRoute(builder: (context) => nextScreen));
//   }

//   @override
//   Widget build(BuildContext context) {
//     final themeColor = Theme.of(context).primaryColor;

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Predicted Budget'),
//         elevation: 0,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               'Select what you want to predict',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
//             ),
//             const SizedBox(height: 25),
//             _buildPredictionOption(
//               icon: Icons.flight_takeoff,
//               label: 'Flights',
//               service: PredictionService.flights,
//               isSelected: _selectedServices.contains(PredictionService.flights),
//               themeColor: themeColor,
//               onTap: () => _toggleSelection(PredictionService.flights),
//             ),
//             const SizedBox(height: 15),
//             _buildPredictionOption(
//               icon: Icons.hotel,
//               label: 'Hotels',
//               service: PredictionService.hotels,
//               isSelected: _selectedServices.contains(PredictionService.hotels),
//               themeColor: themeColor,
//               onTap: () => _toggleSelection(PredictionService.hotels),
//             ),
//             const SizedBox(height: 15),
//             _buildPredictionOption(
//               icon: Icons.directions_car,
//               label: 'Car Rental',
//               service: PredictionService.carRental,
//               isSelected:
//                   _selectedServices.contains(PredictionService.carRental),
//               themeColor: themeColor,
//               onTap: () => _toggleSelection(PredictionService.carRental),
//             ),
//             const Spacer(),
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                 onPressed: _selectedServices.isEmpty ? null : _handlePrediction,
//                 child: const Text('Predict'),
//               ),
//             ),
//             const SizedBox(height: 20),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildPredictionOption({
//     required IconData icon,
//     required String label,
//     required PredictionService service,
//     required bool isSelected,
//     required Color themeColor,
//     required VoidCallback onTap,
//   }) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
//         decoration: BoxDecoration(
//           color: isSelected ? themeColor : Colors.grey[200],
//           borderRadius: BorderRadius.circular(12),
//           boxShadow: isSelected
//               ? [
//                   BoxShadow(
//                     color: themeColor.withOpacity(0.3),
//                     blurRadius: 5,
//                     offset: const Offset(0, 2),
//                   )
//                 ]
//               : [],
//         ),
//         child: Row(
//           children: [
//             Icon(
//               icon,
//               color: isSelected ? Colors.white : Colors.grey[800],
//               size: 28,
//             ),
//             const SizedBox(width: 15),
//             Text(
//               label,
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.w500,
//                 color: isSelected ? Colors.white : Colors.black87,
//               ),
//             ),
//             const Spacer(),
//             if (isSelected)
//               const Icon(Icons.check_circle, color: Colors.white, size: 24)
//             else
//               Icon(Icons.arrow_forward_ios, color: Colors.grey[600], size: 18),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:apptravella/services/prediction_service.dart'; // <-- استيراد الملف المركزي
import 'flight_prediction_input_screen.dart';
import 'hotel_prediction_input_screen.dart';
import 'car_rental_prediction_input_screen.dart';
import 'finance_report_screen.dart';
import 'home_screen.dart'; // استيراد الشاشة الرئيسية

class PredictedBudgetScreen extends StatefulWidget {
  const PredictedBudgetScreen({super.key});

  @override
  State<PredictedBudgetScreen> createState() => _PredictedBudgetScreenState();
}

class _PredictedBudgetScreenState extends State<PredictedBudgetScreen> {
  // Set to store selected services
  final Set<PredictionService> _selectedServices = {};

  // Function to toggle service selection
  void _toggleSelection(PredictionService service) {
    setState(() {
      if (_selectedServices.contains(service)) {
        _selectedServices.remove(service);
      } else {
        _selectedServices.add(service);
      }
    });
  }

  // Function called when the 'Predict' button is pressed
  void _handlePrediction() {
    if (_selectedServices.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select at least one service.')),
      );
      return;
    }

    // تنظيف النتائج السابقة قبل بدء عملية توقع جديدة
    predictionResults.clear();

    // Define the sequence based on a standard order (e.g., Flights, Hotels, Car)
    // Filter the standard order based on selection.
    const standardOrder = [
      PredictionService.flights,
      PredictionService.hotels,
      PredictionService.carRental,
    ];
    final List<PredictionService> servicesSequence =
        standardOrder.where((s) => _selectedServices.contains(s)).toList();

    // Start the sequential navigation flow from the first step (index 0)
    _navigateToNextPredictionStep(0, servicesSequence);
  }

  Future<void> _navigateToNextPredictionStep(
      int currentIndex, List<PredictionService> servicesSequence) async {
    if (currentIndex >= servicesSequence.length) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              FinanceReportScreen(predictedServices: _selectedServices),
        ),
      );
      return;
    }

    PredictionService currentService = servicesSequence[currentIndex];
    bool isLast = currentIndex == servicesSequence.length - 1;

    onStepComplete() {
      _navigateToNextPredictionStep(currentIndex + 1, servicesSequence);
    }

    Widget nextScreen;
    switch (currentService) {
      case PredictionService.flights:
        nextScreen = FlightPredictionInputScreen(
          onComplete: onStepComplete,
          isLastStep: isLast,
          selectedServices: _selectedServices,
        );
        break;
      case PredictionService.hotels:
        nextScreen = HotelPredictionInputScreen(
          onComplete: onStepComplete,
          isLastStep: isLast,
          selectedServices: _selectedServices,
        );
        break;
      case PredictionService.carRental:
        nextScreen = CarRentalPredictionInputScreen(
          onComplete: onStepComplete,
          isLastStep: isLast,
          selectedServices: _selectedServices,
        );
        break;
    }

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => nextScreen));
  }

  @override
  Widget build(BuildContext context) {
    final themeColor = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Predicted Budget'),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          tooltip: 'Back to Home',
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
              (Route<dynamic> route) => false,
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select what you want to predict',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 25),
            _buildPredictionOption(
              icon: Icons.flight_takeoff,
              label: 'Flights',
              service: PredictionService.flights,
              isSelected: _selectedServices.contains(PredictionService.flights),
              themeColor: themeColor,
              onTap: () => _toggleSelection(PredictionService.flights),
            ),
            const SizedBox(height: 15),
            _buildPredictionOption(
              icon: Icons.hotel,
              label: 'Hotels',
              service: PredictionService.hotels,
              isSelected: _selectedServices.contains(PredictionService.hotels),
              themeColor: themeColor,
              onTap: () => _toggleSelection(PredictionService.hotels),
            ),
            const SizedBox(height: 15),
            _buildPredictionOption(
              icon: Icons.directions_car,
              label: 'Car Rental',
              service: PredictionService.carRental,
              isSelected:
                  _selectedServices.contains(PredictionService.carRental),
              themeColor: themeColor,
              onTap: () => _toggleSelection(PredictionService.carRental),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _selectedServices.isEmpty ? null : _handlePrediction,
                child: const Text('Predict'),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildPredictionOption({
    required IconData icon,
    required String label,
    required PredictionService service,
    required bool isSelected,
    required Color themeColor,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        decoration: BoxDecoration(
          color: isSelected ? themeColor : Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: themeColor.withOpacity(0.3),
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  )
                ]
              : [],
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.white : Colors.grey[800],
              size: 28,
            ),
            const SizedBox(width: 15),
            Text(
              label,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: isSelected ? Colors.white : Colors.black87,
              ),
            ),
            const Spacer(),
            if (isSelected)
              const Icon(Icons.check_circle, color: Colors.white, size: 24)
            else
              Icon(Icons.arrow_forward_ios, color: Colors.grey[600], size: 18),
          ],
        ),
      ),
    );
  }
}
