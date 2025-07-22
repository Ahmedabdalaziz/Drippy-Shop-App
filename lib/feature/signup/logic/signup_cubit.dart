import 'package:bloc/bloc.dart';
import 'package:drippydrop_app/feature/signup/data/repo/signup_repo.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/helper/functions.dart';
import '../data/models/singnup_models.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignupRepository signupRepository;

  SignupCubit(this.signupRepository) : super(SignupInitial());

  //------------------------------------sign up-------------------------------------------------//

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

  //-------------------------------------age and gender------------------------------------------------//
  // Age With Gender Selection
  Future<void> updateGenderAndAge(String gender, String ageRange) async {
    emit(GenderAgeLoading());

    try {
      await signupRepository.updateGenderAndAgeRange(
        gender: gender,
        ageRange: ageRange,
      );
      emit(GenderAgeSuccess());
    } on Exception catch (e) {
      final errorMessage = e.toString().replaceFirst('Exception: ', '');

      if (errorMessage.contains("User not logged in")) {
        emit(
          GenderAgeError(
            error: "You must be logged in to update your profile.",
          ),
        );
      } else if (errorMessage.contains("Supabase Error:")) {
        emit(GenderAgeError(error: "Failed to update profile: $errorMessage"));
      } else {
        emit(
          GenderAgeError(
            error:
                "An unexpected error occurred. Please try again. ($errorMessage)",
          ),
        );
      }
    } catch (e) {
      emit(
        GenderAgeError(error: "An unknown error occurred. Please try again."),
      );
    }
  }
}
