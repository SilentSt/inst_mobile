import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inst_mobile/cubit/navigation/cubit.dart';
import 'package:inst_mobile/cubit/news/cubit.dart';
import 'package:inst_mobile/ui/widget/video_post_player.dart';

import '../../resources/app_colors.dart';
import '../../resources/app_lists.dart';
import '../../resources/app_strings.dart';
import '../styles/app_text_styles.dart';
import 'custom_error_widget.dart';
import 'image_post.dart';

class ContentCard extends StatelessWidget {
  const ContentCard({
    Key? key,
    required this.postIndex,
  }) : super(key: key);
  final int postIndex;

  @override
  Widget build(BuildContext context) {
    var _cubit = context.read<NewsCubit>();
    var _post = _cubit.followingPosts[postIndex];
    return Column(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
          child: SingleChildScrollView(
            physics: const PageScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                  _cubit.followingPosts[postIndex].files.length, (index) {
                var file = _cubit.followingPosts[postIndex].files[index];
                var fileType = file.title.split('.').last;
                if (AppLists.imageFormats.contains(fileType)) {
                  return ImagePost(imageSrc: file.url);
                } else if (AppLists.videoFormats.contains(fileType)) {
                  return VideoPostPlayer(videoSrc: file.url);
                } else {
                  return CustomErrorWidget(
                      error: AppStrings.unknownFileType, action: () {});
                }
              }),
            ),
          ),
        ),
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
                        context.read<NavigationCubit>().pushToPostDetailsScene(_post);
                      },
                    ),
                    //TODO: change to real commentary count from NewsCubit
                    Text(
                      _post.commentsCount.toString(),
                      style: AppTextStyles.h2Green,
                    ),
                    IconButton(
                      icon: Image.asset(AppStrings.likePath,
                          color: AppColors.darkGreen),
                      onPressed: () {},
                    ),
                    //TODO: change to real likes count from NewsCubit
                    Text(
                      _post.likesCount.toString(),
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
