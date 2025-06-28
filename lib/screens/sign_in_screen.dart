// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:dio/dio.dart';
// import 'package:travella/services/api/api_endpoints.dart';
// import 'package:travella/services/api/dio_client.dart';
// import 'home_screen.dart';
// import 'forgot_password_screen.dart';
// import 'forgot_password_phone_screen.dart';
// import 'sign_up_screen.dart';

// class SignInScreen extends StatefulWidget {
//   final bool isEmailSignIn;

//   const SignInScreen({super.key, required this.isEmailSignIn});

//   @override
//   State<SignInScreen> createState() => _SignInScreenState();
// }

// class _SignInScreenState extends State<SignInScreen> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _phoneController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();
//   bool _rememberMe = false;
//   bool _obscurePassword = true;
//   bool _isLoading = false;

//   @override
//   void initState() {
//     super.initState();
//     _loadSavedCredentials();
//   }

//   @override
//   void dispose() {
//     _emailController.dispose();
//     _phoneController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }

//   Future<void> _loadSavedCredentials() async {
//     final prefs = await SharedPreferences.getInstance();
//     setState(() {
//       _rememberMe = prefs.getBool('rememberMe') ?? false;
//       if (_rememberMe) {
//         _emailController.text = prefs.getString('savedEmail') ?? '';
//         _phoneController.text = prefs.getString('savedPhone') ?? '';
//       }
//     });
//   }

//   Future<void> _saveCredentials() async {
//     final prefs = await SharedPreferences.getInstance();
//     if (_rememberMe) {
//       await prefs.setString('savedEmail', _emailController.text);
//       await prefs.setString('savedPhone', _phoneController.text);
//       await prefs.setBool('rememberMe', true);
//     } else {
//       await prefs.remove('savedEmail');
//       await prefs.remove('savedPhone');
//       await prefs.setBool('rememberMe', false);
//     }
//   }

//   Future<void> _signIn() async {
//     if (!_formKey.currentState!.validate()) return;

//     final String contactInfo = widget.isEmailSignIn
//         ? _emailController.text.trim()
//         : _phoneController.text.trim();
//     final String password = _passwordController.text;

//     // Local validation
//     if (contactInfo.isEmpty || password.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//             content: Text('Please enter both email/phone and password')),
//       );
//       return;
//     }

//     setState(() => _isLoading = true);

//     try {
//       final dioClient = DioClient();
//       final response = await dioClient.post(
//         ApiEndpoints.login,
//         data: {
//           'Email': contactInfo,
//           'Password': password,
//         },
//       ).timeout(const Duration(seconds: 30));

//       if (!mounted) return;

//       if (response.statusCode == 200) {
//         final data = response.data;
//         final token = data['token'];
//         // استرجاع الاسم من الاستجابة، لو مش موجود هيستخدم قيمة افتراضية
//         final userName = data['displayName'] ?? 'User';

//         // حفظ التوكن والاسم في SharedPreferences
//         final prefs = await SharedPreferences.getInstance();
//         await prefs.setString('authToken', token);
//         await prefs.setString('userName', userName);
//         await _saveCredentials();

//         Navigator.pushAndRemoveUntil(
//           context,
//           MaterialPageRoute(builder: (context) => const HomeScreen()),
//           (route) => false,
//         );
//       } else {
//         final error = response.data;
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text(error['title'] ?? 'Login failed')),
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
//         errorMessage = e.response!.data['title'] ?? 'Login failed';
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
//           'Sign In',
//           style: TextStyle(
//             color: Colors.black,
//             fontSize: 18,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: Form(
//         key: _formKey,
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(24),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 widget.isEmailSignIn ? 'Email' : 'Phone Number',
//                 style: const TextStyle(
//                   fontSize: 14,
//                   fontWeight: FontWeight.w500,
//                   color: Colors.black87,
//                 ),
//               ),
//               const SizedBox(height: 8),
//               TextFormField(
//                 controller:
//                     widget.isEmailSignIn ? _emailController : _phoneController,
//                 keyboardType: widget.isEmailSignIn
//                     ? TextInputType.emailAddress
//                     : TextInputType.phone,
//                 decoration: InputDecoration(
//                   hintText: widget.isEmailSignIn
//                       ? 'Enter Your Email'
//                       : 'Enter Your Phone Number',
//                   prefixIcon: Icon(
//                     widget.isEmailSignIn
//                         ? Icons.email_outlined
//                         : Icons.phone_outlined,
//                     color: Colors.grey,
//                   ),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return widget.isEmailSignIn
//                         ? 'Please enter your email'
//                         : 'Please enter your phone number';
//                   }
//                   if (widget.isEmailSignIn && !value.contains('@')) {
//                     return 'Please enter a valid email';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 16),
//               const Text(
//                 'Password',
//                 style: TextStyle(
//                   fontSize: 14,
//                   fontWeight: FontWeight.w500,
//                   color: Colors.black87,
//                 ),
//               ),
//               const SizedBox(height: 8),
//               TextFormField(
//                 controller: _passwordController,
//                 obscureText: _obscurePassword,
//                 decoration: InputDecoration(
//                   hintText: 'Enter Your Password',
//                   prefixIcon:
//                       const Icon(Icons.lock_outline, color: Colors.grey),
//                   suffixIcon: IconButton(
//                     icon: Icon(
//                       _obscurePassword
//                           ? Icons.visibility_off
//                           : Icons.visibility,
//                       color: Colors.grey,
//                     ),
//                     onPressed: () {
//                       setState(() => _obscurePassword = !_obscurePassword);
//                     },
//                   ),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your password';
//                   }
//                   if (value.length < 6) {
//                     return 'Password must be at least 6 characters';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 16),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Row(
//                     children: [
//                       Checkbox(
//                         value: _rememberMe,
//                         onChanged: (value) {
//                           setState(() => _rememberMe = value ?? false);
//                         },
//                         activeColor: const Color(0xFF4E7D96),
//                       ),
//                       const SizedBox(width: 8),
//                       const Text('Remember Me'),
//                     ],
//                   ),
//                   TextButton(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => widget.isEmailSignIn
//                               ? const ForgotPasswordScreen()
//                               : const ForgotPasswordPhoneScreen(),
//                         ),
//                       );
//                     },
//                     child: const Text('Forgot Password?'),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 24),
//               SizedBox(
//                 width: double.infinity,
//                 height: 50,
//                 child: ElevatedButton(
//                   onPressed: _isLoading ? null : _signIn,
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color(0xFF4E7D96),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                   ),
//                   child: _isLoading
//                       ? const CircularProgressIndicator(
//                           color: Colors.white,
//                           strokeWidth: 2,
//                         )
//                       : const Text('Sign In'),
//                 ),
//               ),
//               const SizedBox(height: 24),
//               const Row(
//                 children: [
//                   Expanded(child: Divider()),
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 16),
//                     child: Text('Or'),
//                   ),
//                   Expanded(child: Divider()),
//                 ],
//               ),
//               const SizedBox(height: 24),
//               _buildSocialButton(
//                 text: widget.isEmailSignIn
//                     ? 'Continue With Phone Number'
//                     : 'Continue With Email',
//                 icon: widget.isEmailSignIn ? Icons.phone : Icons.email_outlined,
//                 onPressed: () {
//                   Navigator.pushReplacement(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) =>
//                           SignInScreen(isEmailSignIn: !widget.isEmailSignIn),
//                     ),
//                   );
//                 },
//               ),
//               const SizedBox(height: 16),
//               _buildSocialButton(
//                 text: 'Continue With Google',
//                 icon: Icons.g_mobiledata,
//                 onPressed: () => _handleSocialLogin('Google'),
//               ),
//               const SizedBox(height: 16),
//               _buildSocialButton(
//                 text: 'Continue With Facebook',
//                 icon: Icons.facebook,
//                 onPressed: () => _handleSocialLogin('Facebook'),
//               ),
//               const SizedBox(height: 16),
//               _buildSocialButton(
//                 text: 'Continue With Apple',
//                 icon: Icons.apple,
//                 onPressed: () => _handleSocialLogin('Apple'),
//               ),
//               const SizedBox(height: 24),
//               Center(
//                 child: TextButton(
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => const SignUpScreen()),
//                     );
//                   },
//                   child: const Text.rich(
//                     TextSpan(
//                       text: "Don't have an account? ",
//                       children: [
//                         TextSpan(
//                           text: 'Sign Up',
//                           style: TextStyle(
//                             color: Color(0xFF4E7D96),
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildSocialButton({
//     required String text,
//     required IconData icon,
//     required VoidCallback onPressed,
//   }) {
//     final Color iconColor = _getSocialButtonColor(text);

//     return OutlinedButton(
//       onPressed: onPressed,
//       style: OutlinedButton.styleFrom(
//         side: const BorderSide(color: Colors.grey),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(8),
//         ),
//         minimumSize: const Size(double.infinity, 50),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(icon, color: iconColor),
//           const SizedBox(width: 12),
//           Text(text),
//         ],
//       ),
//     );
//   }

//   Color _getSocialButtonColor(String text) {
//     switch (text) {
//       case 'Continue With Google':
//         return Colors.red;
//       case 'Continue With Facebook':
//         return const Color(0xFF1877F2);
//       case 'Continue With Apple':
//         return Colors.black;
//       default:
//         return const Color(0xFF4E7D96);
//     }
//   }

//   void _handleSocialLogin(String provider) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('$provider Sign In not implemented yet')),
//     );
//   }
// }
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'package:apptravella/screens/home_screen.dart';
import 'package:apptravella/services/api/api_endpoints.dart';
import 'package:apptravella/services/api/dio_client.dart';
import 'forgot_password_screen.dart';
import 'forgot_password_phone_screen.dart';
import 'sign_up_screen.dart';

class SignInScreen extends StatefulWidget {
  final bool isEmailSignIn;

  const SignInScreen({super.key, required this.isEmailSignIn});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _rememberMe = false;
  bool _obscurePassword = true;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadSavedCredentials();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _loadSavedCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _rememberMe = prefs.getBool('rememberMe') ?? false;
      if (_rememberMe) {
        _emailController.text = prefs.getString('savedEmail') ?? '';
        _phoneController.text = prefs.getString('savedPhone') ?? '';
      }
    });
  }

  Future<void> _saveCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    if (_rememberMe) {
      await prefs.setString('savedEmail', _emailController.text);
      await prefs.setString('savedPhone', _phoneController.text);
      await prefs.setBool('rememberMe', true);
    } else {
      await prefs.remove('savedEmail');
      await prefs.remove('savedPhone');
      await prefs.setBool('rememberMe', false);
    }
  }

  Future<void> _signIn() async {
    if (!_formKey.currentState!.validate()) return;

    final String contactInfo = widget.isEmailSignIn
        ? _emailController.text.trim()
        : _phoneController.text.trim();
    final String password = _passwordController.text;

    // Local validation
    if (contactInfo.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Please enter both email/phone and password')),
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      final dioClient = DioClient();
      final response = await dioClient.post(
        ApiEndpoints.login,
        data: {
          'Email': contactInfo,
          'Password': password,
        },
      ).timeout(const Duration(seconds: 30));

      if (!mounted) return;

      if (response.statusCode == 200) {
        final data = response.data;
        final token = data['token'];
        // استرجاع الاسم من الاستجابة، لو مش موجود هيستخدم قيمة افتراضية
        final userName = data['displayName'] ?? 'User';
        // إضافة حفظ user_id
        final userId = data['user_id']; // افترض إن الـ API بيرجع user_id

        // حفظ التوكن والاسم وuser_id في SharedPreferences
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('authToken', token);
        await prefs.setString('userName', userName);
        if (userId != null) {
          await prefs.setInt('user_id', userId); // حفظ user_id لو موجود
        }
        await _saveCredentials();

        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
          (route) => false,
        );
      } else {
        final error = response.data;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error['title'] ?? 'Login failed')),
        );
      }
    } on TimeoutException {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Request timed out. Please try again.')),
      );
    } on DioException catch (e) {
      if (!mounted) return;
      String errorMessage = 'An error occurred';
      if (e.response != null) {
        errorMessage = e.response!.data['title'] ?? 'Login failed';
      } else {
        errorMessage = e.message ?? 'Network error';
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );
    } catch (e) {
      if (!mounted) return;
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
          'Sign In',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.isEmailSignIn ? 'Email' : 'Phone Number',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller:
                    widget.isEmailSignIn ? _emailController : _phoneController,
                keyboardType: widget.isEmailSignIn
                    ? TextInputType.emailAddress
                    : TextInputType.phone,
                decoration: InputDecoration(
                  hintText: widget.isEmailSignIn
                      ? 'Enter Your Email'
                      : 'Enter Your Phone Number',
                  prefixIcon: Icon(
                    widget.isEmailSignIn
                        ? Icons.email_outlined
                        : Icons.phone_outlined,
                    color: Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return widget.isEmailSignIn
                        ? 'Please enter your email'
                        : 'Please enter your phone number';
                  }
                  if (widget.isEmailSignIn && !value.contains('@')) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              const Text(
                'Password',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _passwordController,
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  hintText: 'Enter Your Password',
                  prefixIcon:
                      const Icon(Icons.lock_outline, color: Colors.grey),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() => _obscurePassword = !_obscurePassword);
                    },
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: _rememberMe,
                        onChanged: (value) {
                          setState(() => _rememberMe = value ?? false);
                        },
                        activeColor: const Color(0xFF4E7D96),
                      ),
                      const SizedBox(width: 8),
                      const Text('Remember Me'),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => widget.isEmailSignIn
                              ? const ForgotPasswordScreen()
                              : const ForgotPasswordPhoneScreen(),
                        ),
                      );
                    },
                    child: const Text('Forgot Password?'),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _signIn,
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
                      : const Text('Sign In'),
                ),
              ),
              const SizedBox(height: 24),
              const Row(
                children: [
                  Expanded(child: Divider()),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text('Or'),
                  ),
                  Expanded(child: Divider()),
                ],
              ),
              const SizedBox(height: 24),
              _buildSocialButton(
                text: widget.isEmailSignIn
                    ? 'Continue With Phone Number'
                    : 'Continue With Email',
                icon: widget.isEmailSignIn ? Icons.phone : Icons.email_outlined,
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          SignInScreen(isEmailSignIn: !widget.isEmailSignIn),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
              _buildSocialButton(
                text: 'Continue With Google',
                icon: Icons.g_mobiledata,
                onPressed: () => _handleSocialLogin('Google'),
              ),
              const SizedBox(height: 16),
              _buildSocialButton(
                text: 'Continue With Facebook',
                icon: Icons.facebook,
                onPressed: () => _handleSocialLogin('Facebook'),
              ),
              const SizedBox(height: 16),
              _buildSocialButton(
                text: 'Continue With Apple',
                icon: Icons.apple,
                onPressed: () => _handleSocialLogin('Apple'),
              ),
              const SizedBox(height: 24),
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignUpScreen()),
                    );
                  },
                  child: const Text.rich(
                    TextSpan(
                      text: "Don't have an account? ",
                      children: [
                        TextSpan(
                          text: 'Sign Up',
                          style: TextStyle(
                            color: Color(0xFF4E7D96),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSocialButton({
    required String text,
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    final Color iconColor = _getSocialButtonColor(text);

    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: Colors.grey),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        minimumSize: const Size(double.infinity, 50),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: iconColor),
          const SizedBox(width: 12),
          Text(text),
        ],
      ),
    );
  }

  Color _getSocialButtonColor(String text) {
    switch (text) {
      case 'Continue With Google':
        return Colors.red;
      case 'Continue With Facebook':
        return const Color(0xFF1877F2);
      case 'Continue With Apple':
        return Colors.black;
      default:
        return const Color(0xFF4E7D96);
    }
  }

  void _handleSocialLogin(String provider) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$provider Sign In not implemented yet')),
    );
  }
}