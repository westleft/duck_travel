import 'package:json_annotation/json_annotation.dart';

part 'access_token_models.g.dart';

@JsonSerializable()
class AccessTokenModel {
  String access_token;
  int expires_in;
  String token_type;
  int refresh_expires_in;
  @JsonKey(name: 'not-before-policy')
  int not_before_policy;
  String scope;


  AccessTokenModel({
    required this.access_token,
    required this.expires_in,
    required this.token_type,
    required this.refresh_expires_in,
    required this.not_before_policy,
    required this.scope,
  });

  factory AccessTokenModel.fromJson(Map<String, dynamic> json) =>
      _$AccessTokenModelFromJson(json);
  Map<String, dynamic> toJson() => _$AccessTokenModelToJson(this);
}