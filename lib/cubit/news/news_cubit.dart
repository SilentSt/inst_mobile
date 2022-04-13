import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:inst_mobile/data/api/history.dart';
import 'package:inst_mobile/data/models/history.dart';

import 'news_state.dart';

class NewsCubit extends Cubit<NewsState>{
  NewsCubit() : super(NewsInitialState());
  List<GetHistory> followingHistories = [];

  Future<void> loadData()async{
    emit(NewsLoadingState());
    var response = await HistoryApi().getFollowingHistory();
    if(response.statusCode>299)
      {
        Map<String, dynamic> data = jsonDecode(response.body);
        emit(NewsErrorState(error: data['detail'].toString()));
      }
    else{
      List<dynamic> data = jsonDecode(response.body);
      for(Map<String, dynamic> history in data)
        {
          followingHistories.add(GetHistory.fromJson(history));
        }
      print(followingHistories.length);
      emit(NewsLoadedState());
    }
  }

  Future<void> acceptError()async{
    emit(NewsLoadedState());
  }



}