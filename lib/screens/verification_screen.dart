// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'sign_in_screen.dart';
// //import 'create_new_password_screen.dart';
// import 'home_screen.dart';

// class VerificationScreen extends StatefulWidget {
//   final bool isEmail;
//   final String contactInfo;

//   const VerificationScreen({
//     super.key,
//     required this.isEmail,
//     required this.contactInfo,
//     required String otp,
//   });

//   @override
//   State<VerificationScreen> createState() => _VerificationScreenState();
// }

// class _VerificationScreenState extends State<VerificationScreen> {
//   final List<TextEditingController> _controllers = List.generate(
//     4,
//     (index) => TextEditingController(),
//   );

//   final List<FocusNode> _focusNodes = List.generate(
//     4,
//     (index) => FocusNode(),
//   );

//   @override
//   void dispose() {
//     for (var controller in _controllers) {
//       controller.dispose();
//     }
//     for (var node in _focusNodes) {
//       node.dispose();
//     }
//     super.dispose();
//   }

//   void _onCodeChanged(String value, int index) {
//     if (value.length == 1 && index < 3) {
//       _focusNodes[index + 1].requestFocus();
//     }
//   }

//   bool _validateCode() {
//     String code = _controllers.map((c) => c.text).join();
//     return code.length == 4;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () => Navigator.pop(context),
//         ),
//         title: Text(
//           widget.isEmail ? 'Verify Email Address' : 'Verify Phone Number',
//           style: const TextStyle(
//             color: Colors.black,
//             fontSize: 18,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(24),
//         child: Column(
//           children: [
//             Text(
//               'Please Enter The Verification Code',
//               style: TextStyle(
//                 fontSize: 14,
//                 color: Colors.black.withOpacity(0.7),
//               ),
//             ),
//             const SizedBox(height: 40),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: List.generate(
//                 4,
//                 (index) => SizedBox(
//                   width: 60,
//                   height: 60,
//                   child: TextFormField(
//                     controller: _controllers[index],
//                     focusNode: _focusNodes[index],
//                     keyboardType: TextInputType.number,
//                     textAlign: TextAlign.center,
//                     style: const TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                     ),
//                     inputFormatters: [
//                       LengthLimitingTextInputFormatter(1),
//                       FilteringTextInputFormatter.digitsOnly,
//                     ],
//                     decoration: InputDecoration(
//                       filled: true,
//                       fillColor: Colors.grey[200],
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(8),
//                         borderSide: BorderSide.none,
//                       ),
//                     ),
//                     onChanged: (value) => _onCodeChanged(value, index),
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 16),
//             Text(
//               'Resend Code in 1:23',
//               style: TextStyle(
//                 fontSize: 12,
//                 color: Colors.black.withOpacity(0.5),
//               ),
//             ),
//             const SizedBox(height: 24),
//             SizedBox(
//               width: double.infinity,
//               height: 45,
//               child: ElevatedButton(
//                 onPressed: () {
//                   if (_validateCode()) {
//                     Navigator.pushAndRemoveUntil(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => const HomeScreen(),
//                       ),
//                       (route) => false,
//                     );
//                   }
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color(0xFF4E7D96),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                 ),
//                 child: const Text(
//                   'Verify',
//                   style: TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w600,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 16),
//             TextButton(
//               onPressed: () {},
//               child: Text(
//                 "Didn't Receive The Code ?",
//                 style: TextStyle(
//                   color: Colors.black.withOpacity(0.7),
//                   fontSize: 12,
//                 ),
//               ),
//             ),
//             const Spacer(),
//             TextButton(
//               onPressed: () {
//                 // Pop current screen and push new sign in screen with opposite method
//                 Navigator.pushReplacement(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) =>
//                         SignInScreen(isEmailSignIn: !widget.isEmail),
//                   ),
//                 );
//               },
//               child: Text(
//                 widget.isEmail
//                     ? 'Use Phone Number Instead'
//                     : 'Use Email Address Instead',
//                 style: const TextStyle(
//                   color: Color(0xFF4E7D96),
//                   fontSize: 14,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'sign_in_screen.dart';
import 'home_screen.dart';

class VerificationScreen extends StatefulWidget {
  final bool isEmail;
  final String contactInfo;

  const VerificationScreen({
    super.key,
    required this.isEmail,
    required this.contactInfo,
    required String otp,
  });

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  final List<TextEditingController> _controllers = List.generate(
    6,
    (index) => TextEditingController(),
  );

  final List<FocusNode> _focusNodes = List.generate(
    6,
    (index) => FocusNode(),
  );

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _onCodeChanged(String value, int index) {
    if (value.length == 1 && index < 5) {
      _focusNodes[index + 1].requestFocus();
    }
  }

  bool _validateCode() {
    String code = _controllers.map((c) => c.text).join();
    return code.length == 6;
  }

  @override
  Widget build(BuildContext context) {
    // استخدام MediaQuery للحصول على أبعاد الشاشة
    final double screenWidth = MediaQuery.of(context).size.width;
    final double boxSize = screenWidth * 0.1; // 10% من عرض الشاشة لكل خانة
    final double fontSize = boxSize * 0.5; // حجم النص بناءً على حجم الخانة

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          widget.isEmail ? 'Verify Email Address' : 'Verify Phone Number',
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Text(
              'Please Enter The Verification Code',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black.withOpacity(0.7),
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                6,
                (index) => SizedBox(
                  width: boxSize, // حجم ديناميكي
                  height: boxSize, // حجم ديناميكي
                  child: TextFormField(
                    controller: _controllers[index],
                    focusNode: _focusNodes[index],
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: fontSize, // حجم النص ديناميكي
                      fontWeight: FontWeight.bold,
                    ),
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onChanged: (value) => _onCodeChanged(value, index),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Resend Code in 1:23',
              style: TextStyle(
                fontSize: 12,
                color: Colors.black.withOpacity(0.5),
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                onPressed: () {
                  if (_validateCode()) {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ),
                      (route) => false,
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4E7D96),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Verify',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {},
              child: Text(
                "Didn't Receive The Code ?",
                style: TextStyle(
                  color: Colors.black.withOpacity(0.7),
                  fontSize: 12,
                ),
              ),
            ),
            const Spacer(),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        SignInScreen(isEmailSignIn: !widget.isEmail),
                  ),
                );
              },
              child: Text(
                widget.isEmail
                    ? 'Use Phone Number Instead'
                    : 'Use Email Address Instead',
                style: const TextStyle(
                  color: Color(0xFF4E7D96),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
