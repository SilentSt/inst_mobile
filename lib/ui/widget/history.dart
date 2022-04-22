import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inst_mobile/cubit/news/cubit.dart';
import 'package:inst_mobile/resources/app_strings.dart';
import 'package:inst_mobile/ui/widget/user_icon.dart';
import 'package:inst_mobile/ui/widget/video_history_player.dart';

import '../../resources/app_lists.dart';
import 'custom_error_widget.dart';
import 'image_history.dart';

class History extends StatelessWidget {
  const History({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    var _cubit = context.read<NewsCubit>();
    return SizedBox(
      height: 60,
      width: 60,
      child: IconButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  var fileType =
                      _cubit.followingHistories[index].filePath.split('.').last;
                  if (AppLists.videoFormats.contains(fileType)) {
                    return VideoHistoryPlayer(
                        videoSrc: _cubit.followingHistories[index].filePath);
                  } else if (AppLists.imageFormats.contains(fileType)) {
                    return ImageHistory(
                        imageSrc: _cubit.followingHistories[index].filePath);
                  } else {
                    return CustomErrorWidget(
                      error: AppStrings.unknownFileType,
                      action: () {},
                    );
                  }
                });
          },
          icon: const UserIcon(size: 60, path: '',)),
    );
  }
}
