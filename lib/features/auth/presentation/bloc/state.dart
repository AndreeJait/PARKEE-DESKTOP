part of 'bloc.dart';

@JsonSerializable()
class AuthState extends Equatable {
  final bool isLoading;
  final bool isLoadingUpload;
  final ExceptionError? error;

  AuthState({this.isLoading = false, this.isLoadingUpload = false, this.error});

  @override
  List<Object?> get props => [isLoading, isLoadingUpload, error];

  factory AuthState.fromJson(Map<String, dynamic> json) =>
      _$AuthStateFromJson(json);

  Map<String, dynamic> toJson() => _$AuthStateToJson(this);
}

class ChangedAuthState extends AuthState {
  final AuthState afterState;
  final String? actionName;

  ChangedAuthState({required this.afterState, this.actionName})
      : super(
            isLoading: afterState.isLoading,
            error: afterState.error,
            isLoadingUpload: afterState.isLoadingUpload);

  @override
  List<Object?> get props => [
        ...super.props,
        actionName,
      ];
}
