abstract class AuthState {}

class AuthLoadingState extends AuthState {}

class AuthLoadedState extends AuthState {}

class AuthWrongDataState extends AuthState{}

class AuthErrorState extends AuthState {
  Error error;

  AuthErrorState({required this.error});
}
