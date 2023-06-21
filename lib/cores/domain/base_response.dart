part of 'domain.dart';

@JsonSerializable()
class BaseResponse {
  Response response;

  BaseResponse({required this.response});

  factory BaseResponse.fromJson(Map<String, dynamic> json) =>
      _$BaseResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BaseResponseToJson(this);
}

@JsonSerializable()
class Response {
  dynamic body;
  String? message;
  int? length;

  Response({this.body, this.message, this.length});

  factory Response.fromJson(Map<String, dynamic> json) =>
      _$ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseToJson(this);
}

@JsonSerializable()
class ErrorResponse {
  Error error;

  ErrorResponse({required this.error});

  factory ErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$ErrorResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorResponseToJson(this);
}

@JsonSerializable()
class Error {
  dynamic body;
  String? message;
  @JsonKey(name: "code_error")
  String codeError;

  Error({this.message, this.body, required this.codeError});

  factory Error.fromJson(Map<String, dynamic> json) => _$ErrorFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorToJson(this);
}
