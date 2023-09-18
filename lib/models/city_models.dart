import 'package:json_annotation/json_annotation.dart';

part 'city_models.g.dart';

@JsonSerializable()
class CityModel {
  @JsonKey(name: 'CityID')
  String cityID;
  @JsonKey(name: 'CityName')
  String cityName;
  @JsonKey(name: 'CityCode')
  String cityCode;
  @JsonKey(name: 'City')
  String city;
  @JsonKey(name: 'CountyID')
  String countyID;
  @JsonKey(name: 'Version')
  String version;

  CityModel({
    required this.cityID,
    required this.cityName,
    required this.cityCode,
    required this.city,
    required this.countyID,
    required this.version,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) => _$CityModelFromJson(json);
  Map<String, dynamic> toJson() => _$CityModelToJson(this);
}