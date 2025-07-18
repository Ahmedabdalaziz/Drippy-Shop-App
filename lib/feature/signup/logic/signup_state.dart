part of 'signup_cubit.dart';

@immutable
sealed class SignupState {}

final class SignupInitial extends SignupState {}

final class SignupLoading extends SignupState {}

final class SignupSuccess extends SignupState {}

final class SignupFailure extends SignupState {
  final String error;

  SignupFailure({required this.error});
}

class SignupEmailConfirmationRequired extends SignupState {
  final String message;

  SignupEmailConfirmationRequired({required this.message});
}

final class SignupValidationError extends SignupState {
  final String field;
  final String message;

  SignupValidationError(this.field, this.message);
}
