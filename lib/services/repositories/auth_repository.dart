import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<String, Map<String, dynamic>>> login({
    required String email,
    required String password,
  });

  Future<Either<String, Map<String, dynamic>>> register({
    required String displayName,
    required String email,
    required String password,
    required String phone,
    required String dateOfBirth,
    required String gender,
  });

  Future<Either<String, Map<String, dynamic>>> forgotPassword({
    required String email,
  });

  Future<Either<String, Map<String, dynamic>>> verifyOtp({
    required String email,
    required String otp,
  });

  Future<Either<String, Map<String, dynamic>>> resetPassword({
    required String email,
    required String newPassword,
    required String otp,
  });

  Future<Either<String, Map<String, dynamic>>> deactivateAccount();

  Future<Either<String, Map<String, dynamic>>> reactivateAccount({
    required String email,
  });

  Future<Either<String, void>> deleteAccount();

  Future<Either<String, Map<String, dynamic>>> getUserProfile();
}
