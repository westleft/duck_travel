// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'access_token_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccessTokenModel _$AccessTokenModelFromJson(Map<String, dynamic> json) =>
    AccessTokenModel(
      access_token: json['access_token'] as String,
      expires_in: json['expires_in'] as int,
      token_type: json['token_type'] as String,
      refresh_expires_in: json['refresh_expires_in'] as int,
      not_before_policy: json['not-before-policy'] as int,
      scope: json['scope'] as String,
    );

Map<String, dynamic> _$AccessTokenModelToJson(AccessTokenModel instance) =>
    <String, dynamic>{
      'access_token': instance.access_token,
      'expires_in': instance.expires_in,
      'token_type': instance.token_type,
      'refresh_expires_in': instance.refresh_expires_in,
      'not-before-policy': instance.not_before_policy,
      'scope': instance.scope,
    };
