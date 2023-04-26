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
    print(response.body);
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
    var response = await CommentaryApi().createCommentary(PostCommentary(text: CommentaryControllers.commentaryTitle.text), postUuid);
    CommentaryControllers.commentaryTitle.clear();
    if(response.statusCode>299)
      {
        emit(PostDetailsErrorState(error: AppStrings.unhandledException));
      }
    else{
      await getPostDetailed(postUuid);
      await getCommentaries(postUuid);
    }
    emit(PostDetailsLoadedState());
  }

  Future<void> likePost(String postUuid) async {
    emit(PostDetailsLoadingState());
    var response = await PostApi().likePost(postUuid);
    if(response.statusCode>299)
    {
      print(response.statusCode);
      print(response.body);
      emit(PostDetailsErrorState(error: AppStrings.errorDialogTitle));
    }
    else{
      await getPostDetailed(postUuid);
      emit(PostDetailsLoadedState());
    }
  }

  Future<void> removeLikePost(String postUuid) async {
    emit(PostDetailsLoadingState());
    var response = await PostApi().removeLikePost(postUuid);
    if(response.statusCode>299)
    {
      emit(PostDetailsErrorState(error: AppStrings.errorDialogTitle));
    }
    else{
      await getPostDetailed(postUuid);
      emit(PostDetailsLoadedState());
    }
  }

  Future<void> likeCommentary(String commentUuid, String postUuid) async {
    emit(PostDetailsLoadingState());
    var response = await CommentaryApi().likeComment(commentUuid);
    if(response.statusCode>299)
    {
      emit(PostDetailsErrorState(error: AppStrings.errorDialogTitle));
    }
    else{
      await getPostDetailed(postUuid);
      emit(PostDetailsLoadedState());
    }
  }

  Future<void> removeLikeCommentary(String commentUuid, String postUuid) async {
    emit(PostDetailsLoadingState());
    var response = await CommentaryApi().removeCommentLike(commentUuid);
    if(response.statusCode>299)
    {
      emit(PostDetailsErrorState(error: AppStrings.errorDialogTitle));
    }
    else{
      await getPostDetailed(postUuid);
      emit(PostDetailsLoadedState());
    }
  }

  Future<void> dropScene()async{
    emit(PostDetailsEmptyState());
  }
}
