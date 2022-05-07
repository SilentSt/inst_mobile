import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:inst_mobile/cubit/navigation/cubit.dart';
import 'package:inst_mobile/cubit/news/cubit.dart';
import 'package:inst_mobile/cubit/post_details_cubit/cubit.dart';
import 'package:inst_mobile/data/models/post.dart';
import 'package:intl/intl.dart';
import '../../../resources/app_strings.dart';
import '../../styles/app_text_styles.dart';
import '../post_widgets/content_slider.dart';

class ContentCard extends StatelessWidget {
  const ContentCard({
    Key? key,
    required this.post,
  }) : super(key: key);
  final GetPostFull post;

  @override
  Widget build(BuildContext context) {
    var _cubit = context.read<NewsCubit>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ContentSlider(post: post),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            BlocBuilder<NewsCubit, NewsState>(
              builder: (context, state) {
                if (state is NewsLikesLoadingState) {
                  return const CircularProgressIndicator();
                }
                return Row(
                  children: [
                    IconButton(
                      icon: SvgPicture.asset(
                        post.isLiked!
                            ? AppStrings.likeFilledPath
                            : AppStrings.likePath,
                        color: post.isLiked! ? Colors.red : Colors.black,
                      ),
                      onPressed: () {
                        post.isLiked!
                            ? _cubit.removeLikePost(post.uuid)
                            : _cubit.likePost(post.uuid);
                      },
                    ),
                    Text(
                      post.likesCount.toString(),
                      style: AppTextStyles.h2Green,
                    ),
                    IconButton(
                      icon: SvgPicture.asset(
                        AppStrings.commentaryPath,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        context.read<PostDetailsCubit>().dropScene();
                        context
                            .read<NavigationCubit>()
                            .pushToPostDetailsScene(post);
                      },
                    ),
                    Text(
                      post.commentsCount.toString(),
                      style: AppTextStyles.h2Green,
                    ),
                  ],
                );
              },
            ),
            IconButton(
              icon: SvgPicture.asset(
                AppStrings.sendPath,
                color: Colors.black,
              ),
              onPressed: () {},
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: RichText(
            textAlign: TextAlign.left,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            text: TextSpan(
              text: '${post.author.nickname}: ',
              style: AppTextStyles.h3.black().bold600(),
              children: [
                TextSpan(
                  text: post.description,
                  style: AppTextStyles.h3.black().light400(),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8,),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Text(
            DateFormat('dd.MM.yy').format(post.updatedAt ?? post.createdAt),
            style: AppTextStyles.h4.light400().lightGrey(),
          ),
        ),
      ],
    );
  }
}
