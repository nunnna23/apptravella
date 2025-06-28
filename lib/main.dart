// // // import 'dart:io'; // <-- تم التأكد من وجود هذا السطر

// // // import 'package:flutter/material.dart';
// // // import 'package:travella/screens/splash_screen.dart'; // Make sure this path is correct
// // // import 'package:flutter_bloc/flutter_bloc.dart';
// // // import 'utils/service_locator.dart';
// // // import 'cubit/flight/flight_cubit.dart';
// // // import 'cubit/auth/auth_cubit.dart';

// // // // Define the primary color constant for easy reuse
// // // const Color kPrimaryColor =
// // //     Color(0xFF4E7D96); // The blue color from your design

// // // void main() {
// // //   // Ensures that plugin services are initialized before runApp() is called.
// // //   WidgetsFlutterBinding.ensureInitialized();

// // //   // --- الكود المضاف لتجاهل شهادة الأمان في وضع التطوير ---
// // //   // تحذير: لا تستخدم هذا الكود في التطبيق النهائي (Production)!
// // //   HttpOverrides.global = MyHttpOverrides();
// // //   // -------------------------------------------------------

// // //   setupServiceLocator();

// // //   runApp(const MyApp()); // السطر الأصلي لتشغيل التطبيق
// // // }

// // // class MyApp extends StatelessWidget {
// // //   const MyApp({super.key});

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return MultiBlocProvider(
// // //       providers: [
// // //         BlocProvider(create: (_) => getIt<FlightCubit>()),
// // //         BlocProvider(create: (_) => getIt<AuthCubit>()),
// // //       ],
// // //       child: MaterialApp(
// // //         // Hides the debug banner in the top-right corner
// // //         debugShowCheckedModeBanner: false,
// // //         title: 'TraVella', // The title of your app

// // //         // --- Light Theme Configuration ---
// // //         theme: ThemeData(
// // //           // Use Material 3 design language
// // //           useMaterial3: true,

// // //           // Set the primary color swatch
// // //           primaryColor: kPrimaryColor,

// // //           // Define the color scheme based on the primary color
// // //           colorScheme: ColorScheme.fromSeed(
// // //             seedColor: kPrimaryColor, // Base color for generating the scheme
// // //             primary:
// // //                 kPrimaryColor, // Explicitly set the primary color in the scheme
// // //             brightness: Brightness.light, // Specify this is for the light theme
// // //           ),

// // //           // --- Component Theme Customizations (Matching Previous Examples) ---

// // //           // Customize AppBar theme
// // //           appBarTheme: const AppBarTheme(
// // //             backgroundColor: Colors.white, // White background for AppBars
// // //             foregroundColor:
// // //                 Colors.black, // Black color for icons and text on AppBar
// // //             elevation: 1.0, // Default subtle shadow
// // //             scrolledUnderElevation:
// // //                 1.0, // Maintain shadow when content scrolls under
// // //             iconTheme:
// // //                 IconThemeData(color: Colors.black), // Ensure icons are black
// // //             titleTextStyle: TextStyle(
// // //               // Default title style
// // //               color: Colors.black,
// // //               fontSize: 18,
// // //               fontWeight: FontWeight.bold,
// // //             ),
// // //           ),

// // //           // Customize Slider theme
// // //           sliderTheme: SliderThemeData(
// // //             activeTrackColor: kPrimaryColor,
// // //             inactiveTrackColor: kPrimaryColor.withOpacity(0.3),
// // //             thumbColor: kPrimaryColor,
// // //             overlayColor: kPrimaryColor.withOpacity(0.2),
// // //             valueIndicatorColor: kPrimaryColor.withOpacity(0.8),
// // //             valueIndicatorTextStyle: const TextStyle(color: Colors.white),
// // //           ),

// // //           // Customize Chip theme
// // //           chipTheme: ChipThemeData(
// // //             selectedColor: kPrimaryColor,
// // //             secondarySelectedColor:
// // //                 kPrimaryColor, // Use primary for consistency
// // //             backgroundColor: Colors.grey[200],
// // //             disabledColor: Colors.grey[400]!,
// // //             padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
// // //             labelStyle: TextStyle(
// // //                 color: Colors.grey[800],
// // //                 fontSize: 13), // Darker grey for unselected text
// // //             secondaryLabelStyle: const TextStyle(
// // //                 color: Colors.white, fontSize: 13), // Style for selected label
// // //             shape: RoundedRectangleBorder(
// // //                 borderRadius: BorderRadius.circular(8.0)),
// // //             side: BorderSide.none, // No border by default
// // //           ),

// // //           // Customize TextButton theme (optional, but good for consistency)
// // //           textButtonTheme: TextButtonThemeData(
// // //             style: TextButton.styleFrom(
// // //               foregroundColor:
// // //                   kPrimaryColor, // Default text color for text buttons
// // //             ),
// // //           ),

// // //           // Customize ElevatedButton theme (optional)
// // //           elevatedButtonTheme: ElevatedButtonThemeData(
// // //               style: ElevatedButton.styleFrom(
// // //             backgroundColor:
// // //                 kPrimaryColor, // Default background for elevated buttons
// // //             foregroundColor:
// // //                 Colors.white, // Default text color for elevated buttons
// // //             shape: RoundedRectangleBorder(
// // //                 borderRadius: BorderRadius.circular(12)), // Default shape
// // //             padding:
// // //                 const EdgeInsets.symmetric(vertical: 16), // Default padding
// // //           )),

// // //           // Set Scaffold background color if needed (often white by default)
// // //           scaffoldBackgroundColor: Colors.white,

// // //           // Define default text themes if needed
// // //           // textTheme: TextTheme(...)
// // //         ),

// // //         // --- Dark Theme Configuration (Basic Example) ---
// // //         // You might want to customize this further later if needed
// // //         darkTheme: ThemeData(
// // //           useMaterial3: true,
// // //           primaryColor: kPrimaryColor, // You can keep the same primary color
// // //           colorScheme: ColorScheme.fromSeed(
// // //             seedColor: kPrimaryColor,
// // //             primary: kPrimaryColor,
// // //             brightness: Brightness.dark, // Specify this is for the dark theme
// // //             // You might need to adjust surface, background, etc. colors for dark mode
// // //             // surface: Colors.grey[850],
// // //             // background: Colors.black,
// // //           ),
// // //           // Customize dark theme components specifically if ThemeData.dark() isn't sufficient
// // //           // appBarTheme: AppBarTheme(...)
// // //           // sliderTheme: SliderThemeData(...)
// // //           // chipTheme: ChipThemeData(...)
// // //           // scaffoldBackgroundColor: Colors.black, // Example
// // //         ),

// // //         // Define how the theme mode is chosen (e.g., system default, always light, always dark)
// // //         themeMode: ThemeMode.system, // Follows the system setting (light/dark)

// // //         // The initial screen of the app
// // //         home:
// // //             const SplashScreen(), // Assuming SplashScreen handles initialization/navigation
// // //       ),
// // //     );
// // //   }
// // // }

// // // // --- الكلاس المضاف لتجاهل شهادة الأمان ---
// // // class MyHttpOverrides extends HttpOverrides {
// // //   @override
// // //   HttpClient createHttpClient(SecurityContext? context) {
// // //     return super.createHttpClient(context)
// // //       ..badCertificateCallback =
// // //           (X509Certificate cert, String host, int port) => true;
// // //   }
// // // }
// // import 'dart:io';
// // import 'package:flutter/material.dart';
// // import 'package:travella/screens/splash_screen.dart';

// // import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'utils/service_locator.dart';
// // import 'cubit/flight/flight_cubit.dart';
// // import 'cubit/auth/auth_cubit.dart';

// // const Color kPrimaryColor = Color(0xFF4E7D96);

// // void main() {
// //   WidgetsFlutterBinding.ensureInitialized();
// //   HttpOverrides.global = MyHttpOverrides();
// //   runApp(const MyApp());
// // }

// // class MyApp extends StatelessWidget {
// //   const MyApp({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return MultiBlocProvider(
// //       providers: [
// //         BlocProvider(create: (_) => getIt<FlightCubit>()),
// //         BlocProvider(create: (_) => getIt<AuthCubit>()),
// //       ],
// //       child: MaterialApp(
// //         builder: (context, child) => LayoutBuilder(
// //           builder: (context, constraints) {
// //             return MediaQuery(
// //               data: MediaQuery.of(context).copyWith(
// //                 textScaleFactor: constraints.maxWidth > 600 ? 1.0 : 0.9,
// //               ),
// //               child: child!,
// //             );
// //           },
// //         ),
// //         debugShowCheckedModeBanner: false,
// //         title: 'TraVella',
// //         theme: ThemeData(
// //           useMaterial3: true,
// //           primaryColor: kPrimaryColor,
// //           colorScheme: ColorScheme.fromSeed(
// //             seedColor: kPrimaryColor,
// //             primary: kPrimaryColor,
// //             brightness: Brightness.light,
// //           ),
// //           appBarTheme: const AppBarTheme(
// //             backgroundColor: Colors.white,
// //             foregroundColor: Colors.black,
// //             elevation: 1.0,
// //             scrolledUnderElevation: 1.0,
// //             iconTheme: IconThemeData(color: Colors.black),
// //             titleTextStyle: TextStyle(
// //               color: Colors.black,
// //               fontSize: 18,
// //               fontWeight: FontWeight.bold,
// //             ),
// //           ),
// //           sliderTheme: SliderThemeData(
// //             activeTrackColor: kPrimaryColor,
// //             inactiveTrackColor: kPrimaryColor.withOpacity(0.3),
// //             thumbColor: kPrimaryColor,
// //             overlayColor: kPrimaryColor.withOpacity(0.2),
// //             valueIndicatorColor: kPrimaryColor.withOpacity(0.8),
// //             valueIndicatorTextStyle: const TextStyle(color: Colors.white),
// //           ),
// //           chipTheme: ChipThemeData(
// //             selectedColor: kPrimaryColor,
// //             secondarySelectedColor: kPrimaryColor,
// //             backgroundColor: Colors.grey[200],
// //             disabledColor: Colors.grey[400]!,
// //             padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
// //             labelStyle: TextStyle(color: Colors.grey[800], fontSize: 13),
// //             secondaryLabelStyle:
// //                 const TextStyle(color: Colors.white, fontSize: 13),
// //             shape: RoundedRectangleBorder(
// //                 borderRadius: BorderRadius.circular(8.0)),
// //             side: BorderSide.none,
// //           ),
// //           textButtonTheme: TextButtonThemeData(
// //             style: TextButton.styleFrom(
// //               foregroundColor: kPrimaryColor,
// //             ),
// //           ),
// //           elevatedButtonTheme: ElevatedButtonThemeData(
// //               style: ElevatedButton.styleFrom(
// //             backgroundColor: kPrimaryColor,
// //             foregroundColor: Colors.white,
// //             shape:
// //                 RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
// //             padding: const EdgeInsets.symmetric(vertical: 16),
// //           )),
// //           scaffoldBackgroundColor: Colors.white,
// //         ),
// //         darkTheme: ThemeData(
// //           useMaterial3: true,
// //           primaryColor: kPrimaryColor,
// //           colorScheme: ColorScheme.fromSeed(
// //             seedColor: kPrimaryColor,
// //             primary: kPrimaryColor,
// //             brightness: Brightness.dark,
// //           ),
// //         ),
// //         themeMode: ThemeMode.system,
// //         home: const SplashScreen(),
// //       ),
// //     );
// //   }
// // }

// // class MyHttpOverrides extends HttpOverrides {
// //   @override
// //   HttpClient createHttpClient(SecurityContext? context) {
// //     return super.createHttpClient(context)
// //       ..badCertificateCallback =
// //           (X509Certificate cert, String host, int port) => true;
// //   }
// // }
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:travella/screens/splash_screen.dart';

// const Color kPrimaryColor = Color(0xFF4E7D96);

// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   HttpOverrides.global = MyHttpOverrides();
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       builder: (context, child) => LayoutBuilder(
//         builder: (context, constraints) {
//           return MediaQuery(
//             data: MediaQuery.of(context).copyWith(
//               textScaleFactor: constraints.maxWidth > 600 ? 1.0 : 0.9,
//             ),
//             child: child!,
//           );
//         },
//       ),
//       debugShowCheckedModeBanner: false,
//       title: 'TraVella',
//       theme: ThemeData(
//         useMaterial3: true,
//         primaryColor: kPrimaryColor,
//         colorScheme: ColorScheme.fromSeed(
//           seedColor: kPrimaryColor,
//           primary: kPrimaryColor,
//           brightness: Brightness.light,
//         ),
//         appBarTheme: const AppBarTheme(
//           backgroundColor: Colors.white,
//           foregroundColor: Colors.black,
//           elevation: 1.0,
//           scrolledUnderElevation: 1.0,
//           iconTheme: IconThemeData(color: Colors.black),
//           titleTextStyle: TextStyle(
//             color: Colors.black,
//             fontSize: 18,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         sliderTheme: SliderThemeData(
//           activeTrackColor: kPrimaryColor,
//           inactiveTrackColor: kPrimaryColor.withOpacity(0.3),
//           thumbColor: kPrimaryColor,
//           overlayColor: kPrimaryColor.withOpacity(0.2),
//           valueIndicatorColor: kPrimaryColor.withOpacity(0.8),
//           valueIndicatorTextStyle: const TextStyle(color: Colors.white),
//         ),
//         chipTheme: ChipThemeData(
//           selectedColor: kPrimaryColor,
//           secondarySelectedColor: kPrimaryColor,
//           backgroundColor: Colors.grey[200],
//           disabledColor: Colors.grey[400]!,
//           padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
//           labelStyle: TextStyle(color: Colors.grey[800], fontSize: 13),
//           secondaryLabelStyle:
//               const TextStyle(color: Colors.white, fontSize: 13),
//           shape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
//           side: BorderSide.none,
//         ),
//         textButtonTheme: TextButtonThemeData(
//           style: TextButton.styleFrom(
//             foregroundColor: kPrimaryColor,
//           ),
//         ),
//         elevatedButtonTheme: ElevatedButtonThemeData(
//             style: ElevatedButton.styleFrom(
//           backgroundColor: kPrimaryColor,
//           foregroundColor: Colors.white,
//           shape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//           padding: const EdgeInsets.symmetric(vertical: 16),
//         )),
//         scaffoldBackgroundColor: Colors.white,
//       ),
//       darkTheme: ThemeData(
//         useMaterial3: true,
//         primaryColor: kPrimaryColor,
//         colorScheme: ColorScheme.fromSeed(
//           seedColor: kPrimaryColor,
//           primary: kPrimaryColor,
//           brightness: Brightness.dark,
//         ),
//       ),
//       themeMode: ThemeMode.system,
//       home: const SplashScreen(),
//     );
//   }
// }

// class MyHttpOverrides extends HttpOverrides {
//   @override
//   HttpClient createHttpClient(SecurityContext? context) {
//     return super.createHttpClient(context)
//       ..badCertificateCallback =
//           (X509Certificate cert, String host, int port) => true;
//   }
// }

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:apptravella/screens/splash_screen.dart';

const Color kPrimaryColor = Color(0xFF4E7D96);

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => LayoutBuilder(
        builder: (context, constraints) {
          return MediaQuery(
            data: MediaQuery.of(
              context,
            ).copyWith(textScaleFactor: constraints.maxWidth > 600 ? 1.0 : 0.9),
            child: child!,
          );
        },
      ),
      debugShowCheckedModeBanner: false,
      title: 'TraVella',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: kPrimaryColor,
        colorScheme: ColorScheme.fromSeed(
          seedColor: kPrimaryColor,
          primary: kPrimaryColor,
          brightness: Brightness.light,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 1.0,
          scrolledUnderElevation: 1.0,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        sliderTheme: SliderThemeData(
          activeTrackColor: kPrimaryColor,
          inactiveTrackColor: kPrimaryColor.withOpacity(0.3),
          thumbColor: kPrimaryColor,
          overlayColor: kPrimaryColor.withOpacity(0.2),
          valueIndicatorColor: kPrimaryColor.withOpacity(0.8),
          valueIndicatorTextStyle: const TextStyle(color: Colors.white),
        ),
        chipTheme: ChipThemeData(
          selectedColor: kPrimaryColor,
          secondarySelectedColor: kPrimaryColor,
          backgroundColor: Colors.grey[200],
          disabledColor: Colors.grey[400]!,
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          labelStyle: TextStyle(color: Colors.grey[800], fontSize: 13),
          secondaryLabelStyle: const TextStyle(
            color: Colors.white,
            fontSize: 13,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          side: BorderSide.none,
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(foregroundColor: kPrimaryColor),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kPrimaryColor,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
        ),
        scaffoldBackgroundColor: Colors.white,
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        primaryColor: kPrimaryColor,
        colorScheme: ColorScheme.fromSeed(
          seedColor: kPrimaryColor,
          primary: kPrimaryColor,
          brightness: Brightness.dark,
        ),
      ),
      themeMode: ThemeMode.system,
      home: const SplashScreen(),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
