import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inst_mobile/cubit/news/cubit.dart';
import 'package:inst_mobile/resources/app_colors.dart';
import 'package:inst_mobile/resources/app_strings.dart';
import 'package:inst_mobile/ui/styles/app_text_styles.dart';
import 'package:inst_mobile/ui/widget/user_icon.dart';

import 'content_card.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({Key? key, required this.index})
      : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    var _cubit = context.read<NewsCubit>();
    var _post = _cubit.followingPosts[index];
    return SizedBox(
      width: MediaQuery.of(context).size.width*0.98,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        elevation: 0,
        color: AppColors.lightGreen,
        margin: const EdgeInsets.all(5),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(children: [
            Row(
              children: [
                UserIcon(path: _post.author.photo, size: 36),
                const SizedBox(
                  width: 5,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '@'+_post.author.nickname,
                      style: AppTextStyles.h1,
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 15),
            ContentCard(postIndex: index)
          ]),
        ),
      ),
    );
  }
}


