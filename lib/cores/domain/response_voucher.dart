part of 'domain.dart';

@JsonSerializable()
class Voucher {
  String id;
  int value;
  @JsonKey(name: "is_percentage")
  bool isPercentage;

  @JsonKey(name: "code_voucher")
  String codeVoucher;

  Voucher(this.id, this.value, this.isPercentage, this.codeVoucher);

  factory Voucher.fromJson(Map<String, dynamic> json) =>
      _$VoucherFromJson(json);

  Map<String, dynamic> toJson() => _$VoucherToJson(this);
}
