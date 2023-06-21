part of 'dto.dart';

@JsonSerializable()
class LoginRequest {
  @JsonKey(name: "email")
  String email;

  @JsonKey(name: "password")
  String password;

  LoginRequest({required this.password, required this.email});

  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);
}
