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

  Future<void> signupUser({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(SignupLoading());

    try {
      // ✅ Validate inputs first
      String? errorMessage;
      if (name.trim().isEmpty) {
        errorMessage = "First name is required";
      } else if (Validators.validateEmail(email) != null) {
        errorMessage = "Email is invalid";
      } else if (Validators.validatePassword(password) != null) {
        errorMessage = "Password is invalid";
      }

      if (errorMessage != null) {
        emit(SignupFailure(error: errorMessage));
        return;
      }

      final request = SignupRequestModel(
        password: password,
        name: name,
        email: email,
      );

      final result = await signupRepository.signup(request);

      // ✅ نفس فكرة LoginCubit: فحص الـ types
      if (result is SignupResponseModel) {
        emit(SignupSuccess());
      }
      else if (result is SignupErrorModel) {
        emit(SignupFailure(error: result.message ?? 'Signup failed'));
      }
      else {
        emit(SignupFailure(error: 'Unexpected error occurred during signup.'));
      }
    }
    on AuthException catch (e) {
      emit(SignupFailure(error: e.message));
    }
    catch (e) {
      emit(SignupFailure(error: 'Unexpected error'));
    }
  }
}
