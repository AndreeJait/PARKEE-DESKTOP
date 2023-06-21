// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exception.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExceptionError _$ExceptionErrorFromJson(Map<String, dynamic> json) =>
    ExceptionError(
      message: json['message'] as String? ?? "Internal server error",
      code: json['code'] as String? ?? "500000",
    );

Map<String, dynamic> _$ExceptionErrorToJson(ExceptionError instance) =>
    <String, dynamic>{
      'message': instance.message,
      'code': instance.code,
    };
