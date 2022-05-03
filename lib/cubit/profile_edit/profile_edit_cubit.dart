import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inst_mobile/cubit/profile_edit/cubit.dart';
import 'package:inst_mobile/data/api/user.dart';
import 'package:inst_mobile/data/temp_data.dart';
import 'package:inst_mobile/ui/controllers/text_editing_controllers.dart';

class ProfileEditCubit extends Cubit<ProfileEditState> {
  ProfileEditCubit() : super(ProfileEditLoadedState());

  XFile? file;
  bool changed = false;

  Future<void> replaceAvatar(bool gallery) async {
    file = await ImagePicker().pickImage(
        source: (gallery ? ImageSource.gallery : ImageSource.camera));
    if (file != null) {
      changed = true;
    }
    emit(ProfileEditAvatarChangedState());
  }

  Future<void> applyChanges() async {
    emit(ProfileEditLoadingState());
    try {
      var response = await UserApi.updateMe(filePath: file!.path,
          email: ProfileEditControllers.emailController.text,
          password: ProfileEditControllers.passwordController.text,
          bio: ProfileEditControllers.descriptionController.text);
      print(response.statusCode);
      print(response.body);
      if(response.statusCode>299)
        {
          emit(ProfileEditLoadedState());
        }
      else{
        emit(ProfileEditSuccessState());
      }
    }
    catch (_) {
      emit(ProfileEditLoadedState());
    }
  }

  Future<void> applyAvatar()async{
    emit(ProfileEditLoadedState());
  }

}