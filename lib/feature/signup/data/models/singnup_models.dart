import 'package:json_annotation/json_annotation.dart';

part 'singnup_models.g.dart';

@JsonSerializable()
class SignupRequestModel {
  final String email;
  final String password;
  final String firstName;
  final String lastName;
  final String phone;

  SignupRequestModel(
      this.password,
      this.firstName,
      this.lastName,
      this.phone, {
        required this.email,
      });

  Map<String, dynamic> toJson() => {
    'email': email.trim(),
    'password': password.trim(),
  };

  factory SignupRequestModel.fromJson(Map<String, dynamic> json) =>
      _$SignupRequestModelFromJson(json);
}

@JsonSerializable()
class UserInfo {
  final String id;
  final String email;

  UserInfo({required this.id, required this.email});

  factory UserInfo.fromJson(Map<String, dynamic> json) =>
      _$UserInfoFromJson(json);

  Map<String, dynamic> toJson() => _$UserInfoToJson(this);
}

@JsonSerializable()
class InsertUserProfileModel {
  final String id;

  @JsonKey(name: 'first_name')
  final String firstName;

  @JsonKey(name: 'last_name')
  final String lastName;

  final String phone;

  InsertUserProfileModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phone,
  });

  factory InsertUserProfileModel.fromJson(Map<String, dynamic> json) =>
      _$InsertUserProfileModelFromJson(json);

  Map<String, dynamic> toJson() => _$InsertUserProfileModelToJson(this);
}

@JsonSerializable()
class SignupErrorModel {
  final int? code;

  @JsonKey(name: 'error_code')
  final String? errorCode;

  @JsonKey(name: 'msg')
  final String? message;

  final bool? requiresEmailConfirmation;

  const SignupErrorModel({
    this.code,
    this.errorCode,
    this.message,
    this.requiresEmailConfirmation,
  });

  factory SignupErrorModel.fromJson(Map<String, dynamic> json) =>
      _$SignupErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$SignupErrorModelToJson(this);
}

@JsonSerializable()
class SignupSuccessModel {
  @JsonKey(name: 'access_token')
  final String accessToken;

  @JsonKey(name: 'refresh_token')
  final String refreshToken;

  @JsonKey(name: 'expires_in')
  final int expiresIn;

  @JsonKey(name: 'expires_at')
  final int expiresAt;

  final UserInfo user;

  SignupSuccessModel({
    required this.accessToken,
    required this.refreshToken,
    required this.expiresIn,
    required this.expiresAt,
    required this.user,
  });

  factory SignupSuccessModel.fromJson(Map<String, dynamic> json) =>
      _$SignupSuccessModelFromJson(json);

  Map<String, dynamic> toJson() => _$SignupSuccessModelToJson(this);
}
