part of 'dto.dart';

@JsonSerializable()
class RequestOrder {
  @JsonKey(name: "plat_number")
  String platNumber;
  @JsonKey(name: "front_image")
  String frontImage;
  @JsonKey(name: "driver_image")
  String driverImage;
  @JsonKey(name: "location_id")
  String locationID;
  @JsonKey(name: "vehicle_type_id")
  String vehicleTypeID;

  RequestOrder(this.platNumber, this.frontImage, this.driverImage,
      this.locationID, this.vehicleTypeID);

  factory RequestOrder.fromJson(Map<String, dynamic> json) =>
      _$RequestOrderFromJson(json);

  Map<String, dynamic> toJson() => _$RequestOrderToJson(this);
}

@JsonSerializable()
class RequestCheckOut {
  String code;

  @JsonKey(name: "front_picture")
  String frontPicture;

  @JsonKey(name: "driver_picture")
  String driverPicture;

  RequestCheckOut(this.code, this.frontPicture, this.driverPicture);

  factory RequestCheckOut.fromJson(Map<String, dynamic> json) =>
      _$RequestCheckOutFromJson(json);

  Map<String, dynamic> toJson() => _$RequestCheckOutToJson(this);
}

@JsonSerializable()
class RequestPayment {
  List<String> vouchers;

  @JsonKey(name: "code_payment")
  String codePayment;

  @JsonKey(name: "payment_method")
  String paymentMethod;

  RequestPayment(this.vouchers, this.codePayment, this.paymentMethod);

  factory RequestPayment.fromJson(Map<String, dynamic> json) =>
      _$RequestPaymentFromJson(json);

  Map<String, dynamic> toJson() => _$RequestPaymentToJson(this);
}
