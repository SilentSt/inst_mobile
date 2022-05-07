import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:inst_mobile/data/models/post.dart';
import 'package:inst_mobile/resources/app_strings.dart';
import 'package:inst_mobile/ui/styles/app_text_styles.dart';
import 'package:inst_mobile/ui/widget/post_widgets/user_icon.dart';

class PostHeader extends StatelessWidget {
  const PostHeader({
    Key? key,
    required GetPostFull post,
  }) : _post = post, super(key: key);

  final GetPostFull _post;

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}