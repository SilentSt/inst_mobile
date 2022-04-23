import 'package:flutter/material.dart';
import '../../data/models/post.dart';
import '../../resources/app_strings.dart';
import '../styles/app_text_styles.dart';

class PostDetailsActionBar extends StatelessWidget {
  const PostDetailsActionBar({
    Key? key,
    required this.post,
  }) : super(key: key);

  final GetPostFull post;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Row(
            children: [
              IconButton(onPressed: (){}, icon: Image.asset(AppStrings.largeLikeOutlinedPath)),
              Text(post.likesCount.toString(), style: AppTextStyles.h3.green(),)
            ],
          ),
          IconButton(onPressed: (){}, icon: Image.asset(AppStrings.sendOutlinedPath))
        ],
      ),
    );
  }
}