// import 'package:flutter/material.dart';
// // تأكد من أن المسارات التالية صحيحة بالنسبة لمشروعك
// import 'package:travella/screens/PersonalDetailsScreen.dart';
// import 'package:travella/screens/create_new_password_screen.dart';
// import 'package:travella/screens/payment_methods_screen.dart';
// import 'package:travella/screens/points_screen.dart';
// import 'package:travella/screens/history_screen.dart';
// import 'package:travella/screens/deactivate_account_screen.dart'; // <-- *** استيراد شاشة التعطيل ***
// import 'package:travella/screens/delete_account_screen.dart'; // <-- *** استيراد شاشة الحذف ***

// class ManageAccountScreen extends StatelessWidget {
//   const ManageAccountScreen({super.key});

//   // Helper widget لبناء خيارات القائمة
//   Widget _buildAccountOption({
//     required BuildContext context,
//     required IconData icon,
//     required String title,
//     required String subtitle,
//     required VoidCallback onTap,
//   }) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
//         margin: const EdgeInsets.only(bottom: 16),
//         decoration: BoxDecoration(
//           color: const Color(0xFFEEEEEE),
//           borderRadius: BorderRadius.circular(12),
//         ),
//         child: Row(
//           children: [
//             Icon(icon, color: const Color(0xFF406F89), size: 24),
//             const SizedBox(width: 16),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     title,
//                     style: const TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w500,
//                         color: Colors.black87),
//                   ),
//                   const SizedBox(height: 2),
//                   Text(
//                     subtitle,
//                     style: TextStyle(fontSize: 13, color: Colors.grey[600]),
//                   ),
//                 ],
//               ),
//             ),
//             const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 18),
//           ],
//         ),
//       ),
//     );
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
//           'Manage Your Account',
//           style: TextStyle(
//               color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
//         ),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             _buildAccountOption(
//               context: context,
//               icon: Icons.person_outline,
//               title: 'Personal Details',
//               subtitle: 'Update Your Info',
//               onTap: () => Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => const PersonalDetailsScreen())),
//             ),
//             _buildAccountOption(
//               context: context,
//               icon: Icons.lock_outline,
//               title: 'Password',
//               subtitle: 'Change Password',
//               onTap: () => Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => const CreateNewPasswordScreen())),
//             ),
//             _buildAccountOption(
//               context: context,
//               icon: Icons.credit_card_outlined,
//               title: 'Payment Methods',
//               subtitle: 'Add Or Remove Payment Methods',
//               onTap: () => Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => const PaymentMethodsScreen())),
//             ),
//             _buildAccountOption(
//               context: context,
//               icon: Icons.card_giftcard_outlined,
//               title: 'Points',
//               subtitle: 'Collect Rewards',
//               onTap: () => Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => const PointsScreen())),
//             ),
//             _buildAccountOption(
//               context: context,
//               icon: Icons.history_outlined,
//               title: 'History',
//               subtitle: 'Last Log In',
//               onTap: () => Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => const HistoryScreen())),
//             ),

//             const SizedBox(height: 24),
//             const Divider(color: Color(0xFF406F89), thickness: 1.5, height: 1),
//             const SizedBox(height: 24),

//             const Padding(
//               padding: EdgeInsets.only(bottom: 16.0),
//               child: Text('Deactivation & Deletion',
//                   style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.w600,
//                       color: Colors.black87)),
//             ),

//             // ******** تعديل onTap هنا للتعطيل **********
//             _buildAccountOption(
//               context: context,
//               icon: Icons.no_accounts_outlined,
//               title: 'Deactivate Account',
//               subtitle: 'Hide Your Pins & Profile',
//               onTap: () {
//                 // الانتقال إلى شاشة تأكيد التعطيل
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) =>
//                           const DeactivateAccountScreen()), // <-- الانتقال
//                 );
//               },
//             ),
//             // ******** نهاية التعديل **********

//             // ******** تعديل onTap هنا للحذف **********
//             _buildAccountOption(
//               context: context,
//               icon: Icons.delete_outline,
//               title: 'Delete Your Account',
//               subtitle: 'Delete Your Account & Data',
//               onTap: () {
//                 // الانتقال إلى شاشة تأكيد الحذف
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) =>
//                           const DeleteAccountScreen()), // <-- الانتقال
//                 );
//               },
//             ),
//             // ******** نهاية التعديل **********
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:apptravella/screens/PersonalDetailsScreen.dart';
import 'package:apptravella/screens/ReactivateAccountScreen.dart';
import 'package:apptravella/screens/create_new_password_screen.dart';
import 'package:apptravella/screens/payment_methods_screen.dart';
import 'package:apptravella/screens/points_screen.dart';
import 'package:apptravella/screens/history_screen.dart';
import 'package:apptravella/screens/deactivate_account_screen.dart';
import 'package:apptravella/screens/delete_account_screen.dart';

class ManageAccountScreen extends StatelessWidget {
  const ManageAccountScreen({super.key});

  Widget _buildAccountOption({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: const Color(0xFFEEEEEE),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(icon, color: const Color(0xFF406F89), size: 24),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: TextStyle(fontSize: 13, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 18),
          ],
        ),
      ),
    );
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
          'Manage Your Account',
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildAccountOption(
              context: context,
              icon: Icons.person_outline,
              title: 'Personal Details',
              subtitle: 'Update Your Info',
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PersonalDetailsScreen())),
            ),
            _buildAccountOption(
              context: context,
              icon: Icons.lock_outline,
              title: 'Password',
              subtitle: 'Change Password',
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CreateNewPasswordScreen())),
            ),
            _buildAccountOption(
              context: context,
              icon: Icons.credit_card_outlined,
              title: 'Payment Methods',
              subtitle: 'Add Or Remove Payment Methods',
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PaymentMethodsScreen())),
            ),
            _buildAccountOption(
              context: context,
              icon: Icons.card_giftcard_outlined,
              title: 'Points',
              subtitle: 'Collect Rewards',
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PointsScreen())),
            ),
            _buildAccountOption(
              context: context,
              icon: Icons.history_outlined,
              title: 'History',
              subtitle: 'Last Log In',
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const HistoryScreen())),
            ),
            const SizedBox(height: 24),
            const Divider(color: Color(0xFF406F89), thickness: 1.5, height: 1),
            const SizedBox(height: 24),
            const Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: Text('Deactivation & Reactivation',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87)),
            ),
            _buildAccountOption(
              context: context,
              icon: Icons.no_accounts_outlined,
              title: 'Deactivate Account',
              subtitle: 'Hide Your Pins & Profile',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DeactivateAccountScreen()),
                );
              },
            ),
            _buildAccountOption(
              context: context,
              icon: Icons.account_circle_outlined,
              title: 'Reactivate Account',
              subtitle: 'Reactivate Your Account',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ReactivateAccountScreen()),
                );
              },
            ),
            _buildAccountOption(
              context: context,
              icon: Icons.delete_outline,
              title: 'Delete Your Account',
              subtitle: 'Delete Your Account & Data',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DeleteAccountScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
