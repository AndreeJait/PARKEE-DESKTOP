part of 'bloc.dart';

abstract class OrderEvent extends Equatable {
  const OrderEvent();

  @override
  List<Object?> get props => [];
}

class ChangeAuthEvent extends OrderEvent {
  final Map<String, dynamic> changed;
  final String? eventName;

  const ChangeAuthEvent({required this.changed, this.eventName});

  @override
  List<Object?> get props => [
        changed,
        eventName,
        ...super.props,
      ];

  @override
  String toString() {
    return "CHANGE_EVENT";
  }
}

class GetLocationsEvent extends OrderEvent{
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


class GetVehicleInfoEvent extends OrderEvent{
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
