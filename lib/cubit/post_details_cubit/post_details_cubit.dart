import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:inst_mobile/cubit/post_details_cubit/cubit.dart';
import 'package:inst_mobile/data/api/commentary.dart';
import 'package:inst_mobile/data/api/post.dart';
import 'package:inst_mobile/data/models/commentary.dart';
import 'package:inst_mobile/data/models/post.dart';
import 'package:inst_mobile/resources/app_strings.dart';
import 'package:inst_mobile/ui/controllers/text_editing_controllers.dart';

class PostDetailsCubit extends Cubit<PostDetailsState> {
  PostDetailsCubit() : super(PostDetailsEmptyState());

  List<GetCommentary> commentaries = [];
  GetPostFull? post;

  Future<void> getCommentaries(String postUuid) async {
    emit(PostDetailsLoadingState());
    try {
      var response = await CommentaryApi().getPostsCommentary(postUuid);
      if (response.statusCode > 299) {
        emit(PostDetailsErrorState(error: AppStrings.errorLoadingCommentaries));
      } else {
        List<dynamic> data = json.decode(utf8.decode(response.bodyBytes));
        commentaries = List.generate(
            data.length, (index) => GetCommentary.fromJson(data[index]));
        emit(PostDetailsLoadedState());
      }
    } catch (_) {
      emit(PostDetailsErrorState(error: AppStrings.errorLoadingCommentaries));
    }
  }

  Future<void> getPostDetailed(String postUuid) async {
    emit(PostDetailsLoadingState());
    var response = await PostApi().getDetailedPost(postUuid);
    if(response.statusCode>299)
      {
        emit(PostDetailsErrorState(error: AppStrings.errorLoadingCommentaries));
      }
    else{
      Map<String, dynamic> data = json.decode(utf8.decode(response.bodyBytes));
      post = GetPostFull.fromJson(data);
      emit(PostDetailsLoadedState());
    }
  }

  Future<void> createCommentary(String postUuid) async {
    if (CommentaryControllers.commentaryTitle.text.isEmpty) {
      return;
    }
    emit(PostDetailsLoadingState());
    CommentaryApi()
        .createCommentary(
            PostCommentary(text: CommentaryControllers.commentaryTitle.text),
            postUuid)
        .then((value) => getCommentaries(postUuid)
            .then((value) => emit(PostDetailsLoadedState())));
    print(commentaries.length);
  }
}
