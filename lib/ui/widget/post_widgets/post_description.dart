import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_network/image_network.dart';
import 'package:inst_mobile/cubit/navigation/cubit.dart';
import 'package:inst_mobile/cubit/profile/cubit.dart';
import 'package:inst_mobile/ui/styles/app_text_styles.dart';
import '../../../cubit/post_details_cubit/post_details_cubit.dart';
import '../../../data/models/post.dart';

class PostDescription extends StatelessWidget {
  const PostDescription({
    Key? key,
    required this.post,
    required PostDetailsCubit cubit,
  }) : _cubit = cubit, super(key: key);

  final GetPostFull post;
  final PostDetailsCubit _cubit;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 5, left: 2),
          child: ImageNetwork(
            height: 38,
            width: 38,
            image: post.author.photo,
            onTap: (){
              context.read<ProfileCubit>().dropState();
              context.read<NavigationCubit>().pushToProfileScene(post.author);
            },
            borderRadius:
            BorderRadius.circular(90),
          ),
        ),
        const SizedBox(width: 10,),
        Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('@'+post.author.nickname, style: AppTextStyles.h3.black().bold900(), textAlign: TextAlign.left,),
            Text(post.description, style: AppTextStyles.h4.black(),)
          ],
        )
      ],
    );
  }
}