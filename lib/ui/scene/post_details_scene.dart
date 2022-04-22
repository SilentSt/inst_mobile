import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inst_mobile/cubit/post_details_cubit/cubit.dart';
import 'package:inst_mobile/data/models/post.dart';
import 'package:inst_mobile/ui/widget/custom_error_widget.dart';

import '../widget/content_slider.dart';
import '../widget/post_details_app_bar.dart';

class PostDetailsScene extends StatelessWidget {
  const PostDetailsScene({Key? key, required this.post}) : super(key: key);

  final GetPostFull post;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostDetailsCubit, PostDetailsState>(
        builder: (context, state) {
      if (state is PostDetailsLoadingState) {
        return const Center(child: CircularProgressIndicator());
      }
      if (state is PostDetailsLoadedState) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                const PostDetailsAppBar(),
                const SizedBox(
                  height: 20,
                ),
                ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: ContentSlider(post: post))),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [

                  ],
                )
              ],
            ),
          ),
        );
      }
      if (state is PostDetailsEmptyState) {}
      if (state is PostDetailsErrorState) {
        return CustomErrorWidget(error: state.error, action: () {});
      }
      return const SizedBox.shrink();
    });
  }
}
