import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inst_mobile/cubit/news/cubit.dart';
import 'package:inst_mobile/resources/app_lists.dart';
import 'package:inst_mobile/ui/widget/image_history.dart';
import 'package:inst_mobile/ui/widget/image_post.dart';
import 'package:inst_mobile/ui/widget/video_history_player.dart';
import 'package:inst_mobile/ui/widget/video_post_player.dart';
import 'package:inst_mobile/ui/widget/widget.dart' as custom_widget;

import 'package:inst_mobile/resources/app_strings.dart';

class NewsScene extends StatelessWidget {
  const NewsScene({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) {
        var _cubit = context.read<NewsCubit>();
        var screenSize = MediaQuery.of(context).size;
        if (state is NewsLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is NewsLoadedState) {
          return Scaffold(
            appBar: AppBar(),
            body: SafeArea(
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                    width: screenSize.width - 50,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          IconButton(onPressed: () {}, icon: Icon(Icons.add)),
                          Row(
                            children: List.generate(
                                _cubit.followingHistories.length,
                                (index) => IconButton(
                                    onPressed: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            var fileType = _cubit
                                                .followingHistories[index]
                                                .filePath
                                                .split('.')
                                                .last;
                                            if (AppLists.videoFormats
                                                .contains(fileType)) {
                                              return VideoHistoryPlayer(
                                                  videoSrc: _cubit
                                                      .followingHistories[index]
                                                      .filePath);
                                            } else if (AppLists.imageFormats
                                                .contains(fileType)) {
                                              return ImageHistory(
                                                  imageSrc: _cubit
                                                      .followingHistories[index]
                                                      .filePath);
                                            } else {
                                              return const ErrorWidget(
                                                  error:
                                                      "Неизвестный формат файла");
                                            }
                                          });
                                    },
                                    icon: Icon(Icons.history))),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children:
                          List.generate(_cubit.followingPosts.length, (index) {
                        var fileType = _cubit.followingPosts[index].filePath
                            ?.split('.')
                            .last;
                        return Card(
                          child: Column(children: [
                            Text(_cubit.followingPosts[index].datetime
                                .toString()),
                            Text(_cubit.followingPosts[index].title),
                            Text(_cubit.followingPosts[index].description!),
                            if (AppLists.videoFormats.contains(fileType))
                              VideoPostPlayer(
                                  videoSrc:
                                      _cubit.followingPosts[index].filePath!),
                            if (AppLists.imageFormats.contains(fileType))
                              ImagePost(
                                  imageSrc:
                                      _cubit.followingPosts[index].filePath!),
                            Row(
                              children: [
                                Text(
                                    'Likes: ${_cubit.followingPosts[index].likes.toString()}'),
                                IconButton(onPressed: (){}, icon: const Icon(Icons.check))
                              ],
                            ),
                            IconButton(onPressed: (){}, icon: const Icon(Icons.keyboard))
                          ]),
                        );
                      }),
                    ),
                  )
                ],
              ),
            ),
            bottomNavigationBar: const custom_widget.AppBottomBar(),
          );
        }
        if (state is NewsEmptyState) {
          return const SizedBox.shrink();
        }
        if (state is NewsErrorState) {
          return ErrorWidget(
            error: state.error,
          );
        }
        context.read<NewsCubit>().loadData();
        return const SizedBox.shrink();
      },
    );
  }
}

class ErrorWidget extends StatelessWidget {
  const ErrorWidget({Key? key, required this.error}) : super(key: key);

  final String error;

  @override
  Widget build(BuildContext context) {
    var _cubit = context.read<NewsCubit>();
    return AlertDialog(
      title: const Text(AppStrings.errorDialogTitle),
      content: Text(error),
      actions: [
        TextButton(onPressed: () => _cubit.acceptError(), child: Text('Ок'))
      ],
    );
  }
}
