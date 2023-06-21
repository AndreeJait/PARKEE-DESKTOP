part of 'bloc.dart';

@JsonSerializable()
class OrderState extends Equatable {
  final bool isLoading;
  final bool isLoadingUpload;
  final ExceptionError? error;
  List<Location> locations;
  List<VehicleInfo> vehicles;

  OrderState(
      {this.isLoading = false,
      this.isLoadingUpload = false,
      this.error,
      this.locations = const [],
      this.vehicles = const []});

  @override
  List<Object?> get props =>
      [isLoading, isLoadingUpload, error, locations, vehicles];

  factory OrderState.fromJson(Map<String, dynamic> json) =>
      _$OrderStateFromJson(json);

  Map<String, dynamic> toJson() => _$OrderStateToJson(this);
}

class ChangedAuthState extends OrderState {
  final OrderState afterState;
  final String? actionName;

  ChangedAuthState({required this.afterState, this.actionName})
      : super(
            isLoading: afterState.isLoading,
            error: afterState.error,
            vehicles: afterState.vehicles,
            locations: afterState.locations,
            isLoadingUpload: afterState.isLoadingUpload);

  @override
  List<Object?> get props => [
        ...super.props,
        actionName,
      ];
}
