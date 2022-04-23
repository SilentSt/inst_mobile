abstract class ProfileState {}

class ProfileLoadingState extends ProfileState {}

class ProfileLoadedState extends ProfileState {}

class ProfileEmptyState extends ProfileState {}

class ProfileErrorState extends ProfileState {
  String error;

  ProfileErrorState({required this.error});
}
