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
      accessToken: json['access_token'] as String,
      refreshToken: json['refresh_token'] as String,
      expiresIn: (json['expires_in'] as num?)?.toInt(),
    );

Map<String, dynamic> _$LoginResponseModelToJson(LoginResponseModel instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
      'expires_in': instance.expiresIn,
    };

LoginErrorModel _$LoginErrorModelFromJson(Map<String, dynamic> json) =>
    LoginErrorModel(msg: json['msg'] as String);

Map<String, dynamic> _$LoginErrorModelToJson(LoginErrorModel instance) =>
    <String, dynamic>{'msg': instance.msg};
