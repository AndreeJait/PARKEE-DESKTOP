part of '../bloc.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object?> get props => [];
}

class ChangeEvent extends AppEvent {
  final Map<String, dynamic> changed;
  final String? eventName;

  const ChangeEvent({required this.changed, this.eventName});

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

class GetAllNotification extends AppEvent{
  final String userID;

  const GetAllNotification({required this.userID});

  @override
  // TODO: implement props
  List<Object?> get props => [
    ...super.props,
    userID
  ];

  @override
  String toString() {
    // TODO: implement toString
    return "GET_ALL_NOTIFICATION";
  }
}

