import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inst_mobile/cubit/news/cubit.dart';
import 'package:inst_mobile/resources/app_lists.dart';
import 'package:inst_mobile/ui/widget/custom_error_widget.dart';
import 'package:inst_mobile/ui/widget/image_post.dart';
import 'package:inst_mobile/ui/widget/video_post_player.dart';

import '../../resources/app_colors.dart';
import '../../resources/app_strings.dart';
import '../styles/app_text_styles.dart';

class ContentCard extends StatelessWidget {
  const ContentCard({
    Key? key,
    required this.postIndex,
  }) : super(key: key);
  final int postIndex;

  @override
  Widget build(BuildContext context) {
    var _cubit = context.read<NewsCubit>();
    return ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Column(
          children: [
            SingleChildScrollView(
              physics: const PageScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                    _cubit.followingPosts[postIndex].files.length, (index) {
                  var file = _cubit.followingPosts[postIndex].files[index];
                  var fileType = file.url.split('.').last;
                  if (AppLists.imageFormats.contains(fileType)) {
                    return ImagePost(imageSrc: file.url);
                  } else if (AppLists.videoFormats.contains(fileType)) {
                    return VideoPostPlayer(videoSrc: file.url);
                  }
                  else{
                    return CustomErrorWidget(error: AppStrings.unknownFileType, action: (){});
                  }
                }),
              ),
            ),
            Image.asset(AppStrings.postPhotoPath),
            Container(
              height: 50,
              color: AppColors.darkGrey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: Image.asset(AppStrings.commentaryPath),
                          onPressed: () {},
                        ),
                        //TODO: change to real commentary count from NewsCubit
                        Text(
                          '10',
                          style: AppTextStyles.h2White,
                        ),
                        IconButton(
                          icon: Image.asset(AppStrings.likePath),
                          onPressed: () {},
                        ),
                        //TODO: change to real likes count from NewsCubit
                        Text(
                          '122',
                          style: AppTextStyles.h2White,
                        ),
                      ],
                    ),
                    IconButton(
                      icon: Image.asset(AppStrings.sendPath),
                      onPressed: () {},
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
