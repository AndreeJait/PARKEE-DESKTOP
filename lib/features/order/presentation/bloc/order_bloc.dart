part of 'bloc.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  late OrderRepository repository;

  OrderBloc() : super(OrderState()) {
    on<ChangeAuthEvent>(_handleOnChangeEventTrigger);
    on<GetLocationsEvent>(_handleGetLocations);
    on<GetVehicleInfoEvent>(_handleGetVehicleInfo);
    repository = OrderRepositoryImpl();
  }

  Future<void> _handleOnChangeEventTrigger(
      ChangeAuthEvent event, Emitter<OrderState> emitter) async {
    try {
      var json = state.toJson();
      event.changed.forEach((key, value) {
        var temp = convertToJson(value);
        json[key] = temp;
      });
      var changedState = OrderState.fromJson(json);
      emitter(ChangedAuthState(
          afterState: changedState, actionName: event.eventName));
    } catch (e) {
      log.error(e);
    }
  }

  FutureOr<void> _handleGetLocations(
      GetLocationsEvent event, Emitter<OrderState> emit) async{
    try {
      var data = await repository.getLocations();
      state.locations = data;
      var json = state.toJson();
      List<Map<String, dynamic>> locations = [];
      for (var element in data) {
        locations.add(element.toJson());
      }
      json["locations"] = locations;
      var changedState = OrderState.fromJson(json);
      emit(ChangedAuthState(
          afterState: changedState, actionName: "GET_DATA_LOCATION"));
    } catch (e) {
      log.error(e);
    }
  }

  FutureOr<void> _handleGetVehicleInfo(GetVehicleInfoEvent event, Emitter<OrderState> emit) async{
    try {
      var data = await repository.getVehicle();
      state.vehicles = data;
      var json = state.toJson();
      List<Map<String, dynamic>> locations = [];
      for (var element in data) {
        locations.add(element.toJson());
      }
      json["vehicles"] = locations;
      var changedState = OrderState.fromJson(json);
      emit(ChangedAuthState(
          afterState: changedState, actionName: "GET_DATA_LOCATION"));
    } catch (e) {
      log.error(e);
    }
  }
}
