import 'package:json_annotation/json_annotation.dart';

part 'exception.g.dart';

@JsonSerializable()
class ExceptionError implements Exception{
  String message;
  String code;

  ExceptionError({this.message = "Internal server error", this.code = "500000"});

  @override
  String toString() {
    return "$message : ($code)";
  }

  factory ExceptionError.fromJson(Map<String, dynamic> json) =>
      _$ExceptionErrorFromJson(json);

  	Map<String, dynamic> toJson() => _$ExceptionErrorToJson(this);
}
