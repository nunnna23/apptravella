class User {
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String country;
  final String gender;

  User({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.country,
    required this.gender,
  });

  // Convert user to JSON
  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phoneNumber': phoneNumber,
      'country': country,
      'gender': gender,
    };
  }

  // Create user from JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      email: json['email'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      country: json['country'] ?? '',
      gender: json['gender'] ?? '',
    );
  }
}   



// class User {
//   final String id;
//   final String firstName;
//   final String lastName;
//   final String email;
//   final String phoneNumber;
//   final String country;
//   final String gender;
//   final String token;

//   User({
//     required this.id,
//     required this.firstName,
//     required this.lastName,
//     required this.email,
//     required this.phoneNumber,
//     required this.country,
//     required this.gender,
//     required this.token,
//   });

//   // Convert user to JSON
//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'firstName': firstName,
//       'lastName': lastName,
//       'email': email,
//       'phoneNumber': phoneNumber,
//       'country': country,
//       'gender': gender,
//       'token': token,
//     };
//   }

//   // Create user from JSON
//   factory User.fromJson(Map<String, dynamic> json) {
//     return User(
//       id: json['id'] ?? '',
//       firstName: json['firstName'] ?? '',
//       lastName: json['lastName'] ?? '',
//       email: json['email'] ?? '',
//       phoneNumber: json['phoneNumber'] ?? json['phone'] ?? '',
//       country: json['country'] ?? '',
//       gender: json['gender'] ?? '',
//       token: json['token'] ?? '',
//     );
//   }
// }

// class LoginResponse {
//   final User user;
//   final String message;

//   LoginResponse({
//     required this.user,
//     required this.message,
//   });

//   factory LoginResponse.fromJson(Map<String, dynamic> json) {
//     return LoginResponse(
//       user: User.fromJson(json['user'] ?? json), // Handle both response formats
//       message: json['message'] ?? 'Login successful',
//     );
//   }
// }