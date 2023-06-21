part of 'bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class ChangeAuthEvent extends AuthEvent {
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

class LoginEvent extends AuthEvent {
  final LoginRequest request;

  const LoginEvent({required this.request});

  @override
  List<Object?> get props => [
        request,
        ...super.props,
      ];
  @override
  String toString() {
    return "LOGIN_EVENT";
  }
}

class RefreshTokenEvent extends AuthEvent {
  const RefreshTokenEvent();

  @override
  List<Object?> get props => [
    ...super.props,
  ];
  @override
  String toString() {
    return "REFRESH_EVENT";
  }
}
