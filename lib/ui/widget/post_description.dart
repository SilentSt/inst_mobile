import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';
import '../../cubit/post_details_cubit/post_details_cubit.dart';
import '../../data/models/post.dart';

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
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            IconButton(
                onPressed: () {},
                icon: ImageNetwork(
                  height: 38,
                  width: 38,
                  image: post.author.photo,
                  borderRadius:
                  BorderRadius.circular(90),
                )),
            Column(
              children: [
                Text(post.author.nickname),
                Text(post.description)
              ],
            )
          ],
        )
      ],
    );
  }
}