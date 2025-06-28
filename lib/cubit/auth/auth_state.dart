import '../../models/auth_response.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthError extends AuthState {
  final String message;

  AuthError(this.message);
}

class AuthenticatedState extends AuthState {
  final AuthResponse user;

  AuthenticatedState(this.user);
}

class UnauthenticatedState extends AuthState {}

class RegisterSuccess extends AuthState {
  final AuthResponse user;

  RegisterSuccess(this.user);
}

class ForgotPasswordSuccess extends AuthState {
  final String message;

  ForgotPasswordSuccess(this.message);
}

class OtpVerificationSuccess extends AuthState {
  final String message;

  OtpVerificationSuccess(this.message);
}

class PasswordResetSuccess extends AuthState {
  final String message;

  PasswordResetSuccess(this.message);
}

class AccountDeactivated extends AuthState {
  final String message;

  AccountDeactivated(this.message);
}

class AccountReactivated extends AuthState {
  final String message;

  AccountReactivated(this.message);
}

class AccountDeleted extends AuthState {}

class ProfileLoaded extends AuthState {
  final Map<String, dynamic> profile;

  ProfileLoaded(this.profile);
}
