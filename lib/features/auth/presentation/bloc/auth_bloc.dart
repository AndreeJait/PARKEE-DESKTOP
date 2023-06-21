part of 'bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  late AuthRepository _authRepository;
  AuthBloc() : super(AuthState()) {
    on<ChangeAuthEvent>(_handleOnChangeEventTrigger);
    on<LoginEvent>(_handleLogin);
    on<RefreshTokenEvent>(_handleRefresh);
    _authRepository = AuthRepositoryImpl();
  }

  Future<void> _handleOnChangeEventTrigger(
      ChangeAuthEvent event, Emitter<AuthState> emitter) async {
    try {
      var json = state.toJson();
      json.forEach((key, value) {
        json[key] = convertToJson(value);
      });
      event.changed.forEach((key, value) {
        var temp = convertToJson(value);
        json[key] = temp;
      });
      var changedState = AuthState.fromJson(json);
      emitter(ChangedAuthState(
          afterState: changedState, actionName: event.eventName));
    } catch (e) {
      log.error(e);
    }
  }


  FutureOr<void> _handleLogin(LoginEvent event, Emitter<AuthState> emit) async{
    try {
      var res= await _authRepository.login(event.request);
      var json = state.toJson();
      json.forEach((key, value) {
        var temp = convertToJson(value);
        json[key] = temp;
      });
      var changedState = AuthState.fromJson(json);
      emit(ChangedAuthState(
          afterState: changedState, actionName: "LOGIN_EVENT"));
    } catch (e) {
      var json = state.toJson();
      json["error"] = (e as ExceptionError).toJson();
      var changedState = AuthState.fromJson(json);
      emit(ChangedAuthState(
          afterState: changedState, actionName: "ERROR_EVENT"));
    }
  }

  FutureOr<void> _handleRefresh(RefreshTokenEvent event, Emitter<AuthState> emit) {
    try {
      var json = state.toJson();
      var changedState = AuthState.fromJson(json);
      emit(ChangedAuthState(
          afterState: changedState, actionName: "REFRESH_TOKEN"));
    } catch (e) {
      log.error(e);
    }
  }
}
