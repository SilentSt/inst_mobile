import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inst_mobile/cubit/create_post/create_post_state.dart';

class CreatePostCubit extends Cubit<CreatePostState>{
  CreatePostCubit() : super(CreatePostLoadedState());

}