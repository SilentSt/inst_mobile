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

  Future<void> addCameraContent(List<XFile> content) async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      content.add(pickedFile);
    }
    emit(CreatePostWithContentState(content));
  }

  Future<void> addGalleryContent(List<XFile> content) async {
    List<XFile>? pickedFile = await ImagePicker().pickMultiImage(
      maxWidth: 1800,
      maxHeight: 1800,
    );
    for (var file in pickedFile) {
      content.add(file);
    }
    emit(CreatePostWithContentState(content));
  }

  Future<void> create(List<XFile> content) async {
    await PostApi().createPost(
      title: 'title',
      description: CreatePostControllers.descriptionController.text,
      files: content,
    );
  }
}
