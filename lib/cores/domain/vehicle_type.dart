part of 'domain.dart';

@JsonSerializable()
class VehicleInfo {
  int capacity;
  @JsonKey(name:"vehicle_type")
  String vehicleType;
  @JsonKey(name: "vehicle_type_id")
  String vehicleTypeID;
  @JsonKey(name: "booked_count")
  int bookedCount;
  @JsonKey(name: "available_capacity")
  int availableCapacity;

  VehicleInfo(this.capacity, this.vehicleType, this.vehicleTypeID,
      this.bookedCount, this.availableCapacity);

  factory VehicleInfo.fromJson(Map<String, dynamic> json) =>
      _$VehicleInfoFromJson(json);

  	Map<String, dynamic> toJson() => _$VehicleInfoToJson(this);
}
