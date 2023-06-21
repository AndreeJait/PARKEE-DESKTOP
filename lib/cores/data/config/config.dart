import 'package:json_annotation/json_annotation.dart';
part 'config.g.dart';

@JsonSerializable()
class Config {
  static late Env env;
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Env {
  String baseUrl;
  String appMode;
  String appName;
  String saltHash;

  Env(this.baseUrl, this.appMode, this.appName, this.saltHash);

  factory Env.fromJson(Map<String, dynamic> json) =>
      _$EnvFromJson(json);
  Map<String, dynamic> toJson() => _$EnvToJson(this);
}

var env = Config.env;
