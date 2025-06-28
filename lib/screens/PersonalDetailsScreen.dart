// // // import 'package:flutter/material.dart';
// // // import 'update_success_screen.dart'; // <-- *** استيراد شاشة النجاح ***

// // // class PersonalDetailsScreen extends StatefulWidget {
// // //   const PersonalDetailsScreen({super.key});

// // //   @override
// // //   State<PersonalDetailsScreen> createState() => _PersonalDetailsScreenState();
// // // }

// // // class _PersonalDetailsScreenState extends State<PersonalDetailsScreen> {
// // //   final _firstNameController = TextEditingController();
// // //   final _lastNameController = TextEditingController();
// // //   final _emailController = TextEditingController();
// // //   final _phoneController = TextEditingController();
// // //   final _dobController = TextEditingController();
// // //   final _genderController = TextEditingController();

// // //   bool _agreeToTerms = false;

// // //   // --- تعريف الألوان الأساسية ---
// // //   static const Color primaryColor = Color(0xFF406F89); // اللون الأزرق الرئيسي
// // //   // borderColor لا يزال مفيدًا للحالة الافتراضية
// // //   static const Color borderColor = Colors.grey;
// // //   static const Color focusedBorderColor = primaryColor;
// // //   static const Color hintColor = Colors.grey;
// // //   static const Color textColor = Colors.black87;
// // //   static const Color labelColor = Colors.black54;

// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     // TODO: Load user data here
// // //   }

// // //   @override
// // //   void dispose() {
// // //     _firstNameController.dispose();
// // //     _lastNameController.dispose();
// // //     _emailController.dispose();
// // //     _phoneController.dispose();
// // //     _dobController.dispose();
// // //     _genderController.dispose();
// // //     super.dispose();
// // //   }

// // //   // Helper widget لإنشاء حقول الإدخال مع الألوان المحدثة
// // //   Widget _buildTextField({
// // //     required TextEditingController controller,
// // //     required String labelText,
// // //     required String hintText,
// // //     TextInputType keyboardType = TextInputType.text,
// // //     IconData? prefixIcon,
// // //     IconData? suffixIcon,
// // //     String? prefixText,
// // //     bool obscureText = false,
// // //     VoidCallback? onSuffixTap,
// // //   }) {
// // //     return Padding(
// // //       padding: const EdgeInsets.only(bottom: 16.0),
// // //       child: Column(
// // //         crossAxisAlignment: CrossAxisAlignment.start,
// // //         children: [
// // //           Text(
// // //             labelText,
// // //             style: const TextStyle(
// // //               fontSize: 14,
// // //               fontWeight: FontWeight.w500,
// // //               color: labelColor, // استخدام لون المعرف
// // //             ),
// // //           ),
// // //           const SizedBox(height: 8),
// // //           TextFormField(
// // //             controller: controller,
// // //             keyboardType: keyboardType,
// // //             obscureText: obscureText,
// // //             style: const TextStyle(color: textColor), // لون النص المدخل
// // //             decoration: InputDecoration(
// // //               hintText: hintText,
// // //               hintStyle:
// // //                   const TextStyle(color: hintColor), // استخدام لون المعرف
// // //               prefixIcon: prefixIcon != null
// // //                   ? Icon(prefixIcon,
// // //                       color: hintColor, size: 20) // استخدام لون المعرف
// // //                   : null,
// // //               suffixIcon: suffixIcon != null
// // //                   ? IconButton(
// // //                       icon: Icon(suffixIcon,
// // //                           color: hintColor, size: 20), // استخدام لون المعرف
// // //                       onPressed: onSuffixTap,
// // //                     )
// // //                   : null,
// // //               prefixText: prefixText,
// // //               prefixStyle: const TextStyle(
// // //                   color: textColor, fontSize: 16), // استخدام لون المعرف
// // //               contentPadding:
// // //                   const EdgeInsets.symmetric(vertical: 14.0, horizontal: 12.0),
// // //               border: OutlineInputBorder(
// // //                 // الحالة الافتراضية والخطأ
// // //                 borderRadius: BorderRadius.circular(8.0),
// // //                 borderSide: const BorderSide(
// // //                     color: borderColor), // استخدام borderColor هنا مناسب
// // //               ),
// // //               enabledBorder: OutlineInputBorder(
// // //                 // عندما يكون الحقل مفعلاً وغير مركز عليه
// // //                 borderRadius: BorderRadius.circular(8.0),
// // //                 // ******** التعديل هنا **********
// // //                 borderSide: BorderSide(
// // //                     color: Colors
// // //                         .grey.shade400), // استخدام Colors.grey.shade400 مباشرة
// // //                 // ******** نهاية التعديل **********
// // //               ),
// // //               focusedBorder: OutlineInputBorder(
// // //                 // عند التركيز على الحقل
// // //                 borderRadius: BorderRadius.circular(8.0),
// // //                 borderSide: const BorderSide(
// // //                     color: focusedBorderColor,
// // //                     width: 1.5), // استخدام لون المعرف
// // //               ),
// // //             ),
// // //             // TODO: Add validation if needed
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }

// // //   Future<void> _selectDate() async {
// // //     DateTime? picked = await showDatePicker(
// // //       context: context,
// // //       initialDate: DateTime.now(),
// // //       firstDate: DateTime(1920),
// // //       lastDate: DateTime.now(),
// // //       builder: (context, child) {
// // //         return Theme(
// // //           data: Theme.of(context).copyWith(
// // //             colorScheme: const ColorScheme.light(
// // //               primary: primaryColor, // استخدام لون المعرف
// // //               onPrimary: Colors.white,
// // //               onSurface: textColor, // استخدام لون المعرف
// // //             ),
// // //             textButtonTheme: TextButtonThemeData(
// // //               style: TextButton.styleFrom(
// // //                 foregroundColor: primaryColor, // استخدام لون المعرف
// // //               ),
// // //             ),
// // //           ),
// // //           child: child!,
// // //         );
// // //       },
// // //     );
// // //     setState(() {
// // //       _dobController.text =
// // //           "${picked?.day.toString().padLeft(2, '0')}/${picked?.month.toString().padLeft(2, '0')}/${picked?.year}";
// // //     });
// // //   }

// // //   // --- دالة لمعالجة عملية التحديث والانتقال ---
// // //   void _handleUpdateInfo() {
// // //     if (!_agreeToTerms) {
// // //       ScaffoldMessenger.of(context).showSnackBar(
// // //         const SnackBar(
// // //             content: Text('Please agree to the terms and conditions.')),
// // //       );
// // //       return;
// // //     }

// // //     // TODO: إضافة منطق حفظ البيانات الفعلي هنا

// // //     print('Updating Info...');

// // //     Navigator.pushReplacement(
// // //       // استخدام pushReplacement لمنع العودة لصفحة التعديل بالـ back button
// // //       context,
// // //       MaterialPageRoute(builder: (context) => const UpdateSuccessScreen()),
// // //     );
// // //   }

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       backgroundColor: Colors.white,
// // //       appBar: AppBar(
// // //         backgroundColor: Colors.white,
// // //         elevation: 0,
// // //         leading: IconButton(
// // //           icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
// // //           onPressed: () => Navigator.of(context).pop(),
// // //         ),
// // //         title: const Text(
// // //           'Personal Details',
// // //           style: TextStyle(
// // //             color: Colors.black,
// // //             fontSize: 18,
// // //             fontWeight: FontWeight.w600,
// // //           ),
// // //         ),
// // //         centerTitle: true,
// // //       ),
// // //       body: SingleChildScrollView(
// // //         padding: const EdgeInsets.all(20.0),
// // //         child: Column(
// // //           crossAxisAlignment: CrossAxisAlignment.stretch,
// // //           children: [
// // //             // الحقول النصية
// // //             Row(
// // //               children: [
// // //                 Expanded(
// // //                     child: _buildTextField(
// // //                         controller: _firstNameController,
// // //                         labelText: 'First Name',
// // //                         hintText: 'Enter Your First Name')),
// // //                 const SizedBox(width: 16),
// // //                 Expanded(
// // //                     child: _buildTextField(
// // //                         controller: _lastNameController,
// // //                         labelText: 'Last Name',
// // //                         hintText: 'Enter Your Last Name')),
// // //               ],
// // //             ),
// // //             _buildTextField(
// // //                 controller: _emailController,
// // //                 labelText: 'Email',
// // //                 hintText: 'Enter Your Email',
// // //                 keyboardType: TextInputType.emailAddress,
// // //                 prefixIcon: Icons.email_outlined),
// // //             _buildTextField(
// // //                 controller: _phoneController,
// // //                 labelText: 'Phone Number',
// // //                 hintText: 'Enter Your Phone Number',
// // //                 keyboardType: TextInputType.phone,
// // //                 prefixText: '+20 '),
// // //             _buildTextField(
// // //                 controller: _dobController,
// // //                 labelText: 'Date Of Birth',
// // //                 hintText: 'DD/MM/YYYY',
// // //                 keyboardType: TextInputType.datetime,
// // //                 suffixIcon: Icons.calendar_today_outlined,
// // //                 onSuffixTap: _selectDate),
// // //             _buildTextField(
// // //                 controller: _genderController,
// // //                 labelText: 'Gender',
// // //                 hintText: 'Enter Your Gender (Optional)',
// // //                 prefixIcon: Icons.person_search_outlined),

// // //             // Checkbox للشروط
// // //             CheckboxListTile(
// // //               title: const Text("Agree on terms and conditions",
// // //                   style: TextStyle(fontSize: 14, color: textColor)),
// // //               value: _agreeToTerms,
// // //               onChanged: (newValue) => setState(() {
// // //                 _agreeToTerms = newValue!;
// // //               }),
// // //               controlAffinity: ListTileControlAffinity.leading,
// // //               contentPadding: EdgeInsets.zero,
// // //               activeColor: primaryColor,
// // //             ),
// // //             const SizedBox(height: 32),

// // //             // زر التحديث
// // //             ElevatedButton(
// // //               onPressed: _handleUpdateInfo,
// // //               style: ElevatedButton.styleFrom(
// // //                 backgroundColor: primaryColor,
// // //                 padding: const EdgeInsets.symmetric(vertical: 16),
// // //                 shape: RoundedRectangleBorder(
// // //                     borderRadius: BorderRadius.circular(12)),
// // //                 textStyle:
// // //                     const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
// // //               ),
// // //               child: const Text('Update Your Info'),
// // //             ),
// // //             const SizedBox(height: 20),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }
// // import 'package:flutter/material.dart';
// // import 'package:dio/dio.dart';
// // import 'package:apptravella/services/api/api_endpoints.dart';
// // import 'package:apptravella/services/api/dio_client.dart';
// // import 'update_success_screen.dart'; // استيراد شاشة النجاح

// // class PersonalDetailsScreen extends StatefulWidget {
// //   const PersonalDetailsScreen({super.key});

// //   @override
// //   State<PersonalDetailsScreen> createState() => _PersonalDetailsScreenState();
// // }

// // class _PersonalDetailsScreenState extends State<PersonalDetailsScreen> {
// //   final _firstNameController = TextEditingController();
// //   final _lastNameController = TextEditingController();
// //   final _emailController = TextEditingController();
// //   final _phoneController = TextEditingController();
// //   final _dobController = TextEditingController();
// //   final _genderController = TextEditingController();

// //   bool _agreeToTerms = false;

// //   // الألوان
// //   static const Color primaryColor = Color(0xFF406F89);
// //   static const Color borderColor = Colors.grey;
// //   static const Color focusedBorderColor = primaryColor;
// //   static const Color hintColor = Colors.grey;
// //   static const Color textColor = Colors.black87;
// //   static const Color labelColor = Colors.black54;

// //   @override
// //   void initState() {
// //     super.initState();
// //     // تحميل البيانات الافتراضية (يمكنك تعديلها حسب احتياجاتك)
// //     _firstNameController.text = '';
// //     _lastNameController.text = '';
// //     _emailController.text = '';
// //     _phoneController.text = '';
// //     _dobController.text = ''; // يمكنك تعديل التاريخ ليكون صحيح
// //     _genderController.text = '';
// //   }

// //   @override
// //   void dispose() {
// //     _firstNameController.dispose();
// //     _lastNameController.dispose();
// //     _emailController.dispose();
// //     _phoneController.dispose();
// //     _dobController.dispose();
// //     _genderController.dispose();
// //     super.dispose();
// //   }

// //   Widget _buildTextField({
// //     required TextEditingController controller,
// //     required String labelText,
// //     required String hintText,
// //     TextInputType keyboardType = TextInputType.text,
// //     IconData? prefixIcon,
// //     IconData? suffixIcon,
// //     String? prefixText,
// //     bool obscureText = false,
// //     VoidCallback? onSuffixTap,
// //   }) {
// //     return Padding(
// //       padding: const EdgeInsets.only(bottom: 16.0),
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           Text(
// //             labelText,
// //             style: const TextStyle(
// //               fontSize: 14,
// //               fontWeight: FontWeight.w500,
// //               color: labelColor,
// //             ),
// //           ),
// //           const SizedBox(height: 8),
// //           TextFormField(
// //             controller: controller,
// //             keyboardType: keyboardType,
// //             obscureText: obscureText,
// //             style: const TextStyle(color: textColor),
// //             decoration: InputDecoration(
// //               hintText: hintText,
// //               hintStyle: const TextStyle(color: hintColor),
// //               prefixIcon: prefixIcon != null
// //                   ? Icon(prefixIcon, color: hintColor, size: 20)
// //                   : null,
// //               suffixIcon: suffixIcon != null
// //                   ? IconButton(
// //                       icon: Icon(suffixIcon, color: hintColor, size: 20),
// //                       onPressed: onSuffixTap,
// //                     )
// //                   : null,
// //               prefixText: prefixText,
// //               prefixStyle: const TextStyle(color: textColor, fontSize: 16),
// //               contentPadding:
// //                   const EdgeInsets.symmetric(vertical: 14.0, horizontal: 12.0),
// //               border: OutlineInputBorder(
// //                 borderRadius: BorderRadius.circular(8.0),
// //                 borderSide: const BorderSide(color: borderColor),
// //               ),
// //               enabledBorder: OutlineInputBorder(
// //                 borderRadius: BorderRadius.circular(8.0),
// //                 borderSide: BorderSide(color: Colors.grey.shade400),
// //               ),
// //               focusedBorder: OutlineInputBorder(
// //                 borderRadius: BorderRadius.circular(8.0),
// //                 borderSide:
// //                     const BorderSide(color: focusedBorderColor, width: 1.5),
// //               ),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// //   Future<void> _selectDate() async {
// //     DateTime? picked = await showDatePicker(
// //       context: context,
// //       initialDate: DateTime.now(),
// //       firstDate: DateTime(1920),
// //       lastDate: DateTime.now(),
// //       builder: (context, child) {
// //         return Theme(
// //           data: Theme.of(context).copyWith(
// //             colorScheme: const ColorScheme.light(
// //               primary: primaryColor,
// //               onPrimary: Colors.white,
// //               onSurface: textColor,
// //             ),
// //             textButtonTheme: TextButtonThemeData(
// //               style: TextButton.styleFrom(foregroundColor: primaryColor),
// //             ),
// //           ),
// //           child: child!,
// //         );
// //       },
// //     );
// //     setState(() {
// //       _dobController.text =
// //           "${picked?.day.toString().padLeft(2, '0')}/${picked?.month.toString().padLeft(2, '0')}/${picked?.year}";
// //     });
// //   }

// //   Future<void> _updatePersonalDetails() async {
// //     if (!_agreeToTerms) {
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         const SnackBar(
// //             content: Text('Please agree to the terms and conditions.')),
// //       );
// //       return;
// //     }

// //     try {
// //       final dio = DioClient().dio;

// //       final response = await dio.put(
// //         ApiEndpoints.baseUrl + '/Accounts/Update personal-details',
// //         data: {
// //           "displayName":
// //               _firstNameController.text + ' ' + _lastNameController.text,
// //           "email": _emailController.text,
// //           "password": "nnnnA@2201121", // يمكنك تعديل الباسورد هنا
// //           "phone": _phoneController.text,
// //           "dateOfBirth": _dobController.text
// //               .split('/')
// //               .reversed
// //               .join('-'), // تحويل إلى YYYY-MM-DD
// //           "gender": _genderController.text,
// //           "agreedToTerms": _agreeToTerms,
// //         },
// //         options: Options(
// //           headers: {
// //             'Content-Type': 'application/json',
// //             'Authorization':
// //                 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9naXZlbm5hbWUiOiJuYWRhIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvZW1haWxhZGRyZXNzIjoib21hcnR3MjAwNEBnbWFpbC5jb20iLCJqdGkiOiIyYmE0OWU0My1iNmIzLTRiOWYtODhlOC01YTQxNDI0YzkyY2MiLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6IjEiLCJleHAiOjE3NTI5NTMzODgsImlzcyI6Imh0dHBzOi8vbG9jYWxob3N0OjcyNzEvIiwiYXVkIjoiaHR0cHM6Ly9sb2NhbGhvc3Q6NzI3MS8ifQ.7Ycw_GII57HQ7Mr2BsC9ynwla5lBWc_KYwrrxPNoqI4',
// //           },
// //         ),
// //       );

// //       if (response.statusCode == 200) {
// //         Navigator.pushReplacement(
// //           context,
// //           MaterialPageRoute(builder: (context) => const UpdateSuccessScreen()),
// //         );
// //       }
// //     } catch (e) {
// //       ScaffoldMessenger.of(context).showSnackBar(
// //         SnackBar(content: Text('Error: ${e.toString()}')),
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
// //           icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
// //           onPressed: () => Navigator.of(context).pop(),
// //         ),
// //         title: const Text(
// //           'Personal Details',
// //           style: TextStyle(
// //             color: Colors.black,
// //             fontSize: 18,
// //             fontWeight: FontWeight.w600,
// //           ),
// //         ),
// //         centerTitle: true,
// //       ),
// //       body: SingleChildScrollView(
// //         padding: const EdgeInsets.all(20.0),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.stretch,
// //           children: [
// //             Row(
// //               children: [
// //                 Expanded(
// //                   child: _buildTextField(
// //                     controller: _firstNameController,
// //                     labelText: 'First Name',
// //                     hintText: 'Enter Your First Name',
// //                   ),
// //                 ),
// //                 const SizedBox(width: 16),
// //                 Expanded(
// //                   child: _buildTextField(
// //                     controller: _lastNameController,
// //                     labelText: 'Last Name',
// //                     hintText: 'Enter Your Last Name',
// //                   ),
// //                 ),
// //               ],
// //             ),
// //             _buildTextField(
// //               controller: _emailController,
// //               labelText: 'Email',
// //               hintText: 'Enter Your Email',
// //               keyboardType: TextInputType.emailAddress,
// //               prefixIcon: Icons.email_outlined,
// //             ),
// //             _buildTextField(
// //               controller: _phoneController,
// //               labelText: 'Phone Number',
// //               hintText: 'Enter Your Phone Number',
// //               keyboardType: TextInputType.phone,
// //               prefixText: '+20 ',
// //             ),
// //             _buildTextField(
// //               controller: _dobController,
// //               labelText: 'Date Of Birth',
// //               hintText: 'DD/MM/YYYY',
// //               keyboardType: TextInputType.datetime,
// //               suffixIcon: Icons.calendar_today_outlined,
// //               onSuffixTap: _selectDate,
// //             ),
// //             _buildTextField(
// //               controller: _genderController,
// //               labelText: 'Gender',
// //               hintText: 'Enter Your Gender (Optional)',
// //               prefixIcon: Icons.person_search_outlined,
// //             ),
// //             CheckboxListTile(
// //               title: const Text("Agree on terms and conditions",
// //                   style: TextStyle(fontSize: 14, color: textColor)),
// //               value: _agreeToTerms,
// //               onChanged: (newValue) => setState(() {
// //                 _agreeToTerms = newValue!;
// //               }),
// //               controlAffinity: ListTileControlAffinity.leading,
// //               contentPadding: EdgeInsets.zero,
// //               activeColor: primaryColor,
// //             ),
// //             const SizedBox(height: 32),
// //             ElevatedButton(
// //               onPressed: _updatePersonalDetails,
// //               style: ElevatedButton.styleFrom(
// //                 backgroundColor: primaryColor,
// //                 padding: const EdgeInsets.symmetric(vertical: 16),
// //                 shape: RoundedRectangleBorder(
// //                   borderRadius: BorderRadius.circular(12),
// //                 ),
// //                 textStyle:
// //                     const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
// //               ),
// //               child: const Text('Update Your Info'),
// //             ),
// //             const SizedBox(height: 20),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:dio/dio.dart';
// import 'package:apptravella/services/api/api_endpoints.dart';
// import 'package:apptravella/services/api/dio_client.dart';
// import 'update_success_screen.dart'; // استيراد شاشة النجاح

// class PersonalDetailsScreen extends StatefulWidget {
//   const PersonalDetailsScreen({super.key});

//   @override
//   State<PersonalDetailsScreen> createState() => _PersonalDetailsScreenState();
// }

// class _PersonalDetailsScreenState extends State<PersonalDetailsScreen> {
//   final _firstNameController = TextEditingController();
//   final _lastNameController = TextEditingController();
//   final _emailController = TextEditingController();
//   final _phoneController = TextEditingController();
//   final _dobController = TextEditingController();
//   final _genderController = TextEditingController();

//   bool _agreeToTerms = false;

//   // الألوان
//   static const Color primaryColor = Color(0xFF406F89);
//   static const Color borderColor = Colors.grey;
//   static const Color focusedBorderColor = primaryColor;
//   static const Color hintColor = Colors.grey;
//   static const Color textColor = Colors.black87;
//   static const Color labelColor = Colors.black54;

//   @override
//   void initState() {
//     super.initState();
//     // تحميل البيانات الافتراضية (يمكنك تعديلها حسب احتياجاتك)
//     _firstNameController.text = '';
//     _lastNameController.text = '';
//     _emailController.text = '';
//     _phoneController.text = '';
//     _dobController.text = ''; // يمكنك تعديل التاريخ ليكون صحيح
//     _genderController.text = '';
//   }

//   @override
//   void dispose() {
//     _firstNameController.dispose();
//     _lastNameController.dispose();
//     _emailController.dispose();
//     _phoneController.dispose();
//     _dobController.dispose();
//     _genderController.dispose();
//     super.dispose();
//   }

//   Widget _buildTextField({
//     required TextEditingController controller,
//     required String labelText,
//     required String hintText,
//     TextInputType keyboardType = TextInputType.text,
//     IconData? prefixIcon,
//     IconData? suffixIcon,
//     String? prefixText,
//     bool obscureText = false,
//     VoidCallback? onSuffixTap,
//   }) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 16.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             labelText,
//             style: const TextStyle(
//               fontSize: 14,
//               fontWeight: FontWeight.w500,
//               color: labelColor,
//             ),
//           ),
//           const SizedBox(height: 8),
//           TextFormField(
//             controller: controller,
//             keyboardType: keyboardType,
//             obscureText: obscureText,
//             style: const TextStyle(color: textColor),
//             decoration: InputDecoration(
//               hintText: hintText,
//               hintStyle: const TextStyle(color: hintColor),
//               prefixIcon: prefixIcon != null
//                   ? Icon(prefixIcon, color: hintColor, size: 20)
//                   : null,
//               suffixIcon: suffixIcon != null
//                   ? IconButton(
//                       icon: Icon(suffixIcon, color: hintColor, size: 20),
//                       onPressed: onSuffixTap,
//                     )
//                   : null,
//               prefixText: prefixText,
//               prefixStyle: const TextStyle(color: textColor, fontSize: 16),
//               contentPadding:
//                   const EdgeInsets.symmetric(vertical: 14.0, horizontal: 12.0),
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(8.0),
//                 borderSide: const BorderSide(color: borderColor),
//               ),
//               enabledBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(8.0),
//                 borderSide: BorderSide(color: Colors.grey.shade400),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(8.0),
//                 borderSide:
//                     const BorderSide(color: focusedBorderColor, width: 1.5),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Future<void> _selectDate() async {
//     DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(1920),
//       lastDate: DateTime.now(),
//       builder: (context, child) {
//         return Theme(
//           data: Theme.of(context).copyWith(
//             colorScheme: const ColorScheme.light(
//               primary: primaryColor,
//               onPrimary: Colors.white,
//               onSurface: textColor,
//             ),
//             textButtonTheme: TextButtonThemeData(
//               style: TextButton.styleFrom(foregroundColor: primaryColor),
//             ),
//           ),
//           child: child!,
//         );
//       },
//     );
//     if (picked != null) {
//       setState(() {
//         _dobController.text =
//             "${picked.day.toString().padLeft(2, '0')}/${picked.month.toString().padLeft(2, '0')}/${picked.year}";
//       });
//     }
//   }

//   Future<void> _updatePersonalDetails() async {
//     if (!_agreeToTerms) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//             content: Text('Please agree to the terms and conditions.')),
//       );
//       return;
//     }

//     try {
//       final dio = DioClient().dio;

//       final response = await dio.put(
//         ApiEndpoints.baseUrl + '/Accounts/Update personal-details',
//         data: {
//           "displayName":
//               _firstNameController.text + ' ' + _lastNameController.text,
//           "email": _emailController.text,
//           "password": "nnnnA@2201121", // يمكنك تعديل الباسورد هنا
//           "phone": _phoneController.text,
//           "dateOfBirth": _dobController.text
//               .split('/')
//               .reversed
//               .join('-'), // تحويل إلى YYYY-MM-DD
//           "gender": _genderController.text,
//           "agreedToTerms": _agreeToTerms,
//         },
//         options: Options(
//           headers: {
//             'Content-Type': 'application/json',
//             // --- التعديل هنا ---
//             // تم استبدال التوكن القديم بالتوكن الجديد
//             'Authorization':
//                 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9naXZlbm5hbWUiOiJuYWRhIGFobWVkIiwiaHR0cDovL3NjaGVtYXMueG1sc29hcC5vcmcvd3MvMjAwNS8wNS9pZGVudGl0eS9jbGFpbXMvZW1haWxhZGRyZXNzIjoib21hcnR3MjAwNEBnbWFpbC5jb20iLCJqdGkiOiI2MTZmMDk2NS0xNTk5LTRjYmEtYWU5Mi02MjI3MWMzYmU2ZWYiLCJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6Ijc3IiwiZXhwIjoxNzU2MjIyODQ1LCJpc3MiOiJodHRwczovL2xvY2FsaG9zdDo3MjcxLyIsImF1ZCI6Imh0dHBzOi8vbG9jYWxob3N0OjcyNzEvIn0.EUBfguIK0LPvSN5PWwSKCm00iBDcRM-fJfqlYGdUjgY',
//           },
//         ),
//       );

//       if (response.statusCode == 200) {
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => const UpdateSuccessScreen()),
//         );
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Error: ${e.toString()}')),
//       );
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
//           icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//         title: const Text(
//           'Personal Details',
//           style: TextStyle(
//             color: Colors.black,
//             fontSize: 18,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Row(
//               children: [
//                 Expanded(
//                   child: _buildTextField(
//                     controller: _firstNameController,
//                     labelText: 'First Name',
//                     hintText: 'Enter Your First Name',
//                   ),
//                 ),
//                 const SizedBox(width: 16),
//                 Expanded(
//                   child: _buildTextField(
//                     controller: _lastNameController,
//                     labelText: 'Last Name',
//                     hintText: 'Enter Your Last Name',
//                   ),
//                 ),
//               ],
//             ),
//             _buildTextField(
//               controller: _emailController,
//               labelText: 'Email',
//               hintText: 'Enter Your Email',
//               keyboardType: TextInputType.emailAddress,
//               prefixIcon: Icons.email_outlined,
//             ),
//             _buildTextField(
//               controller: _phoneController,
//               labelText: 'Phone Number',
//               hintText: 'Enter Your Phone Number',
//               keyboardType: TextInputType.phone,
//               prefixText: '+20 ',
//             ),
//             _buildTextField(
//               controller: _dobController,
//               labelText: 'Date Of Birth',
//               hintText: 'DD/MM/YYYY',
//               keyboardType: TextInputType.datetime,
//               suffixIcon: Icons.calendar_today_outlined,
//               onSuffixTap: _selectDate,
//             ),
//             _buildTextField(
//               controller: _genderController,
//               labelText: 'Gender',
//               hintText: 'Enter Your Gender (Optional)',
//               prefixIcon: Icons.person_search_outlined,
//             ),
//             CheckboxListTile(
//               title: const Text("Agree on terms and conditions",
//                   style: TextStyle(fontSize: 14, color: textColor)),
//               value: _agreeToTerms,
//               onChanged: (newValue) => setState(() {
//                 _agreeToTerms = newValue!;
//               }),
//               controlAffinity: ListTileControlAffinity.leading,
//               contentPadding: EdgeInsets.zero,
//               activeColor: primaryColor,
//             ),
//             const SizedBox(height: 32),
//             ElevatedButton(
//               onPressed: _updatePersonalDetails,
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: primaryColor,
//                 padding: const EdgeInsets.symmetric(vertical: 16),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 textStyle:
//                     const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
//               ),
//               child: const Text('Update Your Info'),
//             ),
//             const SizedBox(height: 20),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:apptravella/services/api/dio_client.dart';
import 'update_success_screen.dart'; // استيراد شاشة النجاح

class PersonalDetailsScreen extends StatefulWidget {
  const PersonalDetailsScreen({super.key});

  @override
  State<PersonalDetailsScreen> createState() => _PersonalDetailsScreenState();
}

class _PersonalDetailsScreenState extends State<PersonalDetailsScreen> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _dobController = TextEditingController();
  final _genderController = TextEditingController();

  bool _agreeToTerms = false;
  bool _isLoading = false;

  static const Color primaryColor = Color(0xFF406F89);
  static const Color textColor = Colors.black87;

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _dobController.dispose();
    _genderController.dispose();
    super.dispose();
  }

  Future<void> _updatePersonalDetails() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (!_agreeToTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Please agree to the terms and conditions.')),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final dio = DioClient().dio;

      final response = await dio.put(
        '/Accounts/Update personal-details',
        data: {
          "displayName":
              "${_firstNameController.text} ${_lastNameController.text}",
          "email": _emailController.text,
          "password": "Omar@2204",
          "phone": _phoneController.text,
          // --- التعديل الرئيسي هنا ---
          "dateOfBirth": _dobController.text.isEmpty
              ? null
              : _dobController.text.split('/').reversed.join('-'),
          "gender":
              _genderController.text.isEmpty ? null : _genderController.text,
          "agreedToTerms": _agreeToTerms,
        },
      );

      if (response.statusCode == 200) {
        if (mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => const UpdateSuccessScreen()),
          );
        }
      }
    } on DioException catch (e) {
      String errorMessage = 'Failed to update details. Please try again.';
      if (e.response != null) {
        // طباعة رسالة الخطأ من السيرفر بشكل أوضح
        final responseData = e.response!.data;
        if (responseData is Map && responseData.containsKey('title')) {
          errorMessage = responseData['title'];
        } else {
          errorMessage = 'Error: ${e.response?.data.toString()}';
        }
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Future<void> _selectDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1920),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: primaryColor,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        _dobController.text =
            "${picked.day.toString().padLeft(2, '0')}/${picked.month.toString().padLeft(2, '0')}/${picked.year}";
      });
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
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Personal Details',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: _buildValidatedTextField(
                      controller: _firstNameController,
                      labelText: 'First Name',
                      hintText: 'Enter First Name',
                      validator: (value) =>
                          value!.isEmpty ? 'First name is required' : null,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildValidatedTextField(
                      controller: _lastNameController,
                      labelText: 'Last Name',
                      hintText: 'Enter Last Name',
                      validator: (value) =>
                          value!.isEmpty ? 'Last name is required' : null,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              _buildValidatedTextField(
                controller: _emailController,
                labelText: 'Email',
                hintText: 'Enter Your Email',
                keyboardType: TextInputType.emailAddress,
                prefixIcon: Icons.email_outlined,
                validator: (value) {
                  if (value!.isEmpty) return 'Email is required';
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return 'Enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              _buildValidatedTextField(
                controller: _phoneController,
                labelText: 'Phone Number',
                hintText: 'Enter Your Phone Number',
                keyboardType: TextInputType.phone,
                prefixText: '+20 ',
                validator: (value) =>
                    value!.isEmpty ? 'Phone is required' : null,
              ),
              const SizedBox(height: 16),
              // حقل تاريخ الميلاد لا يحتاج validator لأنه اختياري
              _buildValidatedTextField(
                controller: _dobController,
                labelText: 'Date Of Birth (Optional)',
                hintText: 'DD/MM/YYYY',
                readOnly: true,
                onTap: _selectDate,
                suffixIcon: Icons.calendar_today_outlined,
                validator: (value) => null, // No validation needed
              ),
              const SizedBox(height: 16),
              _buildValidatedTextField(
                controller: _genderController,
                labelText: 'Gender (Optional)',
                hintText: 'e.g., Male, Female',
                validator: (value) => null, // No validation needed
              ),
              CheckboxListTile(
                title: const Text("Agree to terms and conditions",
                    style: TextStyle(fontSize: 14, color: textColor)),
                value: _agreeToTerms,
                onChanged: (newValue) => setState(() {
                  _agreeToTerms = newValue!;
                }),
                controlAffinity: ListTileControlAffinity.leading,
                contentPadding: EdgeInsets.zero,
                activeColor: primaryColor,
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: _isLoading ? null : _updatePersonalDetails,
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  textStyle: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w600),
                ),
                child: _isLoading
                    ? const SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(
                            color: Colors.white, strokeWidth: 3),
                      )
                    : const Text('Update Your Info'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildValidatedTextField({
    required TextEditingController controller,
    required String labelText,
    required String hintText,
    required FormFieldValidator<String> validator,
    TextInputType keyboardType = TextInputType.text,
    IconData? prefixIcon,
    String? prefixText,
    IconData? suffixIcon,
    VoidCallback? onTap,
    bool readOnly = false,
  }) {
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      readOnly: readOnly,
      onTap: onTap,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        prefixIcon:
            prefixIcon != null ? Icon(prefixIcon, color: Colors.grey) : null,
        suffixIcon:
            suffixIcon != null ? Icon(suffixIcon, color: Colors.grey) : null,
        prefixText: prefixText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
