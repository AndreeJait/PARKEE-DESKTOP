part of 'domain.dart';

@JsonSerializable()
class ResponseOrder {
  @JsonKey(name: "link_parking_ticket")
  String linkParkingTicket;

  ResponseOrder(this.linkParkingTicket);

  factory ResponseOrder.fromJson(Map<String, dynamic> json) =>
      _$ResponseOrderFromJson(json);

  Map<String, dynamic> toJson() => _$ResponseOrderToJson(this);
}
