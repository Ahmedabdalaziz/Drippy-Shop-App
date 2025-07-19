import 'package:bloc/bloc.dart';
import 'package:drippydrop_app/core/helper/token_functions.dart';
import 'package:drippydrop_app/feature/signup/data/repo/signup_repo.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/helper/functions.dart';
import '../data/models/singnup_models.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignupRepository signupRepository;

  SignupCubit(this.signupRepository) : super(SignupInitial());

  Future<void> signupUser({
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required String password,
  }) async {

    emit(SignupLoading());

    String? errorMessage;
    if (firstName.trim().isEmpty) {
      errorMessage = "First name is required";
    } else if (lastName.trim().isEmpty) {
      errorMessage = "Last name is required";
    } else if (Validators.validateEmail(email) != null) {
      errorMessage = "Email is invalid";
    } else if (Validators.validatePhone(phone) != null) {
      errorMessage = "Phone is invalid";
    } else if (Validators.validatePassword(password) != null) {
      errorMessage = "Password is invalid";
    }

    if (errorMessage != null) {
      emit(SignupFailure(error: errorMessage));
      return;
    }

    try {
      final request = SignupRequestModel(
        password,
        firstName,
        lastName,
        phone,
        email: email,
      );

      final result = await signupRepository.signup(request);

      if (result is SignupSuccessModel) {
        saveAuthToken(result.accessToken);
        saveRefreshToken(result.refreshToken);

        emit(SignupSuccess());
      } else if (result is SignupErrorModel) {
        emit(SignupFailure(error: result.message ?? 'Signup failed'));
      } else {
        emit(SignupFailure(error: 'Unexpected error occurred during signup.'));
      }
    } on AuthException catch (e) {
      emit(SignupFailure(error: e.message));
    } catch (e) {
      emit(SignupFailure(error: 'Unexpected error: ${e.toString()}'));
    }
  }
}
