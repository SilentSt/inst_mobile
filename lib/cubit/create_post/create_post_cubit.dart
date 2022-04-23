import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inst_mobile/cubit/create_post/create_post_state.dart';

class CreatePostCubit extends Cubit<CreatePostState> {
  CreatePostCubit() : super(CreatePostLoadedState());

  String fileName = "";
  List<XFile>? files = null;

  Future<void> pickImage() async {
    var picker = ImagePicker();
    files = await picker.pickMultiImage(
        maxHeight: 1800,
        maxWidth: 1800
    );
    if (files != null) {
      files!.forEach((element) {
        fileName += element.name+"\n";
      });

    }
  }

}