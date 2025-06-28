// // import 'package:flutter/material.dart';

// // import 'package:travella/screens/favorites_screen.dart';
// // import 'package:travella/screens/active_bookings_screen.dart';
// // import 'package:travella/screens/home_screen.dart';
// // import 'package:travella/screens/profile_screen.dart';

// // class CustomBottomNavigationBar extends StatefulWidget {
// //   final int currentIndex;

// //   const CustomBottomNavigationBar({
// //     Key? key,
// //     this.currentIndex = 0,
// //   }) : super(key: key);

// //   @override
// //   State<CustomBottomNavigationBar> createState() =>
// //       _CustomBottomNavigationBarState();
// // }

// // class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
// //   late int _selectedIndex;
// //   final double _barHeight = 65.0; // Height of the main bar part
// //   final double _iconSize = 28.0;
// //   final double _circleDiameter = 60.0; // Diameter of the icon circle
// //   final double _notchDepth = 25.0; // How much the notch dips from the top

// //   @override
// //   void initState() {
// //     super.initState();
// //     _selectedIndex = widget.currentIndex;
// //   }

// //   void _onItemTapped(int index) {
// //     if (_selectedIndex == index) return;

// //     setState(() {
// //       _selectedIndex = index;
// //     });

// //     // Navigation logic
// //     switch (index) {
// //       case 0:
// //         Navigator.pushReplacement(
// //           context,
// //           MaterialPageRoute(builder: (context) => const HomeScreen()),
// //         );
// //         break;
// //       case 1:
// //         Navigator.pushReplacement(
// //           context,
// //           MaterialPageRoute(builder: (context) => const FavoritesScreen()),
// //         );
// //         break;
// //       case 2:
// //         Navigator.pushReplacement(
// //           context,
// //           MaterialPageRoute(builder: (context) => const ActiveBookingsScreen()),
// //         );
// //         break;
// //       case 3:
// //         Navigator.pushReplacement(
// //           context,
// //           MaterialPageRoute(builder: (context) => const ProfileScreen()),
// //         );
// //         break;
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     final screenWidth = MediaQuery.of(context).size.width;
// //     const double totalMargin = 32; // horizontal: 16 * 2
// //     final double barWidth = screenWidth - totalMargin;
// //     final double itemWidth = barWidth / 4;
// //     final double notchCenter = (itemWidth * _selectedIndex) + (itemWidth / 2);

// //     return Container(
// //       margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
// //       height: _barHeight, // Height is defined by the painter/stack
// //       child: Stack(
// //         clipBehavior: Clip.none, // Allow circle to overflow
// //         children: [
// //           // Background shape with notch
// //           CustomPaint(
// //             size: Size(barWidth, _barHeight),
// //             painter: NotchedNavBarPainter(
// //               color: const Color(0xFF406F89),
// //               notchCenterX: notchCenter,
// //               barHeight: _barHeight,
// //               notchDepth: _notchDepth,
// //               circleRadius: _circleDiameter / 2,
// //               cornerRadius: 30.0, // Matches ClipRRect radius
// //             ),
// //           ),
// //           // Icons Row
// //           Positioned(
// //             top: 0,
// //             left: 0,
// //             right: 0,
// //             height: _barHeight, // Icons sit within the bar height primarily
// //             child: Row(
// //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //               children: [
// //                 _buildNavItem(Icons.home_rounded, 0, itemWidth),
// //                 _buildNavItem(Icons.favorite, 1, itemWidth),
// //                 _buildNavItem(Icons.bed, 2, itemWidth),
// //                 _buildNavItem(Icons.person, 3, itemWidth),
// //               ],
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// //   Widget _buildNavItem(IconData icon, int index, double itemWidth) {
// //     bool isSelected = _selectedIndex == index;
// //     // Move selected item up to sit in the notch
// //     final double verticalOffset = isSelected ? -_notchDepth : 0;

// //     return GestureDetector(
// //       onTap: () => _onItemTapped(index),
// //       // Ensure the container covers the tappable area
// //       child: Container(
// //         width: itemWidth,
// //         color: Colors.transparent, // Make container tappable but invisible
// //         child: Align(
// //           alignment: Alignment.center,
// //           child: Transform.translate(
// //             offset: Offset(0, verticalOffset),
// //             child: Container(
// //               width: _circleDiameter,
// //               height: _circleDiameter,
// //               decoration: BoxDecoration(
// //                 shape: BoxShape.circle,
// //                 color: isSelected ? Colors.white : Colors.transparent,
// //                 boxShadow: isSelected
// //                     ? [
// //                         BoxShadow(
// //                           color: Colors.black.withOpacity(0.1),
// //                           blurRadius: 5,
// //                           spreadRadius: 1,
// //                           offset: const Offset(0, 1),
// //                         )
// //                       ]
// //                     : [],
// //               ),
// //               child: Icon(
// //                 icon,
// //                 color: isSelected ? const Color(0xFF406F89) : Colors.white,
// //                 size: _iconSize,
// //               ),
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // // Custom Painter for the navigation bar background with TOP notch
// // class NotchedNavBarPainter extends CustomPainter {
// //   final Color color;
// //   final double notchCenterX;
// //   final double barHeight;
// //   final double notchDepth; // How far the notch goes below y=0
// //   final double circleRadius;
// //   final double cornerRadius;

// //   NotchedNavBarPainter({
// //     required this.color,
// //     required this.notchCenterX,
// //     required this.barHeight,
// //     required this.notchDepth,
// //     required this.circleRadius,
// //     required this.cornerRadius,
// //   });

// //   @override
// //   void paint(Canvas canvas, Size size) {
// //     final Paint paint = Paint()..color = color;
// //     final Path path = Path();

// //     final double R = cornerRadius;
// //     final double r = circleRadius;
// //     final double h = barHeight;
// //     final double w = size.width;
// //     final double n = notchCenterX;
// //     // Make notch slightly wider than circle for visual appeal
// //     const double notchWidthFactor = 1.1;
// //     final double notchStart = n - (r * notchWidthFactor);
// //     final double notchEnd = n + (r * notchWidthFactor);

// //     // Control points for the curve (adjust for smoothness)
// //     final double cp1x = n - r * 0.7;
// // // Dip below 0
// //     final double cp2x = n + r * 0.7;
// //     final double bottomNotchY = -notchDepth; // Deepest point

// //     path.moveTo(0, R);
// //     path.quadraticBezierTo(0, 0, R, 0); // Top-left corner
// //     path.lineTo(notchStart, 0); // Top edge to notch

// //     // Bezier curve for the notch (dipping downwards)
// //     path.cubicTo(cp1x, 0, cp1x, bottomNotchY, n, bottomNotchY);
// //     path.cubicTo(cp2x, bottomNotchY, cp2x, 0, notchEnd, 0);

// //     path.lineTo(w - R, 0); // Top edge after notch
// //     path.quadraticBezierTo(w, 0, w, R); // Top-right corner
// //     path.lineTo(w, h - R); // Right edge
// //     path.quadraticBezierTo(w, h, w - R, h); // Bottom-right corner
// //     path.lineTo(R, h); // Bottom edge
// //     path.quadraticBezierTo(0, h, 0, h - R); // Bottom-left corner
// //     path.close();

// //     canvas.drawPath(path, paint);
// //   }

// //   @override
// //   bool shouldRepaint(covariant NotchedNavBarPainter oldDelegate) {
// //     return oldDelegate.notchCenterX != notchCenterX ||
// //         oldDelegate.color != color;
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:travella/screens/ProfileSignedInScreen.dart';
// // تأكد من أن مسارات هذه الشاشات صحيحة في مشروعك
// import 'package:travella/screens/favorites_screen.dart';
// import 'package:travella/screens/active_bookings_screen.dart';
// import 'package:travella/screens/home_screen.dart';
// // أو ProfileSignedInScreen حسب الحالة

// // --- Widget شريط التنقل السفلي المخصص ---
// class CustomBottomNavigationBar extends StatefulWidget {
//   final int currentIndex;

//   const CustomBottomNavigationBar({
//     super.key,
//     this.currentIndex = 0, required void Function(int index) onTap, // الافتراضي هو الشاشة الرئيسية (index 0)
//   });

//   @override
//   State<CustomBottomNavigationBar> createState() =>
//       _CustomBottomNavigationBarState();
// }

// class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
//   late int _selectedIndex;

//   // --- الأبعاد والأنماط الأساسية (قيم مطابقة للكود الأصلي) ---
//   static const double barHeight = 65.0;
//   static const double circleDiameter = 58.0;
//   static const double iconSize = 28.0;
//   static const double cornerRadius = 30.0;
//   static const double notchRadius = 35.0;
//   static const double selectedItemElevation = 15.0;

//   // الألوان (قيم مطابقة للكود الأصلي)
//   static const Color primaryColor = Color(0xFF406F89);
//   static final Color inactiveColor = Colors.white.withOpacity(0.9);
//   static const Color selectedBgColor = Colors.white;
//   // --- نهاية الأبعاد والأنماط ---

//   @override
//   void initState() {
//     super.initState();
//     _selectedIndex = widget.currentIndex;
//   }

//   // --- دالة لمعالجة الضغط على عنصر والانتقال ---
//   void _onItemTapped(int index) {
//     final currentRouteName = ModalRoute.of(context)?.settings.name;
//     final targetRouteName = '/${_getRouteName(index)}';

//     if (_selectedIndex == index && currentRouteName == targetRouteName) {
//       // Already on the target screen
//       return;
//     }

//     // Navigation logic using pushReplacement
//     switch (index) {
//       case 0: // Home
//         if (currentRouteName != '/home') {
//           Navigator.pushReplacement(
//               context, _createRoute(const HomeScreen(), '/home'));
//         }
//         break;
//       case 1: // Favorites
//         if (currentRouteName != '/favorites') {
//           Navigator.pushReplacement(
//               context, _createRoute(const FavoritesScreen(), '/favorites'));
//         }
//         break;
//       case 2: // Bookings
//         if (currentRouteName != '/bookings') {
//           Navigator.pushReplacement(
//               context, _createRoute(const ActiveBookingsScreen(), '/bookings'));
//         }
//         break;
//       case 3: // Profile
//         if (currentRouteName != '/profile') {
//           // Add authentication check logic here if needed
//           Navigator.pushReplacement(
//               context, _createRoute(const ProfileSignedInScreen(), '/profile'));
//         }
//         break;
//     }

//     if (mounted && _selectedIndex != index) {
//       setState(() {
//         _selectedIndex = index;
//       });
//     }
//   }

//   // --- دالة مساعدة لإنشاء مسار الصفحة (Route) ---
//   Route _createRoute(Widget screen, String routeName) {
//     return PageRouteBuilder(
//       settings: RouteSettings(name: routeName),
//       pageBuilder: (context, animation, secondaryAnimation) => screen,
//       transitionsBuilder: (context, animation, secondaryAnimation, child) {
//         return FadeTransition(opacity: animation, child: child); // Simple fade
//       },
//       transitionDuration: const Duration(milliseconds: 150),
//     );
//   }

//   // --- دالة مساعدة للحصول على اسم المسار النصي ---
//   String _getRouteName(int index) {
//     switch (index) {
//       case 0:
//         return 'home';
//       case 1:
//         return 'favorites';
//       case 2:
//         return 'bookings';
//       case 3:
//         return 'profile';
//       default:
//         return '';
//     }
//   }

//   // --- بناء واجهة المستخدم لشريط التنقل ---
//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     const double horizontalMargin = 16.0;
//     final double barWidth = screenWidth - (horizontalMargin * 2);
//     const int itemCount = 4;
//     final double itemWidth = barWidth / itemCount;
//     final double notchCenterX = (itemWidth * _selectedIndex) + (itemWidth / 2);
//     const double totalHeight = barHeight + selectedItemElevation;

//     return Container(
//       margin: const EdgeInsets.symmetric(
//           horizontal: horizontalMargin, vertical: 15),
//       width: barWidth,
//       height: totalHeight,
//       child: Stack(
//         clipBehavior: Clip.none,
//         alignment: Alignment.bottomCenter,
//         children: [
//           // --- 1. رسم خلفية الشريط (Painter) ---
//           Positioned(
//             bottom: 0,
//             left: 0,
//             right: 0,
//             height: barHeight,
//             child: CustomPaint(
//               painter: NotchedNavBarPainter(
//                 color: primaryColor,
//                 notchCenterX: notchCenterX,
//                 barHeight: barHeight,
//                 notchRadius: notchRadius,
//                 cornerRadius: cornerRadius,
//               ),
//             ),
//           ),
//           // --- 2. وضع الأيقونات فوق الخلفية ---
//           Positioned(
//             top: 0,
//             left: 0,
//             right: 0,
//             height: totalHeight,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // استخدام الأيقونات المحددة لكل فهرس
//                 _buildNavItem(Icons.home_filled, 0, itemWidth, totalHeight),
//                 _buildNavItem(Icons.favorite, 1, itemWidth, totalHeight),
//                 _buildNavItem(Icons.bed_outlined, 2, itemWidth, totalHeight),
//                 _buildNavItem(Icons.person_outline, 3, itemWidth, totalHeight),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // --- دالة مساعدة لبناء كل عنصر أيقونة ---
//   Widget _buildNavItem(
//       IconData icon, int index, double itemWidth, double totalHeight) {
//     bool isSelected = _selectedIndex == index;
//     final double verticalPosition = isSelected ? 0 : selectedItemElevation;

//     return SizedBox(
//       width: itemWidth,
//       height: totalHeight,
//       child: GestureDetector(
//         onTap: () => _onItemTapped(index),
//         behavior: HitTestBehavior.opaque,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             SizedBox(height: verticalPosition),
//             Container(
//               width: isSelected ? circleDiameter : iconSize + 8, // حجم الحاوية
//               height: isSelected ? circleDiameter : iconSize + 8,
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: isSelected ? selectedBgColor : Colors.transparent,
//                 boxShadow: isSelected
//                     ? [
//                         BoxShadow(
//                           color: Colors.black.withOpacity(0.15),
//                           blurRadius: 8,
//                           offset: const Offset(0, 2),
//                         )
//                       ]
//                     : [],
//               ),
//               child: Center(
//                 child: Icon(
//                   icon, // استخدام الأيقونة الممررة
//                   color: isSelected
//                       ? primaryColor
//                       : inactiveColor, // تطبيق اللون المناسب
//                   size: iconSize,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // --- Custom Painter لرسم الشريط مع الـ Notch العلوي ---
// class NotchedNavBarPainter extends CustomPainter {
//   final Color color;
//   final double notchCenterX;
//   final double barHeight;
//   final double notchRadius;
//   final double cornerRadius;

//   NotchedNavBarPainter({
//     required this.color,
//     required this.notchCenterX,
//     required this.barHeight,
//     required this.notchRadius,
//     required this.cornerRadius,
//   });

//   @override
//   void paint(Canvas canvas, Size size) {
//     final Paint paint = Paint()
//       ..color = color
//       ..style = PaintingStyle.fill;

//     final Path path = Path();
//     final double w = size.width;
//     final double h = size.height;
//     final double r = cornerRadius;
//     final double nRadius = notchRadius;

//     final double notchStart = notchCenterX - nRadius;
//     final double notchEnd = notchCenterX + nRadius;

//     path.moveTo(r, h);
//     path.lineTo(w - r, h);
//     path.arcToPoint(Offset(w, h - r),
//         radius: Radius.circular(r), clockwise: false);
//     path.lineTo(w, r);
//     path.arcToPoint(Offset(w - r, 0),
//         radius: Radius.circular(r), clockwise: false);
//     path.lineTo(notchEnd, 0);
//     path.arcToPoint(
//       Offset(notchStart, 0),
//       radius: Radius.circular(nRadius),
//       clockwise: true,
//       largeArc: false,
//     );
//     path.lineTo(r, 0);
//     path.arcToPoint(Offset(0, r), radius: Radius.circular(r), clockwise: false);
//     path.lineTo(0, h - r);
//     path.arcToPoint(Offset(r, h), radius: Radius.circular(r), clockwise: false);
//     path.close();

//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(covariant NotchedNavBarPainter oldDelegate) {
//     return oldDelegate.notchCenterX != notchCenterX ||
//         oldDelegate.color != color ||
//         oldDelegate.barHeight != barHeight ||
//         oldDelegate.notchRadius != notchRadius ||
//         oldDelegate.cornerRadius != cornerRadius;
//   }
// }
import 'package:flutter/material.dart';
import 'package:apptravella/screens/ProfileSignedInScreen.dart';
// تأكد من أن مسارات هذه الشاشات صحيحة في مشروعك
import 'package:apptravella/screens/favorites_screen.dart';
import 'package:apptravella/screens/active_bookings_screen.dart';
import 'package:apptravella/screens/home_screen.dart';

// --- Widget شريط التنقل السفلي المخصص ---
class CustomBottomNavigationBar extends StatefulWidget {
  final int currentIndex;
  final void Function(int index) onTap; // تم تحديد onTap كـ required parameter

  const CustomBottomNavigationBar({
    super.key,
    this.currentIndex = 0, // الافتراضي هو الشاشة الرئيسية (index 0)
    required this.onTap, // جعلناها required
  });

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  late int _selectedIndex;

  // --- الأبعاد والأنماط الأساسية (قيم مطابقة للكود الأصلي) ---
  static const double barHeight = 65.0;
  static const double circleDiameter = 58.0;
  static const double iconSize = 28.0;
  static const double cornerRadius = 30.0;
  static const double notchRadius = 35.0;
  static const double selectedItemElevation = 15.0;

  // الألوان (قيم مطابقة للكود الأصلي)
  static const Color primaryColor = Color(0xFF406F89);
  static final Color inactiveColor = Colors.white.withOpacity(0.9);
  static const Color selectedBgColor = Colors.white;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.currentIndex;
  }

  // --- دالة لمعالجة الضغط على عنصر والانتقال ---
  void _onItemTapped(int index) {
    final currentRouteName = ModalRoute.of(context)?.settings.name;
    final targetRouteName = '/${_getRouteName(index)}';

    if (_selectedIndex == index && currentRouteName == targetRouteName) {
      // Already on the target screen, no action needed
      return;
    }

    // Navigation logic using pushReplacement
    switch (index) {
      case 0: // Home
        if (currentRouteName != '/home') {
          widget.onTap(index); // استدعاء onTap من الشاشة الأم
          Navigator.pushReplacement(
              context, _createRoute(const HomeScreen(), '/home'));
        }
        break;
      case 1: // Favorites
        if (currentRouteName != '/favorites') {
          widget.onTap(index); // استدعاء onTap من الشاشة الأم
          Navigator.pushReplacement(
              context, _createRoute(const FavoritesScreen(), '/favorites'));
        }
        break;
      case 2: // Bookings
        if (currentRouteName != '/bookings') {
          widget.onTap(index); // استدعاء onTap من الشاشة الأم
          Navigator.pushReplacement(
              context, _createRoute(const ActiveBookingsScreen(), '/bookings'));
        }
        break;
      case 3: // Profile
        if (currentRouteName != '/profile') {
          widget.onTap(index); // استدعاء onTap من الشاشة الأم
          Navigator.pushReplacement(
              context, _createRoute(const ProfileSignedInScreen(), '/profile'));
        }
        break;
    }

    if (mounted && _selectedIndex != index) {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  // --- دالة مساعدة لإنشاء مسار الصفحة (Route) ---
  Route _createRoute(Widget screen, String routeName) {
    return PageRouteBuilder(
      settings: RouteSettings(name: routeName),
      pageBuilder: (context, animation, secondaryAnimation) => screen,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child); // Simple fade
      },
      transitionDuration: const Duration(milliseconds: 150),
    );
  }

  // --- دالة مساعدة للحصول على اسم المسار النصي ---
  String _getRouteName(int index) {
    switch (index) {
      case 0:
        return 'home';
      case 1:
        return 'favorites';
      case 2:
        return 'bookings';
      case 3:
        return 'profile';
      default:
        return '';
    }
  }

  // --- بناء واجهة المستخدم لشريط التنقل ---
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    const double horizontalMargin = 16.0;
    final double barWidth = screenWidth - (horizontalMargin * 2);
    const int itemCount = 4;
    final double itemWidth = barWidth / itemCount;
    final double notchCenterX = (itemWidth * _selectedIndex) + (itemWidth / 2);
    const double totalHeight = barHeight + selectedItemElevation;

    return Container(
      margin: const EdgeInsets.symmetric(
          horizontal: horizontalMargin, vertical: 15),
      width: barWidth,
      height: totalHeight,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomCenter,
        children: [
          // --- 1. رسم خلفية الشريط (Painter) ---
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: barHeight,
            child: CustomPaint(
              painter: NotchedNavBarPainter(
                color: primaryColor,
                notchCenterX: notchCenterX,
                barHeight: barHeight,
                notchRadius: notchRadius,
                cornerRadius: cornerRadius,
              ),
            ),
          ),
          // --- 2. وضع الأيقونات فوق الخلفية ---
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: totalHeight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // استخدام الأيقونات المحددة لكل فهرس
                _buildNavItem(Icons.home_filled, 0, itemWidth, totalHeight),
                _buildNavItem(Icons.favorite, 1, itemWidth, totalHeight),
                _buildNavItem(Icons.bed_outlined, 2, itemWidth, totalHeight),
                _buildNavItem(Icons.person_outline, 3, itemWidth, totalHeight),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // --- دالة مساعدة لبناء كل عنصر أيقونة ---
  Widget _buildNavItem(
      IconData icon, int index, double itemWidth, double totalHeight) {
    bool isSelected = _selectedIndex == index;
    final double verticalPosition = isSelected ? 0 : selectedItemElevation;

    return SizedBox(
      width: itemWidth,
      height: totalHeight,
      child: GestureDetector(
        onTap: () => _onItemTapped(index),
        behavior: HitTestBehavior.opaque,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: verticalPosition),
            Container(
              width: isSelected ? circleDiameter : iconSize + 8, // حجم الحاوية
              height: isSelected ? circleDiameter : iconSize + 8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected ? selectedBgColor : Colors.transparent,
                boxShadow: isSelected
                    ? [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        )
                      ]
                    : [],
              ),
              child: Center(
                child: Icon(
                  icon, // استخدام الأيقونة الممررة
                  color: isSelected
                      ? primaryColor
                      : inactiveColor, // تطبيق اللون المناسب
                  size: iconSize,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// --- Custom Painter لرسم الشريط مع الـ Notch العلوي ---
class NotchedNavBarPainter extends CustomPainter {
  final Color color;
  final double notchCenterX;
  final double barHeight;
  final double notchRadius;
  final double cornerRadius;

  NotchedNavBarPainter({
    required this.color,
    required this.notchCenterX,
    required this.barHeight,
    required this.notchRadius,
    required this.cornerRadius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final Path path = Path();
    final double w = size.width;
    final double h = size.height;
    final double r = cornerRadius;
    final double nRadius = notchRadius;

    final double notchStart = notchCenterX - nRadius;
    final double notchEnd = notchCenterX + nRadius;

    path.moveTo(r, h);
    path.lineTo(w - r, h);
    path.arcToPoint(Offset(w, h - r),
        radius: Radius.circular(r), clockwise: false);
    path.lineTo(w, r);
    path.arcToPoint(Offset(w - r, 0),
        radius: Radius.circular(r), clockwise: false);
    path.lineTo(notchEnd, 0);
    path.arcToPoint(
      Offset(notchStart, 0),
      radius: Radius.circular(nRadius),
      clockwise: true,
      largeArc: false,
    );
    path.lineTo(r, 0);
    path.arcToPoint(Offset(0, r), radius: Radius.circular(r), clockwise: false);
    path.lineTo(0, h - r);
    path.arcToPoint(Offset(r, h), radius: Radius.circular(r), clockwise: false);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant NotchedNavBarPainter oldDelegate) {
    return oldDelegate.notchCenterX != notchCenterX ||
        oldDelegate.color != color ||
        oldDelegate.barHeight != barHeight ||
        oldDelegate.notchRadius != notchRadius ||
        oldDelegate.cornerRadius != cornerRadius;
  }
}
