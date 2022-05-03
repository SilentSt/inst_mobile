import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:inst_mobile/cubit/global_search/cubit.dart';
import 'package:inst_mobile/data/api/global_search.dart';
import 'package:inst_mobile/data/api/post.dart';
import 'package:inst_mobile/data/models/user.dart';

class GlobalSearchCubit extends Cubit<GlobalSearchState>{
  GlobalSearchCubit() : super(GlobalSearchLoadedState(users: []));

  Future<void> find(String searchStr)async{
    emit(GlobalSearchLoadingState());
    var response = await GlobalSearchApi.find(searchStr);
    if(response.statusCode>299)
    {
      emit(GlobalSearchErrorState(error: 'Ошибка при попытке поиска пользователей'));
    }
    else{
      List<dynamic> data = json.decode(utf8.decode(response.bodyBytes));
      var users = List.generate(data.length, (index) => GetSmallUser.fromJson(data[index]));
      var pResponse = await PostApi().getPosts();
      if(pResponse.statusCode>299)
      {
        emit(GlobalSearchErrorState(error: 'Ошибка при попытке поиска постов'));
      }
      else{
        // List<dynamic> pData = json.decode(utf8.decode(response.bodyBytes));
        // print(pData);
        // var tempPosts = List.generate(pData.length, (index) => GetPostFull.fromJson(pData[index]));
        // List<GetPostFull> posts = [];
        // for(var tp in tempPosts)
        // {
        //   if(tp.title!=null&&tp.title!.contains(searchStr))
        //   {
        //     posts.add(tp);
        //   }
        // }
        emit(GlobalSearchLoadedState(users: users));
      }
    }
    //try{
    //
    //}
    //catch(_)
    //{
    //  emit(GlobalSearchErrorState(error: 'Ошибка поиска'));
    //}

  }

  Future<void> acceptError()async{
    emit(GlobalSearchLoadedState(users: []));
  }
}