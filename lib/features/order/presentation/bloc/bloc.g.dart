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
    };
