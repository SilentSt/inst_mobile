import 'package:bloc/bloc.dart';
import 'package:inst_mobile/cubit/global_search/cubit.dart';

class GlobalSearchCubit extends Cubit<GlobalSearchState>{
  GlobalSearchCubit() : super(GlobalSearchLoadedState());

  Future<void> loadData()async{
    emit(GlobalSearchLoadingState());
    //TODO: load data
    emit(GlobalSearchLoadedState());
  }

  Future<void> acceptError()async{
    emit(GlobalSearchLoadedState());
  }
}