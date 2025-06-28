// import 'package:flutter/material.dart';
// import 'package:travella/screens/sign_in_screen.dart';
// import 'package:travella/screens/sign_up_screen.dart';

// class WelcomeScreen extends StatelessWidget {
//   const WelcomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Image.asset(
//             'assets/background.jpeg',
//             width: double.infinity,
//             height: double.infinity,
//             fit: BoxFit.cover,
//           ),
//           Container(
//             width: double.infinity,
//             height: double.infinity,
//             color: Colors.black.withOpacity(0.5),
//           ),
//           SafeArea(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const SizedBox(height: 20),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 24),
//                   child: Image.asset(
//                     'assets/WhatsApp_Image_2025-03-01_at_12.30.21_PM-removebg-preview.png',
//                     width: 150,
//                     height: 150,
//                   ),
//                 ),
//                 const SizedBox(height: 40),
//                 const Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 24),
//                   child: Text(
//                     'Thousands of\nHotels &\nFlights',
//                     style: TextStyle(
//                       fontSize: 42,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                       height: 1.2,
//                     ),
//                   ),
//                 ),
//                 const Spacer(),
//                 // Sign In Button
//                 Center(
//                   child: SizedBox(
//                     width: 120,
//                     height: 35,
//                     child: ElevatedButton(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) =>
//                                 const SignInScreen(isEmailSignIn: true),
//                           ),
//                         );
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: const Color(0xFF2C5D73),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(4),
//                         ),
//                         padding: EdgeInsets.zero,
//                       ),
//                       child: const Text(
//                         'Sign in',
//                         style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.w900,
//                           color: Colors.white,
//                           letterSpacing: 0.5,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Center(
//                   child: TextButton(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => const SignUpScreen(),
//                         ),
//                       );
//                     },
//                     style: TextButton.styleFrom(
//                       padding: const EdgeInsets.symmetric(vertical: 4),
//                     ),
//                     child: const Text(
//                       "Don't Have An Account? Sign Up",
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 11,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 4),
//                 // Or Divider
//                 const Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 80),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Expanded(
//                         child: Divider(
//                           color: Colors.white70,
//                           thickness: 0.3,
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 8),
//                         child: Text(
//                           'Or',
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 10,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                       ),
//                       Expanded(
//                         child: Divider(
//                           color: Colors.white70,
//                           thickness: 0.3,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 4),
//                 Center(
//                   child: Text(
//                     'Continue in',
//                     style: TextStyle(
//                       color: Colors.white.withOpacity(0.9),
//                       fontSize: 13,
//                       fontWeight: FontWeight.w600,
//                       letterSpacing: 0.5,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 4),
//                 // Guest Mode Button
//                 Center(
//                   child: SizedBox(
//                     width: 120,
//                     height: 35,
//                     child: ElevatedButton(
//                       onPressed: () {},
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: const Color(0xFF2C5D73),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(4),
//                         ),
//                         padding: EdgeInsets.zero,
//                       ),
//                       child: const Text(
//                         'Guest mode',
//                         style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.w900,
//                           color: Colors.white,
//                           letterSpacing: 0.5,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 24),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:apptravella/screens/sign_in_screen.dart';
import 'package:apptravella/screens/sign_up_screen.dart';
import 'package:apptravella/screens/home_screen.dart'; // إضافة استيراد HomeScreen

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/background.jpeg',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.black.withOpacity(0.5),
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: Image.asset(
                    'assets/WhatsApp_Image_2025-03-01_at_12.30.21_PM-removebg-preview.png',
                    width: 150,
                    height: 150,
                  ),
                ),
                const SizedBox(height: 40),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    'Thousands of\nHotels &\nFlights',
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      height: 1.2,
                    ),
                  ),
                ),
                const Spacer(),
                // Sign In Button
                Center(
                  child: SizedBox(
                    width: 120,
                    height: 35,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const SignInScreen(isEmailSignIn: true),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF2C5D73),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        padding: EdgeInsets.zero,
                      ),
                      child: const Text(
                        'Sign in',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUpScreen(),
                        ),
                      );
                    },
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                    ),
                    child: const Text(
                      "Don't Have An Account? Sign Up",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                // Or Divider
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 80),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Divider(
                          color: Colors.white70,
                          thickness: 0.3,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          'Or',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color: Colors.white70,
                          thickness: 0.3,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                Center(
                  child: Text(
                    'Continue in',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                // Guest Mode Button
                Center(
                  child: SizedBox(
                    width: 120,
                    height: 35,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF2C5D73),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        padding: EdgeInsets.zero,
                      ),
                      child: const Text(
                        'Guest mode',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
