// // import 'package:flutter/material.dart';
// // // استيراد شاشة تأكيد الحجز
// // import 'booking_confirmation_screen.dart';
// // // --- !!! استيراد شاشة إضافة بطاقة جديدة !!! ---
// // import 'add_new_card_screen.dart'; // تأكد من أن المسار صحيح

// // class PaymentSelectionScreen extends StatefulWidget {
// //   // --- FIX: Added const ---
// //   const PaymentSelectionScreen({super.key});

// //   @override
// //   State<PaymentSelectionScreen> createState() => _PaymentSelectionScreenState();
// // }

// // class _PaymentSelectionScreenState extends State<PaymentSelectionScreen> {
// //   String? _selectedPaymentMethod;
// //   final _cvvController = TextEditingController();
// //   final _cvvFocusNode = FocusNode();
// //   bool _showCvvError = false;

// //   // بيانات وهمية للبطاقات
// //   final List<Map<String, dynamic>> _savedCards = [
// //     {
// //       'id': 'mastercard_3075',
// //       'title': 'Mastercard ****3075',
// //       'details': 'Wafaey Khaled\nExpires 11/2026'
// //     },
// //     {
// //       'id': 'mastercard_5321',
// //       'title': 'Mastercard ****5321',
// //       'details': 'Wafaey Khaled\nExpires 11/2026'
// //     },
// //     {
// //       'id': 'visacard_3075',
// //       'title': 'Visacard ****3075',
// //       'details': 'Wafaey Khaled\nExpires 11/2026'
// //     },
// //   ];

// //   @override
// //   void dispose() {
// //     _cvvController.dispose();
// //     _cvvFocusNode.dispose();
// //     super.dispose();
// //   }

// //   // دالة معالجة الحجز
// //   void _handleBooking() {
// //     bool isValid = true;
// //     setState(() {
// //       _showCvvError = false;
// //     });

// //     if (_selectedPaymentMethod == null) {
// //       ScaffoldMessenger.of(context).showSnackBar(
// //           const SnackBar(content: Text('Please select a payment method.')));
// //       isValid = false;
// //     } else if (_selectedPaymentMethod != 'Cash' &&
// //         _selectedPaymentMethod != 'Add New Card') {
// //       if (_cvvController.text.length < 3) {
// //         ScaffoldMessenger.of(context).showSnackBar(
// //             const SnackBar(content: Text('Please enter a valid CVV.')));
// //         setState(() {
// //           _showCvvError = true;
// //         });
// //         _cvvFocusNode.requestFocus();
// //         isValid = false;
// //       }
// //     }

// //     if (isValid) {
// //       print('Booking initiated with method: $_selectedPaymentMethod');
// //       if (_selectedPaymentMethod != 'Cash' &&
// //           _selectedPaymentMethod != 'Add New Card') {
// //         print('CVV entered: ${_cvvController.text}');
// //       }

// //       Navigator.pushAndRemoveUntil(
// //         context,
// //         MaterialPageRoute(
// //             builder: (context) => const BookingConfirmationScreen()),
// //         (Route<dynamic> route) => false,
// //       );
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.white,
// //       appBar: AppBar(
// //         backgroundColor: Colors.white,
// //         elevation: 0,
// //         leading: IconButton(
// //             icon: const Icon(Icons.arrow_back, color: Colors.black),
// //             onPressed: () => Navigator.of(context).pop()),
// //         title: const Text('Select a payment method',
// //             style: TextStyle(color: Colors.black, fontSize: 18)),
// //         centerTitle: true,
// //         actions: [
// //           TextButton(
// //               onPressed: () => Navigator.of(context).pop(),
// //               child: const Text('Cancel',
// //                   style: TextStyle(color: Colors.grey, fontSize: 16)))
// //         ],
// //       ),
// //       body: Padding(
// //         // --- FIX: Added const ---
// //         padding: const EdgeInsets.all(16.0),
// //         child: Column(
// //           children: [
// //             // عرض خيارات الدفع
// //             ..._savedCards.map((card) => _buildPaymentOption(
// //                 title: card['title'],
// //                 subtitle: card['details'],
// //                 value: card['id'],
// //                 needsCvv: true)),
// //             // --- FIX: Added const ---
// //             const SizedBox(height: 12),
// //             _buildPaymentOption(title: 'Cash', value: 'Cash', needsCvv: false),
// //             // --- FIX: Added const ---
// //             const SizedBox(height: 12),
// //             // --- زر إضافة بطاقة جديدة ---
// //             _buildPaymentOption(
// //                 title: 'Add New card',
// //                 value: 'Add New Card',
// //                 needsCvv: false,
// //                 isAction: true),

// //             // --- FIX: Added const ---
// //             const Spacer(), // لدفع الزر للأسفل

// //             // زر الحجز
// //             SizedBox(
// //               width: double.infinity,
// //               child: ElevatedButton(
// //                 onPressed: _handleBooking,
// //                 style: ElevatedButton.styleFrom(
// //                     // --- FIX: Added const ---
// //                     backgroundColor: const Color(0xFF4E7D96),
// //                     // --- FIX: Added const ---
// //                     padding: const EdgeInsets.symmetric(vertical: 16),
// //                     shape: RoundedRectangleBorder(
// //                         borderRadius: BorderRadius.circular(12))),
// //                 // --- FIX: Added const ---
// //                 child: const Text('Book',
// //                     style: TextStyle(
// //                         fontSize: 18,
// //                         fontWeight: FontWeight.bold,
// //                         color: Colors.white)),
// //               ),
// //             ),
// //             // --- FIX: Added const ---
// //             const SizedBox(height: 10),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   // الدالة المساعدة لبناء خيارات الدفع
// //   Widget _buildPaymentOption(
// //       {required String title,
// //       String? subtitle,
// //       required String value,
// //       required bool needsCvv,
// //       bool isAction = false}) {
// //     bool isSelected = _selectedPaymentMethod == value;
// //     Color backgroundColor = isSelected
// //         ? const Color(0xFFCFD8DC).withOpacity(0.7)
// //         : const Color(0xFF4E7D96);
// //     Color contentColor = isSelected ? Colors.black : Colors.white;
// //     if (isAction) {
// //       backgroundColor = const Color(0xFF4E7D96);
// //       contentColor = Colors.white;
// //     }

// //     return GestureDetector(
// //       onTap: () {
// //         // --- !!! التعديل هنا !!! ---
// //         if (isAction) {
// //           // الانتقال إلى شاشة إضافة بطاقة جديدة
// //           Navigator.push(
// //             context,
// //             MaterialPageRoute(builder: (context) => const AddNewCardScreen()),
// //           );
// //         } else {
// //           // المنطق السابق لاختيار طريقة الدفع
// //           setState(() {
// //             _selectedPaymentMethod = value;
// //             _cvvController.clear();
// //             _showCvvError = false;
// //             if (needsCvv) {
// //               WidgetsBinding.instance
// //                   .addPostFrameCallback((_) => _cvvFocusNode.requestFocus());
// //             } else {
// //               _cvvFocusNode.unfocus();
// //             }
// //           });
// //         }
// //         // --- !!! نهاية التعديل !!! ---
// //       },
// //       child: Container(
// //         // --- FIX: Added const ---
// //         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
// //         // --- FIX: Added const ---
// //         margin: const EdgeInsets.only(bottom: 12),
// //         decoration: BoxDecoration(
// //             color: backgroundColor, borderRadius: BorderRadius.circular(10)),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
// //               Flexible(
// //                   child: Text(title,
// //                       style: TextStyle(
// //                           fontSize: 16,
// //                           fontWeight: FontWeight.w500,
// //                           color: contentColor))),
// //               if (!isAction)
// //                 Radio<String>(
// //                     value: value,
// //                     groupValue: _selectedPaymentMethod,
// //                     onChanged: (String? newValue) {
// //                       setState(() {
// //                         _selectedPaymentMethod = newValue;
// //                         _cvvController.clear();
// //                         _showCvvError = false;
// //                         if (needsCvv) {
// //                           WidgetsBinding.instance.addPostFrameCallback(
// //                               (_) => _cvvFocusNode.requestFocus());
// //                         } else {
// //                           _cvvFocusNode.unfocus();
// //                         }
// //                       });
// //                     },
// //                     activeColor: Colors.white,
// //                     fillColor: WidgetStateProperty.resolveWith<Color>(
// //                         (Set<WidgetState> states) =>
// //                             states.contains(WidgetState.selected)
// //                                 ? Colors.white
// //                                 : Colors.white.withOpacity(0.6)),
// //                     visualDensity: VisualDensity.compact,
// //                     materialTapTargetSize: MaterialTapTargetSize.shrinkWrap)
// //             ]),
// //             if (subtitle != null && !isAction) ...[
// //               const SizedBox(height: 6),
// //               Text(subtitle,
// //                   style: TextStyle(
// //                       fontSize: 13,
// //                       color: contentColor.withOpacity(0.9),
// //                       height: 1.3))
// //             ],
// //             if (isSelected && needsCvv) ...[
// //               // حقل CVV
// //               // --- FIX: Added const ---
// //               const SizedBox(height: 12),
// //               SizedBox(
// //                   height: 45,
// //                   child: TextField(
// //                       controller: _cvvController,
// //                       focusNode: _cvvFocusNode,
// //                       keyboardType: TextInputType.number,
// //                       maxLength: 3,
// //                       obscureText: true,
// //                       style: const TextStyle(color: Colors.black, fontSize: 14),
// //                       decoration: InputDecoration(
// //                           hintText: 'Enter CVV',
// //                           hintStyle:
// //                               TextStyle(color: Colors.grey[500], fontSize: 14),
// //                           counterText: "",
// //                           isDense: true,
// //                           contentPadding: const EdgeInsets.symmetric(
// //                               horizontal: 12, vertical: 12),
// //                           filled: true,
// //                           fillColor: Colors.white,
// //                           border: OutlineInputBorder(
// //                               borderRadius: BorderRadius.circular(6),
// //                               borderSide: BorderSide(
// //                                   color: _showCvvError
// //                                       ? Colors.red
// //                                       : Colors.grey[400]!)),
// //                           enabledBorder: OutlineInputBorder(
// //                               borderRadius: BorderRadius.circular(6),
// //                               borderSide: BorderSide(
// //                                   color: _showCvvError
// //                                       ? Colors.red
// //                                       : Colors.grey[400]!,
// //                                   width: _showCvvError ? 1.5 : 1.0)),
// //                           focusedBorder: OutlineInputBorder(
// //                               borderRadius: BorderRadius.circular(6),
// //                               borderSide: BorderSide(
// //                                   color: _showCvvError
// //                                       ? Colors.red
// //                                       : Colors.blueAccent,
// //                                   width: 1.5))))),
// //               // --- FIX: Added const ---
// //               const SizedBox(height: 5),
// //             ]
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// // lib/screens/payment_selection_screen.dart
// import 'package:flutter/material.dart';

// class PaymentSelectionScreen extends StatelessWidget {
//   final String sessionId;

//   const PaymentSelectionScreen(
//       {super.key, required this.sessionId, required String checkoutUrl});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Payment Selection'),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () => Navigator.pop(context),
//         ),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text('Checkout Session ID: $sessionId'),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 // هنا يمكنك إضافة منطق الدفع (مثل توجيه إلى بوابة دفع مثل Stripe)
//                 ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//                   content: Text('Payment processing not implemented yet.'),
//                 ));
//               },
//               child: const Text('Proceed to Pay'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PaymentSelectionScreen extends StatefulWidget {
  // تم تغيير الاسم ليكون أوضح
  final String checkoutUrl;

  const PaymentSelectionScreen({
    super.key,
    required this.checkoutUrl,
    required String sessionId,
  });

  @override
  State<PaymentSelectionScreen> createState() => _PaymentSelectionScreenState();
}

class _PaymentSelectionScreenState extends State<PaymentSelectionScreen> {
  @override
  void initState() {
    super.initState();
    // نقوم بفتح الرابط فوراً عند بناء الشاشة
    // WidgetsBinding.instance.addPostFrameCallback ensures that the build is complete
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _launchURL();
    });
  }

  Future<void> _launchURL() async {
    // التأكد من أن الرابط غير فارغ
    if (widget.checkoutUrl.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid payment URL provided.')),
      );
      Navigator.of(context).pop(); // الرجوع للشاشة السابقة
      return;
    }

    final Uri url = Uri.parse(widget.checkoutUrl);

    try {
      // محاولة فتح الرابط في المتصفح الخارجي
      if (await canLaunchUrl(url)) {
        await launchUrl(url, mode: LaunchMode.externalApplication);
        // بعد الفتح بنجاح، يمكننا الرجوع للشاشة السابقة أو فعل أي شيء آخر
        // حالياً، سنترك المستخدم في المتصفح ونبقي التطبيق في الخلفية
      } else {
        throw 'Could not launch ${url.toString()}';
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to open payment page: $e')),
      );
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    // هذه الشاشة ستكون مجرد شاشة تحميل مؤقتة
    return Scaffold(
      appBar: AppBar(
        title: const Text('Redirecting to Payment'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 20),
            Text(
              'Please wait, redirecting to our secure payment gateway...',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
