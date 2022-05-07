import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:inst_mobile/cubit/news/cubit.dart';
import 'package:inst_mobile/resources/app_colors.dart';
import 'package:inst_mobile/resources/app_strings.dart';
import 'package:inst_mobile/ui/styles/app_text_styles.dart';
import 'package:inst_mobile/ui/widget/post_widgets/user_icon.dart';

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
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const SizedBox(width: 16,),
                UserIcon(user: _post.author, size: 36),
                const SizedBox(
                  width: 5,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '@' + _post.author.nickname,
                      style: AppTextStyles.h1,
                    ),
                  ],
                )
              ],
            ),
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                AppStrings.menuPath,
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        ContentCard(post: _post),
        const SizedBox(height: 10),
      ],
    );
  }
}
