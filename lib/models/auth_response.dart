class AuthResponse {
  final int customerId;
  final String displayName;
  final String email;
  final String token;

  AuthResponse({
    required this.customerId,
    required this.displayName,
    required this.email,
    required this.token,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      customerId: json['customerId'] as int,
      displayName: json['displayName'] as String,
      email: json['email'] as String,
      token: json['token'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'customerId': customerId,
      'displayName': displayName,
      'email': email,
      'token': token,
    };
  }
}
