// // import 'package:flutter/material.dart';
// // import 'package:country_picker/country_picker.dart';
// // import 'package:shared_preferences/shared_preferences.dart';
// // import 'dart:convert';
// // import '../models/user.dart';
// // import 'preferences_screen.dart';

// // class SignUpScreen extends StatefulWidget {
// //   const SignUpScreen({super.key});

// //   @override
// //   State<SignUpScreen> createState() => _SignUpScreenState();
// // }

// // class _SignUpScreenState extends State<SignUpScreen> {
// //   final TextEditingController _firstNameController = TextEditingController();
// //   final TextEditingController _lastNameController = TextEditingController();
// //   final TextEditingController _emailController = TextEditingController();
// //   final TextEditingController _phoneController = TextEditingController();
// //   final TextEditingController _passwordController = TextEditingController();
// //   final TextEditingController _confirmPasswordController =
// //       TextEditingController();

// //   bool _isPasswordVisible = false;
// //   bool _isConfirmPasswordVisible = false;
// //   bool _agreeToTerms = false;
// //   String _selectedGender = 'Male';
// //   String _selectedCountry = '';
// //   DateTime? _selectedDate;
// //   String _selectedCountryCode = '';

// //   @override
// //   void dispose() {
// //     _firstNameController.dispose();
// //     _lastNameController.dispose();
// //     _emailController.dispose();
// //     _phoneController.dispose();
// //     _passwordController.dispose();
// //     _confirmPasswordController.dispose();
// //     super.dispose();
// //   }

// //   void _showCountryPicker() {
// //     showCountryPicker(
// //       context: context,
// //       showPhoneCode: true,
// //       onSelect: (Country country) {
// //         setState(() {
// //           _selectedCountry = country.name;
// //           _selectedCountryCode = '+${country.phoneCode}';
// //           // Update phone controller with country code
// //           if (_phoneController.text.isEmpty) {
// //             _phoneController.text = '+${country.phoneCode}';
// //           }
// //         });
// //       },
// //     );
// //   }

// //   Future<void> _selectDate(BuildContext context) async {
// //     final DateTime? picked = await showDatePicker(
// //       context: context,
// //       initialDate: _selectedDate ?? DateTime.now(),
// //       firstDate: DateTime(1900),
// //       lastDate: DateTime.now(),
// //     );
// //     if (picked != null && picked != _selectedDate) {
// //       setState(() {
// //         _selectedDate = picked;
// //       });
// //     }
// //   }

// //   Future<void> _saveUserData() async {
// //     final user = User(
// //       firstName: _firstNameController.text,
// //       lastName: _lastNameController.text,
// //       email: _emailController.text,
// //       phoneNumber: _phoneController.text,
// //       country: _selectedCountry,
// //       gender: _selectedGender,
// //     );

// //     final prefs = await SharedPreferences.getInstance();
// //     await prefs.setString('user_data', jsonEncode(user.toJson()));
// //   }

// //   void _handleSignUp() async {
// //     // Add your validation logic here
// //     if (_firstNameController.text.isEmpty ||
// //         _lastNameController.text.isEmpty ||
// //         _emailController.text.isEmpty ||
// //         _phoneController.text.isEmpty ||
// //         _selectedCountry.isEmpty) {
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         const SnackBar(
// //           content: Text('Please fill in all required fields'),
// //           backgroundColor: Colors.red,
// //         ),
// //       );
// //       return;
// //     }

// //     await _saveUserData();

// //     if (mounted) {
// //       Navigator.push(
// //         context,
// //         MaterialPageRoute(
// //           builder: (context) => const PreferencesScreen(),
// //         ),
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
// //           icon: const Icon(Icons.arrow_back, color: Colors.black),
// //           onPressed: () => Navigator.pop(context),
// //         ),
// //         title: const Text(
// //           'Sign Up',
// //           style: TextStyle(
// //             color: Colors.black,
// //             fontSize: 18,
// //             fontWeight: FontWeight.w600,
// //           ),
// //         ),
// //         centerTitle: true,
// //       ),
// //       body: SingleChildScrollView(
// //         padding: const EdgeInsets.all(24),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             Row(
// //               children: [
// //                 Expanded(
// //                   child: Column(
// //                     crossAxisAlignment: CrossAxisAlignment.start,
// //                     children: [
// //                       const Text(
// //                         'First Name',
// //                         style: TextStyle(
// //                           fontSize: 14,
// //                           fontWeight: FontWeight.w500,
// //                           color: Colors.black87,
// //                         ),
// //                       ),
// //                       const SizedBox(height: 8),
// //                       TextFormField(
// //                         controller: _firstNameController,
// //                         decoration: InputDecoration(
// //                           hintText: 'Enter First Name',
// //                           border: OutlineInputBorder(
// //                             borderRadius: BorderRadius.circular(8),
// //                             borderSide: const BorderSide(color: Colors.grey),
// //                           ),
// //                           enabledBorder: OutlineInputBorder(
// //                             borderRadius: BorderRadius.circular(8),
// //                             borderSide: const BorderSide(color: Colors.grey),
// //                           ),
// //                           focusedBorder: OutlineInputBorder(
// //                             borderRadius: BorderRadius.circular(8),
// //                             borderSide:
// //                                 const BorderSide(color: Color(0xFF4E7D96)),
// //                           ),
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //                 const SizedBox(width: 16),
// //                 Expanded(
// //                   child: Column(
// //                     crossAxisAlignment: CrossAxisAlignment.start,
// //                     children: [
// //                       const Text(
// //                         'Last Name',
// //                         style: TextStyle(
// //                           fontSize: 14,
// //                           fontWeight: FontWeight.w500,
// //                           color: Colors.black87,
// //                         ),
// //                       ),
// //                       const SizedBox(height: 8),
// //                       TextFormField(
// //                         controller: _lastNameController,
// //                         decoration: InputDecoration(
// //                           hintText: 'Enter Last Name',
// //                           border: OutlineInputBorder(
// //                             borderRadius: BorderRadius.circular(8),
// //                             borderSide: const BorderSide(color: Colors.grey),
// //                           ),
// //                           enabledBorder: OutlineInputBorder(
// //                             borderRadius: BorderRadius.circular(8),
// //                             borderSide: const BorderSide(color: Colors.grey),
// //                           ),
// //                           focusedBorder: OutlineInputBorder(
// //                             borderRadius: BorderRadius.circular(8),
// //                             borderSide:
// //                                 const BorderSide(color: Color(0xFF4E7D96)),
// //                           ),
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //               ],
// //             ),
// //             const SizedBox(height: 16),
// //             const Text(
// //               'Email',
// //               style: TextStyle(
// //                 fontSize: 14,
// //                 fontWeight: FontWeight.w500,
// //                 color: Colors.black87,
// //               ),
// //             ),
// //             const SizedBox(height: 8),
// //             TextFormField(
// //               controller: _emailController,
// //               keyboardType: TextInputType.emailAddress,
// //               decoration: InputDecoration(
// //                 hintText: 'Enter Your Email',
// //                 prefixIcon: const Icon(
// //                   Icons.email_outlined,
// //                   color: Colors.grey,
// //                 ),
// //                 border: OutlineInputBorder(
// //                   borderRadius: BorderRadius.circular(8),
// //                   borderSide: const BorderSide(color: Colors.grey),
// //                 ),
// //                 enabledBorder: OutlineInputBorder(
// //                   borderRadius: BorderRadius.circular(8),
// //                   borderSide: const BorderSide(color: Colors.grey),
// //                 ),
// //                 focusedBorder: OutlineInputBorder(
// //                   borderRadius: BorderRadius.circular(8),
// //                   borderSide: const BorderSide(color: Color(0xFF4E7D96)),
// //                 ),
// //               ),
// //             ),
// //             const SizedBox(height: 16),
// //             const Text(
// //               'Phone Number',
// //               style: TextStyle(
// //                 fontSize: 14,
// //                 fontWeight: FontWeight.w500,
// //                 color: Colors.black87,
// //               ),
// //             ),
// //             const SizedBox(height: 8),
// //             TextFormField(
// //               controller: _phoneController,
// //               keyboardType: TextInputType.phone,
// //               decoration: InputDecoration(
// //                 hintText: 'Enter Phone Number',
// //                 prefixIcon: Padding(
// //                   padding: const EdgeInsets.symmetric(horizontal: 12),
// //                   child: Text(
// //                     _selectedCountryCode.isEmpty ? '+XX' : _selectedCountryCode,
// //                     style: const TextStyle(
// //                       fontSize: 16,
// //                       color: Colors.grey,
// //                     ),
// //                   ),
// //                 ),
// //                 prefixIconConstraints:
// //                     const BoxConstraints(minWidth: 0, minHeight: 0),
// //                 border: OutlineInputBorder(
// //                   borderRadius: BorderRadius.circular(8),
// //                   borderSide: const BorderSide(color: Colors.grey),
// //                 ),
// //                 enabledBorder: OutlineInputBorder(
// //                   borderRadius: BorderRadius.circular(8),
// //                   borderSide: const BorderSide(color: Colors.grey),
// //                 ),
// //                 focusedBorder: OutlineInputBorder(
// //                   borderRadius: BorderRadius.circular(8),
// //                   borderSide: const BorderSide(color: Color(0xFF4E7D96)),
// //                 ),
// //               ),
// //             ),
// //             const SizedBox(height: 16),
// //             const Text(
// //               'Gender',
// //               style: TextStyle(
// //                 fontSize: 14,
// //                 fontWeight: FontWeight.w500,
// //                 color: Colors.black87,
// //               ),
// //             ),
// //             const SizedBox(height: 8),
// //             Container(
// //               decoration: BoxDecoration(
// //                 border: Border.all(color: Colors.grey),
// //                 borderRadius: BorderRadius.circular(8),
// //               ),
// //               child: DropdownButtonHideUnderline(
// //                 child: DropdownButton<String>(
// //                   value: _selectedGender,
// //                   isExpanded: true,
// //                   padding: const EdgeInsets.symmetric(horizontal: 12),
// //                   items: ['Male', 'Female']
// //                       .map((gender) => DropdownMenuItem(
// //                             value: gender,
// //                             child: Text(gender),
// //                           ))
// //                       .toList(),
// //                   onChanged: (value) {
// //                     if (value != null) {
// //                       setState(() {
// //                         _selectedGender = value;
// //                       });
// //                     }
// //                   },
// //                 ),
// //               ),
// //             ),
// //             const SizedBox(height: 16),
// //             const Text(
// //               'Country',
// //               style: TextStyle(
// //                 fontSize: 14,
// //                 fontWeight: FontWeight.w500,
// //                 color: Colors.black87,
// //               ),
// //             ),
// //             const SizedBox(height: 8),
// //             InkWell(
// //               onTap: _showCountryPicker,
// //               child: Container(
// //                 width: double.infinity,
// //                 height: 50,
// //                 padding: const EdgeInsets.symmetric(horizontal: 16),
// //                 decoration: BoxDecoration(
// //                   border: Border.all(color: Colors.grey),
// //                   borderRadius: BorderRadius.circular(8),
// //                 ),
// //                 child: Row(
// //                   children: [
// //                     const Icon(Icons.flag_outlined, color: Colors.grey),
// //                     const SizedBox(width: 12),
// //                     Text(
// //                       _selectedCountry.isEmpty
// //                           ? 'Select Your Country'
// //                           : _selectedCountry,
// //                       style: TextStyle(
// //                         fontSize: 14,
// //                         color: _selectedCountry.isEmpty
// //                             ? Colors.grey
// //                             : Colors.black87,
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ),
// //             const SizedBox(height: 16),
// //             const Text(
// //               'Date Of Birth',
// //               style: TextStyle(
// //                 fontSize: 14,
// //                 fontWeight: FontWeight.w500,
// //                 color: Colors.black87,
// //               ),
// //             ),
// //             const SizedBox(height: 8),
// //             InkWell(
// //               onTap: () => _selectDate(context),
// //               child: Container(
// //                 width: double.infinity,
// //                 height: 50,
// //                 padding: const EdgeInsets.symmetric(horizontal: 16),
// //                 decoration: BoxDecoration(
// //                   border: Border.all(color: Colors.grey),
// //                   borderRadius: BorderRadius.circular(8),
// //                 ),
// //                 child: Row(
// //                   children: [
// //                     const Icon(Icons.calendar_today_outlined,
// //                         color: Colors.grey),
// //                     const SizedBox(width: 12),
// //                     Text(
// //                       _selectedDate == null
// //                           ? 'Select Your Date of Birth'
// //                           : '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
// //                       style: TextStyle(
// //                         fontSize: 14,
// //                         color: _selectedDate == null
// //                             ? Colors.grey
// //                             : Colors.black87,
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ),
// //             const SizedBox(height: 16),
// //             const Text(
// //               'Password',
// //               style: TextStyle(
// //                 fontSize: 14,
// //                 fontWeight: FontWeight.w500,
// //                 color: Colors.black87,
// //               ),
// //             ),
// //             const SizedBox(height: 8),
// //             TextFormField(
// //               controller: _passwordController,
// //               obscureText: !_isPasswordVisible,
// //               decoration: InputDecoration(
// //                 hintText: 'Enter Your Password',
// //                 prefixIcon: const Icon(
// //                   Icons.lock_outline,
// //                   color: Colors.grey,
// //                 ),
// //                 suffixIcon: IconButton(
// //                   icon: Icon(
// //                     _isPasswordVisible
// //                         ? Icons.visibility
// //                         : Icons.visibility_off,
// //                     color: Colors.grey,
// //                   ),
// //                   onPressed: () {
// //                     setState(() {
// //                       _isPasswordVisible = !_isPasswordVisible;
// //                     });
// //                   },
// //                 ),
// //                 border: OutlineInputBorder(
// //                   borderRadius: BorderRadius.circular(8),
// //                   borderSide: const BorderSide(color: Colors.grey),
// //                 ),
// //                 enabledBorder: OutlineInputBorder(
// //                   borderRadius: BorderRadius.circular(8),
// //                   borderSide: const BorderSide(color: Colors.grey),
// //                 ),
// //                 focusedBorder: OutlineInputBorder(
// //                   borderRadius: BorderRadius.circular(8),
// //                   borderSide: const BorderSide(color: Color(0xFF4E7D96)),
// //                 ),
// //               ),
// //             ),
// //             const SizedBox(height: 16),
// //             const Text(
// //               'Confirm Password',
// //               style: TextStyle(
// //                 fontSize: 14,
// //                 fontWeight: FontWeight.w500,
// //                 color: Colors.black87,
// //               ),
// //             ),
// //             const SizedBox(height: 8),
// //             TextFormField(
// //               controller: _confirmPasswordController,
// //               obscureText: !_isConfirmPasswordVisible,
// //               decoration: InputDecoration(
// //                 hintText: 'Confirm Your Password',
// //                 prefixIcon: const Icon(
// //                   Icons.lock_outline,
// //                   color: Colors.grey,
// //                 ),
// //                 suffixIcon: IconButton(
// //                   icon: Icon(
// //                     _isConfirmPasswordVisible
// //                         ? Icons.visibility
// //                         : Icons.visibility_off,
// //                     color: Colors.grey,
// //                   ),
// //                   onPressed: () {
// //                     setState(() {
// //                       _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
// //                     });
// //                   },
// //                 ),
// //                 border: OutlineInputBorder(
// //                   borderRadius: BorderRadius.circular(8),
// //                   borderSide: const BorderSide(color: Colors.grey),
// //                 ),
// //                 enabledBorder: OutlineInputBorder(
// //                   borderRadius: BorderRadius.circular(8),
// //                   borderSide: const BorderSide(color: Colors.grey),
// //                 ),
// //                 focusedBorder: OutlineInputBorder(
// //                   borderRadius: BorderRadius.circular(8),
// //                   borderSide: const BorderSide(color: Color(0xFF4E7D96)),
// //                 ),
// //               ),
// //             ),
// //             const SizedBox(height: 16),
// //             Row(
// //               children: [
// //                 Checkbox(
// //                   value: _agreeToTerms,
// //                   onChanged: (value) {
// //                     setState(() {
// //                       _agreeToTerms = value ?? false;
// //                     });
// //                   },
// //                   activeColor: const Color(0xFF4E7D96),
// //                 ),
// //                 const Text(
// //                   'Agree on terms and conditions',
// //                   style: TextStyle(
// //                     fontSize: 14,
// //                     color: Colors.black87,
// //                   ),
// //                 ),
// //               ],
// //             ),
// //             const SizedBox(height: 24),
// //             SizedBox(
// //               width: double.infinity,
// //               height: 45,
// //               child: ElevatedButton(
// //                 onPressed: _handleSignUp,
// //                 style: ElevatedButton.styleFrom(
// //                   backgroundColor: const Color(0xFF4E7D96),
// //                   minimumSize: const Size(double.infinity, 48),
// //                   shape: RoundedRectangleBorder(
// //                     borderRadius: BorderRadius.circular(8),
// //                   ),
// //                 ),
// //                 child: const Text(
// //                   'Continue',
// //                   style: TextStyle(
// //                     color: Colors.white,
// //                     fontSize: 16,
// //                     fontWeight: FontWeight.w600,
// //                   ),
// //                 ),
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:country_picker/country_picker.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:dio/dio.dart';
// import 'package:travella/screens/ProfileSignedInScreen.dart';
// import 'package:travella/services/api/api_endpoints.dart';
// import 'package:travella/services/api/dio_client.dart';

// class SignUpScreen extends StatefulWidget {
//   const SignUpScreen({super.key});

//   @override
//   State<SignUpScreen> createState() => _SignUpScreenState();
// }

// class _SignUpScreenState extends State<SignUpScreen> {
//   final TextEditingController _firstNameController = TextEditingController();
//   final TextEditingController _lastNameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _phoneController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _confirmPasswordController =
//       TextEditingController();

//   bool _isPasswordVisible = false;
//   bool _isConfirmPasswordVisible = false;
//   bool _agreeToTerms = false;
//   String _selectedGender = 'Male';
//   String _selectedCountry = '';
//   DateTime? _selectedDate;
//   String _selectedCountryCode = '';
//   bool _isLoading = false;

//   @override
//   void dispose() {
//     _firstNameController.dispose();
//     _lastNameController.dispose();
//     _emailController.dispose();
//     _phoneController.dispose();
//     _passwordController.dispose();
//     _confirmPasswordController.dispose();
//     super.dispose();
//   }

//   void _showCountryPicker() {
//     showCountryPicker(
//       context: context,
//       showPhoneCode: true,
//       onSelect: (Country country) {
//         setState(() {
//           _selectedCountry = country.name;
//           _selectedCountryCode = '+${country.phoneCode}';
//           if (_phoneController.text.isEmpty) {
//             _phoneController.text = '+${country.phoneCode}';
//           }
//         });
//       },
//     );
//   }

//   Future<void> _selectDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: _selectedDate ?? DateTime.now(),
//       firstDate: DateTime(1900),
//       lastDate: DateTime.now(),
//     );
//     if (picked != null && picked != _selectedDate) {
//       setState(() {
//         _selectedDate = picked;
//       });
//     }
//   }

//   Future<void> _handleSignUp() async {
//     // التحقق من صحة البيانات
//     if (_firstNameController.text.isEmpty ||
//         _lastNameController.text.isEmpty ||
//         _emailController.text.isEmpty ||
//         _phoneController.text.isEmpty ||
//         _passwordController.text.isEmpty ||
//         _confirmPasswordController.text.isEmpty ||
//         _selectedCountry.isEmpty ||
//         _selectedDate == null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text('Please fill in all required fields'),
//           backgroundColor: Colors.red,
//         ),
//       );
//       return;
//     }

//     // التحقق من تطابق كلمة المرور
//     if (_passwordController.text != _confirmPasswordController.text) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text('Passwords do not match'),
//           backgroundColor: Colors.red,
//         ),
//       );
//       return;
//     }

//     // التحقق من البريد الإلكتروني
//     if (!_emailController.text.contains('@') ||
//         !_emailController.text.contains('.')) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text('Please enter a valid email address'),
//           backgroundColor: Colors.red,
//         ),
//       );
//       return;
//     }

//     // التحقق من طول كلمة المرور
//     if (_passwordController.text.length < 6) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text('Password must be at least 6 characters long'),
//           backgroundColor: Colors.red,
//         ),
//       );
//       return;
//     }

//     // التحقق من الموافقة على الشروط
//     if (!_agreeToTerms) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text('You must agree to the terms and conditions'),
//           backgroundColor: Colors.red,
//         ),
//       );
//       return;
//     }

//     setState(() => _isLoading = true);

//     try {
//       final dioClient = DioClient();
//       final response = await dioClient.post(
//         ApiEndpoints.register, // تأكد من إضافة النهاية في ApiEndpoints
//         data: {
//           'displayName':
//               '${_firstNameController.text} ${_lastNameController.text}',
//           'email': _emailController.text,
//           'password': _passwordController.text,
//           'phone': _phoneController.text,
//           'dateOfBirth': _selectedDate!
//               .toIso8601String()
//               .split('T')[0], // تنسيق YYYY-MM-DD
//           'gender': _selectedGender.toLowerCase(),
//         },
//       ).timeout(const Duration(seconds: 30));

//       if (!mounted) return;

//       if (response.statusCode == 200) {
//         final data = response.data;
//         final token = data['token'];
//         final userName = data['displayName'];

//         // حفظ البيانات في SharedPreferences
//         final prefs = await SharedPreferences.getInstance();
//         await prefs.setString('authToken', token);
//         await prefs.setString('userName', userName);

//         Navigator.pushAndRemoveUntil(
//           context,
//           MaterialPageRoute(
//               builder: (context) => const ProfileSignedInScreen()),
//           (route) => false,
//         );
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text(response.data['title'] ?? 'Sign Up failed')),
//         );
//       }
//     } on TimeoutException {
//       if (!mounted) return;
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Request timed out. Please try again.')),
//       );
//     } on DioException catch (e) {
//       if (!mounted) return;
//       String errorMessage = 'An error occurred';
//       if (e.response != null) {
//         errorMessage = e.response!.data['title'] ?? 'Sign Up failed';
//       } else {
//         errorMessage = e.message ?? 'Network error';
//       }
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(errorMessage)),
//       );
//     } catch (e) {
//       if (!mounted) return;
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error: ${e.toString()}')),
//       );
//     } finally {
//       if (mounted) {
//         setState(() => _isLoading = false);
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
//           'Sign Up',
//           style: TextStyle(
//             color: Colors.black,
//             fontSize: 18,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(24),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         'First Name',
//                         style: TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.w500,
//                           color: Colors.black87,
//                         ),
//                       ),
//                       const SizedBox(height: 8),
//                       TextFormField(
//                         controller: _firstNameController,
//                         decoration: InputDecoration(
//                           hintText: 'Enter First Name',
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(8),
//                             borderSide: const BorderSide(color: Colors.grey),
//                           ),
//                           enabledBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(8),
//                             borderSide: const BorderSide(color: Colors.grey),
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(8),
//                             borderSide:
//                                 const BorderSide(color: Color(0xFF4E7D96)),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(width: 16),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         'Last Name',
//                         style: TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.w500,
//                           color: Colors.black87,
//                         ),
//                       ),
//                       const SizedBox(height: 8),
//                       TextFormField(
//                         controller: _lastNameController,
//                         decoration: InputDecoration(
//                           hintText: 'Enter Last Name',
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(8),
//                             borderSide: const BorderSide(color: Colors.grey),
//                           ),
//                           enabledBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(8),
//                             borderSide: const BorderSide(color: Colors.grey),
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(8),
//                             borderSide:
//                                 const BorderSide(color: Color(0xFF4E7D96)),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 16),
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
//             const SizedBox(height: 16),
//             const Text(
//               'Phone Number',
//               style: TextStyle(
//                 fontSize: 14,
//                 fontWeight: FontWeight.w500,
//                 color: Colors.black87,
//               ),
//             ),
//             const SizedBox(height: 8),
//             TextFormField(
//               controller: _phoneController,
//               keyboardType: TextInputType.phone,
//               decoration: InputDecoration(
//                 hintText: 'Enter Phone Number',
//                 prefixIcon: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 12),
//                   child: Text(
//                     _selectedCountryCode.isEmpty ? '+XX' : _selectedCountryCode,
//                     style: const TextStyle(
//                       fontSize: 16,
//                       color: Colors.grey,
//                     ),
//                   ),
//                 ),
//                 prefixIconConstraints:
//                     const BoxConstraints(minWidth: 0, minHeight: 0),
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
//               'Gender',
//               style: TextStyle(
//                 fontSize: 14,
//                 fontWeight: FontWeight.w500,
//                 color: Colors.black87,
//               ),
//             ),
//             const SizedBox(height: 8),
//             Container(
//               decoration: BoxDecoration(
//                 border: Border.all(color: Colors.grey),
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               child: DropdownButtonHideUnderline(
//                 child: DropdownButton<String>(
//                   value: _selectedGender,
//                   isExpanded: true,
//                   padding: const EdgeInsets.symmetric(horizontal: 12),
//                   items: ['Male', 'Female']
//                       .map((gender) => DropdownMenuItem(
//                             value: gender,
//                             child: Text(gender),
//                           ))
//                       .toList(),
//                   onChanged: (value) {
//                     if (value != null) {
//                       setState(() {
//                         _selectedGender = value;
//                       });
//                     }
//                   },
//                 ),
//               ),
//             ),
//             const SizedBox(height: 16),
//             const Text(
//               'Country',
//               style: TextStyle(
//                 fontSize: 14,
//                 fontWeight: FontWeight.w500,
//                 color: Colors.black87,
//               ),
//             ),
//             const SizedBox(height: 8),
//             InkWell(
//               onTap: _showCountryPicker,
//               child: Container(
//                 width: double.infinity,
//                 height: 50,
//                 padding: const EdgeInsets.symmetric(horizontal: 16),
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.grey),
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: Row(
//                   children: [
//                     const Icon(Icons.flag_outlined, color: Colors.grey),
//                     const SizedBox(width: 12),
//                     Text(
//                       _selectedCountry.isEmpty
//                           ? 'Select Your Country'
//                           : _selectedCountry,
//                       style: TextStyle(
//                         fontSize: 14,
//                         color: _selectedCountry.isEmpty
//                             ? Colors.grey
//                             : Colors.black87,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(height: 16),
//             const Text(
//               'Date Of Birth',
//               style: TextStyle(
//                 fontSize: 14,
//                 fontWeight: FontWeight.w500,
//                 color: Colors.black87,
//               ),
//             ),
//             const SizedBox(height: 8),
//             InkWell(
//               onTap: () => _selectDate(context),
//               child: Container(
//                 width: double.infinity,
//                 height: 50,
//                 padding: const EdgeInsets.symmetric(horizontal: 16),
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.grey),
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: Row(
//                   children: [
//                     const Icon(Icons.calendar_today_outlined,
//                         color: Colors.grey),
//                     const SizedBox(width: 12),
//                     Text(
//                       _selectedDate == null
//                           ? 'Select Your Date of Birth'
//                           : '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
//                       style: TextStyle(
//                         fontSize: 14,
//                         color: _selectedDate == null
//                             ? Colors.grey
//                             : Colors.black87,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(height: 16),
//             const Text(
//               'Password',
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
//               decoration: InputDecoration(
//                 hintText: 'Enter Your Password',
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
//                 hintText: 'Confirm Your Password',
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
//             const SizedBox(height: 16),
//             Row(
//               children: [
//                 Checkbox(
//                   value: _agreeToTerms,
//                   onChanged: (value) {
//                     setState(() {
//                       _agreeToTerms = value ?? false;
//                     });
//                   },
//                   activeColor: const Color(0xFF4E7D96),
//                 ),
//                 const Text(
//                   'Agree on terms and conditions',
//                   style: TextStyle(
//                     fontSize: 14,
//                     color: Colors.black87,
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 24),
//             SizedBox(
//               width: double.infinity,
//               height: 45,
//               child: ElevatedButton(
//                 onPressed: _isLoading ? null : _handleSignUp,
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color(0xFF4E7D96),
//                   minimumSize: const Size(double.infinity, 48),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                 ),
//                 child: _isLoading
//                     ? const CircularProgressIndicator(
//                         color: Colors.white,
//                         strokeWidth: 2,
//                       )
//                     : const Text(
//                         'Continue',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 16,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
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
// import 'package:country_picker/country_picker.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:dio/dio.dart';
// // import 'package:travella/screens/home_screen.dart';
// import 'package:apptravella/screens/preferences_screen.dart';
// import 'package:apptravella/services/api/api_endpoints.dart';
// import 'package:apptravella/services/api/dio_client.dart';

// class SignUpScreen extends StatefulWidget {
//   const SignUpScreen({super.key});

//   @override
//   State<SignUpScreen> createState() => _SignUpScreenState();
// }

// class _SignUpScreenState extends State<SignUpScreen> {
//   final TextEditingController _firstNameController = TextEditingController();
//   final TextEditingController _lastNameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _phoneController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _confirmPasswordController =
//       TextEditingController();

//   bool _isPasswordVisible = false;
//   bool _isConfirmPasswordVisible = false;
//   bool _agreeToTerms = false;
//   String _selectedGender = 'Male';
//   String _selectedCountry = '';
//   DateTime? _selectedDate;
//   String _selectedCountryCode = '';
//   bool _isLoading = false;

//   @override
//   void dispose() {
//     _firstNameController.dispose();
//     _lastNameController.dispose();
//     _emailController.dispose();
//     _phoneController.dispose();
//     _passwordController.dispose();
//     _confirmPasswordController.dispose();
//     super.dispose();
//   }

//   void _showCountryPicker() {
//     showCountryPicker(
//       context: context,
//       showPhoneCode: true,
//       onSelect: (Country country) {
//         setState(() {
//           _selectedCountry = country.name;
//           _selectedCountryCode = '+${country.phoneCode}';
//           if (_phoneController.text.isEmpty ||
//               !_phoneController.text.startsWith('+')) {
//             _phoneController.text = '+${country.phoneCode}';
//           } else {
//             final currentNumber =
//                 _phoneController.text.replaceAll(RegExp(r'^\+\d+'), '');
//             _phoneController.text = '+${country.phoneCode}$currentNumber';
//           }
//         });
//       },
//     );
//   }

//   Future<void> _selectDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: _selectedDate ?? DateTime.now(),
//       firstDate: DateTime(1900),
//       lastDate: DateTime.now(), // منع اختيار تواريخ مستقبلية
//     );
//     if (picked != null && picked != _selectedDate) {
//       if (picked.isAfter(DateTime.now().subtract(const Duration(days: 1)))) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text('Date of birth cannot be in the future'),
//             backgroundColor: Colors.red,
//           ),
//         );
//         return;
//       }
//       setState(() {
//         _selectedDate = picked;
//       });
//     }
//   }

//   Future<void> _handleSignUp() async {
//     // التحقق من صحة البيانات
//     if (_firstNameController.text.isEmpty ||
//         _lastNameController.text.isEmpty ||
//         _emailController.text.isEmpty ||
//         _phoneController.text.isEmpty ||
//         _passwordController.text.isEmpty ||
//         _confirmPasswordController.text.isEmpty ||
//         _selectedCountry.isEmpty ||
//         _selectedDate == null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text('Please fill in all required fields'),
//           backgroundColor: Colors.red,
//         ),
//       );
//       return;
//     }

//     // التحقق من تطابق كلمة المرور
//     if (_passwordController.text != _confirmPasswordController.text) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text('Passwords do not match'),
//           backgroundColor: Colors.red,
//         ),
//       );
//       return;
//     }

//     // التحقق من البريد الإلكتروني
//     if (!_emailController.text.contains('@') ||
//         !_emailController.text.contains('.')) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text('Please enter a valid email address'),
//           backgroundColor: Colors.red,
//         ),
//       );
//       return;
//     }

//     // التحقق من طول كلمة المرور ومتطلباتها
//     final passwordRegex = RegExp(
//         r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');
//     if (!passwordRegex.hasMatch(_passwordController.text)) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text(
//               'Password must be at least 8 characters, include uppercase, lowercase, number, and special character'),
//           backgroundColor: Colors.red,
//         ),
//       );
//       return;
//     }

//     // التحقق من رقم الهاتف
//     final phoneNumberWithoutCode =
//         _phoneController.text.replaceFirst(_selectedCountryCode, '');
//     if (phoneNumberWithoutCode.length < 8) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text(
//               'Phone number must be at least 8 digits after the country code'),
//           backgroundColor: Colors.red,
//         ),
//       );
//       return;
//     }

//     // التحقق من الموافقة على الشروط
//     if (!_agreeToTerms) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text('You must agree to the terms and conditions'),
//           backgroundColor: Colors.red,
//         ),
//       );
//       return;
//     }

//     setState(() => _isLoading = true);

//     try {
//       final dioClient = DioClient();
//       final response = await dioClient.post(
//         ApiEndpoints.register,
//         data: {
//           'displayName':
//               '${_firstNameController.text} ${_lastNameController.text}',
//           'email': _emailController.text,
//           'password': _passwordController.text,
//           'phone': _phoneController.text,
//           'dateOfBirth': _selectedDate!.toIso8601String().split('T')[0],
//           'gender': _selectedGender.toLowerCase(),
//         },
//       ).timeout(const Duration(seconds: 30));

//       if (!mounted) return;

//       if (response.statusCode == 200) {
//         final data = response.data;
//         final token = data['token'];
//         final userName = data['displayName'];

//         // حفظ البيانات في SharedPreferences
//         final prefs = await SharedPreferences.getInstance();
//         await prefs.setString('authToken', token);
//         await prefs.setString('userName', userName);

//         Navigator.pushAndRemoveUntil(
//           context,
//           MaterialPageRoute(builder: (context) => const PreferencesScreen()),
//           (route) => false,
//         );
//       } else {
//         print('Server response: ${response.data}');
//         String errorMessage = response.data['message'] ?? 'Sign Up failed';
//         if (response.data['errors'] != null) {
//           errorMessage += ': ${response.data['errors'].toString()}';
//         }
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text(errorMessage),
//             backgroundColor: Colors.red,
//           ),
//         );
//       }
//     } on TimeoutException {
//       if (!mounted) return;
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Request timed out. Please try again.')),
//       );
//     } on DioException catch (e) {
//       if (!mounted) return;
//       print('Dio Error: ${e.response?.data ?? e.message}');
//       String errorMessage = 'An error occurred';
//       if (e.response != null) {
//         errorMessage = e.response!.data['message'] ?? 'Sign Up failed';
//         if (e.response!.data['errors'] != null) {
//           errorMessage += ': ${e.response!.data['errors'].toString()}';
//         }
//       } else {
//         errorMessage = e.message ?? 'Network error';
//       }
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(errorMessage)),
//       );
//     } catch (e) {
//       if (!mounted) return;
//       print('General Error: $e');
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error: ${e.toString()}')),
//       );
//     } finally {
//       if (mounted) {
//         setState(() => _isLoading = false);
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
//           'Sign Up',
//           style: TextStyle(
//             color: Colors.black,
//             fontSize: 18,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(24),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         'First Name',
//                         style: TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.w500,
//                           color: Colors.black87,
//                         ),
//                       ),
//                       const SizedBox(height: 8),
//                       TextFormField(
//                         controller: _firstNameController,
//                         decoration: InputDecoration(
//                           hintText: 'Enter First Name',
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(8),
//                             borderSide: const BorderSide(color: Colors.grey),
//                           ),
//                           enabledBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(8),
//                             borderSide: const BorderSide(color: Colors.grey),
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(8),
//                             borderSide:
//                                 const BorderSide(color: Color(0xFF4E7D96)),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(width: 16),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         'Last Name',
//                         style: TextStyle(
//                           fontSize: 14,
//                           fontWeight: FontWeight.w500,
//                           color: Colors.black87,
//                         ),
//                       ),
//                       const SizedBox(height: 8),
//                       TextFormField(
//                         controller: _lastNameController,
//                         decoration: InputDecoration(
//                           hintText: 'Enter Last Name',
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(8),
//                             borderSide: const BorderSide(color: Colors.grey),
//                           ),
//                           enabledBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(8),
//                             borderSide: const BorderSide(color: Colors.grey),
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(8),
//                             borderSide:
//                                 const BorderSide(color: Color(0xFF4E7D96)),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 16),
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
//             const SizedBox(height: 16),
//             const Text(
//               'Country',
//               style: TextStyle(
//                 fontSize: 14,
//                 fontWeight: FontWeight.w500,
//                 color: Colors.black87,
//               ),
//             ),
//             const SizedBox(height: 8),
//             InkWell(
//               onTap: _showCountryPicker,
//               child: Container(
//                 width: double.infinity,
//                 height: 50,
//                 padding: const EdgeInsets.symmetric(horizontal: 16),
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.grey),
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: Row(
//                   children: [
//                     const Icon(Icons.flag_outlined, color: Colors.grey),
//                     const SizedBox(width: 12),
//                     Text(
//                       _selectedCountry.isEmpty
//                           ? 'Select Your Country'
//                           : _selectedCountry,
//                       style: TextStyle(
//                         fontSize: 14,
//                         color: _selectedCountry.isEmpty
//                             ? Colors.grey
//                             : Colors.black87,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(height: 16),
//             const Text(
//               'Phone Number',
//               style: TextStyle(
//                 fontSize: 14,
//                 fontWeight: FontWeight.w500,
//                 color: Colors.black87,
//               ),
//             ),
//             const SizedBox(height: 8),
//             TextFormField(
//               controller: _phoneController,
//               keyboardType: TextInputType.phone,
//               decoration: InputDecoration(
//                 hintText: 'Enter Phone Number',
//                 prefixIcon: Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 12),
//                   child: Text(
//                     _selectedCountryCode.isEmpty ? '+XX' : _selectedCountryCode,
//                     style: const TextStyle(
//                       fontSize: 16,
//                       color: Colors.grey,
//                     ),
//                   ),
//                 ),
//                 prefixIconConstraints:
//                     const BoxConstraints(minWidth: 0, minHeight: 0),
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
//               'Gender',
//               style: TextStyle(
//                 fontSize: 14,
//                 fontWeight: FontWeight.w500,
//                 color: Colors.black87,
//               ),
//             ),
//             const SizedBox(height: 8),
//             Container(
//               decoration: BoxDecoration(
//                 border: Border.all(color: Colors.grey),
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               child: DropdownButtonHideUnderline(
//                 child: DropdownButton<String>(
//                   value: _selectedGender,
//                   isExpanded: true,
//                   padding: const EdgeInsets.symmetric(horizontal: 12),
//                   items: ['Male', 'Female']
//                       .map((gender) => DropdownMenuItem(
//                             value: gender,
//                             child: Text(gender),
//                           ))
//                       .toList(),
//                   onChanged: (value) {
//                     if (value != null) {
//                       setState(() {
//                         _selectedGender = value;
//                       });
//                     }
//                   },
//                 ),
//               ),
//             ),
//             const SizedBox(height: 16),
//             const Text(
//               'Date Of Birth',
//               style: TextStyle(
//                 fontSize: 14,
//                 fontWeight: FontWeight.w500,
//                 color: Colors.black87,
//               ),
//             ),
//             const SizedBox(height: 8),
//             InkWell(
//               onTap: () => _selectDate(context),
//               child: Container(
//                 width: double.infinity,
//                 height: 50,
//                 padding: const EdgeInsets.symmetric(horizontal: 16),
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.grey),
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: Row(
//                   children: [
//                     const Icon(Icons.calendar_today_outlined,
//                         color: Colors.grey),
//                     const SizedBox(width: 12),
//                     Text(
//                       _selectedDate == null
//                           ? 'Select Your Date of Birth'
//                           : '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
//                       style: TextStyle(
//                         fontSize: 14,
//                         color: _selectedDate == null
//                             ? Colors.grey
//                             : Colors.black87,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             const SizedBox(height: 16),
//             const Text(
//               'Password',
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
//               decoration: InputDecoration(
//                 hintText: 'Enter Your Password',
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
//                 hintText: 'Confirm Your Password',
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
//             const SizedBox(height: 16),
//             Row(
//               children: [
//                 Checkbox(
//                   value: _agreeToTerms,
//                   onChanged: (value) {
//                     setState(() {
//                       _agreeToTerms = value ?? false;
//                     });
//                   },
//                   activeColor: const Color(0xFF4E7D96),
//                 ),
//                 const Text(
//                   'Agree on terms and conditions',
//                   style: TextStyle(
//                     fontSize: 14,
//                     color: Colors.black87,
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 24),
//             SizedBox(
//               width: double.infinity,
//               height: 45,
//               child: ElevatedButton(
//                 onPressed: _isLoading ? null : _handleSignUp,
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: const Color(0xFF4E7D96),
//                   minimumSize: const Size(double.infinity, 48),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                 ),
//                 child: _isLoading
//                     ? const CircularProgressIndicator(
//                         color: Colors.white,
//                         strokeWidth: 2,
//                       )
//                     : const Text(
//                         'Continue',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 16,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
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
import 'package:country_picker/country_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'package:apptravella/screens/preferences_screen.dart';
import 'package:apptravella/services/api/api_endpoints.dart';
import 'package:apptravella/services/api/dio_client.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // --- كل المتحكمات والمنطق الداخلي يبقى كما هو ---
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;
  bool _agreeToTerms = false;
  String _selectedGender = 'Male';
  String _selectedCountry = '';
  DateTime? _selectedDate;
  String _selectedCountryCode = '';
  bool _isLoading = false;

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _showCountryPicker() {
    showCountryPicker(
      context: context,
      showPhoneCode: true,
      onSelect: (Country country) {
        setState(() {
          _selectedCountry = country.name;
          _selectedCountryCode = '+${country.phoneCode}';
          if (_phoneController.text.isEmpty ||
              !_phoneController.text.startsWith('+')) {
            _phoneController.text = '+${country.phoneCode}';
          } else {
            final currentNumber =
                _phoneController.text.replaceAll(RegExp(r'^\+\d+'), '');
            _phoneController.text = '+${country.phoneCode}$currentNumber';
          }
        });
      },
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(), // منع اختيار تواريخ مستقبلية
    );
    if (picked != null && picked != _selectedDate) {
      if (picked.isAfter(DateTime.now().subtract(const Duration(days: 1)))) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Date of birth cannot be in the future'),
            backgroundColor: Colors.red,
          ),
        );
        return;
      }
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _handleSignUp() async {
    // التحقق من صحة البيانات
    if (_firstNameController.text.isEmpty ||
        _lastNameController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _phoneController.text.isEmpty ||
        _passwordController.text.isEmpty ||
        _confirmPasswordController.text.isEmpty ||
        _selectedCountry.isEmpty ||
        _selectedDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill in all required fields'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // التحقق من تطابق كلمة المرور
    if (_passwordController.text != _confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Passwords do not match'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // التحقق من البريد الإلكتروني
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

    // التحقق من طول كلمة المرور ومتطلباتها
    final passwordRegex = RegExp(
        r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');
    if (!passwordRegex.hasMatch(_passwordController.text)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
              'Password must be at least 8 characters, include uppercase, lowercase, number, and special character'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // التحقق من رقم الهاتف
    final phoneNumberWithoutCode =
        _phoneController.text.replaceFirst(_selectedCountryCode, '');
    if (phoneNumberWithoutCode.length < 8) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
              'Phone number must be at least 8 digits after the country code'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // التحقق من الموافقة على الشروط
    if (!_agreeToTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('You must agree to the terms and conditions'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      final dioClient = DioClient();
      final response = await dioClient.post(
        ApiEndpoints.register,
        data: {
          'displayName':
              '${_firstNameController.text} ${_lastNameController.text}',
          'email': _emailController.text,
          'password': _passwordController.text,
          'phone': _phoneController.text,
          'dateOfBirth': _selectedDate!.toIso8601String().split('T')[0],
          'gender': _selectedGender.toLowerCase(),
        },
      ).timeout(const Duration(seconds: 30));

      if (!mounted) return;

      if (response.statusCode == 200) {
        final data = response.data;
        final token = data['token'];
        final userName = data['displayName'];

        // حفظ البيانات في SharedPreferences
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('authToken', token);
        await prefs.setString('userName', userName);

        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const PreferencesScreen()),
          (route) => false,
        );
      } else {
        print('Server response: ${response.data}');
        String errorMessage = response.data['message'] ?? 'Sign Up failed';
        if (response.data['errors'] != null) {
          errorMessage += ': ${response.data['errors'].toString()}';
        }
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMessage),
            backgroundColor: Colors.red,
          ),
        );
      }
    } on TimeoutException {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Request timed out. Please try again.')),
      );
    } on DioException catch (e) {
      if (!mounted) return;
      print('Dio Error: ${e.response?.data ?? e.message}');
      String errorMessage = 'An error occurred';
      if (e.response != null) {
        errorMessage = e.response!.data['message'] ?? 'Sign Up failed';
        if (e.response!.data['errors'] != null) {
          errorMessage += ': ${e.response!.data['errors'].toString()}';
        }
      } else {
        errorMessage = e.message ?? 'Network error';
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );
    } catch (e) {
      if (!mounted) return;
      print('General Error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // --- الحصول على أبعاد الشاشة لاستخدامها في الأحجام النسبية ---
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    // --- حجم خط نسبي للعناوين والنصوص ---
    final double labelFontSize = screenWidth * 0.035;
    final double appBarFontSize = screenWidth * 0.045;
    final double buttonFontSize = screenWidth * 0.04;

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
          'Sign Up',
          style: TextStyle(
            color: Colors.black,
            fontSize: appBarFontSize, // حجم نسبي
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.06), // padding نسبي
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'First Name',
                        style: TextStyle(
                          fontSize: labelFontSize, // حجم نسبي
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.01), // مسافة نسبية
                      TextFormField(
                        controller: _firstNameController,
                        decoration: InputDecoration(
                          hintText: 'Enter First Name',
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
                            borderSide:
                                const BorderSide(color: Color(0xFF4E7D96)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: screenWidth * 0.04), // مسافة نسبية
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Last Name',
                        style: TextStyle(
                          fontSize: labelFontSize, // حجم نسبي
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.01), // مسافة نسبية
                      TextFormField(
                        controller: _lastNameController,
                        decoration: InputDecoration(
                          hintText: 'Enter Last Name',
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
                            borderSide:
                                const BorderSide(color: Color(0xFF4E7D96)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.02), // مسافة نسبية
            Text(
              'Email',
              style: TextStyle(
                fontSize: labelFontSize,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
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
            SizedBox(height: screenHeight * 0.02),
            Text(
              'Country',
              style: TextStyle(
                fontSize: labelFontSize,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            InkWell(
              onTap: _showCountryPicker,
              child: Container(
                width: double.infinity,
                height: screenHeight * 0.06, // ارتفاع نسبي
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.flag_outlined, color: Colors.grey),
                    const SizedBox(width: 12),
                    Text(
                      _selectedCountry.isEmpty
                          ? 'Select Your Country'
                          : _selectedCountry,
                      style: TextStyle(
                        fontSize: labelFontSize,
                        color: _selectedCountry.isEmpty
                            ? Colors.grey
                            : Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Text(
              'Phone Number',
              style: TextStyle(
                fontSize: labelFontSize,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            TextFormField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: 'Enter Phone Number',
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    _selectedCountryCode.isEmpty ? '+XX' : _selectedCountryCode,
                    style: TextStyle(
                      fontSize: screenWidth * 0.04, // حجم نسبي
                      color: Colors.grey,
                    ),
                  ),
                ),
                prefixIconConstraints:
                    const BoxConstraints(minWidth: 0, minHeight: 0),
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
            SizedBox(height: screenHeight * 0.02),
            Text(
              'Gender',
              style: TextStyle(
                fontSize: labelFontSize,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: _selectedGender,
                  isExpanded: true,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  items: ['Male', 'Female']
                      .map((gender) => DropdownMenuItem(
                            value: gender,
                            child: Text(gender),
                          ))
                      .toList(),
                  onChanged: (value) {
                    if (value != null) {
                      setState(() {
                        _selectedGender = value;
                      });
                    }
                  },
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Text(
              'Date Of Birth',
              style: TextStyle(
                fontSize: labelFontSize,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            InkWell(
              onTap: () => _selectDate(context),
              child: Container(
                width: double.infinity,
                height: screenHeight * 0.06, // ارتفاع نسبي
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.calendar_today_outlined,
                        color: Colors.grey),
                    const SizedBox(width: 12),
                    Text(
                      _selectedDate == null
                          ? 'Select Your Date of Birth'
                          : '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
                      style: TextStyle(
                        fontSize: labelFontSize,
                        color: _selectedDate == null
                            ? Colors.grey
                            : Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Text(
              'Password',
              style: TextStyle(
                fontSize: labelFontSize,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            TextFormField(
              controller: _passwordController,
              obscureText: !_isPasswordVisible,
              decoration: InputDecoration(
                hintText: 'Enter Your Password',
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
            SizedBox(height: screenHeight * 0.02),
            Text(
              'Confirm Password',
              style: TextStyle(
                fontSize: labelFontSize,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            TextFormField(
              controller: _confirmPasswordController,
              obscureText: !_isConfirmPasswordVisible,
              decoration: InputDecoration(
                hintText: 'Confirm Your Password',
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
            SizedBox(height: screenHeight * 0.02),
            Row(
              children: [
                Checkbox(
                  value: _agreeToTerms,
                  onChanged: (value) {
                    setState(() {
                      _agreeToTerms = value ?? false;
                    });
                  },
                  activeColor: const Color(0xFF4E7D96),
                ),
                Text(
                  'Agree on terms and conditions',
                  style: TextStyle(
                    fontSize: labelFontSize,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.03),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _isLoading ? null : _handleSignUp,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4E7D96),
                  minimumSize:
                      Size(double.infinity, screenHeight * 0.06), // حجم نسبي
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: _isLoading
                    ? const CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2,
                      )
                    : Text(
                        'Continue',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: buttonFontSize, // حجم نسبي
                          fontWeight: FontWeight.w600,
                        ),
                      ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02), // مسافة إضافية في الأسفل
          ],
        ),
      ),
    );
  }
}
