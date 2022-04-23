import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:image_network/image_network.dart';
import 'package:inst_mobile/cubit/profile/cubit.dart';
import 'package:inst_mobile/data/api/user.dart';
import 'package:inst_mobile/data/models/user.dart';
import 'package:inst_mobile/data/temp_data.dart';
import 'package:inst_mobile/resources/app_lists.dart';
import 'package:inst_mobile/resources/app_strings.dart';

class ProfileCubit extends Cubit<ProfileState>{
  ProfileCubit() : super(ProfileLoadedState());

  List<ImageNetwork> images = [];
  GetFullUser? user;
  GetSmallUser? smallUser;

  Future<void> loadData({required userUuid})async{
    emit(ProfileLoadingState());

    try{
      var response =  await UserApi.getUserByUuid(userUuid);
      if(response.statusCode>299)
        {
          emit(ProfileErrorState(error: AppStrings.errorLoadingProfile));
        }
      else{
        user = json.decode(utf8.decode(response.bodyBytes));
        emit(ProfileLoadedState());
      }
    }
    catch(_)
    {
      emit(ProfileErrorState(error: AppStrings.errorLoadingProfile));
    }

  }

  Future<void> loadImages(GetFullUser user)async{
    images.clear();
    for(var post in user.posts)
      {
        for(var file in post.files)
          {
            if(AppLists.imageFormats.contains(file.title.split('.').last))
              {
                images.add(ImageNetwork(image: file.url, height: 136, width: 122));
              }
          }
      }
  }

  Future<void> acceptError()async{
    emit(ProfileLoadedState());
  }
}