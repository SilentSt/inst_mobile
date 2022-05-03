import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:inst_mobile/cubit/post_details_cubit/cubit.dart';
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
              IconButton(
                  onPressed: () {
                    //TODO: need fix
                    // post.isLiked!
                    //     ? context
                    //         .read<PostDetailsCubit>()
                    //         .removeLikePost(post.uuid)
                    //     : context.read<PostDetailsCubit>().likePost(post.uuid);
                  },
                  icon: SvgPicture.asset(post.isLiked!
                      ? AppStrings.largeLikeOutlinedPath
                      : AppStrings.likePath)),
              Text(
                post.likesCount.toString(),
                style: AppTextStyles.h3.green(),
              )
            ],
          ),
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(AppStrings.sendOutlinedPath))
        ],
      ),
    );
  }
}
