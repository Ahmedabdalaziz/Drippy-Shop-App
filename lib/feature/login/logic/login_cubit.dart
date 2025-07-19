import 'package:bloc/bloc.dart';
import 'package:drippydrop_app/core/helper/token_functions.dart';
import 'package:drippydrop_app/feature/login/data/models/login_models.dart';
import 'package:drippydrop_app/feature/login/data/repo/login_repo.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepository _loginRepository;

  LoginCubit(this._loginRepository) : super(LoginInitial());

  // login user
  Future<void> loginUser(String email, String password) async {
    emit(LoginLoading());

    try {
      final response = await _loginRepository.login(email, password);

      if (response is LoginResponseModel) {
        await saveAuthToken(response.accessToken);
        await saveRefreshToken(response.refreshToken);
        emit(LoginSuccess(response));
      } else if (response is LoginErrorModel) {
        emit(LoginError(response.msg ?? 'Login failed. Please try again.'));
      } else {
        emit(LoginError('Unexpected error occurred during login.'));
      }
    } on AuthException catch (e) {
      emit(LoginError(e.message));
    } catch (e) {
      emit(LoginError('Unexpected error: $e'));
    }
  }

  // logout user
  Future<void> logoutUser() async {
    emit(LoginLoading());
    try {
      await clearAuthTokens();
      emit(LoginInitial());
    } catch (e) {
      emit(LoginError('Failed to logout. Please try again.'));
    }
  }
}
