part of 'bloc.dart';

@JsonSerializable()
class OrderState extends Equatable {
  final bool isLoading;
  final bool isLoadingUpload;
  final ExceptionError? error;
  List<Location> locations;
  List<VehicleInfo> vehicles;
  UploadResponse? uploadResponse;
  ResponseOrder? responseOrder;
  CheckoutResponse? checkoutResponse;
  PaymentResponse? paymentResponse;
  List<Voucher> vouchers;

  OrderState(
      {this.isLoading = false,
      this.isLoadingUpload = false,
      this.error,
      this.uploadResponse,
      this.vouchers = const [],
      this.responseOrder,
      this.checkoutResponse,
      this.paymentResponse,
      this.locations = const [],
      this.vehicles = const []});

  @override
  List<Object?> get props => [
        isLoading,
        isLoadingUpload,
        error,
        locations,
        vehicles,
        vouchers,
        uploadResponse,
        checkoutResponse,
        paymentResponse,
        responseOrder
      ];

  factory OrderState.fromJson(Map<String, dynamic> json) =>
      _$OrderStateFromJson(json);

  Map<String, dynamic> toJson() => _$OrderStateToJson(this);
}

class ChangedOrderState extends OrderState {
  final OrderState afterState;
  final String? actionName;

  ChangedOrderState({required this.afterState, this.actionName})
      : super(
            isLoading: afterState.isLoading,
            error: afterState.error,
            vehicles: afterState.vehicles,
            locations: afterState.locations,
            vouchers: afterState.vouchers,
            paymentResponse: afterState.paymentResponse,
            checkoutResponse: afterState.checkoutResponse,
            uploadResponse: afterState.uploadResponse,
            responseOrder: afterState.responseOrder,
            isLoadingUpload: afterState.isLoadingUpload);

  @override
  List<Object?> get props => [
        ...super.props,
        actionName,
      ];
}
