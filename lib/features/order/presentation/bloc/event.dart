part of 'bloc.dart';

abstract class OrderEvent extends Equatable {
  const OrderEvent();

  @override
  List<Object?> get props => [];
}

class ChangeOrderEvent extends OrderEvent {
  final Map<String, dynamic> changed;
  final String? eventName;

  const ChangeOrderEvent({required this.changed, this.eventName});

  @override
  List<Object?> get props => [
        changed,
        eventName,
        ...super.props,
      ];

  @override
  String toString() {
    return "CHANGE_ORDER_EVENT";
  }
}

class GetLocationsEvent extends OrderEvent {
  const GetLocationsEvent();

  @override
  List<Object?> get props => [
        ...super.props,
      ];

  @override
  String toString() {
    return "GET_LOCATION";
  }
}

class GetVehicleInfoEvent extends OrderEvent {
  const GetVehicleInfoEvent();

  @override
  List<Object?> get props => [
        ...super.props,
      ];

  @override
  String toString() {
    return "GET_VEHICLE_INFO";
  }
}

class UploadImageEvent extends OrderEvent {
  final UploadRequest request;

  const UploadImageEvent(this.request);

  @override
  List<Object?> get props => [
        ...super.props,
        request,
      ];

  @override
  String toString() {
    return "UPLOAD_IMAGE";
  }
}

class RequestOrderEvent extends OrderEvent {
  final RequestOrder requestOrder;

  const RequestOrderEvent(this.requestOrder);

  @override
  List<Object?> get props => [...super.props, requestOrder];

  @override
  String toString() {
    return "REQUEST_ORDER";
  }
}

class CheckoutRequestEvent extends OrderEvent {
  final RequestCheckOut request;

  const CheckoutRequestEvent(this.request);

  @override
  List<Object?> get props => [
        ...super.props,
        request,
      ];

  @override
  String toString() {
    return "CHECKOUT_REQUEST";
  }
}

class PaidEvent extends OrderEvent {
  final RequestPayment request;

  const PaidEvent(this.request);

  @override
  List<Object?> get props => [
        ...super.props,
        request,
      ];

  @override
  String toString() {
    return "PAYMENT_REQUEST";
  }
}

class GetAllVoucher extends OrderEvent {
  const GetAllVoucher();

  @override
  List<Object?> get props => [
        ...super.props,
      ];

  @override
  String toString() {
    return "GET_ALL_VOUCHER";
  }
}
