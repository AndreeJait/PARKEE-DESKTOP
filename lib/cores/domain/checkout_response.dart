part of 'domain.dart';

@JsonSerializable()
class CheckoutResponse {
  @JsonKey(name: "code_payment")
  String codePayment;
  @JsonKey(name: "total_price")
  int totalPrice;
  @JsonKey(name: "total_dif")
  String totalDif;
  @JsonKey(name: "entry_time")
  String entryTime;
  @JsonKey(name: "exit_time")
  String exitTime;
  @JsonKey(name: "vehicle_type")
  String vehicleType;

  CheckoutResponse(this.codePayment, this.totalPrice, this.totalDif,
      this.entryTime, this.exitTime, this.vehicleType);

  factory CheckoutResponse.fromJson(Map<String, dynamic> json) =>
      _$CheckoutResponseFromJson(json);

  	Map<String, dynamic> toJson() => _$CheckoutResponseToJson(this);
}
