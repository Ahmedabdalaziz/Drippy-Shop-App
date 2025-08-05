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
  final String message;
  final String token;
  final String status;

  LoginResponseModel({
    required this.message,
    required this.token,
    required this.status,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseModelToJson(this);
}

@JsonSerializable()
class LoginErrorModel {
  final String status;
  final String message;

  LoginErrorModel({required this.status, required this.message});

  factory LoginErrorModel.fromJson(Map<String, dynamic> json) =>
      _$LoginErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginErrorModelToJson(this);
}
