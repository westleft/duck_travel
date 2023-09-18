import 'package:json_annotation/json_annotation.dart';

part 'scenic_spot_models.g.dart';

@JsonSerializable()
class ScenicSpotModel {
  @JsonKey(name: 'ScenicSpotID')
  String scenicSpotID;
  @JsonKey(name: 'ScenicSpotName')
  String scenicSpotName;
  @JsonKey(name: 'DescriptionDetail')
  String descriptionDetail;
  @JsonKey(name: 'Description')
  String description;
  @JsonKey(name: 'Phone')
  String phone;
  @JsonKey(name: 'Address')
  String address;
  @JsonKey(name: 'ZipCode')
  String zipCode;
  @JsonKey(name: 'TravelInfo')
  String travelInfo;
  @JsonKey(name: 'OpenTime')
  String openTime;
  @JsonKey(name: 'Picture')
  Map<String, dynamic> picture;
  @JsonKey(name: 'Position')
  Position position;
  @JsonKey(name: 'Class1')
  String class1;
  @JsonKey(name: 'Class2')
  String? class2;
  @JsonKey(name: 'Class3')
  String? class3;
  @JsonKey(name: 'WebsiteUrl')
  String? websiteUrl;
  @JsonKey(name: 'ParkingPosition')
  Map<String, dynamic> parkingPosition;
  @JsonKey(name: 'TicketInfo')
  String? ticketInfo;
  @JsonKey(name: 'City')
  String city;
  @JsonKey(name: 'SrcUpdateTime')
  String srcUpdateTime;
  @JsonKey(name: 'UpdateTime')
  String updateTime;
  @JsonKey(name: 'Remarks')
  String? remarks;

  ScenicSpotModel({
    required this.scenicSpotID,
    required this.scenicSpotName,
    required this.descriptionDetail,
    required this.description,
    required this.phone,
    required this.address,
    required this.zipCode,
    required this.travelInfo,
    required this.openTime,
    required this.picture,
    required this.position,
    required this.class1,
    this.class2,
    this.class3,
    this.websiteUrl,
    required this.parkingPosition,
    this.ticketInfo,
    required this.city,
    required this.srcUpdateTime,
    required this.updateTime,
    this.remarks,
  });

  factory ScenicSpotModel.fromJson(Map<String, dynamic> json) =>
      _$ScenicSpotModelFromJson(json);
  Map<String, dynamic> toJson() => _$ScenicSpotModelToJson(this);
}

@JsonSerializable()
class Position {
  @JsonKey(name: 'PositionLon')
  double positionLon;
  @JsonKey(name: 'PositionLat')
  double positionLat;
  @JsonKey(name: 'GeoHash')
  String geoHash;

  Position({
    required this.positionLon,
    required this.positionLat,
    required this.geoHash,
  });

  factory Position.fromJson(Map<String, dynamic> json) =>
      _$PositionFromJson(json);
  Map<String, dynamic> toJson() => _$PositionToJson(this);
}
