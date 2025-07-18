import 'package:json_annotation/json_annotation.dart';

part 'login_models.g.dart';

@JsonSerializable()
class LoginRequestModel {
  final String email;
  final String password;

  LoginRequestModel({required this.email, required this.password});

  factory LoginRequestModel.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRequestModelToJson(this);
}

@JsonSerializable()
class LoginResponseModel {
  @JsonKey(name: 'access_token')
  final String accessToken;

  @JsonKey(name: 'refresh_token')
  final String refreshToken;

  @JsonKey(name: 'expires_in')
  final int? expiresIn;

  LoginResponseModel({
    required this.accessToken,
    required this.refreshToken,
    this.expiresIn,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseModelToJson(this);
}

@JsonSerializable()
class LoginErrorModel {
  final String msg;

  LoginErrorModel({required this.msg});

  factory LoginErrorModel.fromJson(Map<String, dynamic> json) =>
      _$LoginErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginErrorModelToJson(this);
}
