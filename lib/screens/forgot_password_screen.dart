// import 'package:flutter/material.dart';
// import 'verification_screen.dart';
// //import 'sign_in_screen.dart';
// import 'forgot_password_phone_screen.dart';

// class ForgotPasswordScreen extends StatefulWidget {
//   const ForgotPasswordScreen({super.key});

//   @override
//   State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
// }

// class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
//   final TextEditingController _emailController = TextEditingController();

//   @override
//   void dispose() {
//     _emailController.dispose();
//     super.dispose();
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
//         title: const Text(
//           'Forget Password',
//           style: TextStyle(
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
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               'Email',
//               style: TextStyle(
//                 fontSize: 14,
//                 fontWeight: FontWeight.w500,
//                 color: Colors.black87,
//               ),
//             ),
//             const SizedBox(height: 8),
//             TextFormField(
//               controller: _emailController,
//               keyboardType: TextInputType.emailAddress,
//               decoration: InputDecoration(
//                 hintText: 'Enter Your Email',
//                 prefixIcon: const Icon(
//                   Icons.email_outlined,
//                   color: Colors.grey,
//                 ),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8),
//                   borderSide: const BorderSide(color: Colors.grey),
//                 ),
//                 enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8),
//                   borderSide: const BorderSide(color: Colors.grey),
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8),
//                   borderSide: const BorderSide(color: Color(0xFF4E7D96)),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 24),
//             SizedBox(
//               width: double.infinity,
//               height: 45,
//               child: ElevatedButton(
//                 onPressed: () {
//                   if (_emailController.text.isNotEmpty) {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => VerificationScreen(
//                           isEmail: true,
//                           contactInfo: _emailController.text,
//                         ),
//                       ),
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
//                   'Send Code',
//                   style: TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w600,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 16),
//             Center(
//               child: TextButton(
//                 onPressed: () => Navigator.pop(context),
//                 child: const Text(
//                   'Return To Sign In',
//                   style: TextStyle(
//                     color: Colors.black87,
//                     fontSize: 14,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ),
//             ),
//             const Spacer(),
//             Center(
//               child: TextButton(
//                 onPressed: () {
//                   Navigator.pushReplacement(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => const ForgotPasswordPhoneScreen(),
//                     ),
//                   );
//                 },
//                 child: const Text(
//                   'Use Phone Number Instead',
//                   style: TextStyle(
//                     color: Color(0xFF4E7D96),
//                     fontSize: 14,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:apptravella/services/api/api_endpoints.dart';
import 'package:apptravella/services/api/dio_client.dart';
import 'verification_screen.dart';
import 'forgot_password_phone_screen.dart';
// تأكدي إن الملف ده موجود

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  bool _isLoading = false; // لعرض مؤشر التحميل

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _handleForgotPassword() async {
    // التحقق من أن الإيميل ليس فارغًا
    if (_emailController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter your email'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // التحقق من تنسيق الإيميل
    if (!_emailController.text.contains('@') ||
        !_emailController.text.contains('.')) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a valid email address'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    setState(() {
      _isLoading = true; // بدء التحميل
    });

    try {
      final dioClient = DioClient();
      final response = await dioClient.post(
        ApiEndpoints.forgotPassword,
        data: {
          'email': _emailController.text,
        },
      ).timeout(const Duration(seconds: 30));

      if (!mounted) return;

      if (response.statusCode == 200) {
        // لو الطلب نجح، ننتقل لشاشة التحقق
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VerificationScreen(
              isEmail: true,
              contactInfo: _emailController.text,
              otp: '',
            ),
          ),
        );
      } else {
        // لو فيه خطأ في الاستجابة
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(response.data['message'] ?? 'Failed to send OTP'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } on TimeoutException {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Request timed out. Please try again.'),
          backgroundColor: Colors.red,
        ),
      );
    } on DioException catch (e) {
      if (!mounted) return;
      String errorMessage = 'An error occurred';
      if (e.response != null) {
        errorMessage = e.response!.data['message'] ?? 'Failed to send OTP';
      } else {
        errorMessage = e.message ?? 'Network error';
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorMessage),
          backgroundColor: Colors.red,
        ),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: ${e.toString()}'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false; // إنهاء التحميل
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Forget Password',
          style: TextStyle(
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Email',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: 'Enter Your Email',
                prefixIcon: const Icon(
                  Icons.email_outlined,
                  color: Colors.grey,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Color(0xFF4E7D96)),
                ),
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                onPressed: _isLoading
                    ? null
                    : _handleForgotPassword, // تعطيل الزر أثناء التحميل
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4E7D96),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: _isLoading
                    ? const CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2,
                      )
                    : const Text(
                        'Send Code',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  'Return To Sign In',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const Spacer(),
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ForgotPasswordPhoneScreen(),
                    ),
                  );
                },
                child: const Text(
                  'Use Phone Number Instead',
                  style: TextStyle(
                    color: Color(0xFF4E7D96),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
