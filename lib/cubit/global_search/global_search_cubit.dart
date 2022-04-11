import 'package:bloc/bloc.dart';
import 'package:inst_mobile/cubit/global_search/cubit.dart';

class GlobalSearchCubit extends Cubit<GlobalSearchState>{
  GlobalSearchCubit() : super(GlobalSearchLoadingState());

}