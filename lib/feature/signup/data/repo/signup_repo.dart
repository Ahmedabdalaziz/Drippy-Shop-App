import 'package:dio/dio.dart';
import 'package:drippydrop_app/core/networking/api_service.dart';
import 'package:drippydrop_app/feature/signup/data/models/singnup_models.dart';

class SignupRepository {
  final ApiService apiService;

  SignupRepository(this.apiService);

  Future<dynamic> signup(SignupRequestModel model) async {
    try {
      final response = await apiService.signup(model);
      return response;
    } on DioException catch (e) {
      if (e.response != null && e.response?.data != null) {
        return SignupErrorModel.fromJson(e.response!.data);
      } else {
        return const SignupErrorModel(
          message: 'An unexpected error occurred during signup',
        );
      }
    } catch (e) {
      return const SignupErrorModel(message: 'Unexpected error during signup');
    }
  }
}
