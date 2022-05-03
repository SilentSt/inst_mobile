import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inst_mobile/cubit/create_post/create_post_state.dart';
import 'package:inst_mobile/ui/controllers/text_editing_controllers.dart';

import '../../data/api/post.dart';

class CreatePostCubit extends Cubit<CreatePostState> {
  CreatePostCubit() : super(CreatePostLoadedState());

  String fileName = "";
  List<XFile>? files = [];

  Future<void> pick(Picker type, PickStorage storage) async {
    XFile? file;
    var picker = ImagePicker();
    ImageSource sour;
    switch (storage) {
      case PickStorage.gallery:
        sour = ImageSource.gallery;
        break;
      case PickStorage.camera:
        sour = ImageSource.camera;
        break;
    }
    switch (type) {
      case Picker.image:
        file =
        await picker.pickImage(source: sour, maxHeight: 2500, maxWidth: 1440);
        break;
      case Picker.video:
        file =
        await picker.pickVideo(source: sour, maxDuration: Duration(minutes: 5));
        break;
    }
    if (file != null) files!.add(file);
    if (files != null && files!.isNotEmpty) {
      fileName = "";
      files!.forEach((element) {
        fileName += element.name + "\n";
      });
      emit(CreatePostLoadingState());
      emit(CreatePostLoadedState());
    }
  }

  Future<void> createPost() async {
    List<String> filePath = List.generate(files!.length, (index) => files![index].path);
    var response = await PostApi().createPost(title: CreatePostControllers.titleController.text,
        description: CreatePostControllers.descriptionController.text,
        files: filePath);
    if(response.statusCode>299)
      {
        emit(CreatePostLoadedState());
      }
    else{
      emit(CreatedPostSuccessState());
    }
  }
}

enum Picker {
  image,
  video,
}

enum PickStorage { gallery, camera }
