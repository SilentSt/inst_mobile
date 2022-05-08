import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:inst_mobile/cubit/navigation/cubit.dart';
import 'package:inst_mobile/cubit/post_details_cubit/cubit.dart';
import 'package:inst_mobile/data/models/post.dart';
import 'package:inst_mobile/resources/app_colors.dart';
import 'package:inst_mobile/resources/app_strings.dart';
import 'package:inst_mobile/ui/styles/app_text_styles.dart';
import 'package:inst_mobile/ui/widget/app_error.dart';
import '../widget/post_widgets/commentaries_feed.dart';
import '../widget/post_widgets/commentary_input_card.dart';
import '../widget/post_widgets/post_description.dart';
import '../widget/post_widgets/post_details_action_bar.dart';
import '../widget/post_widgets/post_details_app_bar.dart';
import '../widget/post_widgets/post_details_content.dart';

class CommentariesScene extends StatelessWidget {
  const CommentariesScene({Key? key, required this.post}) : super(key: key);

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
            appBar: AppBar(
              backgroundColor: AppColors.snow,
              shadowColor: Colors.transparent,
              leading: IconButton(
                onPressed: () {
                  context.read<NavigationCubit>().pushToNewsScene();
                },
                icon: SvgPicture.asset(
                  AppStrings.arrowBackPath,
                  color: Colors.black,
                ),
              ),
              title: Text(
                AppStrings.postDetailsTitle,
                style: AppTextStyles.h2.bold700().black(),
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.menu,
                    color: Colors.black,
                  ),
                )
              ],
            ),
            backgroundColor: AppColors.snow,
            body: SafeArea(
              child: SingleChildScrollView(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height -
                      MediaQuery.of(context).padding.vertical,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CommentariesFeed(
                        post: post,
                      ),
                      CommentaryInputCard(
                        postUuid: post.uuid,
                      )
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
          return AppError(
              error: state.error,
              action: () {
                context.read<NavigationCubit>().pushToNewsScene();
              });
        }
        return const SizedBox.shrink();
      },
    );
  }
}
