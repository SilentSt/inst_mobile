import 'dart:io';

import 'package:image_picker/image_picker.dart';

abstract class CreatePostState{}

class CreatePostNoContentState extends CreatePostState{}

class CreatePostWithContentState extends CreatePostState{
  final List<XFile> content;

  CreatePostWithContentState(this.content);
}

class CreatePostLoadingState extends CreatePostState{}