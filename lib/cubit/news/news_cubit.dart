import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:inst_mobile/data/api/history.dart';
import 'package:inst_mobile/data/api/post.dart';
import 'package:inst_mobile/data/models/history.dart';
import 'package:inst_mobile/data/models/post.dart';
import 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitialState());
  List<GetHistory> followingHistories = [];
  List<GetPostFull> followingPosts = [];

  Future<void> loadData() async {
    emit(NewsLoadingState());
    // var historiesResponse = await HistoryApi().getFollowingHistory();
    // if(historiesResponse.statusCode>299)
    //   {
    //     Map<String, dynamic> data = jsonDecode(historiesResponse.body);
    //     emit(NewsErrorState(error: data['detail'].toString()));
    //   }
    // else{
    //   List<dynamic> data = jsonDecode(historiesResponse.body);
    //   for(Map<String, dynamic> history in data)
    //     {
    //       followingHistories.add(GetHistory.fromJson(history));
    //     }
    // }
    var followingPostsResponse = await PostApi().getPosts();
    if (followingPostsResponse.statusCode > 299) {
      Map<String, dynamic> data = json.decode(followingPostsResponse.body);
      emit(NewsErrorState(error: data['detail'].toString()));
    } else {
      List<dynamic> data =
          json.decode(utf8.decode(followingPostsResponse.bodyBytes));
      followingPosts = List.generate(data.length, (index) => GetPostFull.fromJson(data[index]));
      emit(NewsLoadedState());
    }
  }

  Future<void> acceptError() async {
    emit(NewsLoadedState());
  }

  Future<void> likePost(String postUuid) async {
    emit(NewsLoadingState());
    var response = await PostApi().likePost(postUuid);
    if(response.statusCode>299)
      {
        emit(NewsErrorState(error: json.decode(utf8.decode(response.bodyBytes))['detail']));
      }
    else{
      await loadPost(postUuid);
      emit(NewsLoadedState());
    }
  }

  Future<void> removeLikePost(String postUuid) async {
    emit(NewsLoadingState());
    var response = await PostApi().removeLikePost(postUuid);
    if(response.statusCode>299)
    {
      emit(NewsErrorState(error: json.decode(utf8.decode(response.bodyBytes))['detail']));
    }
    else{
      await loadPost(postUuid);
      emit(NewsLoadedState());
    }
  }

  Future<void> loadPost(String uuid) async{
    emit(NewsLoadingState());
    var response = await PostApi().getDetailedPost(uuid);
    if(response.statusCode>299)
      {
        print(response.statusCode);
        print(response.body);
        emit(NewsErrorState(error: json.decode(utf8.decode(response.bodyBytes))));
      }
    else{
      Map<String, dynamic> data = json.decode(utf8.decode(response.bodyBytes));
      var post = GetPostFull.fromJson(data);
      var index = followingPosts.indexOf(followingPosts.firstWhere((element) => element.uuid==post.uuid));
      if(index!=-1)
      {
        followingPosts[index]=post;
      }
    }
    emit(NewsLoadedState());
  }

  void dropState() => emit(NewsInitialState());
}
