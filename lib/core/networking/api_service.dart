import 'package:dio/dio.dart';
import 'package:drippydrop_app/core/networking/api_constants.dart';
import 'package:drippydrop_app/feature/login/data/models/login_models.dart';
import 'package:retrofit/retrofit.dart';

import '../../feature/signup/data/models/singnup_models.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.login)
  Future<LoginResponseModel> login(@Body() LoginRequestModel body);

  @POST(ApiConstants.singUp)
  Future<SignupResponseModel> signup(@Body() SignupRequestModel body);
}
