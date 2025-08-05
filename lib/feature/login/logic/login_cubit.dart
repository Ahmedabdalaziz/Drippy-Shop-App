import 'package:bloc/bloc.dart';
import 'package:drippydrop_app/core/helper/token.dart';
import 'package:drippydrop_app/feature/login/data/models/login_models.dart';
import 'package:drippydrop_app/feature/login/data/repo/login_repo.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepository _loginRepository;

  LoginCubit(this._loginRepository) : super(LoginInitial());

  Future<void> loginUser(String email, String password) async {
    emit(LoginLoading());

    try {
      final response = await _loginRepository.login(email, password);

      if (response is LoginResponseModel) {
        emit(LoginSuccess(response));
        await TokenManager().saveToken(response.token);
      } else if (response is LoginErrorModel) {
        emit(LoginError(response.message));
      } else {
        emit(LoginError('Unexpected error occurred during login.'));
      }
    } catch (e) {
      emit(LoginError('Unexpected error'));
    }
  }
}
