part of 'bloc.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  late OrderRepository repository;

  OrderBloc() : super(OrderState()) {
    on<ChangeOrderEvent>(_handleOnChangeEventTrigger);
    on<GetLocationsEvent>(_handleGetLocations);
    on<GetVehicleInfoEvent>(_handleGetVehicleInfo);
    on<UploadImageEvent>(_handleUploadImage);
    on<RequestOrderEvent>(_handleRequestOrder);
    on<CheckoutRequestEvent>(_handleCheckout);
    on<PaidEvent>(_handlePaid);
    on<GetAllVoucher>(_getAllVoucher);
    repository = OrderRepositoryImpl();
  }

  Future<void> _handleOnChangeEventTrigger(
      ChangeOrderEvent event, Emitter<OrderState> emitter) async {
    try {
      var json = state.toJson();
      json.forEach((key, value) {
        json[key] = convertToJson(value);
      });
      event.changed.forEach((key, value) {
        var temp = convertToJson(value);
        json[key] = temp;
      });
      var changedState = OrderState.fromJson(json);
      emitter(ChangedOrderState(
          afterState: changedState, actionName: event.eventName));
    } catch (e) {
      log.error(e);
    }
  }

  FutureOr<void> _handleGetLocations(
      GetLocationsEvent event, Emitter<OrderState> emit) async {
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
      emit(ChangedOrderState(
          afterState: changedState, actionName: "GET_DATA_LOCATION"));
    } catch (e) {
      log.error(e);
      var json = state.toJson();
      json["error"] = (e as ExceptionError).toJson();
      json.forEach((key, value) {
        json[key] = convertToJson(value);
      });
      var changedState = OrderState.fromJson(json);
      emit(ChangedOrderState(
          afterState: changedState, actionName: "ERROR_EVENT"));
    }
  }

  FutureOr<void> _handleGetVehicleInfo(
      GetVehicleInfoEvent event, Emitter<OrderState> emit) async {
    try {
      var data = await repository.getVehicle();
      state.vehicles = data;
      var json = state.toJson();
      List<Map<String, dynamic>> locations = [];
      for (var element in data) {
        locations.add(element.toJson());
      }
      json["vehicles"] = locations;
      json.forEach((key, value) {
        json[key] = convertToJson(value);
      });
      var changedState = OrderState.fromJson(json);
      emit(ChangedOrderState(
          afterState: changedState, actionName: "GET_DATA_LOCATION"));
    } catch (e) {
      log.error(e);
      var json = state.toJson();
      json["error"] = (e as ExceptionError).toJson();
      json.forEach((key, value) {
        json[key] = convertToJson(value);
      });
      var changedState = OrderState.fromJson(json);
      emit(ChangedOrderState(
          afterState: changedState, actionName: "ERROR_EVENT"));
    }
  }

  FutureOr<void> _handleUploadImage(
      UploadImageEvent event, Emitter<OrderState> emit) async {
    try {
      var data = await repository.upload(event.request);
      state.uploadResponse = data;
      var json = state.toJson();
      json.forEach((key, value) {
        json[key] = convertToJson(value);
      });
      var changedState = OrderState.fromJson(json);
      emit(ChangedOrderState(
          afterState: changedState, actionName: "UPLOADED_DATA"));
    } catch (e) {
      log.error(e);
      var json = state.toJson();
      json["error"] = (e as ExceptionError).toJson();
      json.forEach((key, value) {
        json[key] = convertToJson(value);
      });
      var changedState = OrderState.fromJson(json);
      emit(ChangedOrderState(
          afterState: changedState, actionName: "ERROR_EVENT"));
    }
  }

  FutureOr<void> _handleRequestOrder(
      RequestOrderEvent event, Emitter<OrderState> emit) async {
    try {
      var data = await repository.requestOrder(event.requestOrder);
      state.responseOrder = data;
      var json = state.toJson();
      json.forEach((key, value) {
        json[key] = convertToJson(value);
      });
      var changedState = OrderState.fromJson(json);
      emit(ChangedOrderState(
          afterState: changedState, actionName: "RESPONSE_ORDER"));
    } catch (e) {
      log.error(e);
      var json = state.toJson();
      json["error"] = (e as ExceptionError).toJson();
      json.forEach((key, value) {
        json[key] = convertToJson(value);
      });
      var changedState = OrderState.fromJson(json);
      emit(ChangedOrderState(
          afterState: changedState, actionName: "ERROR_EVENT"));
    }
  }

  FutureOr<void> _handleCheckout(
      CheckoutRequestEvent event, Emitter<OrderState> emit) async {
    try {
      var data = await repository.checkout(event.request);
      state.checkoutResponse = data;
      var json = state.toJson();
      json.forEach((key, value) {
        json[key] = convertToJson(value);
      });
      var changedState = OrderState.fromJson(json);
      emit(ChangedOrderState(
          afterState: changedState, actionName: "RESPONSE_CHECKOUT"));
    } catch (e) {
      log.error(e);
      var json = state.toJson();
      json["error"] = (e as ExceptionError).toJson();
      json.forEach((key, value) {
        json[key] = convertToJson(value);
      });
      var changedState = OrderState.fromJson(json);
      emit(ChangedOrderState(
          afterState: changedState, actionName: "ERROR_EVENT"));
    }
  }

  FutureOr<void> _handlePaid(PaidEvent event, Emitter<OrderState> emit) async {
    try {
      var data = await repository.paid(event.request);
      state.paymentResponse = data;
      var json = state.toJson();
      json.forEach((key, value) {
        json[key] = convertToJson(value);
      });
      var changedState = OrderState.fromJson(json);
      emit(ChangedOrderState(
          afterState: changedState, actionName: "RESPONSE_PAYMENT"));
    } catch (e) {
      log.error(e);
      var json = state.toJson();
      json["error"] = (e as ExceptionError).toJson();
      json.forEach((key, value) {
        json[key] = convertToJson(value);
      });
      var changedState = OrderState.fromJson(json);
      emit(ChangedOrderState(
          afterState: changedState, actionName: "ERROR_EVENT"));
    }
  }

  FutureOr<void> _getAllVoucher(
      GetAllVoucher event, Emitter<OrderState> emit) async {
    try {
      var data = await repository.getVouchers();
      state.vouchers = data;
      var json = state.toJson();
      List<Map<String, dynamic>> vouchers = [];
      for (var element in data) {
        vouchers.add(element.toJson());
      }
      json["vouchers"] = vouchers;
      var changedState = OrderState.fromJson(json);
      emit(ChangedOrderState(
          afterState: changedState, actionName: "GET_VOUCHERS"));
    } catch (e) {
      log.error(e);
      var json = state.toJson();
      json["error"] = (e as ExceptionError).toJson();
      json.forEach((key, value) {
        json[key] = convertToJson(value);
      });
      var changedState = OrderState.fromJson(json);
      emit(ChangedOrderState(
          afterState: changedState, actionName: "ERROR_EVENT"));
    }
  }
}
