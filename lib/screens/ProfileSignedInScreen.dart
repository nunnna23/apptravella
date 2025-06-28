import 'package:flutter/material.dart';
import 'package:apptravella/screens/ManageAccountScreen.dart';
import 'package:apptravella/screens/SettingsScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:apptravella/services/api/api_endpoints.dart';
import 'package:apptravella/services/api/dio_client.dart';
import '../widgets/custom_bottom_navigation_bar.dart';
import 'notifications_screen.dart';
import 'faq_screen.dart';
import 'about_us_screen.dart';
import 'profile_screen.dart';

class ProfileSignedInScreen extends StatefulWidget {
  const ProfileSignedInScreen({super.key});

  @override
  State<ProfileSignedInScreen> createState() => _ProfileSignedInScreenState();
}

class _ProfileSignedInScreenState extends State<ProfileSignedInScreen> {
  String userName = "Loading...";
  String? _profileImagePath;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      userName = prefs.getString('userName') ?? "User";
      _profileImagePath = prefs.getString('profileImagePath');
    });
  }

  Future<void> _pickImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('profileImagePath', pickedFile.path);
      setState(() {
        _profileImagePath = pickedFile.path;
      });
    }
  }

  Future<void> _logout() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('authToken');
      if (token == null) {
        throw Exception('No authentication token found.');
      }

      final dio = DioClient().dio; // استخدام DioClient
      final response = await dio.post(
        '${ApiEndpoints.baseUrl}${ApiEndpoints.logout}', // استخدام ApiEndpoints
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'accept': '*/*',
          },
        ),
        data: '',
      );

      if (response.statusCode == 200) {
        await prefs.remove('authToken');
        await prefs.remove('userName');
        await prefs.remove('profileImagePath');
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const ProfileScreen()),
        );
      } else {
        throw Exception('Logout failed: ${response.statusCode}');
      }
    } catch (e) {
      print("Logout error: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Logout failed: $e')),
      );
    }
  }

  Widget _buildProfileOption({
    required BuildContext context,
    required IconData icon,
    required String title,
    VoidCallback? onTap,
    Color iconColor = const Color(0xFF406F89),
    Color backgroundColor = const Color(0xFFEEEEEE),
    Color textColor = Colors.black,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(icon, color: iconColor, size: 24),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  color: textColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const String defaultProfileImage = 'assets/onboarding3.jpeg';

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(top: 20.0, right: 16.0, left: 16.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: TextButton.icon(
                    onPressed: _logout,
                    icon: const Icon(Icons.exit_to_app,
                        color: Colors.red, size: 20),
                    label: const Text(
                      'Sign Out',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      alignment: Alignment.centerRight,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey[200],
                    backgroundImage: _profileImagePath != null
                        ? FileImage(File(_profileImagePath!))
                        : const AssetImage(defaultProfileImage)
                            as ImageProvider,
                    onBackgroundImageError: (exception, stackTrace) {
                      print("Error loading profile image: $exception");
                    },
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: _pickImage,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFF406F89),
                        ),
                        child: const Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                'Hi, $userName',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 24),
              const Divider(
                color: Color(0xFFEEEEEE),
                thickness: 1,
                height: 1,
                indent: 16,
                endIndent: 16,
              ),
              const SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    _buildProfileOption(
                      context: context,
                      icon: Icons.person_outline,
                      title: 'Manage Your Account',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ManageAccountScreen(),
                          ),
                        );
                      },
                    ),
                    _buildProfileOption(
                      context: context,
                      icon: Icons.notifications_none_outlined,
                      title: 'Notifications',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const NotificationsScreen(),
                          ),
                        );
                      },
                    ),
                    _buildProfileOption(
                      context: context,
                      icon: Icons.settings_outlined,
                      title: 'Settings',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SettingsScreen(),
                          ),
                        );
                      },
                    ),
                    _buildProfileOption(
                      context: context,
                      icon: Icons.help_outline_outlined,
                      title: 'FAQ',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const FAQScreen(),
                          ),
                        );
                      },
                    ),
                    _buildProfileOption(
                      context: context,
                      icon: Icons.info_outline_rounded,
                      title: 'About Us',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AboutUsScreen(),
                          ),
                        );
                      },
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
