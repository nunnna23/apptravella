// import 'package:flutter/material.dart';
// import 'password_changed_screen.dart';

// class CreateNewPasswordScreen extends StatefulWidget {
//   const CreateNewPasswordScreen({super.key});

//   @override
//   State<CreateNewPasswordScreen> createState() =>
//       _CreateNewPasswordScreenState();
// }

// class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _confirmPasswordController =
//       TextEditingController();
//   bool _isPasswordVisible = false;
//   bool _isConfirmPasswordVisible = false;

//   bool _hasMinLength = false;
//   bool _hasNumber = false;
//   bool _hasUpperAndLowerCase = false;

//   @override
//   void dispose() {
//     _passwordController.dispose();
//     _confirmPasswordController.dispose();
//     super.dispose();
//   }

//   void _checkPasswordStrength(String password) {
//     setState(() {
//       _hasMinLength = password.length >= 8;
//       _hasNumber = password.contains(RegExp(r'[0-9]'));
//       _hasUpperAndLowerCase = password.contains(RegExp(r'[A-Z]')) &&
//           password.contains(RegExp(r'[a-z]'));
//     });
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
//           'Create New Password',
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
//               'New Password',
//               style: TextStyle(
//                 fontSize: 14,
//                 fontWeight: FontWeight.w500,
//                 color: Colors.black87,
//               ),
//             ),
//             const SizedBox(height: 8),
//             TextFormField(
//               controller: _passwordController,
//               obscureText: !_isPasswordVisible,
//               onChanged: _checkPasswordStrength,
//               decoration: InputDecoration(
//                 hintText: 'Enter Your New Password',
//                 prefixIcon: const Icon(
//                   Icons.lock_outline,
//                   color: Colors.grey,
//                 ),
//                 suffixIcon: IconButton(
//                   icon: Icon(
//                     _isPasswordVisible
//                         ? Icons.visibility
//                         : Icons.visibility_off,
//                     color: Colors.grey,
//                   ),
//                   onPressed: () {
//                     setState(() {
//                       _isPasswordVisible = !_isPasswordVisible;
//                     });
//                   },
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
//             const SizedBox(height: 16),
//             const Text(
//               'Confirm Password',
//               style: TextStyle(
//                 fontSize: 14,
//                 fontWeight: FontWeight.w500,
//                 color: Colors.black87,
//               ),
//             ),
//             const SizedBox(height: 8),
//             TextFormField(
//               controller: _confirmPasswordController,
//               obscureText: !_isConfirmPasswordVisible,
//               decoration: InputDecoration(
//                 hintText: 'Confirm Password',
//                 prefixIcon: const Icon(
//                   Icons.lock_outline,
//                   color: Colors.grey,
//                 ),
//                 suffixIcon: IconButton(
//                   icon: Icon(
//                     _isConfirmPasswordVisible
//                         ? Icons.visibility
//                         : Icons.visibility_off,
//                     color: Colors.grey,
//                   ),
//                   onPressed: () {
//                     setState(() {
//                       _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
//                     });
//                   },
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
//             _PasswordRequirement(
//               text: 'At Least 8 Character',
//               isMet: _hasMinLength,
//             ),
//             const SizedBox(height: 8),
//             _PasswordRequirement(
//               text: 'At Least 1 Number',
//               isMet: _hasNumber,
//             ),
//             const SizedBox(height: 8),
//             _PasswordRequirement(
//               text: 'Both Upper & Lowercase Letter',
//               isMet: _hasUpperAndLowerCase,
//             ),
//             const SizedBox(height: 32),
//             SizedBox(
//               width: double.infinity,
//               height: 45,
//               child: ElevatedButton(
//                 onPressed: () {
//                   if (_hasMinLength &&
//                       _hasNumber &&
//                       _hasUpperAndLowerCase &&
//                       _passwordController.text ==
//                           _confirmPasswordController.text) {
//                     Navigator.pushReplacement(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => const PasswordChangedScreen(),
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
//                   'Reset Password',
//                   style: TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w600,
//                     color: Colors.white,
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

// class _PasswordRequirement extends StatelessWidget {
//   final String text;
//   final bool isMet;

//   const _PasswordRequirement({
//     required this.text,
//     required this.isMet,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Icon(
//           isMet ? Icons.check_circle : Icons.check_circle_outline,
//           color: const Color(0xFF4CAF50),
//           size: 20,
//         ),
//         const SizedBox(width: 8),
//         Text(
//           text,
//           style: const TextStyle(
//             fontSize: 12,
//             color: Color(0xFF4CAF50),
//           ),
//         ),
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:apptravella/services/api/api_endpoints.dart';
import 'package:apptravella/services/api/dio_client.dart';
import 'password_changed_screen.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  State<CreateNewPasswordScreen> createState() =>
      _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  bool _hasMinLength = false;
  bool _hasNumber = false;
  bool _hasUpperAndLowerCase = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _checkPasswordStrength(String password) {
    setState(() {
      _hasMinLength = password.length >= 8;
      _hasNumber = password.contains(RegExp(r'[0-9]'));
      _hasUpperAndLowerCase = password.contains(RegExp(r'[A-Z]')) &&
          password.contains(RegExp(r'[a-z]'));
    });
  }

  Future<void> _changePassword() async {
    // Validate inputs
    if (_emailController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter your email.')),
      );
      return;
    }
    if (!_hasMinLength || !_hasNumber || !_hasUpperAndLowerCase) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Password does not meet requirements.')),
      );
      return;
    }
    if (_passwordController.text != _confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Passwords do not match.')),
      );
      return;
    }

    try {
      // Prepare the request body
      final data = {
        "email": _emailController.text,
        "newPassword": _passwordController.text,
        "confirmPassword": _confirmPasswordController.text,
      };

      // Send the POST request using DioClient
      final response = await DioClient().post(
        ApiEndpoints.resetPassword,
        data: data,
      );

      // Check if the request was successful
      if (response.statusCode == 200) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const PasswordChangedScreen(),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to reset password: ${response.data}')),
        );
      }
    } on DioException catch (e) {
      // Handle Dio-specific errors
      String errorMessage = 'Failed to reset password.';
      if (e.response != null) {
        errorMessage = e.response!.data.toString();
      } else {
        errorMessage = e.message ?? errorMessage;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );
    } catch (e) {
      // Handle any other errors
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An error occurred: $e')),
      );
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
          'Create New Password',
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
            const SizedBox(height: 16),
            const Text(
              'New Password',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _passwordController,
              obscureText: !_isPasswordVisible,
              onChanged: _checkPasswordStrength,
              decoration: InputDecoration(
                hintText: 'Enter Your New Password',
                prefixIcon: const Icon(
                  Icons.lock_outline,
                  color: Colors.grey,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
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
            const SizedBox(height: 16),
            const Text(
              'Confirm Password',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _confirmPasswordController,
              obscureText: !_isConfirmPasswordVisible,
              decoration: InputDecoration(
                hintText: 'Confirm Password',
                prefixIcon: const Icon(
                  Icons.lock_outline,
                  color: Colors.grey,
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _isConfirmPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    setState(() {
                      _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                    });
                  },
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
            _PasswordRequirement(
              text: 'At Least 8 Characters',
              isMet: _hasMinLength,
            ),
            const SizedBox(height: 8),
            _PasswordRequirement(
              text: 'At Least 1 Number',
              isMet: _hasNumber,
            ),
            const SizedBox(height: 8),
            _PasswordRequirement(
              text: 'Both Upper & Lowercase Letter',
              isMet: _hasUpperAndLowerCase,
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                onPressed: _changePassword,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4E7D96),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Reset Password',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
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

class _PasswordRequirement extends StatelessWidget {
  final String text;
  final bool isMet;

  const _PasswordRequirement({
    required this.text,
    required this.isMet,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          isMet ? Icons.check_circle : Icons.check_circle_outline,
          color: const Color(0xFF4CAF50),
          size: 20,
        ),
        const SizedBox(width: 8),
        Text(
          text,
          style: const TextStyle(
            fontSize: 12,
            color: Color(0xFF4CAF50),
          ),
        ),
      ],
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:dio/dio.dart';
// import 'package:apptravella/services/api/api_endpoints.dart';
// import 'package:apptravella/services/api/dio_client.dart';
// import 'password_changed_screen.dart';

// class CreateNewPasswordScreen extends StatefulWidget {
//   const CreateNewPasswordScreen({super.key});

//   @override
//   State<CreateNewPasswordScreen> createState() =>
//       _CreateNewPasswordScreenState();
// }

// class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
//   // 1. استخدام Form للتحقق من المدخلات
//   final _formKey = GlobalKey<FormState>();
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();
//   final _confirmPasswordController = TextEditingController();

//   bool _isPasswordVisible = false;
//   bool _isConfirmPasswordVisible = false;

//   // 2. متغير لتتبع حالة التحميل
//   bool _isLoading = false;

//   bool _hasMinLength = false;
//   bool _hasNumber = false;
//   bool _hasUpperAndLowerCase = false;

//   @override
//   void dispose() {
//     _emailController.dispose();
//     _passwordController.dispose();
//     _confirmPasswordController.dispose();
//     super.dispose();
//   }

//   void _checkPasswordStrength(String password) {
//     setState(() {
//       _hasMinLength = password.length >= 8;
//       _hasNumber = password.contains(RegExp(r'[0-9]'));
//       _hasUpperAndLowerCase = password.contains(RegExp(r'[A-Z]')) &&
//           password.contains(RegExp(r'[a-z]'));
//     });
//   }

//   Future<void> _changePassword() async {
//     // التحقق من صلاحية كل الحقول باستخدام Form
//     if (!_formKey.currentState!.validate()) {
//       return;
//     }

//     setState(() {
//       _isLoading = true; // بدء التحميل
//     });

//     try {
//       final data = {
//         "email": _emailController.text,
//         "newPassword": _passwordController.text,
//         "confirmPassword": _confirmPasswordController.text,
//       };

//       final response = await DioClient().post(
//         ApiEndpoints.resetPassword,
//         data: data,
//       );

//       if (response.statusCode == 200) {
//         // التحقق من أن context ما زال موجوداً قبل الانتقال
//         if (mounted) {
//           Navigator.pushReplacement(
//             context,
//             MaterialPageRoute(
//               builder: (context) => const PasswordChangedScreen(),
//             ),
//           );
//         }
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Failed to reset password: ${response.data}')),
//         );
//       }
//     } on DioException catch (e) {
//       String errorMessage = 'Failed to reset password.';
//       if (e.response != null) {
//         errorMessage = e.response!.data.toString();
//       } else {
//         errorMessage = e.message ?? errorMessage;
//       }
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(errorMessage)),
//       );
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('An error occurred: $e')),
//       );
//     } finally {
//       // إيقاف التحميل سواء نجح الطلب أو فشل
//       if (mounted) {
//         setState(() {
//           _isLoading = false;
//         });
//       }
//     }
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
//           'Create New Password',
//           style: TextStyle(
//             color: Colors.black,
//             fontSize: 18,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         centerTitle: true,
//       ),
//       // 3. استخدام SingleChildScrollView لجعل الشاشة قابلة للتمرير
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(24),
//           // 4. استخدام Form widget
//           child: Form(
//             key: _formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text(
//                   'Email',
//                   style: TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w500,
//                     color: Colors.black87,
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//                 TextFormField(
//                   controller: _emailController,
//                   keyboardType: TextInputType.emailAddress,
//                   autovalidateMode: AutovalidateMode.onUserInteraction,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter your email.';
//                     }
//                     if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
//                       return 'Please enter a valid email address.';
//                     }
//                     return null;
//                   },
//                   decoration: InputDecoration(
//                     hintText: 'Enter Your Email',
//                     prefixIcon: const Icon(
//                       Icons.email_outlined,
//                       color: Colors.grey,
//                     ),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(8),
//                       borderSide: const BorderSide(color: Colors.grey),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(8),
//                       borderSide: const BorderSide(color: Colors.grey),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(8),
//                       borderSide: const BorderSide(color: Color(0xFF4E7D96)),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 16),
//                 const Text(
//                   'New Password',
//                   style: TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w500,
//                     color: Colors.black87,
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//                 TextFormField(
//                   controller: _passwordController,
//                   obscureText: !_isPasswordVisible,
//                   onChanged: _checkPasswordStrength,
//                   autovalidateMode: AutovalidateMode.onUserInteraction,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter a new password.';
//                     }
//                     if (value.length < 8) {
//                       return 'Password must be at least 8 characters.';
//                     }
//                     return null;
//                   },
//                   decoration: InputDecoration(
//                     hintText: 'Enter Your New Password',
//                     prefixIcon: const Icon(
//                       Icons.lock_outline,
//                       color: Colors.grey,
//                     ),
//                     suffixIcon: IconButton(
//                       icon: Icon(
//                         _isPasswordVisible
//                             ? Icons.visibility
//                             : Icons.visibility_off,
//                         color: Colors.grey,
//                       ),
//                       onPressed: () {
//                         setState(() {
//                           _isPasswordVisible = !_isPasswordVisible;
//                         });
//                       },
//                     ),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 16),
//                 const Text(
//                   'Confirm Password',
//                   style: TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w500,
//                     color: Colors.black87,
//                   ),
//                 ),
//                 const SizedBox(height: 8),
//                 TextFormField(
//                   controller: _confirmPasswordController,
//                   obscureText: !_isConfirmPasswordVisible,
//                   autovalidateMode: AutovalidateMode.onUserInteraction,
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please confirm your password.';
//                     }
//                     if (value != _passwordController.text) {
//                       return 'Passwords do not match.';
//                     }
//                     return null;
//                   },
//                   decoration: InputDecoration(
//                     hintText: 'Confirm Password',
//                     prefixIcon: const Icon(
//                       Icons.lock_outline,
//                       color: Colors.grey,
//                     ),
//                     suffixIcon: IconButton(
//                       icon: Icon(
//                         _isConfirmPasswordVisible
//                             ? Icons.visibility
//                             : Icons.visibility_off,
//                         color: Colors.grey,
//                       ),
//                       onPressed: () {
//                         setState(() {
//                           _isConfirmPasswordVisible =
//                               !_isConfirmPasswordVisible;
//                         });
//                       },
//                     ),
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 24),
//                 _PasswordRequirement(
//                   text: 'At Least 8 Characters',
//                   isMet: _hasMinLength,
//                 ),
//                 const SizedBox(height: 8),
//                 _PasswordRequirement(
//                   text: 'At Least 1 Number',
//                   isMet: _hasNumber,
//                 ),
//                 const SizedBox(height: 8),
//                 _PasswordRequirement(
//                   text: 'Both Upper & Lowercase Letter',
//                   isMet: _hasUpperAndLowerCase,
//                 ),
//                 const SizedBox(height: 32),
//                 SizedBox(
//                   width: double.infinity,
//                   height: 50, // زيادة ارتفاع الزر قليلاً
//                   child: ElevatedButton(
//                     onPressed: _isLoading
//                         ? null
//                         : _changePassword, // تعطيل الزر أثناء التحميل
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: const Color(0xFF4E7D96),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                     child: _isLoading
//                         ? const SizedBox(
//                             width: 24,
//                             height: 24,
//                             child: CircularProgressIndicator(
//                               color: Colors.white,
//                               strokeWidth: 3,
//                             ),
//                           )
//                         : const Text(
//                             'Reset Password',
//                             style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.w600,
//                               color: Colors.white,
//                             ),
//                           ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class _PasswordRequirement extends StatelessWidget {
//   final String text;
//   final bool isMet;

//   const _PasswordRequirement({
//     required this.text,
//     required this.isMet,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Icon(
//           isMet ? Icons.check_circle : Icons.check_circle_outline,
//           color: isMet ? const Color(0xFF4CAF50) : Colors.grey,
//           size: 20,
//         ),
//         const SizedBox(width: 8),
//         Text(
//           text,
//           style: TextStyle(
//             fontSize: 14,
//             color: isMet ? Colors.black87 : Colors.grey,
//           ),
//         ),
//       ],
//     );
//   }
// }
