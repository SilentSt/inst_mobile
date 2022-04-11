abstract class InitialState{}

class InitialLoadingState extends InitialState{}

class InitialLoadedState extends InitialState{}

class InitialErrorState extends InitialState{
  String error;

  InitialErrorState({required this.error});
}
