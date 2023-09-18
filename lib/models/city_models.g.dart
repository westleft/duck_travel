// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CityModel _$CityModelFromJson(Map<String, dynamic> json) => CityModel(
      cityID: json['CityID'] as String,
      cityName: json['CityName'] as String,
      cityCode: json['CityCode'] as String,
      city: json['City'] as String,
      countyID: json['CountyID'] as String,
      version: json['Version'] as String,
    );

Map<String, dynamic> _$CityModelToJson(CityModel instance) => <String, dynamic>{
      'CityID': instance.cityID,
      'CityName': instance.cityName,
      'CityCode': instance.cityCode,
      'City': instance.city,
      'CountyID': instance.countyID,
      'Version': instance.version,
    };
