part of 'domain.dart';

@JsonSerializable()
class PaymentResponse {
  @JsonKey(name: "struct_paid")
  String structPaid;

  PaymentResponse(this.structPaid);

  factory PaymentResponse.fromJson(Map<String, dynamic> json) =>
      _$PaymentResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentResponseToJson(this);
}
