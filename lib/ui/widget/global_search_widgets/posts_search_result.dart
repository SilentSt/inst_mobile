import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_network/image_network.dart';

import '../../../cubit/navigation/navigation_cubit.dart';
import '../../../cubit/profile/profile_cubit.dart';
import '../../../data/models/post.dart';

class PostsSearchResult extends StatelessWidget {
  const PostsSearchResult({
    Key? key,
    required this.posts,
  }) : super(key: key);

  final List<GetPostFull> posts;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(
        posts.length,
        (index) => Card(
          elevation: 0,
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(90),
                child: ImageNetwork(
                    height: 90,
                    width: 90,
                    onTap: () {
                      context.read<ProfileCubit>().dropState();
                      context
                          .read<NavigationCubit>()
                          .pushToProfileScene(posts[index].author);
                    },
                    image: posts[index].files.first.url),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
