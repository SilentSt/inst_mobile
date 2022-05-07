import 'package:flutter/cupertino.dart';
import 'package:inst_mobile/ui/widget/video_post_player.dart';

import '../../data/models/post.dart';
import '../../resources/app_lists.dart';
import '../../resources/app_strings.dart';
import 'custom_error_widget.dart';
import 'image_post.dart';

class ContentSlider extends StatelessWidget {
  const ContentSlider({
    Key? key,
    required this.post,
  }) : super(key: key);

  final GetPostFull post;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const PageScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          post.files.length,
          (index) {
            var file = post.files[index];
            var fileType = file.title.split('.').last;
            if (AppLists.imageFormats.contains(fileType)) {
              return ImagePost(imageSrc: file.url);
            } else if (AppLists.videoFormats.contains(fileType)) {
              return VideoPostPlayer(videoSrc: file.url);
            } else {
              return CustomErrorWidget(
                  error: AppStrings.unknownFileType, action: () {});
            }
          },
        ),
      ),
    );
  }
}
