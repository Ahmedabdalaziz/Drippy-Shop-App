// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'singnup_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignupRequestModel _$SignupRequestModelFromJson(Map<String, dynamic> json) =>
    SignupRequestModel(
      password: json['password'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$SignupRequestModelToJson(SignupRequestModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'name': instance.name,
    };

SignupErrorModel _$SignupErrorModelFromJson(Map<String, dynamic> json) =>
    SignupErrorModel(
      status: json['status'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$SignupErrorModelToJson(SignupErrorModel instance) =>
    <String, dynamic>{'status': instance.status, 'message': instance.message};

SignupResponseModel _$SignupResponseModelFromJson(Map<String, dynamic> json) =>
    SignupResponseModel(
      message: json['message'] as String,
      token: json['token'] as String,
      status: json['status'] as String,
    );

Map<String, dynamic> _$SignupResponseModelToJson(
  SignupResponseModel instance,
) => <String, dynamic>{
  'message': instance.message,
  'token': instance.token,
  'status': instance.status,
};
