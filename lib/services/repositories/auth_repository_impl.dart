import 'package:dartz/dartz.dart';
import 'auth_repository.dart';
import 'base_repository.dart';

class AuthRepositoryImpl extends BaseRepository implements AuthRepository {
  AuthRepositoryImpl();

  Future<Either<String, Map<String, dynamic>>> login({
    required String email,
    required String password,
  }) async {
    return handleApiCall(
      apiCall: () async {
        final response = await dioClient.post(
          '/api/Accounts/Login',
          data: {
            'email': email,
            'password': password,
          },
        );
        return response.data;
      },
    );
  }

  Future<Either<String, Map<String, dynamic>>> register({
    required String displayName,
    required String email,
    required String password,
    required String phone,
    required String dateOfBirth,
    required String gender,
  }) async {
    return handleApiCall(
      apiCall: () async {
        final response = await dioClient.post(
          '/api/Accounts/Register',
          data: {
            'displayName': displayName,
            'email': email,
            'password': password,
            'phone': phone,
            'dateOfBirth': dateOfBirth,
            'gender': gender,
          },
        );
        return response.data;
      },
    );
  }

  Future<Either<String, Map<String, dynamic>>> forgotPassword({
    required String email,
  }) async {
    return handleApiCall(
      apiCall: () async {
        final response = await dioClient.post(
          '/api/Accounts/ForgotPassword',
          data: {
            'email': email,
          },
        );
        return response.data;
      },
    );
  }

  Future<Either<String, Map<String, dynamic>>> verifyOtp({
    required String email,
    required String otp,
  }) async {
    return handleApiCall(
      apiCall: () async {
        final response = await dioClient.post(
          '/api/Accounts/VerifyOtp',
          data: {
            'email': email,
            'otp': otp,
          },
        );
        return response.data;
      },
    );
  }

  Future<Either<String, Map<String, dynamic>>> resetPassword({
    required String email,
    required String newPassword,
    required String otp,
  }) async {
    return handleApiCall(
      apiCall: () async {
        final response = await dioClient.post(
          '/api/Accounts/ResetPassword',
          data: {
            'email': email,
            'newPassword': newPassword,
            'otp': otp,
          },
        );
        return response.data;
      },
    );
  }

  Future<Either<String, Map<String, dynamic>>> deactivateAccount() async {
    return handleApiCall(
      apiCall: () async {
        final response =
            await dioClient.post('/api/Accounts/DeactivateAccount');
        return response.data;
      },
    );
  }

  Future<Either<String, Map<String, dynamic>>> reactivateAccount({
    required String email,
  }) async {
    return handleApiCall(
      apiCall: () async {
        final response = await dioClient.post(
          '/api/Accounts/ReactivateAccount',
          data: {
            'email': email,
          },
        );
        return response.data;
      },
    );
  }

  Future<Either<String, void>> deleteAccount() async {
    return handleApiCall(
      apiCall: () async {
        await dioClient.delete('/api/Accounts/DeleteAccount');
        return;
      },
    );
  }

  Future<Either<String, Map<String, dynamic>>> getUserProfile() async {
    return handleApiCall(
      apiCall: () async {
        final response = await dioClient.get('/api/Accounts/Profile');
        return response.data;
      },
    );
  }
}
