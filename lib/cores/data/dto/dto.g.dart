// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginRequest _$LoginRequestFromJson(Map<String, dynamic> json) => LoginRequest(
      password: json['password'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$LoginRequestToJson(LoginRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };

RequestOrder _$RequestOrderFromJson(Map<String, dynamic> json) => RequestOrder(
      json['plat_number'] as String,
      json['front_image'] as String,
      json['driver_image'] as String,
      json['location_id'] as String,
      json['vehicle_type_id'] as String,
    );

Map<String, dynamic> _$RequestOrderToJson(RequestOrder instance) =>
    <String, dynamic>{
      'plat_number': instance.platNumber,
      'front_image': instance.frontImage,
      'driver_image': instance.driverImage,
      'location_id': instance.locationID,
      'vehicle_type_id': instance.vehicleTypeID,
    };

RequestCheckOut _$RequestCheckOutFromJson(Map<String, dynamic> json) =>
    RequestCheckOut(
      json['code'] as String,
      json['front_picture'] as String,
      json['driver_picture'] as String,
    );

Map<String, dynamic> _$RequestCheckOutToJson(RequestCheckOut instance) =>
    <String, dynamic>{
      'code': instance.code,
      'front_picture': instance.frontPicture,
      'driver_picture': instance.driverPicture,
    };

RequestPayment _$RequestPaymentFromJson(Map<String, dynamic> json) =>
    RequestPayment(
      (json['vouchers'] as List<dynamic>).map((e) => e as String).toList(),
      json['code_payment'] as String,
      json['payment_method'] as String,
    );

Map<String, dynamic> _$RequestPaymentToJson(RequestPayment instance) =>
    <String, dynamic>{
      'vouchers': instance.vouchers,
      'code_payment': instance.codePayment,
      'payment_method': instance.paymentMethod,
    };
