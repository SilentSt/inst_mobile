import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:inst_mobile/data/api/history.dart';
import 'package:inst_mobile/data/api/post.dart';
import 'package:inst_mobile/data/models/history.dart';
import 'package:inst_mobile/data/models/post.dart';

import 'news_state.dart';

class NewsCubit extends Cubit<NewsState>{
  NewsCubit() : super(NewsInitialState());
  List<GetHistory> followingHistories = [];
  List<GetPostFull> followingPosts = [];

  Future<void> loadData()async{
    emit(NewsLoadingState());
    var historiesResponse = await HistoryApi().getFollowingHistory();
    if(historiesResponse.statusCode>299)
      {
        Map<String, dynamic> data = jsonDecode(historiesResponse.body);
        emit(NewsErrorState(error: data['detail'].toString()));
      }
    else{
      List<dynamic> data = jsonDecode(historiesResponse.body);
      for(Map<String, dynamic> history in data)
        {
          followingHistories.add(GetHistory.fromJson(history));
        }
    }
    var followingPostsResponse = await PostApi().getPosts();
    if(followingPostsResponse.statusCode>299)
    {
      Map<String, dynamic> data = jsonDecode(followingPostsResponse.body);
      emit(NewsErrorState(error: data['detail'].toString()));
    }
    else{
      List<dynamic> data = jsonDecode(followingPostsResponse.body);
      for(Map<String, dynamic> history in data)
      {
        followingPosts.add(GetPostFull.fromJson(history));
      }
      emit(NewsLoadedState());
    }
  }

  Future<void> acceptError()async{
    emit(NewsLoadedState());
  }


}