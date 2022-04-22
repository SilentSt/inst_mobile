abstract class PostDetailsState{}

class PostDetailsLoadingState extends PostDetailsState{}

class PostDetailsLoadedState extends PostDetailsState{}

class PostDetailsEmptyState extends PostDetailsState{}

class PostDetailsErrorState extends PostDetailsState{
  final String error;

  PostDetailsErrorState({required this.error});
}