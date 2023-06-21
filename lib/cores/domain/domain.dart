import 'package:json_annotation/json_annotation.dart';
import 'package:uuid/uuid.dart';

part 'domain.g.dart';
part 'login_response.dart';
part 'base_response.dart';
part 'upload_response.dart';
part 'location.dart';
part 'vehicle_type.dart';

@JsonSerializable()
class Domain {
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "created_at")
  DateTime? createdAt;
  @JsonKey(name: "updated_at")
  DateTime? updatedAt;
  @JsonKey(name: "created_by")
  String? createdBy;
  @JsonKey(name: "updated_by")
  String? updatedBy;

  Domain(
      {
      this.createdBy,
      this.updatedAt,
      this.updatedBy}) {
    id = const Uuid().v4();
    createdAt = DateTime.now();
  }
}
