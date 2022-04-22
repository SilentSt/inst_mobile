import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inst_mobile/cubit/navigation/cubit.dart';
import 'package:inst_mobile/cubit/news/cubit.dart';
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
                Row(
                  children: [
                    IconButton(
                      icon: Image.asset(AppStrings.commentaryPath,
                          color: AppColors.darkGreen),
                      onPressed: () {
                        context
                            .read<NavigationCubit>()
                            .pushToPostDetailsScene(post);
                      },
                    ),
                    //TODO: change to real commentary count from NewsCubit
                    Text(
                      post.commentsCount.toString(),
                      style: AppTextStyles.h2Green,
                    ),
                    IconButton(
                      icon: Image.asset(AppStrings.likePath,
                          color: AppColors.darkGreen),
                      onPressed: () {},
                    ),
                    //TODO: change to real likes count from NewsCubit
                    Text(
                      post.likesCount.toString(),
                      style: AppTextStyles.h2Green,
                    ),
                  ],
                ),
                IconButton(
                  icon: Image.asset(AppStrings.sendPath,
                      color: AppColors.darkGreen),
                  onPressed: () {},
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}