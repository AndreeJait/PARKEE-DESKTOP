// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'domain.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Domain _$DomainFromJson(Map<String, dynamic> json) => Domain(
      createdBy: json['created_by'] as String?,
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      updatedBy: json['updated_by'] as String?,
    )
      ..id = json['id'] as String?
      ..createdAt = json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String);

Map<String, dynamic> _$DomainToJson(Domain instance) => <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'created_by': instance.createdBy,
      'updated_by': instance.updatedBy,
    };

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      accessToken: json['access_token'] as String,
      refreshToken: json['refresh_token'] as String,
      expiredToken: json['expired_token'] as int,
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
      'expired_token': instance.expiredToken,
    };

BaseResponse _$BaseResponseFromJson(Map<String, dynamic> json) => BaseResponse(
      response: Response.fromJson(json['response'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BaseResponseToJson(BaseResponse instance) =>
    <String, dynamic>{
      'response': instance.response,
    };

Response _$ResponseFromJson(Map<String, dynamic> json) => Response(
      body: json['body'],
      message: json['message'] as String?,
      length: json['length'] as int?,
    );

Map<String, dynamic> _$ResponseToJson(Response instance) => <String, dynamic>{
      'body': instance.body,
      'message': instance.message,
      'length': instance.length,
    };

ErrorResponse _$ErrorResponseFromJson(Map<String, dynamic> json) =>
    ErrorResponse(
      error: Error.fromJson(json['error'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ErrorResponseToJson(ErrorResponse instance) =>
    <String, dynamic>{
      'error': instance.error,
    };

Error _$ErrorFromJson(Map<String, dynamic> json) => Error(
      message: json['message'] as String?,
      body: json['body'],
      codeError: json['code_error'] as String,
    );

Map<String, dynamic> _$ErrorToJson(Error instance) => <String, dynamic>{
      'body': instance.body,
      'message': instance.message,
      'code_error': instance.codeError,
    };

UploadResponse _$UploadResponseFromJson(Map<String, dynamic> json) =>
    UploadResponse(
      url: json['url'] as String,
      objectName: json['object_name'] as String,
    );

Map<String, dynamic> _$UploadResponseToJson(UploadResponse instance) =>
    <String, dynamic>{
      'url': instance.url,
      'object_name': instance.objectName,
    };

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
      json['id'] as String,
      json['name'] as String,
      json['address'] as String,
      json['city'] as String,
    );

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'city': instance.city,
    };

VehicleInfo _$VehicleInfoFromJson(Map<String, dynamic> json) => VehicleInfo(
      json['capacity'] as int,
      json['vehicle_type'] as String,
      json['vehicle_type_id'] as String,
      json['booked_count'] as int,
      json['available_capacity'] as int,
    );

Map<String, dynamic> _$VehicleInfoToJson(VehicleInfo instance) =>
    <String, dynamic>{
      'capacity': instance.capacity,
      'vehicle_type': instance.vehicleType,
      'vehicle_type_id': instance.vehicleTypeID,
      'booked_count': instance.bookedCount,
      'available_capacity': instance.availableCapacity,
    };
