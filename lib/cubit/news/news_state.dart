abstract class NewsState {}

class NewsLoadingState extends NewsState {}

class NewsLoadedState extends NewsState {}

class NewsEmptyState extends NewsState {}

class NewsErrorState extends NewsState {
  String error;

  NewsErrorState({required this.error});
}
