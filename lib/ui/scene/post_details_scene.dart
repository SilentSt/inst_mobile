import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_network/image_network.dart';
import 'package:inst_mobile/cubit/navigation/cubit.dart';
import 'package:inst_mobile/cubit/post_details_cubit/cubit.dart';
import 'package:inst_mobile/data/models/post.dart';
import 'package:inst_mobile/data/temp_data.dart';
import 'package:inst_mobile/resources/app_colors.dart';
import 'package:inst_mobile/resources/app_strings.dart';
import 'package:inst_mobile/ui/styles/app_text_styles.dart';
import 'package:inst_mobile/ui/widget/custom_error_widget.dart';
import '../widget/commentaries_feed.dart';
import '../widget/commentary_input_card.dart';
import '../widget/post_description.dart';
import '../widget/post_details_action_bar.dart';
import '../widget/post_details_app_bar.dart';
import '../widget/post_details_content.dart';

class PostDetailsScene extends StatelessWidget {
  const PostDetailsScene({Key? key, required this.post}) : super(key: key);

  final GetPostFull post;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostDetailsCubit, PostDetailsState>(
        builder: (context, state) {
      var _cubit = context.read<PostDetailsCubit>();
      if (state is PostDetailsLoadingState) {
        return const Center(child: CircularProgressIndicator());
      }
      if (state is PostDetailsLoadedState) {
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: SizedBox(
                height: MediaQuery.of(context).size.height -
                    MediaQuery.of(context).padding.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const PostDetailsAppBar(),
                    const SizedBox(
                      height: 20,
                    ),
                    PostDetailsContent(post: post),
                    PostDetailsActionBar(post: post),
                    const SizedBox(
                      height: 20,
                    ),
                    PostDescription(post: post, cubit: _cubit),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                        width: 340, height: 2, color: AppColors.lightGrey),
                    const SizedBox(
                      height: 10,
                    ),
                    CommentariesFeed(post: post, cubit: _cubit),
                    CommentaryInputCard(postUuid: post.uuid,)
                  ],
                ),
              ),
            ),
          ),
        );
      }
      if (state is PostDetailsEmptyState) {
        _cubit.getCommentaries(post.uuid);
      }
      if (state is PostDetailsErrorState) {
        return CustomErrorWidget(
            error: state.error,
            action: () {
              context.read<NavigationCubit>().pushToNewsScene();
            });
      }
      return const SizedBox.shrink();
    });
  }
}
