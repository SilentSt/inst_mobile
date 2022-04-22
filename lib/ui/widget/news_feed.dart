import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inst_mobile/cubit/news/cubit.dart';
import 'package:inst_mobile/ui/widget/news_card.dart';

class NewsFeed extends StatelessWidget {
  const NewsFeed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _cubit = context.read<NewsCubit>();
    return SingleChildScrollView(
      child: Column(
        children: List.generate(_cubit.followingPosts.length, (index) {
          var fileType = _cubit.followingPosts[index].filePath?.split('.').last;
          return NewsCard(index: index, fileType: fileType!);
        }),
      ),
    );
  }
}
