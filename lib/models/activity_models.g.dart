// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityModel _$ActivityModelFromJson(Map<String, dynamic> json) =>
    ActivityModel(
      ActivityID: json['ActivityID'] as String,
      ActivityName: json['ActivityName'] as String,
      Description: json['Description'] as String,
      Location: json['Location'] as String,
      Phone: json['Phone'] as String,
      Organizer: json['Organizer'] as String,
      StartTime: DateTime.parse(json['StartTime'] as String),
      EndTime: DateTime.parse(json['EndTime'] as String),
      Picture: json['Picture'] as Map<String, dynamic>,
      Position:
          PositionModel.fromJson(json['Position'] as Map<String, dynamic>),
      Class1: json['Class1'] as String,
      SrcUpdateTime: json['SrcUpdateTime'] as String,
      UpdateTime: json['UpdateTime'] as String,
    );

Map<String, dynamic> _$ActivityModelToJson(ActivityModel instance) =>
    <String, dynamic>{
      'ActivityID': instance.ActivityID,
      'ActivityName': instance.ActivityName,
      'Description': instance.Description,
      'Location': instance.Location,
      'Phone': instance.Phone,
      'Organizer': instance.Organizer,
      'StartTime': instance.StartTime.toIso8601String(),
      'EndTime': instance.EndTime.toIso8601String(),
      'Picture': instance.Picture,
      'Position': instance.Position,
      'Class1': instance.Class1,
      'SrcUpdateTime': instance.SrcUpdateTime,
      'UpdateTime': instance.UpdateTime,
    };

PositionModel _$PositionModelFromJson(Map<String, dynamic> json) =>
    PositionModel(
      PositionLon: (json['PositionLon'] as num).toDouble(),
      PositionLat: (json['PositionLat'] as num).toDouble(),
      GeoHash: json['GeoHash'] as String,
    );

Map<String, dynamic> _$PositionModelToJson(PositionModel instance) =>
    <String, dynamic>{
      'PositionLon': instance.PositionLon,
      'PositionLat': instance.PositionLat,
      'GeoHash': instance.GeoHash,
    };
