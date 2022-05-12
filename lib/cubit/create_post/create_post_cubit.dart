import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inst_mobile/cubit/create_post/create_post_state.dart';
import 'package:inst_mobile/data/api/post.dart';
import 'package:inst_mobile/ui/controllers/text_editing_controllers.dart';

class CreatePostCubit extends Cubit<CreatePostState> {
  CreatePostCubit() : super(CreatePostNoContentState());

  Future<void> dropState() async {
    emit(CreatePostNoContentState());
  }

  Future<void> addCameraContent(List<File> content) async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);
      content.add(imageFile);
    }
    emit(CreatePostWithContentState(content));
  }

  Future<void> addGalleryContent(List<File> content) async {
    List<XFile>? pickedFile = await ImagePicker().pickMultiImage(
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      for(var file in pickedFile){
        content.add(File(file.path));
      }
    }
    emit(CreatePostWithContentState(content));
  }

  Future<void> create(List<File> content) async {
    List<String> files = [];
    content.forEach(
      (element) {
        files.add(element.path);
      },
    );
    await PostApi().createPost(
      title: 'title',
      description: CreatePostControllers.descriptionController.text,
      files: files,
    );
  }
}
