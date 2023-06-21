// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthState _$AuthStateFromJson(Map<String, dynamic> json) => AuthState(
      isLoading: json['isLoading'] as bool? ?? false,
      isLoadingUpload: json['isLoadingUpload'] as bool? ?? false,
      error: json['error'] == null
          ? null
          : ExceptionError.fromJson(json['error'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AuthStateToJson(AuthState instance) => <String, dynamic>{
      'isLoading': instance.isLoading,
      'isLoadingUpload': instance.isLoadingUpload,
      'error': instance.error,
    };
