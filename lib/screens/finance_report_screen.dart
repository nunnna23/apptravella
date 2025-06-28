// // import 'package:flutter/material.dart';
// // import 'package:intl/intl.dart';
// // import 'package:travella/services/prediction_service.dart'; // <-- استيراد الملف المركزي
// // import 'predicted_budget_screen.dart';

// // class FinanceReportScreen extends StatelessWidget {
// //   final Set<PredictionService> predictedServices;

// //   const FinanceReportScreen({super.key, required this.predictedServices});

// //   // --- دالة مساعدة لتحويل السعر من نص إلى رقم ---
// //   // تحول "1,260 EGP" إلى 1260.0
// //   double _parsePrice(String? priceString) {
// //     if (priceString == null) return 0.0;
// //     try {
// //       final numericString = priceString.replaceAll(RegExp(r'[^0-9.,]'), '');
// //       return double.parse(numericString.replaceAll(',', ''));
// //     } catch (e) {
// //       print("Error parsing price: $e");
// //       return 0.0;
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     // حساب المجموع الكلي من النتائج الحقيقية المخزنة في الـ Map العام
// //     final double totalSpend = predictionResults.values
// //         .fold(0.0, (sum, item) => sum + _parsePrice(item));

// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('Finance Report'),
// //         leading: IconButton(
// //           icon: const Icon(Icons.close),
// //           tooltip: 'Close Prediction',
// //           onPressed: () {
// //             // العودة إلى الشاشة الرئيسية للتوقع وإزالة كل الشاشات السابقة
// //             Navigator.pushAndRemoveUntil(
// //               context,
// //               MaterialPageRoute(
// //                   builder: (context) => const PredictedBudgetScreen()),
// //               (Route<dynamic> route) => false,
// //             );
// //           },
// //         ),
// //         centerTitle: true,
// //       ),
// //       body: Padding(
// //         padding: const EdgeInsets.all(20.0),
// //         child: Center(
// //           child: Column(
// //             mainAxisAlignment: MainAxisAlignment.center,
// //             crossAxisAlignment: CrossAxisAlignment.center,
// //             children: [
// //               // --- بطاقة المجموع الكلي ---
// //               _buildFinanceCard(
// //                 context: context,
// //                 title: 'Total spend',
// //                 amount: totalSpend,
// //                 isTotal: true,
// //               ),

// //               // --- بطاقات الخدمات الفردية (فقط إذا كان هناك أكثر من خدمة) ---
// //               if (predictedServices.length > 1) ...[
// //                 const SizedBox(height: 25),
// //                 // عرض بطاقة الطيران فقط إذا كانت نتيجته موجودة
// //                 if (predictionResults.containsKey(PredictionService.flights))
// //                   _buildFinanceCard(
// //                     context: context,
// //                     title: 'Flights',
// //                     amount: _parsePrice(
// //                         predictionResults[PredictionService.flights]),
// //                   ),
// //                 const SizedBox(height: 15),
// //                 // عرض بطاقة الفنادق فقط إذا كانت نتيجته موجودة
// //                 if (predictionResults.containsKey(PredictionService.hotels))
// //                   _buildFinanceCard(
// //                     context: context,
// //                     title: 'Hotels',
// //                     amount: _parsePrice(
// //                         predictionResults[PredictionService.hotels]),
// //                   ),
// //                 const SizedBox(height: 15),
// //                 // عرض بطاقة السيارات فقط إذا كانت نتيجته موجودة
// //                 if (predictionResults.containsKey(PredictionService.carRental))
// //                   _buildFinanceCard(
// //                     context: context,
// //                     title: 'Car Rental',
// //                     amount: _parsePrice(
// //                         predictionResults[PredictionService.carRental]),
// //                   ),
// //               ],
// //               const Spacer(),
// //               // --- زر الانتهاء ---
// //               ElevatedButton(
// //                 onPressed: () {
// //                   Navigator.pushAndRemoveUntil(
// //                     context,
// //                     MaterialPageRoute(
// //                         builder: (context) => const PredictedBudgetScreen()),
// //                     (Route<dynamic> route) => false,
// //                   );
// //                 },
// //                 style: ElevatedButton.styleFrom(
// //                   padding:
// //                       const EdgeInsets.symmetric(horizontal: 50, vertical: 14),
// //                 ),
// //                 child: const Text('Done'),
// //               ),
// //               const SizedBox(height: 20),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   // --- الدالة المساعدة لبناء بطاقات عرض السعر ---
// //   Widget _buildFinanceCard({
// //     required BuildContext context,
// //     required String title,
// //     required double amount,
// //     bool isTotal = false,
// //   }) {
// //     // استخدام NumberFormat لتهيئة عرض العملة
// //     final formatCurrency = NumberFormat.currency(
// //       locale: 'en_US',
// //       symbol: 'EGP ',
// //       decimalDigits: 0,
// //     );

// //     return Container(
// //       padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
// //       constraints: const BoxConstraints(minWidth: 280),
// //       decoration: BoxDecoration(
// //         color: Colors.white,
// //         borderRadius: BorderRadius.circular(15),
// //         boxShadow: [
// //           BoxShadow(
// //             color: Colors.grey.withOpacity(0.15),
// //             blurRadius: 10,
// //             spreadRadius: 1,
// //             offset: const Offset(0, 4),
// //           )
// //         ],
// //       ),
// //       child: Column(
// //         mainAxisSize: MainAxisSize.min,
// //         crossAxisAlignment: CrossAxisAlignment.center,
// //         children: [
// //           Text(
// //             title,
// //             style: TextStyle(
// //                 fontSize: 15,
// //                 color: Colors.grey[600],
// //                 fontWeight: FontWeight.w500),
// //           ),
// //           const SizedBox(height: 8),
// //           Text(
// //             formatCurrency.format(amount),
// //             style: TextStyle(
// //               fontSize: isTotal ? 28 : 24,
// //               fontWeight: FontWeight.bold,
// //               color: Theme.of(context).primaryColor,
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:travella/services/prediction_service.dart'; // <-- استيراد الملف المركزي
// import 'predicted_budget_screen.dart';

// class FinanceReportScreen extends StatelessWidget {
//   final Set<PredictionService> predictedServices;

//   const FinanceReportScreen({super.key, required this.predictedServices});

//   // --- دالة مساعدة لتحويل السعر من نص إلى رقم ---
//   double _parsePrice(String? priceString) {
//     if (priceString == null) return 0.0;
//     try {
//       final numericString = priceString.replaceAll(RegExp(r'[^0-9.,]'), '');
//       return double.parse(numericString.replaceAll(',', ''));
//     } catch (e) {
//       print("Error parsing price: $e");
//       return 0.0;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     // حساب المجموع الكلي من النتائج الحقيقية المخزنة في الـ Map العام
//     final double totalSpend = predictionResults.values
//         .fold(0.0, (sum, item) => sum + _parsePrice(item));

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Finance Report'),
//         leading: IconButton(
//           icon: const Icon(Icons.close),
//           tooltip: 'Close Prediction',
//           onPressed: () {
//             Navigator.pushAndRemoveUntil(
//               context,
//               MaterialPageRoute(
//                   builder: (context) => const PredictedBudgetScreen()),
//               (Route<dynamic> route) => false,
//             );
//           },
//         ),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               _buildFinanceCard(
//                 context: context,
//                 title: 'Total spend',
//                 amount: totalSpend,
//                 isTotal: true,
//               ),
//               if (predictedServices.length > 1) ...[
//                 const SizedBox(height: 25),
//                 if (predictionResults.containsKey(PredictionService.flights))
//                   _buildFinanceCard(
//                     context: context,
//                     title: 'Flights',
//                     amount: _parsePrice(
//                         predictionResults[PredictionService.flights]),
//                   ),
//                 const SizedBox(height: 15),
//                 if (predictionResults.containsKey(PredictionService.hotels))
//                   _buildFinanceCard(
//                     context: context,
//                     title: 'Hotels',
//                     amount: _parsePrice(
//                         predictionResults[PredictionService.hotels]),
//                   ),
//                 const SizedBox(height: 15),
//                 if (predictionResults.containsKey(PredictionService.carRental))
//                   _buildFinanceCard(
//                     context: context,
//                     title: 'Car Rental',
//                     amount: _parsePrice(
//                         predictionResults[PredictionService.carRental]),
//                   ),
//               ],
//               const Spacer(),
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.pushAndRemoveUntil(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => const PredictedBudgetScreen()),
//                     (Route<dynamic> route) => false,
//                   );
//                 },
//                 style: ElevatedButton.styleFrom(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 50, vertical: 14),
//                 ),
//                 child: const Text('Done'),
//               ),
//               const SizedBox(height: 20),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildFinanceCard({
//     required BuildContext context,
//     required String title,
//     required double amount,
//     bool isTotal = false,
//   }) {
//     final formatCurrency = NumberFormat.currency(
//       locale: 'en_US',
//       symbol: 'EGP ',
//       decimalDigits: 0,
//     );

//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
//       constraints: const BoxConstraints(minWidth: 280),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(15),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.15),
//             blurRadius: 10,
//             spreadRadius: 1,
//             offset: const Offset(0, 4),
//           )
//         ],
//       ),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Text(
//             title,
//             style: TextStyle(
//                 fontSize: 15,
//                 color: Colors.grey[600],
//                 fontWeight: FontWeight.w500),
//           ),
//           const SizedBox(height: 8),
//           Text(
//             formatCurrency.format(amount),
//             style: TextStyle(
//               fontSize: isTotal ? 28 : 24,
//               fontWeight: FontWeight.bold,
//               color: Theme.of(context).primaryColor,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:apptravella/services/prediction_service.dart'; // <-- استيراد الملف المركزي
import 'predicted_budget_screen.dart';

class FinanceReportScreen extends StatelessWidget {
  final Set<PredictionService> predictedServices;

  const FinanceReportScreen({super.key, required this.predictedServices});

  // --- دالة مساعدة لتحويل السعر من نص إلى رقم ---
  double _parsePrice(String? priceString) {
    if (priceString == null) return 0.0;
    try {
      final numericString = priceString.replaceAll(RegExp(r'[^0-9.,]'), '');
      return double.parse(numericString.replaceAll(',', ''));
    } catch (e) {
      print("Error parsing price: $e");
      return 0.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    // حساب المجموع الكلي من النتائج الحقيقية المخزنة في الـ Map العام
    final double totalSpend = predictionResults.values
        .fold(0.0, (sum, item) => sum + _parsePrice(item));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Finance Report'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          tooltip: 'Close Prediction',
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                  builder: (context) => const PredictedBudgetScreen()),
              (Route<dynamic> route) => false,
            );
          },
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // --- بطاقة المجموع الكلي ---
              _buildFinanceCard(
                context: context,
                title: 'Total spend',
                amount: totalSpend,
                isTotal: true,
              ),

              // --- بطاقات الخدمات الفردية (عرض دائمًا مع التحقق من وجود قيم) ---
              const SizedBox(height: 25),
              if (predictionResults.containsKey(PredictionService.flights) &&
                  _parsePrice(predictionResults[PredictionService.flights]) > 0)
                _buildFinanceCard(
                  context: context,
                  title: 'Flights',
                  amount:
                      _parsePrice(predictionResults[PredictionService.flights]),
                ),
              if (predictionResults.containsKey(PredictionService.hotels) &&
                  _parsePrice(predictionResults[PredictionService.hotels]) > 0)
                const SizedBox(height: 15),
              if (predictionResults.containsKey(PredictionService.hotels) &&
                  _parsePrice(predictionResults[PredictionService.hotels]) > 0)
                _buildFinanceCard(
                  context: context,
                  title: 'Hotels',
                  amount:
                      _parsePrice(predictionResults[PredictionService.hotels]),
                ),
              if (predictionResults.containsKey(PredictionService.carRental) &&
                  _parsePrice(predictionResults[PredictionService.carRental]) >
                      0)
                const SizedBox(height: 15),
              if (predictionResults.containsKey(PredictionService.carRental) &&
                  _parsePrice(predictionResults[PredictionService.carRental]) >
                      0)
                _buildFinanceCard(
                  context: context,
                  title: 'Car Rental',
                  amount: _parsePrice(
                      predictionResults[PredictionService.carRental]),
                ),

              const Spacer(),
              // --- زر الانتهاء ---
              ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PredictedBudgetScreen()),
                    (Route<dynamic> route) => false,
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 14),
                ),
                child: const Text('Done'),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFinanceCard({
    required BuildContext context,
    required String title,
    required double amount,
    bool isTotal = false,
  }) {
    final formatCurrency = NumberFormat.currency(
      locale: 'en_US',
      symbol: 'EGP ',
      decimalDigits: 0,
    );

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      constraints: const BoxConstraints(minWidth: 280),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            blurRadius: 10,
            spreadRadius: 1,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 15,
                color: Colors.grey[600],
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 8),
          Text(
            formatCurrency.format(amount),
            style: TextStyle(
              fontSize: isTotal ? 28 : 24,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
