// lib/models/signin_user_model.dart

class SignInUser {
  final String email;
  final String password;

  SignInUser({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}

class SignInResponse {
  final String id;
  final String email;
  final String phone;
  final String token;

  SignInResponse({
    required this.id,
    required this.email,
    required this.phone,
    required this.token,
  });

  factory SignInResponse.fromJson(Map<String, dynamic> json) {
    return SignInResponse(
      id: json['id'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      token: json['token'] ?? '',
    );
  }
}