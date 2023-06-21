part of 'domain.dart';

@JsonSerializable()
class LoginResponse {
  @JsonKey(name: "access_token")
  String accessToken;
  @JsonKey(name: "refresh_token")
  String refreshToken;
  @JsonKey(name: "expired_token")
  int expiredToken;

  LoginResponse(
      {required this.accessToken,
      required this.refreshToken,
      required this.expiredToken});

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
