import 'package:flutter/cupertino.dart';
import '../../../data/models/post.dart';
import 'content_slider.dart';

class PostDetailsContent extends StatelessWidget {
  const PostDetailsContent({
    Key? key,
    required this.post,
  }) : super(key: key);

  final GetPostFull post;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.9,
            child: ContentSlider(post: post)));
  }
}