abstract class RegistrationState {}

class RegistrationLoadingState extends RegistrationState {}

class RegistrationLoadedState extends RegistrationState {}

class RegistrationWrongDataState extends RegistrationState {
  String exception;

  RegistrationWrongDataState({required this.exception});
}

class RegistrationSuccessState extends RegistrationState {}

class RegistrationErrorState extends RegistrationState {
  Error error;

  RegistrationErrorState({required this.error});
}
