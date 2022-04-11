abstract class AuthState {}

class AuthLoadingState extends AuthState {}

class AuthLoadedState extends AuthState {}

class AuthWrongDataState extends AuthState{}

class AuthAuthorizedState extends AuthState{}

class AuthErrorState extends AuthState {
  String error;

  AuthErrorState({required this.error});
}
