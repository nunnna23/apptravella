import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/auth_response.dart';
import '../../services/repositories/auth_repository.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _repository;

  AuthCubit(this._repository) : super(AuthInitial());

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(AuthLoading());

    final result = await _repository.login(
      email: email,
      password: password,
    );

    result.fold(
      (error) => emit(AuthError(error)),
      (data) => emit(AuthenticatedState(AuthResponse.fromJson(data))),
    );
  }

  Future<void> register({
    required String displayName,
    required String email,
    required String password,
    required String phone,
    required String dateOfBirth,
    required String gender,
  }) async {
    emit(AuthLoading());

    final result = await _repository.register(
      displayName: displayName,
      email: email,
      password: password,
      phone: phone,
      dateOfBirth: dateOfBirth,
      gender: gender,
    );

    result.fold(
      (error) => emit(AuthError(error)),
      (data) => emit(RegisterSuccess(AuthResponse.fromJson(data))),
    );
  }

  Future<void> forgotPassword({
    required String email,
  }) async {
    emit(AuthLoading());

    final result = await _repository.forgotPassword(
      email: email,
    );

    result.fold(
      (error) => emit(AuthError(error)),
      (data) =>
          emit(ForgotPasswordSuccess(data['message'] ?? 'Reset email sent')),
    );
  }

  Future<void> verifyOtp({
    required String email,
    required String otp,
  }) async {
    emit(AuthLoading());

    final result = await _repository.verifyOtp(
      email: email,
      otp: otp,
    );

    result.fold(
      (error) => emit(AuthError(error)),
      (data) => emit(OtpVerificationSuccess(
          data['message'] ?? 'OTP verified successfully')),
    );
  }

  Future<void> resetPassword({
    required String email,
    required String newPassword,
    required String otp,
  }) async {
    emit(AuthLoading());

    final result = await _repository.resetPassword(
      email: email,
      newPassword: newPassword,
      otp: otp,
    );

    result.fold(
      (error) => emit(AuthError(error)),
      (data) => emit(PasswordResetSuccess(
          data['message'] ?? 'Password reset successfully')),
    );
  }

  Future<void> deactivateAccount() async {
    emit(AuthLoading());

    final result = await _repository.deactivateAccount();

    result.fold(
      (error) => emit(AuthError(error)),
      (data) => emit(AccountDeactivated(
          data['message'] ?? 'Account deactivated successfully')),
    );
  }

  Future<void> reactivateAccount({
    required String email,
  }) async {
    emit(AuthLoading());

    final result = await _repository.reactivateAccount(
      email: email,
    );

    result.fold(
      (error) => emit(AuthError(error)),
      (data) => emit(AccountReactivated(
          data['message'] ?? 'Account reactivated successfully')),
    );
  }

  Future<void> deleteAccount() async {
    emit(AuthLoading());

    final result = await _repository.deleteAccount();

    result.fold(
      (error) => emit(AuthError(error)),
      (_) => emit(AccountDeleted()),
    );
  }

  Future<void> getUserProfile() async {
    emit(AuthLoading());

    final result = await _repository.getUserProfile();

    result.fold(
      (error) => emit(AuthError(error)),
      (data) => emit(ProfileLoaded(data)),
    );
  }

  void logout() {
    // TODO: Clear local storage/token
    emit(UnauthenticatedState());
  }
}
