part of '../bloc.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppState()) {
    on<ChangeEvent>(_handleOnChangeEventTrigger);
    on<GetAllNotification>(_getAllNotification);
  }

  Future<void> _handleOnChangeEventTrigger(
      ChangeEvent event, Emitter<AppState> emitter) async {
    try {
      var json = state.toJson();
      event.changed.forEach((key, value) {
        var temp = convertToJson(value);
        json[key] = temp;
      });
      var changedState = AppState.fromJson(json);
      emitter(ChangedAppState(
          afterState: changedState, actionName: event.eventName));
    } catch (e) {
      log.error(e);
    }
  }

  FutureOr<void> _getAllNotification(
      GetAllNotification event, Emitter<AppState> emit) {
    try {
      // TODO: Call Service
      var data = false;
      var json = state.toJson();
      json["isLoading"] = convertToJson(data);
      var changedState = AppState.fromJson(json);
      emit(ChangedAppState(
          afterState: changedState, actionName: "GET_ALL_NOTIFIER"));
    } catch (e) {
      log.error(e);
    }
  }
}
