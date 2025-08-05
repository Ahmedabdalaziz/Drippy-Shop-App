import 'package:json_annotation/json_annotation.dart';

part 'singnup_models.g.dart';

@JsonSerializable()
class SignupRequestModel {
  final String email;
  final String password;
  final String name;

  SignupRequestModel({required this.password, required this.name, required this.email});

  Map<String, dynamic> toJson() => {
    'name': name.trim(),
    'email': email.trim(),
    'password': password.trim(),
  };

  factory SignupRequestModel.fromJson(Map<String, dynamic> json) =>
      _$SignupRequestModelFromJson(json);
}

@JsonSerializable()
class SignupErrorModel {
  final String? status;
  final String? message;

  const SignupErrorModel({this.status, this.message});

  factory SignupErrorModel.fromJson(Map<String, dynamic> json) =>
      _$SignupErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$SignupErrorModelToJson(this);
}

@JsonSerializable()
class SignupResponseModel {
  final String message;
  final String token;
  final String status;

  SignupResponseModel({
    required this.message,
    required this.token,
    required this.status,
  });

  factory SignupResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SignupResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$SignupResponseModelToJson(this);
}
