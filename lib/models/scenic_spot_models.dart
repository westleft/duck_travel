import 'package:json_annotation/json_annotation.dart';

part 'scenic_spot_models.g.dart';

@JsonSerializable()
class ScenicSpotModel {
  @JsonKey(name: 'ScenicSpotID')
  String? scenicSpotID;
  @JsonKey(name: 'ScenicSpotName')
  String? scenicSpotName;
  @JsonKey(name: 'DescriptionDetail')
  String? descriptionDetail;
  @JsonKey(name: 'Description')
  String? description;
  @JsonKey(name: 'Phone')
  String? phone;
  @JsonKey(name: 'Address')
  String? address;
  @JsonKey(name: 'ZipCode')
  String? zipCode;
  @JsonKey(name: 'TravelInfo')
  String? travelInfo;
  @JsonKey(name: 'OpenTime')
  String? openTime;
  @JsonKey(name: 'Picture')
  Picture? picture;
  @JsonKey(name: 'Position')
  Position? position;
  @JsonKey(name: 'Class1')
  String? class1;
  @JsonKey(name: 'Class2')
  String? class2;
  @JsonKey(name: 'Class3')
  String? class3;
  @JsonKey(name: 'WebsiteUrl')
  String? websiteUrl;
  @JsonKey(name: 'ParkingPosition')
  Map<String, dynamic>? parkingPosition;
  @JsonKey(name: 'TicketInfo')
  String? ticketInfo;
  @JsonKey(name: 'City')
  String? city;
  @JsonKey(name: 'SrcUpdateTime')
  String? srcUpdateTime;
  @JsonKey(name: 'UpdateTime')
  String? updateTime;
  @JsonKey(name: 'Remarks')
  String? remarks;
  @JsonKey(name: 'Level')
  String? level;
  @JsonKey(name: 'ParkingInfo')
  String? parkingInfo;

  ScenicSpotModel({
    this.scenicSpotID,
    this.scenicSpotName,
    this.descriptionDetail,
    this.description,
    this.phone,
    this.address,
    this.zipCode,
    this.travelInfo,
    this.openTime,
    this.picture,
    this.position,
    this.class1,
    this.class2,
    this.class3,
    this.websiteUrl,
    this.parkingPosition,
    this.ticketInfo,
    this.city,
    this.srcUpdateTime,
    this.updateTime,
    this.remarks,
    this.level,
    this.parkingInfo
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

@JsonSerializable()
class Picture {
  @JsonKey(name: 'PictureUrl1')
  String pictureUrl1;
  @JsonKey(name: 'PictureDescription1')
  String pictureDescription1;

  Picture({
    required this.pictureUrl1,
    required this.pictureDescription1,
  });

  factory Picture.fromJson(Map<String, dynamic> json) =>
      _$PictureFromJson(json);
  Map<String, dynamic> toJson() => _$PictureToJson(this);
}
