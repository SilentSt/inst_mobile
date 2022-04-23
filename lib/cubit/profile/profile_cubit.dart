import 'package:bloc/bloc.dart';
import 'package:image_network/image_network.dart';
import 'package:inst_mobile/cubit/profile/cubit.dart';
import 'package:inst_mobile/data/models/user.dart';
import 'package:inst_mobile/resources/app_lists.dart';

class ProfileCubit extends Cubit<ProfileState>{
  ProfileCubit() : super(ProfileLoadedState());

  List<ImageNetwork> images = [];

  Future<void> loadData()async{
    emit(ProfileLoadingState());
    //TODO: load data
    emit(ProfileLoadedState());
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