// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderState _$OrderStateFromJson(Map<String, dynamic> json) => OrderState(
      isLoading: json['isLoading'] as bool? ?? false,
      isLoadingUpload: json['isLoadingUpload'] as bool? ?? false,
      error: json['error'] == null
          ? null
          : ExceptionError.fromJson(json['error'] as Map<String, dynamic>),
      uploadResponse: json['uploadResponse'] == null
          ? null
          : UploadResponse.fromJson(
              json['uploadResponse'] as Map<String, dynamic>),
      vouchers: (json['vouchers'] as List<dynamic>?)
              ?.map((e) => Voucher.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      responseOrder: json['responseOrder'] == null
          ? null
          : ResponseOrder.fromJson(
              json['responseOrder'] as Map<String, dynamic>),
      checkoutResponse: json['checkoutResponse'] == null
          ? null
          : CheckoutResponse.fromJson(
              json['checkoutResponse'] as Map<String, dynamic>),
      paymentResponse: json['paymentResponse'] == null
          ? null
          : PaymentResponse.fromJson(
              json['paymentResponse'] as Map<String, dynamic>),
      locations: (json['locations'] as List<dynamic>?)
              ?.map((e) => Location.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      vehicles: (json['vehicles'] as List<dynamic>?)
              ?.map((e) => VehicleInfo.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$OrderStateToJson(OrderState instance) =>
    <String, dynamic>{
      'isLoading': instance.isLoading,
      'isLoadingUpload': instance.isLoadingUpload,
      'error': instance.error,
      'locations': instance.locations,
      'vehicles': instance.vehicles,
      'uploadResponse': instance.uploadResponse,
      'responseOrder': instance.responseOrder,
      'checkoutResponse': instance.checkoutResponse,
      'paymentResponse': instance.paymentResponse,
      'vouchers': instance.vouchers,
    };
