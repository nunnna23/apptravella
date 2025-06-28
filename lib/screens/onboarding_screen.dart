// // import 'package:flutter/material.dart';
// // import 'package:apptravella/screens/highlighted_text.dart';
// // import 'package:apptravella/screens/welcome.dart';
// // import '../models/onboarding_content.dart';

// // class AppColors {
// //   static const Color primary = Colors.blue;
// //   static const Color secondary = Colors.grey;
// //   static const Color highlight = Color(0xFFFF7733);
// // }

// // class OnboardingScreen extends StatefulWidget {
// //   const OnboardingScreen({super.key});

// //   @override
// //   State<OnboardingScreen> createState() => _OnboardingScreenState();
// // }

// // class _OnboardingScreenState extends State<OnboardingScreen> {
// //   int currentPage = 0;
// //   final PageController _pageController = PageController();

// //   final List<OnboardingContent> contents = [
// //     OnboardingContent(
// //       title: "Life is short and the\nworld is wide",
// //       description:
// //           "At Friends-tours and travel, we customize reliable and trustworthy educational tours to destinations all over the world",
// //       image: "assets/onboarding11.jpeg",
// //       buttonText: "Get Started",
// //     ),
// //     OnboardingContent(
// //       title: "It's a big world out\nthere go explore",
// //       description:
// //           "To get the best of your adventure you just need to leave and go where you like. we are waiting for you",
// //       image: "assets/onboarding2.jpeg",
// //       buttonText: "Next",
// //     ),
// //     OnboardingContent(
// //       title: "People don't take trips,\ntrips take people",
// //       description:
// //           "\"An eco-green trip isn't just a journey; it's a commitment to protect our planet, embrace sustainability, and leave behind only footprints while taking away memories.\" 🌿✨",
// //       image: "assets/onboarding3.jpeg",
// //       buttonText: "Next",
// //     ),
// //   ];

// //   void _onSkipOrNext() {
// //     if (currentPage < contents.length - 1) {
// //       _pageController.nextPage(
// //         duration: const Duration(milliseconds: 300),
// //         curve: Curves.easeIn,
// //       );
// //     } else {
// //       Navigator.pushReplacement(
// //         context,
// //         MaterialPageRoute(
// //           builder: (context) => const WelcomeScreen(),
// //         ),
// //       );
// //     }
// //   }

// //   void _onSkip() {
// //     Navigator.pushReplacement(
// //       context,
// //       MaterialPageRoute(
// //         builder: (context) => const WelcomeScreen(),
// //       ),
// //     );
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return SafeArea(
// //       child: Scaffold(
// //         body: Column(
// //           children: [
// //             Expanded(
// //               child: PageView.builder(
// //                 controller: _pageController,
// //                 itemCount: contents.length,
// //                 onPageChanged: (value) {
// //                   setState(() {
// //                     currentPage = value;
// //                   });
// //                 },
// //                 itemBuilder: (context, index) {
// //                   return OnboardingPageWidget(
// //                     content: contents[index],
// //                     onSkipOrNext: _onSkipOrNext,
// //                     onSkip: _onSkip,
// //                     pageController: _pageController,
// //                     currentIndex: index,
// //                     totalPages: contents.length,
// //                   );
// //                 },
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class OnboardingPageWidget extends StatelessWidget {
// //   final OnboardingContent content;
// //   final VoidCallback onSkipOrNext;
// //   final VoidCallback onSkip;
// //   final PageController pageController;
// //   final int currentIndex;
// //   final int totalPages;

// //   const OnboardingPageWidget({
// //     super.key,
// //     required this.content,
// //     required this.onSkipOrNext,
// //     required this.onSkip,
// //     required this.pageController,
// //     required this.currentIndex,
// //     required this.totalPages,
// //   });

// //   @override
// //   Widget build(BuildContext context) {
// //     return SafeArea(
// //       child: Stack(
// //         children: [
// //           Column(
// //             children: [
// //               SizedBox(
// //                 height: MediaQuery.of(context).size.height * 0.55,
// //                 width: double.infinity,
// //                 child: ClipRRect(
// //                   borderRadius: const BorderRadius.only(
// //                     bottomLeft: Radius.circular(30),
// //                     bottomRight: Radius.circular(30),
// //                   ),
// //                   child: Image.asset(
// //                     content.image,
// //                     fit: BoxFit.cover,
// //                     width: double.infinity,
// //                   ),
// //                 ),
// //               ),
// //               const SizedBox(height: 20),
// //               Padding(
// //                 padding: const EdgeInsets.symmetric(horizontal: 24.0),
// //                 child: Column(
// //                   children: [
// //                     if (content.title.contains('wide'))
// //                       const HighlightedText(
// //                         normalText: 'Life is short and the\nworld is ',
// //                         highlightedText: 'wide',
// //                       )
// //                     else if (content.title.contains('explore'))
// //                       const HighlightedText(
// //                         normalText: "It's a big world out\nthere go ",
// //                         highlightedText: 'explore',
// //                       )
// //                     else
// //                       const HighlightedText(
// //                         normalText: "People don't take trips,\ntrips take ",
// //                         highlightedText: 'people',
// //                       ),
// //                     const SizedBox(height: 15),
// //                     Text(
// //                       content.description,
// //                       textAlign: TextAlign.center,
// //                       style: const TextStyle(
// //                         fontSize: 15,
// //                         color: Color(0xFF666666),
// //                         height: 1.5,
// //                       ),
// //                     ),
// //                     const SizedBox(height: 20),
// //                     Row(
// //                       mainAxisAlignment: MainAxisAlignment.center,
// //                       children: List.generate(
// //                         totalPages,
// //                         (index) => Container(
// //                           height: 10,
// //                           width: currentIndex == index ? 25 : 10,
// //                           margin: const EdgeInsets.only(right: 5),
// //                           decoration: BoxDecoration(
// //                             borderRadius: BorderRadius.circular(20),
// //                             color: currentIndex == index
// //                                 ? const Color(0xFF4E7D96)
// //                                 : Colors.grey,
// //                           ),
// //                         ),
// //                       ),
// //                     ),
// //                     const SizedBox(height: 20), // Adjust this value as needed
// //                     Padding(
// //                       padding: const EdgeInsets.symmetric(horizontal: 24.0),
// //                       child: ElevatedButton(
// //                         onPressed: onSkipOrNext,
// //                         style: ElevatedButton.styleFrom(
// //                           backgroundColor: const Color(0xFF4E7D96),
// //                           minimumSize: const Size(double.infinity, 56),
// //                           shape: RoundedRectangleBorder(
// //                             borderRadius: BorderRadius.circular(12),
// //                           ),
// //                         ),
// //                         child: Text(
// //                           content.buttonText,
// //                           style: const TextStyle(
// //                             fontSize: 16,
// //                             fontWeight: FontWeight.w600,
// //                             color: Colors.white,
// //                           ),
// //                         ),
// //                       ),
// //                     ),
// //                     const SizedBox(height: 5), // Adjust this value as needed
// //                   ],
// //                 ),
// //               ),
// //             ],
// //           ),
// //           Positioned(
// //             top: 20,
// //             right: 20,
// //             child: TextButton(
// //               onPressed: onSkip,
// //               child: const Text(
// //                 'Skip',
// //                 style: TextStyle(
// //                   color: Color(0xFF666666),
// //                   fontSize: 16,
// //                   fontWeight: FontWeight.w500,
// //                 ),
// //               ),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';

// // تعريف الألوان
// class AppColors {
//   static const Color primary = Colors.blue;
//   static const Color secondary = Colors.grey;
//   static const Color highlight = Color(0xFFFF7733);
// }

// // تعريف موديل البيانات لمحتوى الصفحات
// class OnboardingContent {
//   String title;
//   String description;
//   String image;
//   String buttonText;

//   OnboardingContent({
//     required this.title,
//     required this.description,
//     required this.image,
//     required this.buttonText,
//   });
// }

// // الصفحة الرئيسية التي تحتوي على PageView
// class OnboardingScreen extends StatefulWidget {
//   const OnboardingScreen({super.key});

//   @override
//   State<OnboardingScreen> createState() => _OnboardingScreenState();
// }

// class _OnboardingScreenState extends State<OnboardingScreen> {
//   int currentPage = 0;
//   final PageController _pageController = PageController();

//   // محتوى الصفحات الترحيبية
//   final List<OnboardingContent> contents = [
//     OnboardingContent(
//       title: "Life is short and the\nworld is wide",
//       description:
//           "At Friends-tours and travel, we customize reliable and trustworthy educational tours to destinations all over the world",
//       image: "assets/onboarding11.jpeg",
//       buttonText: "Next",
//     ),
//     OnboardingContent(
//       title: "It's a big world out\nthere go explore",
//       description:
//           "To get the best of your adventure you just need to leave and go where you like. we are waiting for you",
//       image: "assets/onboarding2.jpeg",
//       buttonText: "Next",
//     ),
//     OnboardingContent(
//       title: "People don't take trips,\ntrips take people",
//       description:
//           "\"An eco-green trip isn't just a journey; it's a commitment to protect our planet, embrace sustainability, and leave behind only footprints while taking away memories.\" 🌿✨",
//       image: "assets/onboarding3.jpeg",
//       buttonText: "Get Started",
//     ),
//   ];

//   void _onSkipOrNext() {
//     if (currentPage < contents.length - 1) {
//       _pageController.nextPage(
//         duration: const Duration(milliseconds: 300),
//         curve: Curves.easeIn,
//       );
//     } else {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//           builder: (context) => const WelcomeScreen(),
//         ),
//       );
//     }
//   }

//   void _onSkip() {
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(
//         builder: (context) => const WelcomeScreen(),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Column(
//           children: [
//             Expanded(
//               child: PageView.builder(
//                 controller: _pageController,
//                 itemCount: contents.length,
//                 onPageChanged: (value) {
//                   setState(() {
//                     currentPage = value;
//                   });
//                 },
//                 itemBuilder: (context, index) {
//                   return OnboardingPageWidget(
//                     content: contents[index],
//                     onSkipOrNext: _onSkipOrNext,
//                     onSkip: _onSkip,
//                     pageController: _pageController,
//                     currentIndex: index,
//                     totalPages: contents.length,
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// // الويدجت الخاصة بكل صفحة ترحيبية
// class OnboardingPageWidget extends StatelessWidget {
//   final OnboardingContent content;
//   final VoidCallback onSkipOrNext;
//   final VoidCallback onSkip;
//   final PageController pageController;
//   final int currentIndex;
//   final int totalPages;

//   const OnboardingPageWidget({
//     super.key,
//     required this.content,
//     required this.onSkipOrNext,
//     required this.onSkip,
//     required this.pageController,
//     required this.currentIndex,
//     required this.totalPages,
//   });

//   // ويدجت لعرض العنوان مع الكلمة المميزة
//   Widget _buildHighlightedTitle(BuildContext context, double screenWidth) {
//     final titleStyle = TextStyle(
//       fontSize: screenWidth * 0.07, // حجم خط نسبي
//       fontWeight: FontWeight.bold,
//       color: Colors.black,
//       height: 1.3,
//     );
//     final highlightStyle = titleStyle.copyWith(color: AppColors.highlight);

//     List<String> parts;
//     String normalPart;
//     String highlightedPart;

//     if (content.title.contains('wide')) {
//       parts = content.title.split('wide');
//       normalPart = parts[0];
//       highlightedPart = 'wide';
//     } else if (content.title.contains('explore')) {
//       parts = content.title.split('explore');
//       normalPart = parts[0];
//       highlightedPart = 'explore';
//     } else {
//       parts = content.title.split('people');
//       normalPart = parts[0];
//       highlightedPart = 'people';
//     }

//     return RichText(
//       textAlign: TextAlign.center,
//       text: TextSpan(
//         style: titleStyle,
//         children: [
//           TextSpan(text: normalPart),
//           TextSpan(text: highlightedPart, style: highlightStyle),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     // الحصول على أبعاد الشاشة
//     final screenHeight = MediaQuery.of(context).size.height;
//     final screenWidth = MediaQuery.of(context).size.width;

//     return Stack(
//       children: [
//         Column(
//           children: [
//             // الجزء العلوي للصورة
//             SizedBox(
//               height: screenHeight * 0.5, // 50% من ارتفاع الشاشة
//               width: double.infinity,
//               child: ClipRRect(
//                 borderRadius: const BorderRadius.only(
//                   bottomLeft: Radius.circular(30),
//                   bottomRight: Radius.circular(30),
//                 ),
//                 child: Image.asset(
//                   content.image,
//                   fit: BoxFit.cover,
//                   width: double.infinity,
//                   // في حال عدم وجود الصورة، سيظهر هذا النص
//                   errorBuilder: (context, error, stackTrace) {
//                     return const Center(child: Text('Image not found'));
//                   },
//                 ),
//               ),
//             ),
//             // الجزء السفلي للمحتوى (قابل للتمرير)
//             Expanded(
//               child: SingleChildScrollView(
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(
//                       horizontal: screenWidth * 0.06), // 6% من عرض الشاشة
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       SizedBox(height: screenHeight * 0.03),
//                       _buildHighlightedTitle(context, screenWidth),
//                       SizedBox(height: screenHeight * 0.02),
//                       Text(
//                         content.description,
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           fontSize: screenWidth * 0.04, // حجم خط نسبي
//                           color: const Color(0xFF666666),
//                           height: 1.5,
//                         ),
//                       ),
//                       SizedBox(height: screenHeight * 0.03),
//                       // مؤشر الصفحات
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: List.generate(
//                           totalPages,
//                           (index) => Container(
//                             height: screenHeight * 0.012, // ارتفاع نسبي
//                             width: currentIndex == index
//                                 ? screenWidth * 0.06 // عرض نسبي
//                                 : screenWidth * 0.025,
//                             margin: const EdgeInsets.only(right: 5),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(20),
//                               color: currentIndex == index
//                                   ? const Color(0xFF4E7D96)
//                                   : Colors.grey,
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: screenHeight * 0.03),
//                       // زر المتابعة
//                       ElevatedButton(
//                         onPressed: onSkipOrNext,
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: const Color(0xFF4E7D96),
//                           minimumSize:
//                               Size(double.infinity, screenHeight * 0.07),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                         ),
//                         child: Text(
//                           content.buttonText,
//                           style: TextStyle(
//                             fontSize: screenWidth * 0.045, // حجم خط نسبي
//                             fontWeight: FontWeight.w600,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: screenHeight * 0.02),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//         // زر التخطي
//         Positioned(
//           top: 20,
//           right: 20,
//           child: TextButton(
//             onPressed: onSkip,
//             child: Text(
//               'Skip',
//               style: TextStyle(
//                 color: const Color(0xFF666666),
//                 fontSize: screenWidth * 0.04, // حجم خط نسبي
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// // صفحة مؤقتة للانتقال إليها بعد انتهاء الصفحات الترحيبية
// class WelcomeScreen extends StatelessWidget {
//   const WelcomeScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: Center(
//         child: Text(
//           "Welcome to the App!",
//           style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:apptravella/screens/welcome.dart'; // تم تفعيل هذا السطر
import '../models/onboarding_content.dart'; // تم تفعيل هذا السطر

// تعريف الألوان
class AppColors {
  static const Color primary = Colors.blue;
  static const Color secondary = Colors.grey;
  static const Color highlight = Color(0xFFFF7733);
}

// الصفحة الرئيسية التي تحتوي على PageView
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentPage = 0;
  final PageController _pageController = PageController();

  // محتوى الصفحات الترحيبية
  final List<OnboardingContent> contents = [
    OnboardingContent(
      title: "Life is short and the\nworld is wide",
      description:
          "At Friends-tours and travel, we customize reliable and trustworthy educational tours to destinations all over the world",
      image: "assets/onboarding11.jpeg",
      buttonText: "Next",
    ),
    OnboardingContent(
      title: "It's a big world out\nthere go explore",
      description:
          "To get the best of your adventure you just need to leave and go where you like. we are waiting for you",
      image: "assets/onboarding2.jpeg",
      buttonText: "Next",
    ),
    OnboardingContent(
      title: "People don't take trips,\ntrips take people",
      description:
          "\"An eco-green trip isn't just a journey; it's a commitment to protect our planet, embrace sustainability, and leave behind only footprints while taking away memories.\" 🌿✨",
      image: "assets/onboarding3.jpeg",
      buttonText: "Get Started",
    ),
  ];

  void _onSkipOrNext() {
    if (currentPage < contents.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      // الآن سينتقل إلى صفحتك الفعلية
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const WelcomeScreen(),
        ),
      );
    }
  }

  void _onSkip() {
    // الآن سينتقل إلى صفحتك الفعلية
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const WelcomeScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: contents.length,
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemBuilder: (context, index) {
                  return OnboardingPageWidget(
                    content: contents[index],
                    onSkipOrNext: _onSkipOrNext,
                    onSkip: _onSkip,
                    pageController: _pageController,
                    currentIndex: index,
                    totalPages: contents.length,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// الويدجت الخاصة بكل صفحة ترحيبية
class OnboardingPageWidget extends StatelessWidget {
  final OnboardingContent content;
  final VoidCallback onSkipOrNext;
  final VoidCallback onSkip;
  final PageController pageController;
  final int currentIndex;
  final int totalPages;

  const OnboardingPageWidget({
    super.key,
    required this.content,
    required this.onSkipOrNext,
    required this.onSkip,
    required this.pageController,
    required this.currentIndex,
    required this.totalPages,
  });

  // ويدجت لعرض العنوان مع الكلمة المميزة
  Widget _buildHighlightedTitle(BuildContext context, double screenWidth) {
    final titleStyle = TextStyle(
      fontSize: screenWidth * 0.07, // حجم خط نسبي
      fontWeight: FontWeight.bold,
      color: Colors.black,
      height: 1.3,
    );
    final highlightStyle = titleStyle.copyWith(color: AppColors.highlight);

    List<String> parts;
    String normalPart;
    String highlightedPart;

    if (content.title.contains('wide')) {
      parts = content.title.split('wide');
      normalPart = parts[0];
      highlightedPart = 'wide';
    } else if (content.title.contains('explore')) {
      parts = content.title.split('explore');
      normalPart = parts[0];
      highlightedPart = 'explore';
    } else {
      parts = content.title.split('people');
      normalPart = parts[0];
      highlightedPart = 'people';
    }

    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: titleStyle,
        children: [
          TextSpan(text: normalPart),
          TextSpan(text: highlightedPart, style: highlightStyle),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // الحصول على أبعاد الشاشة
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        Column(
          children: [
            // الجزء العلوي للصورة
            SizedBox(
              height: screenHeight * 0.5, // 50% من ارتفاع الشاشة
              width: double.infinity,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                child: Image.asset(
                  content.image,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  // في حال عدم وجود الصورة، سيظهر هذا النص
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(child: Text('Image not found'));
                  },
                ),
              ),
            ),
            // الجزء السفلي للمحتوى (قابل للتمرير)
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.06), // 6% من عرض الشاشة
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: screenHeight * 0.03),
                      _buildHighlightedTitle(context, screenWidth),
                      SizedBox(height: screenHeight * 0.02),
                      Text(
                        content.description,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: screenWidth * 0.04, // حجم خط نسبي
                          color: const Color(0xFF666666),
                          height: 1.5,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.03),
                      // مؤشر الصفحات
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          totalPages,
                          (index) => Container(
                            height: screenHeight * 0.012, // ارتفاع نسبي
                            width: currentIndex == index
                                ? screenWidth * 0.06 // عرض نسبي
                                : screenWidth * 0.025,
                            margin: const EdgeInsets.only(right: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: currentIndex == index
                                  ? const Color(0xFF4E7D96)
                                  : Colors.grey,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.03),
                      // زر المتابعة
                      ElevatedButton(
                        onPressed: onSkipOrNext,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF4E7D96),
                          minimumSize:
                              Size(double.infinity, screenHeight * 0.07),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          content.buttonText,
                          style: TextStyle(
                            fontSize: screenWidth * 0.045, // حجم خط نسبي
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.02),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        // زر التخطي
        Positioned(
          top: 20,
          right: 20,
          child: TextButton(
            onPressed: onSkip,
            child: Text(
              'Skip',
              style: TextStyle(
                color: const Color(0xFF666666),
                fontSize: screenWidth * 0.04, // حجم خط نسبي
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
