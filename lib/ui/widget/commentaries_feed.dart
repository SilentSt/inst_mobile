import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_network/image_network.dart';
import '../../cubit/post_details_cubit/cubit.dart';
import '../../data/models/post.dart';
import '../../resources/app_strings.dart';

class CommentariesFeed extends StatelessWidget {
  const CommentariesFeed({
    Key? key,
    required this.post,
    required PostDetailsCubit cubit,
  }) : _cubit = cubit, super(key: key);

  final GetPostFull post;
  final PostDetailsCubit _cubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostDetailsCubit, PostDetailsState>(
      builder: (context, state) {
        if(state is PostDetailsLoadingState)
          {
            return const Center(child: CircularProgressIndicator(),);
          }
          return SizedBox(
            height: 150,
            child: SingleChildScrollView(
              child: Column(
                children: List.generate(
                    post.commentsCount,
                        (index) => Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: ImageNetwork(
                                  height: 38,
                                  width: 38,
                                  image: _cubit
                                      .commentaries[index]
                                      .author
                                      .photo,
                                  borderRadius:
                                  BorderRadius.circular(90),
                                )),
                            Column(
                              children: [
                                Text(_cubit.commentaries[index]
                                    .author.nickname),
                                Text(_cubit
                                    .commentaries[index].title)
                              ],
                            )
                          ],
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Image.asset(
                                AppStrings.smallLikeOutlinedPath))
                      ],
                    )),
              ),
            ),
          );
      }
    );
  }
}