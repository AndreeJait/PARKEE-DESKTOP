part of 'dto.dart';

@JsonSerializable()
class LoginRequest {
  @JsonKey(name: "username")
  String username;

  @JsonKey(name: "password")
  String password;

  LoginRequest({required this.password, required this.username});

  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);
}

@JsonSerializable()
class LoginResponse {
  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "role")
  String? role;

  @JsonKey(name: "username")
  String? username;

  @JsonKey(name: "dorm")
  String? dorm;

  LoginResponse({this.name, this.role, this.username, this.dorm});

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}

@JsonSerializable()
class RegisterRequest {
  @JsonKey(name: "username")
  String username;

  @JsonKey(name: "password")
  String password;

  @JsonKey(name: "name")
  String name;

  @JsonKey(name: "role")
  String role;

  RegisterRequest(
      {required this.password,
      required this.username,
      required this.role,
      required this.name});

  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterRequestToJson(this);
}

@JsonSerializable()
class RegisterResponse {
  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "role")
  String? role;

  @JsonKey(name: "username")
  String? username;

  RegisterResponse({this.name, this.role, this.username});

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterResponseToJson(this);
}
