import 'package:dio/dio.dart';
import 'package:drippydrop_app/feature/login/data/models/login_models.dart';
import '../../../../core/networking/api_service.dart';

class LoginRepository {
  final ApiService apiService;

  LoginRepository(this.apiService);

  Future<dynamic> login(String email, String password) async {
    try {
      final response = await apiService.login(
        LoginRequestModel(email: email, password: password),
      );
      return response;
    } on DioException catch (e) {
      if (e.response != null && e.response?.data != null) {
        return LoginErrorModel.fromJson(e.response!.data);
      }
      else {
        return LoginErrorModel(
          status: 'error',
          message: 'An unexpected error occurred',
        );
      }
    }
  }
}
