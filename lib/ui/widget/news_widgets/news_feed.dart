import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inst_mobile/cubit/news/cubit.dart';
import 'package:inst_mobile/ui/widget/post_widgets/post_card.dart';

class NewsFeed extends StatelessWidget {
  const NewsFeed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _cubit = context.read<NewsCubit>();
    return SizedBox(
      height: MediaQuery.of(context).size.height-100,
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Column(
          children: List.generate(
            _cubit.followingPosts.length,
            (index) {
              return PostCard(index: index);
            },
          ),
        ),
      ),
    );
  }
}
