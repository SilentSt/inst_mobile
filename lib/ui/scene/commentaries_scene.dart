import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_network/image_network.dart';
import 'package:inst_mobile/cubit/navigation/cubit.dart';
import 'package:inst_mobile/cubit/post_details_cubit/cubit.dart';
import 'package:inst_mobile/cubit/profile/profile_cubit.dart';
import 'package:inst_mobile/data/models/post.dart';
import 'package:inst_mobile/resources/app_colors.dart';
import 'package:inst_mobile/resources/app_strings.dart';
import 'package:inst_mobile/ui/styles/app_text_styles.dart';
import 'package:inst_mobile/ui/widget/app_error.dart';
import 'package:intl/intl.dart';
import '../widget/post_widgets/commentaries_feed.dart';
import '../widget/post_widgets/commentary_input_card.dart';
import '../widget/post_widgets/post_description.dart';
import '../widget/post_widgets/post_details_action_bar.dart';
import '../widget/post_widgets/post_details_app_bar.dart';
import '../widget/post_widgets/post_details_content.dart';

class CommentariesScene extends StatelessWidget {
  const CommentariesScene({Key? key, required this.post}) : super(key: key);

  final GetPostFull post;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostDetailsCubit, PostDetailsState>(
      builder: (context, state) {
        var _cubit = context.read<PostDetailsCubit>();
        if (state is PostDetailsLoadingState) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is PostDetailsLoadedState) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: AppColors.snow,
              shadowColor: Colors.transparent,
              leading: IconButton(
                onPressed: () {
                  context.read<NavigationCubit>().pushToNewsScene();
                },
                icon: SvgPicture.asset(
                  AppStrings.arrowBackPath,
                  color: Colors.black,
                ),
              ),
              title: Text(
                AppStrings.postDetailsTitle,
                style: AppTextStyles.h2.bold700().black(),
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.menu,
                    color: Colors.black,
                  ),
                )
              ],
            ),
            backgroundColor: AppColors.snow,
            body: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 5, left: 2),
                                  child: ImageNetwork(
                                    height: 38,
                                    width: 38,
                                    onTap: () {
                                      context
                                          .read<ProfileCubit>()
                                          .dropState();
                                      context
                                          .read<NavigationCubit>()
                                          .pushToProfileScene(post.author);
                                    },
                                    image: post.author.photo,
                                    borderRadius: BorderRadius.circular(90),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width *
                                      0.7,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '@' + post.author.nickname,
                                        style: AppTextStyles.h3
                                            .black()
                                            .bold900(),
                                        textAlign: TextAlign.left,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        post.description,
                                        style: AppTextStyles.h4.black(),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            DateFormat('dd.MM.yy').format(
                                              post.createdAt,
                                            ),
                                            style: AppTextStyles.h4.grey(),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 25,
                        child: Center(
                          child: SizedBox(
                            height: 1,
                            width: MediaQuery.of(context).size.width,
                            child: ColoredBox(
                              color: AppColors.baseShimmer,
                            ),
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height*.6,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                            ),
                            child: CommentariesFeed(
                              post: post,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  CommentaryInputCard(
                    postUuid: post.uuid,
                  )
                ],
              ),
            ),
          );
        }
        if (state is PostDetailsEmptyState) {
          _cubit.getCommentaries(post.uuid);
        }
        if (state is PostDetailsErrorState) {
          return AppError(
              error: state.error,
              action: () {
                context.read<NavigationCubit>().pushToNewsScene();
              });
        }
        return const SizedBox.shrink();
      },
    );
  }
}
