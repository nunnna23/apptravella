// import 'package:flutter/material.dart';
// import 'deactivate_success_screen.dart'; // شاشة نجاح التعطيل
// import 'forgot_password_phone_screen.dart'; // شاشة نسيت كلمة المرور (بالهاتف)

// class DeactivateAccountScreen extends StatefulWidget {
//   const DeactivateAccountScreen({super.key});

//   @override
//   State<DeactivateAccountScreen> createState() =>
//       _DeactivateAccountScreenState();
// }

// class _DeactivateAccountScreenState extends State<DeactivateAccountScreen> {
//   final _passwordController = TextEditingController();
//   bool _isPasswordVisible = false;
//   bool _agreeToTerms = false;

//   @override
//   void dispose() {
//     _passwordController.dispose();
//     super.dispose();
//   }

//   void _handleDeactivate() {
//     if (!_agreeToTerms) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//             content: Text('Please agree to the terms and conditions.')),
//       );
//       return;
//     }
//     if (_passwordController.text.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Please enter your password.')),
//       );
//       return;
//     }

//     // --- TODO: التحقق من صحة كلمة المرور الحالية للمستخدم هنا ---
//     // bool isPasswordCorrect = await checkPassword(_passwordController.text);
//     bool isPasswordCorrect = true; // افتراضي للمتابعة

//     // ignore: dead_code
//     // ignore: dead_code
//     // ignore: dead_code
//     // ignore: dead_code
//     if (!isPasswordCorrect) {}

//     // --- TODO: تنفيذ منطق تعطيل الحساب الفعلي (API call) ---
//     print('Deactivating account...');

//     // الانتقال لشاشة النجاح واستبدال الشاشة الحالية
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(builder: (context) => const DeactivateSuccessScreen()),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     const Color primaryColor = Color(0xFF406F89); // اللون الأساسي

//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//         title: const Text('Deactivate Account',
//             style: TextStyle(
//                 color: Colors.black,
//                 fontSize: 18,
//                 fontWeight: FontWeight.w600)),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         // للسماح بالتمرير مع لوحة المفاتيح
//         padding: const EdgeInsets.all(24.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               'Enter Your Password To Deactivate Your Account',
//               style: TextStyle(fontSize: 14, color: Colors.black54),
//             ),
//             const SizedBox(height: 24),
//             const Text(
//               'Password',
//               style: TextStyle(
//                   fontSize: 14,
//                   fontWeight: FontWeight.w500,
//                   color: Colors.black87),
//             ),
//             const SizedBox(height: 8),
//             TextFormField(
//               controller: _passwordController,
//               obscureText: !_isPasswordVisible,
//               decoration: InputDecoration(
//                 hintText: 'Enter Your Password',
//                 prefixIcon: const Icon(Icons.lock_outline, color: Colors.grey),
//                 suffixIcon: IconButton(
//                   icon: Icon(
//                       _isPasswordVisible
//                           ? Icons.visibility
//                           : Icons.visibility_off,
//                       color: Colors.grey),
//                   onPressed: () =>
//                       setState(() => _isPasswordVisible = !_isPasswordVisible),
//                 ),
//                 border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8.0),
//                     borderSide: const BorderSide(color: Colors.grey)),
//                 enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8.0),
//                     borderSide: BorderSide(color: Colors.grey.shade400)),
//                 focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8.0),
//                     borderSide:
//                         const BorderSide(color: primaryColor, width: 1.5)),
//               ),
//             ),
//             // زر نسيت كلمة المرور
//             Align(
//               alignment: Alignment.centerRight,
//               child: TextButton(
//                 onPressed: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) =>
//                               const ForgotPasswordPhoneScreen()));
//                 },
//                 child: const Text('Forget Password?',
//                     style: TextStyle(color: primaryColor, fontSize: 13)),
//               ),
//             ),
//             const SizedBox(height: 16),
//             CheckboxListTile(
//               title: const Text("Agree on terms and conditions",
//                   style: TextStyle(fontSize: 14)),
//               value: _agreeToTerms,
//               onChanged: (newValue) => setState(() {
//                 _agreeToTerms = newValue!;
//               }),
//               controlAffinity: ListTileControlAffinity.leading,
//               contentPadding: EdgeInsets.zero,
//               activeColor: primaryColor,
//             ),
//             const SizedBox(height: 32),
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                 onPressed: _handleDeactivate,
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: primaryColor,
//                   padding: const EdgeInsets.symmetric(vertical: 16),
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12)),
//                   textStyle: const TextStyle(
//                       fontSize: 16, fontWeight: FontWeight.w600),
//                 ),
//                 child: const Text('Deactivate Account'),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// // }
// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'deactivate_success_screen.dart'; // شاشة نجاح التعطيل
// import 'package:travella/services/api/dio_client.dart'; // استيراد DioClient
// import 'package:travella/services/api/api_endpoints.dart'; // استيراد ApiEndpoints
// import 'package:dio/dio.dart'; // استيراد Dio لمعالجة الأخطاء

// class DeactivateAccountScreen extends StatefulWidget {
//   const DeactivateAccountScreen({super.key});

//   @override
//   State<DeactivateAccountScreen> createState() =>
//       _DeactivateAccountScreenState();
// }

// class _DeactivateAccountScreenState extends State<DeactivateAccountScreen> {
//   final _emailController = TextEditingController();
//   bool _agreeToTerms = false;
//   bool _isLoading = false; // لعرض حالة التحميل

//   @override
//   void dispose() {
//     _emailController.dispose();
//     super.dispose();
//   }

//   Future<void> _handleDeactivate() async {
//     if (!_agreeToTerms) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text('Please agree to the terms and conditions.'),
//         ),
//       );
//       return;
//     }
//     if (_emailController.text.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Please enter your email.')),
//       );
//       return;
//     }

//     // التحقق من تنسيق الإيميل
//     if (!_emailController.text.contains('@') ||
//         !_emailController.text.contains('.')) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Please enter a valid email address.')),
//       );
//       return;
//     }

//     setState(() {
//       _isLoading = true; // بدء التحميل
//     });

//     try {
//       final dioClient = DioClient();
//       final response = await dioClient
//           .post(
//             ApiEndpoints.deactivateAccount, // استخدام الـ Endpoint الصحيح
//             data:
//                 _emailController.text, // إرسال الإيميل كـ body (string مباشرة)
//           )
//           .timeout(const Duration(seconds: 30));

//       if (!mounted) return;

//       if (response.statusCode == 200) {
//         // لو الطلب نجح، انتقل لشاشة النجاح
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//               builder: (context) => const DeactivateSuccessScreen()),
//         );
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text(
//                 response.data['message'] ?? 'Failed to deactivate account'),
//             backgroundColor: Colors.red,
//           ),
//         );
//       }
//     } on TimeoutException {
//       if (!mounted) return;
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text('Request timed out. Please try again.'),
//           backgroundColor: Colors.red,
//         ),
//       );
//     } on DioException catch (e) {
//       if (!mounted) return;
//       String errorMessage = 'An error occurred';
//       if (e.response != null) {
//         errorMessage =
//             e.response!.data['message'] ?? 'Failed to deactivate account';
//       } else {
//         errorMessage = e.message ?? 'Network error';
//       }
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text(errorMessage),
//           backgroundColor: Colors.red,
//         ),
//       );
//     } catch (e) {
//       if (!mounted) return;
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Error: ${e.toString()}'),
//           backgroundColor: Colors.red,
//         ),
//       );
//     } finally {
//       if (mounted) {
//         setState(() {
//           _isLoading = false; // إنهاء التحميل
//         });
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     const Color primaryColor = Color(0xFF406F89); // اللون الأساسي

//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//         title: const Text('Deactivate Account',
//             style: TextStyle(
//                 color: Colors.black,
//                 fontSize: 18,
//                 fontWeight: FontWeight.w600)),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(24.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text(
//               'Enter Your Email To Deactivate Your Account',
//               style: TextStyle(fontSize: 14, color: Colors.black54),
//             ),
//             const SizedBox(height: 24),
//             const Text(
//               'Email',
//               style: TextStyle(
//                   fontSize: 14,
//                   fontWeight: FontWeight.w500,
//                   color: Colors.black87),
//             ),
//             const SizedBox(height: 8),
//             TextFormField(
//               controller: _emailController,
//               keyboardType: TextInputType.emailAddress, // تغيير لنوع إيميل
//               decoration: InputDecoration(
//                 hintText: 'Enter Your Email',
//                 prefixIcon:
//                     const Icon(Icons.email_outlined, color: Colors.grey),
//                 border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8.0),
//                     borderSide: const BorderSide(color: Colors.grey)),
//                 enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8.0),
//                     borderSide: BorderSide(color: Colors.grey.shade400)),
//                 focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8.0),
//                     borderSide:
//                         const BorderSide(color: primaryColor, width: 1.5)),
//               ),
//             ),
//             const SizedBox(height: 16),
//             CheckboxListTile(
//               title: const Text("Agree on terms and conditions",
//                   style: TextStyle(fontSize: 14)),
//               value: _agreeToTerms,
//               onChanged: (newValue) => setState(() {
//                 _agreeToTerms = newValue!;
//               }),
//               controlAffinity: ListTileControlAffinity.leading,
//               contentPadding: EdgeInsets.zero,
//               activeColor: primaryColor,
//             ),
//             const SizedBox(height: 32),
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                 onPressed: _isLoading
//                     ? null
//                     : _handleDeactivate, // تعطيل الزر أثناء التحميل
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: primaryColor,
//                   padding: const EdgeInsets.symmetric(vertical: 16),
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12)),
//                   textStyle: const TextStyle(
//                       fontSize: 16, fontWeight: FontWeight.w600),
//                 ),
//                 child: _isLoading
//                     ? const CircularProgressIndicator(
//                         color: Colors.white,
//                         strokeWidth: 2,
//                       )
//                     : const Text('Deactivate Account'),
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
import 'deactivate_success_screen.dart'; // شاشة نجاح التعطيل
import 'package:apptravella/services/api/dio_client.dart'; // استيراد DioClient
import 'package:apptravella/services/api/api_endpoints.dart'; // استيراد ApiEndpoints
import 'package:dio/dio.dart'; // استيراد Dio لمعالجة الأخطاء

class DeactivateAccountScreen extends StatefulWidget {
  const DeactivateAccountScreen({super.key});

  @override
  State<DeactivateAccountScreen> createState() =>
      _DeactivateAccountScreenState();
}

class _DeactivateAccountScreenState extends State<DeactivateAccountScreen> {
  final _emailController = TextEditingController();
  bool _agreeToTerms = false;
  bool _isLoading = false; // لعرض حالة التحميل

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _handleDeactivate() async {
    if (!_agreeToTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please agree to the terms and conditions.'),
        ),
      );
      return;
    }
    if (_emailController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter your email.')),
      );
      return;
    }

    // التحقق من تنسيق الإيميل
    if (!_emailController.text.contains('@') ||
        !_emailController.text.contains('.')) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid email address.')),
      );
      return;
    }

    setState(() {
      _isLoading = true; // بدء التحميل
    });

    try {
      final dioClient = DioClient();
      final response = await dioClient
          .post(
            ApiEndpoints.deactivateAccount, // استخدام الـ Endpoint الصحيح
            data:
                '"${_emailController.text}"', // إرسال الإيميل كـ String مباشرة
          )
          .timeout(const Duration(seconds: 30));

      if (!mounted) return;

      if (response.statusCode == 200) {
        // لو الطلب نجح، انتقل لشاشة النجاح
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => const DeactivateSuccessScreen()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
                response.data['message'] ?? 'Failed to deactivate account'),
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
        errorMessage =
            e.response!.data['message'] ?? 'Failed to deactivate account';
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
    const Color primaryColor = Color(0xFF406F89); // اللون الأساسي

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Deactivate Account',
            style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Enter Your Email To Deactivate Your Account',
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
            const SizedBox(height: 24),
            const Text(
              'Email',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress, // تغيير لنوع إيميل
              decoration: InputDecoration(
                hintText: 'Enter Your Email',
                prefixIcon:
                    const Icon(Icons.email_outlined, color: Colors.grey),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(color: Colors.grey)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide(color: Colors.grey.shade400)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide:
                        const BorderSide(color: primaryColor, width: 1.5)),
              ),
            ),
            const SizedBox(height: 16),
            CheckboxListTile(
              title: const Text("Agree on terms and conditions",
                  style: TextStyle(fontSize: 14)),
              value: _agreeToTerms,
              onChanged: (newValue) => setState(() {
                _agreeToTerms = newValue!;
              }),
              controlAffinity: ListTileControlAffinity.leading,
              contentPadding: EdgeInsets.zero,
              activeColor: primaryColor,
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _isLoading
                    ? null
                    : _handleDeactivate, // تعطيل الزر أثناء التحميل
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  textStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600),
                ),
                child: _isLoading
                    ? const CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2,
                      )
                    : const Text('Deactivate Account'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
