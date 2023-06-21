part of '../bloc.dart';

@JsonSerializable()
class AppState extends Equatable {
  final bool isLoading;
  final bool isLoadingUpload;

  AppState({this.isLoading = false, this.isLoadingUpload = false});

  @override
  List<Object?> get props => [isLoading, isLoadingUpload];

  factory AppState.fromJson(Map<String, dynamic> json) =>
      _$AppStateFromJson(json);

  Map<String, dynamic> toJson() => _$AppStateToJson(this);
}

class ChangedAppState extends AppState {
  final AppState afterState;
  final String? actionName;

  ChangedAppState({required this.afterState, this.actionName})
      : super(
            isLoading: afterState.isLoading,
            isLoadingUpload: afterState.isLoadingUpload);

  @override
  List<Object?> get props => [
        ...super.props,
        actionName,
      ];
}
