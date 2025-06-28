// lib/services/auth_service.dart

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/signin_user_model.dart';

class AuthService {
  static const String _baseUrl = 'http://travella.runasp.net';

  static Future<SignInResponse> signIn({
    required String email,
    required String password,
  }) async {
    final user = SignInUser(email: email, password: password);
    
    final response = await http.post(
      Uri.parse('$_baseUrl/api/Accounts/Login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(user.toJson()),
    );

    if (response.statusCode == 200) {
      return SignInResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to sign in: ${response.body}');
    }
  }
}