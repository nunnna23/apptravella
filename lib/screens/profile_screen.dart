// import 'package:flutter/material.dart';
// import 'package:travella/screens/SettingsScreen.dart';
// import '../widgets/custom_bottom_navigation_bar.dart';
// import 'notifications_screen.dart';
// import 'faq_screen.dart';
// import 'about_us_screen.dart';

// class ProfileScreen extends StatelessWidget {
//   const ProfileScreen({Key? key}) : super(key: key);

//   Widget _buildProfileOption({
//     required IconData icon,
//     required String title,
//     VoidCallback? onTap,
//   }) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
//         margin: const EdgeInsets.only(bottom: 16),
//         decoration: BoxDecoration(
//           color: const Color(0xFFEEEEEE),
//           borderRadius: BorderRadius.circular(12),
//         ),
//         child: Row(
//           children: [
//             Icon(
//               icon,
//               color: const Color(0xFF406F89),
//               size: 24,
//             ),
//             const SizedBox(width: 16),
//             Text(
//               title,
//               style: const TextStyle(
//                 fontSize: 16,
//                 color: Colors.black,
//                 fontWeight: FontWeight.w400,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Column(
//           children: [
//             // Profile Icon and Sign In/Sign Up
//             Padding(
//               padding: const EdgeInsets.fromLTRB(16, 40, 16, 0),
//               child: Column(
//                 children: [
//                   Container(
//                     width: 120,
//                     height: 120,
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       border: Border.all(
//                         color: const Color(0xFF406F89),
//                         width: 3,
//                       ),
//                     ),
//                     child: const Icon(
//                       Icons.person_outline,
//                       size: 60,
//                       color: Color(0xFF406F89),
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   const Text(
//                     'Sign In / Sign up',
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.w500,
//                       color: Color(0xFF406F89),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 32),
//             Container(
//               width: double.infinity,
//               height: 4,
//               color: const Color(0xFF406F89),
//             ),
//             const SizedBox(height: 32),

//             // Profile Options
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               child: Column(
//                 children: [
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => const NotificationsScreen(),
//                         ),
//                       );
//                     },
//                     child: _buildProfileOption(
//                       icon: Icons.notifications_none_outlined,
//                       title: 'Notifications',
//                     ),
//                   ),
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => const SettingsScreen(),
//                         ),
//                       );
//                     },
//                     child: _buildProfileOption(
//                       icon: Icons.settings_outlined,
//                       title: 'Settings',
//                     ),
//                   ),
//                   _buildProfileOption(
//                     icon: Icons.help_outline_outlined,
//                     title: 'FAQ',
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => const FAQScreen(),
//                         ),
//                       );
//                     },
//                   ),
//                   _buildProfileOption(
//                     icon: Icons.info_outline_rounded,
//                     title: 'About Us',
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => const AboutUsScreen(),
//                         ),
//                       );
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: const CustomBottomNavigationBar(currentIndex: 3),
//     );
//   }
// }

import 'package:flutter/material.dart';
//import 'package:travella/screens/ManageAccountScreen.dart';
import 'package:apptravella/screens/SettingsScreen.dart';
import 'package:apptravella/screens/sign_in_screen.dart'; // استيراد شاشة تسجيل الدخول
import 'package:apptravella/screens/sign_up_screen.dart'; // استيراد شاشة إنشاء الحساب
import '../widgets/custom_bottom_navigation_bar.dart';
import 'notifications_screen.dart'; // استيراد شاشة الإشعارات
import 'faq_screen.dart';
import 'about_us_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  // Helper widget
  Widget _buildProfileOption({
    required IconData icon,
    required String title,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: const Color(0xFFEEEEEE), // لون خلفية الخيارات
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: const Color(0xFF406F89), // لون أيقونات الخيارات
              size: 24,
            ),
            const SizedBox(width: 16),
            // ******** التعديل هنا: إضافة Expanded **********
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            // ******** نهاية التعديل **********
            // السهم يأتي بعد النص الموسع، فيتم دفعه لليمين
            Icon(Icons.arrow_forward_ios,
                size: 16, color: Colors.grey.shade600),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const TextStyle linkStyle = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: Color(0xFF406F89), // اللون الأزرق للنص
    );

    const Color accentColor = Color(0xFF406F89); // تعريف اللون الرئيسي

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: accentColor, width: 2.5),
                      ),
                      child: const Icon(Icons.person_outline,
                          size: 60, color: accentColor),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      // أزرار Sign In / Sign Up
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignInScreen(
                                      isEmailSignIn:
                                          true))), // تأكد من isEmailSignIn
                          style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              minimumSize: const Size(50, 30),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              alignment: Alignment.center),
                          child: const Text('Sign In', style: linkStyle),
                        ),
                        const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4.0),
                            child: Text('/', style: linkStyle)),
                        TextButton(
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignUpScreen())),
                          style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              minimumSize: const Size(50, 30),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              alignment: Alignment.center),
                          child: const Text('Sign up', style: linkStyle),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 32),
              const Divider(
                // الخط الفاصل
                color: accentColor, thickness: 1.5, height: 1, indent: 16,
                endIndent: 16,
              ),
              const SizedBox(height: 32),
              Padding(
                // خيارات المستخدم
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    // _buildProfileOption(
                    //   icon: Icons.person_outline, // أيقونة إدارة الحساب
                    //   title: 'Manage Your Account',
                    //   onTap: () {
                    //     // الانتقال مباشرة إلى شاشة إدارة الحساب
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //           builder: (context) =>
                    //               const ManageAccountScreen()),
                    //     );
                    //   },
                    // ),
                    _buildProfileOption(
                        icon: Icons.notifications_none_outlined,
                        title: 'Notifications',
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const NotificationsScreen()));
                        }),
                    _buildProfileOption(
                      icon: Icons.settings_outlined,
                      title: 'Settings',
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SettingsScreen())),
                    ),
                    _buildProfileOption(
                      icon: Icons.help_outline_outlined,
                      title: 'FAQ',
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const FAQScreen())),
                    ),
                    _buildProfileOption(
                      icon: Icons.info_outline_rounded,
                      title: 'About Us',
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AboutUsScreen())),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 3,
        onTap: (int index) {},
      ),
    );
  }
}
