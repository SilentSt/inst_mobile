abstract class GlobalSearchState {}

class GlobalSearchLoadingState extends GlobalSearchState {}

class GlobalSearchLoadedState extends GlobalSearchState {}

class GlobalSearchEmptyState extends GlobalSearchState {}

class GlobalSearchErrorState extends GlobalSearchState {
  String error;

  GlobalSearchErrorState({required this.error});
}
