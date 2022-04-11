abstract class ProfileState {}

class ProfileLoadingState extends ProfileState {}

class ProfileLoadedState extends ProfileState {}

class ProfileEmptyState extends ProfileState {}

class ProfileErrorState extends ProfileState {
  Error error;

  ProfileErrorState({required this.error});
}
