import 'dart:io';

abstract class CreatePostState{}

class CreatePostNoContentState extends CreatePostState{}

class CreatePostWithContentState extends CreatePostState{
  final List<File> content;

  CreatePostWithContentState(this.content);
}

class CreatePostLoadingState extends CreatePostState{}