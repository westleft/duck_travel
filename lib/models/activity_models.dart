import 'package:json_annotation/json_annotation.dart';

part 'activity_models.g.dart';

@JsonSerializable()
class ActivityModel {
  String ActivityID;
  String ActivityName;
  String Description;
  String Location;
  String Phone;
  String Organizer;
  DateTime StartTime;
  DateTime EndTime;
  Map<String, dynamic> Picture;
  PositionModel Position;
  String Class1;
  String SrcUpdateTime;
  String UpdateTime;

  ActivityModel({
    required this.ActivityID,
    required this.ActivityName,
    required this.Description,
    required this.Location,
    required this.Phone,
    required this.Organizer,
    required this.StartTime,
    required this.EndTime,
    required this.Picture,
    required this.Position,
    required this.Class1,
    required this.SrcUpdateTime,
    required this.UpdateTime,
  });

  factory ActivityModel.fromJson(Map<String, dynamic> json) =>
      _$ActivityModelFromJson(json);

  Map<String, dynamic> toJson() => _$ActivityModelToJson(this);
}

@JsonSerializable()
class PositionModel {
  double PositionLon;
  double PositionLat;
  String GeoHash;

  PositionModel({
    required this.PositionLon,
    required this.PositionLat,
    required this.GeoHash,
  });

  factory PositionModel.fromJson(Map<String, dynamic> json) =>
      _$PositionModelFromJson(json);

  Map<String, dynamic> toJson() => _$PositionModelToJson(this);
}