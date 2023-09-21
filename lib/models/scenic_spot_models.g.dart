// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scenic_spot_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ScenicSpotModel _$ScenicSpotModelFromJson(Map<String, dynamic> json) =>
    ScenicSpotModel(
      scenicSpotID: json['ScenicSpotID'] as String?,
      scenicSpotName: json['ScenicSpotName'] as String?,
      descriptionDetail: json['DescriptionDetail'] as String?,
      description: json['Description'] as String?,
      phone: json['Phone'] as String?,
      address: json['Address'] as String?,
      zipCode: json['ZipCode'] as String?,
      travelInfo: json['TravelInfo'] as String?,
      openTime: json['OpenTime'] as String?,
      picture: json['Picture'] == null
          ? null
          : Picture.fromJson(json['Picture'] as Map<String, dynamic>),
      position: json['Position'] == null
          ? null
          : Position.fromJson(json['Position'] as Map<String, dynamic>),
      class1: json['Class1'] as String?,
      class2: json['Class2'] as String?,
      class3: json['Class3'] as String?,
      websiteUrl: json['WebsiteUrl'] as String?,
      parkingPosition: json['ParkingPosition'] as Map<String, dynamic>?,
      ticketInfo: json['TicketInfo'] as String?,
      city: json['City'] as String?,
      srcUpdateTime: json['SrcUpdateTime'] as String?,
      updateTime: json['UpdateTime'] as String?,
      remarks: json['Remarks'] as String?,
      level: json['Level'] as String?,
      parkingInfo: json['ParkingInfo'] as String?,
    );

Map<String, dynamic> _$ScenicSpotModelToJson(ScenicSpotModel instance) =>
    <String, dynamic>{
      'ScenicSpotID': instance.scenicSpotID,
      'ScenicSpotName': instance.scenicSpotName,
      'DescriptionDetail': instance.descriptionDetail,
      'Description': instance.description,
      'Phone': instance.phone,
      'Address': instance.address,
      'ZipCode': instance.zipCode,
      'TravelInfo': instance.travelInfo,
      'OpenTime': instance.openTime,
      'Picture': instance.picture,
      'Position': instance.position,
      'Class1': instance.class1,
      'Class2': instance.class2,
      'Class3': instance.class3,
      'WebsiteUrl': instance.websiteUrl,
      'ParkingPosition': instance.parkingPosition,
      'TicketInfo': instance.ticketInfo,
      'City': instance.city,
      'SrcUpdateTime': instance.srcUpdateTime,
      'UpdateTime': instance.updateTime,
      'Remarks': instance.remarks,
      'Level': instance.level,
      'ParkingInfo': instance.parkingInfo,
    };

Position _$PositionFromJson(Map<String, dynamic> json) => Position(
      positionLon: (json['PositionLon'] as num).toDouble(),
      positionLat: (json['PositionLat'] as num).toDouble(),
      geoHash: json['GeoHash'] as String,
    );

Map<String, dynamic> _$PositionToJson(Position instance) => <String, dynamic>{
      'PositionLon': instance.positionLon,
      'PositionLat': instance.positionLat,
      'GeoHash': instance.geoHash,
    };

Picture _$PictureFromJson(Map<String, dynamic> json) => Picture(
      pictureUrl1: json['PictureUrl1'] as String,
      pictureDescription1: json['PictureDescription1'] as String,
    );

Map<String, dynamic> _$PictureToJson(Picture instance) => <String, dynamic>{
      'PictureUrl1': instance.pictureUrl1,
      'PictureDescription1': instance.pictureDescription1,
    };
