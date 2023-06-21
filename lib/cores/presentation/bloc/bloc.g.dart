// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppState _$AppStateFromJson(Map<String, dynamic> json) => AppState(
      isLoading: json['isLoading'] as bool? ?? false,
      isLoadingUpload: json['isLoadingUpload'] as bool? ?? false,
    );

Map<String, dynamic> _$AppStateToJson(AppState instance) => <String, dynamic>{
      'isLoading': instance.isLoading,
      'isLoadingUpload': instance.isLoadingUpload,
    };
