import 'package:bloc/bloc.dart';

import 'news_state.dart';

class NewsCubit extends Cubit<NewsState>{
  NewsCubit() : super(NewsLoadedState());

  Future<void> loadData()async{
    emit(NewsLoadingState());
    //TODO: load data
    emit(NewsLoadedState());
  }

  Future<void> acceptError()async{
    emit(NewsLoadedState());
  }



}