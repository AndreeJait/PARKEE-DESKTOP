part of 'domain.dart';

@JsonSerializable()
class UploadResponse {
  String url;
  @JsonKey(name: "object_name")
  String objectName;

  UploadResponse({required this.url, required this.objectName});

  factory UploadResponse.fromJson(Map<String, dynamic> json) =>
      _$UploadResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UploadResponseToJson(this);
}
