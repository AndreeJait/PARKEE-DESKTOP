part of 'domain.dart';

@JsonSerializable()
class Location {
  String id;
  String name;
  String address;
  String city;

  Location(this.id, this.name, this.address, this.city);

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}
