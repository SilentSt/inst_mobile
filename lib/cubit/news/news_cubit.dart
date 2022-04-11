import 'package:bloc/bloc.dart';

import 'news_state.dart';

class NewsCubit extends Cubit<NewsState>{
  NewsCubit() : super(NewsLoadingState());

}