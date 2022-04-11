abstract class RegistrationState {}

class RegistrationLoadingState extends RegistrationState {}

class RegistrationLoadedState extends RegistrationState {}

class RegistrationWrongDataState extends RegistrationState {
  String error;

  RegistrationWrongDataState({required this.error});
}

class RegistrationSuccessState extends RegistrationState {}

class RegistrationErrorState extends RegistrationState {
  String error;

  RegistrationErrorState({required this.error});
}
