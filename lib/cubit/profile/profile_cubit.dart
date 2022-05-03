import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';
import 'package:inst_mobile/cubit/profile/cubit.dart';
import 'package:inst_mobile/data/api/post.dart';
import 'package:inst_mobile/data/api/user.dart';
import 'package:inst_mobile/data/models/post.dart';
import 'package:inst_mobile/data/models/user.dart';
import 'package:inst_mobile/data/temp_data.dart';
import 'package:inst_mobile/resources/app_colors.dart';
import 'package:inst_mobile/resources/app_lists.dart';
import 'package:inst_mobile/resources/app_strings.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileEmptyState());

  List<ImageNetwork> images = [];
  List<GetPostFull> userPosts = [];
  GetFullMe? user;
  GetSmallUser? smallUser;
  bool followed = false;

  Future<void> loadData({required String userUuid}) async {
    emit(ProfileLoadingState());

    try {
      var response = await UserApi.getUserByUuid(userUuid);
      if (response.statusCode > 299) {
        emit(ProfileErrorState(error: AppStrings.errorLoadingProfile));
      } else {
        user = GetFullMe.fromJson(json.decode(utf8.decode(response.bodyBytes)));
        if (user!.followersCount < 1) {
          followed = false;
        } else {
          for (var f in user!.followers!) {
            if (f.uuid == TempData.me!.uuid) {
              followed = true;
              break;
            } else {
              followed = false;
            }
          }
        }

        var postsResponse = await PostApi().getUsersPost(userUuid);
        if (postsResponse.statusCode > 299) {
          emit(ProfileErrorState(error: AppStrings.errorLoadingProfile));
          //AppStrings.errorLoadingProfile
        } else {
          List<dynamic> data =
              json.decode(utf8.decode(postsResponse.bodyBytes));
          userPosts = List.generate(
              data.length, (index) => GetPostFull.fromJson(data[index]));
          emit(ProfileLoadedState());
        }
      }
    } catch (_) {
      emit(ProfileErrorState(error: AppStrings.errorLoadingProfile));
    }
  }

  Future<void> loadImages(List<GetPostFull> posts, BuildContext context) async {
    images.clear();
    for (var post in posts) {
      for (var file in post.files) {
        if (AppLists.imageFormats.contains(file.title.split('.').last)) {
          images.add(ImageNetwork(
            image: file.url,
            height: 136,
            width: 122,
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    backgroundColor: AppColors.darkGreen,
                        contentPadding: EdgeInsets.zero,
                        insetPadding: EdgeInsets.zero,
                        titlePadding: EdgeInsets.zero,
                        content: Container(
                          child: ImageNetwork(
                              width: MediaQuery.of(context).size.width*0.8,
                              height: MediaQuery.of(context).size.height*0.8,
                              onTap: (){
                                Navigator.of(context).pop();
                              },
                              image: file.url),
                        ),
                      ));
            },
          ));
        }
      }
    }
  }

  Future<void> acceptError() async {
    emit(ProfileLoadedState());
  }

  Future<void> pushForceLoaded() async {
    emit(ProfileLoadedState());
  }

  Future<void> clearData() async {
    emit(ProfileEmptyState());
  }

  Future<void> follow(String uuid) async {
    emit(ProfileLoadingState());
    try {
      var response = await UserApi.followUser(uuid);
      if (response.statusCode > 299) {
        emit(ProfileErrorState(
            error: json.decode(utf8.decode(response.bodyBytes))));
      } else {
        loadData(userUuid: uuid);
        emit(ProfileLoadedState());
      }
    } catch (_) {
      emit(ProfileErrorState(error: AppStrings.errorLoadingProfile));
    }
  }

  Future<void> unfollow(String uuid) async {
    emit(ProfileLoadingState());
    try {
      var response = await UserApi.unfollowUser(uuid);
      if (response.statusCode > 299) {
        emit(ProfileErrorState(
            error: json.decode(utf8.decode(response.bodyBytes))));
      } else {
        loadData(userUuid: uuid);
        emit(ProfileLoadedState());
      }
    } catch (_) {
      emit(ProfileErrorState(error: AppStrings.errorLoadingProfile));
    }
  }
}
