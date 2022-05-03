import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:inst_mobile/cubit/navigation/cubit.dart';
import 'package:inst_mobile/cubit/news/cubit.dart';
import 'package:inst_mobile/cubit/post_details_cubit/cubit.dart';
import 'package:inst_mobile/data/models/post.dart';
import '../../resources/app_colors.dart';
import '../../resources/app_strings.dart';
import '../styles/app_text_styles.dart';
import 'content_slider.dart';

class ContentCard extends StatelessWidget {
  const ContentCard({
    Key? key,
    required this.post,
  }) : super(key: key);
  final GetPostFull post;

  @override
  Widget build(BuildContext context) {
    var _cubit = context.read<NewsCubit>();
    return Column(
      children: [
        ContentSlider(post: post),
        Container(
          height: 50,
          color: AppColors.snow,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                BlocBuilder<NewsCubit, NewsState>(
                  builder: (context, state) {
                    if(state is NewsLikesLoadingState)
                      {
                        return const CircularProgressIndicator();
                      }
                    return Row(
                      children: [
                        IconButton(
                          icon: SvgPicture.asset(AppStrings.commentaryPath,
                              color: AppColors.darkGreen),
                          onPressed: () {
                            context.read<PostDetailsCubit>().dropScene();
                            context
                                .read<NavigationCubit>()
                                .pushToPostDetailsScene(post);
                          },
                        ),
                        Text(
                          post.commentsCount.toString(),
                          style: AppTextStyles.h2Green,
                        ),
                        IconButton(
                          icon: SvgPicture.asset(post.isLiked!?AppStrings.likeFilledPath:AppStrings.likePath,
                              color: AppColors.darkGreen),
                          onPressed: () {
                            post.isLiked!?_cubit.removeLikePost(post.uuid):_cubit.likePost(post.uuid);
                          },
                        ),
                        Text(
                          post.likesCount.toString(),
                          style: AppTextStyles.h2Green,
                        ),
                      ],
                    );
                  }
                ),
                IconButton(
                  icon: SvgPicture.asset(AppStrings.sendPath,
                      color: AppColors.darkGreen),
                  onPressed: () {

                  },
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}