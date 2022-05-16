import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inst_mobile/cubit/news/cubit.dart';
import 'package:inst_mobile/ui/widget/post_widgets/post_header.dart';

import '../news_widgets/content_card.dart';

class PostCard extends StatelessWidget {
  const PostCard({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    var _cubit = context.read<NewsCubit>();
    var _post = _cubit.followingPosts[index];
    return Column(
      children: [
        PostHeader(post: _post,),
        const SizedBox(height: 15),
        ContentCard(post: _post),
        const SizedBox(height: 10),
      ],
    );
  }
}
