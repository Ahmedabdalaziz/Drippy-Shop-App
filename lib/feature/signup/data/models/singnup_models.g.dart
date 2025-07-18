// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'singnup_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignupRequestModel _$SignupRequestModelFromJson(Map<String, dynamic> json) =>
    SignupRequestModel(
      json['password'] as String,
      json['firstName'] as String,
      json['lastName'] as String,
      json['phone'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$SignupRequestModelToJson(SignupRequestModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'phone': instance.phone,
    };

UserInfo _$UserInfoFromJson(Map<String, dynamic> json) =>
    UserInfo(id: json['id'] as String, email: json['email'] as String);

Map<String, dynamic> _$UserInfoToJson(UserInfo instance) => <String, dynamic>{
  'id': instance.id,
  'email': instance.email,
};

InsertUserProfileModel _$InsertUserProfileModelFromJson(
  Map<String, dynamic> json,
) => InsertUserProfileModel(
  id: json['id'] as String,
  firstName: json['first_name'] as String,
  lastName: json['last_name'] as String,
  phone: json['phone'] as String,
);

Map<String, dynamic> _$InsertUserProfileModelToJson(
  InsertUserProfileModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'first_name': instance.firstName,
  'last_name': instance.lastName,
  'phone': instance.phone,
};

SignupErrorModel _$SignupErrorModelFromJson(Map<String, dynamic> json) =>
    SignupErrorModel(
      code: (json['code'] as num?)?.toInt(),
      errorCode: json['error_code'] as String?,
      message: json['msg'] as String?,
      requiresEmailConfirmation: json['requiresEmailConfirmation'] as bool?,
    );

Map<String, dynamic> _$SignupErrorModelToJson(SignupErrorModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'error_code': instance.errorCode,
      'msg': instance.message,
      'requiresEmailConfirmation': instance.requiresEmailConfirmation,
    };

SignupSuccessModel _$SignupSuccessModelFromJson(Map<String, dynamic> json) =>
    SignupSuccessModel(
      accessToken: json['access_token'] as String,
      refreshToken: json['refresh_token'] as String,
      expiresIn: (json['expires_in'] as num).toInt(),
      expiresAt: (json['expires_at'] as num).toInt(),
      user: UserInfo.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SignupSuccessModelToJson(SignupSuccessModel instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
      'expires_in': instance.expiresIn,
      'expires_at': instance.expiresAt,
      'user': instance.user,
    };
