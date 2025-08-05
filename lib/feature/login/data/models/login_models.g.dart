// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginRequestModel _$LoginRequestModelFromJson(Map<String, dynamic> json) =>
    LoginRequestModel(
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$LoginRequestModelToJson(LoginRequestModel instance) =>
    <String, dynamic>{'email': instance.email, 'password': instance.password};

LoginResponseModel _$LoginResponseModelFromJson(Map<String, dynamic> json) =>
    LoginResponseModel(
      message: json['message'] as String,
      token: json['token'] as String,
      status: json['status'] as String,
    );

Map<String, dynamic> _$LoginResponseModelToJson(LoginResponseModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'token': instance.token,
      'status': instance.status,
    };

LoginErrorModel _$LoginErrorModelFromJson(Map<String, dynamic> json) =>
    LoginErrorModel(
      status: json['status'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$LoginErrorModelToJson(LoginErrorModel instance) =>
    <String, dynamic>{'status': instance.status, 'message': instance.message};
