// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Config _$ConfigFromJson(Map<String, dynamic> json) => Config();

Map<String, dynamic> _$ConfigToJson(Config instance) => <String, dynamic>{};

Env _$EnvFromJson(Map<String, dynamic> json) => Env(
      json['base_url'] as String,
      json['app_mode'] as String,
      json['app_name'] as String,
      json['salt_hash'] as String,
    );

Map<String, dynamic> _$EnvToJson(Env instance) => <String, dynamic>{
      'base_url': instance.baseUrl,
      'app_mode': instance.appMode,
      'app_name': instance.appName,
      'salt_hash': instance.saltHash,
    };
