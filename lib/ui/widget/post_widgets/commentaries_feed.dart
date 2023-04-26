import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_network/image_network.dart';
import 'package:inst_mobile/cubit/navigation/cubit.dart';
import 'package:inst_mobile/ui/styles/app_text_styles.dart';
import 'package:intl/intl.dart';
import '../../../cubit/post_details_cubit/cubit.dart';
import '../../../cubit/profile/profile_cubit.dart';
import '../../../data/models/post.dart';
import '../../../resources/app_strings.dart';

class CommentariesFeed extends StatelessWidget {
  const CommentariesFeed({
    Key? key,
    required this.post,
  }) : super(key: key);

  final GetPostFull post;

  @override
  Widget build(BuildContext context) {
    var _cubit = context.read<PostDetailsCubit>();
    return BlocBuilder<PostDetailsCubit, PostDetailsState>(
      builder: (context, state) {
        if (state is PostDetailsLoadingState) {
          return const Center(
            child: Center(child: CircularProgressIndicator()),
          );
        }
        if (state is PostDetailsLoadedState) {
          return SingleChildScrollView(
            child: Column(
              children: List.generate(
                _cubit.commentaries.length,
                (index) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 5, left: 2),
                          child: ImageNetwork(
                            height: 38,
                            width: 38,
                            onTap: () {
                              //TODO still needs fix
                              // context.read<ProfileCubit>().dropState();
                              // context
                              //     .read<NavigationCubit>()
                              //     .pushToProfileScene(post.author);
                            },
                            image: _cubit.commentaries[index].author.photo,
                            borderRadius: BorderRadius.circular(90),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.65,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '@' +
                                    _cubit.commentaries[index].author.nickname,
                                style: AppTextStyles.h3.black().bold900(),
                                textAlign: TextAlign.left,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                _cubit.commentaries[index].title,
                                style: AppTextStyles.h4.black(),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    DateFormat('dd.MM.yy').format(
                                      _cubit.commentaries[index].createdAt ??
                                          post.createdAt,
                                    ),
                                    style: AppTextStyles.h4.grey(),
                                  ),
                                  Text(
                                    "Оценили: ${_cubit.commentaries[index].likes}",
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    IconButton(
                      onPressed: () {
                        !_cubit.commentaries[index].isLiked!
                            ? _cubit.likeCommentary(
                                _cubit.commentaries[index].uuid, post.uuid)
                            : _cubit.removeLikeCommentary(_cubit.commentaries[index].uuid, post.uuid);
                      },
                      icon: SvgPicture.asset(
                        !_cubit.commentaries[index].isLiked!
                            ? AppStrings.largeLikeOutlinedPath
                            : AppStrings.likeFilledPath,
                        color: !_cubit.commentaries[index].isLiked!
                            ? Colors.black
                            : Colors.red,
                        width: 9,
                        height: 9,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        if (state is PostDetailsEmptyState) {
          _cubit.getPostDetailed(post.uuid);
          _cubit.getCommentaries(post.uuid);
        }
        return SizedBox.shrink();
      },
    );
  }
}
