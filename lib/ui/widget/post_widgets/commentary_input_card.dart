import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_network/image_network.dart';
import 'package:inst_mobile/cubit/post_details_cubit/cubit.dart';
import 'package:inst_mobile/ui/controllers/text_editing_controllers.dart';
import '../../../data/temp_data.dart';
import '../../../resources/app_colors.dart';
import '../../../resources/app_strings.dart';
import '../../styles/app_text_styles.dart';

class CommentaryInputCard extends StatelessWidget {
  const CommentaryInputCard({
    Key? key,
    required this.postUuid,
  }) : super(key: key);

  final String postUuid;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostDetailsCubit, PostDetailsState>(
      builder: (context, state) {
        if (state is PostDetailsLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            //height: 200,
            child: Card(
              margin: const EdgeInsets.all(0),
              elevation: 15,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ImageNetwork(
                      image: TempData.me!.photo,
                      height: 38,
                      width: 38,
                      borderRadius: BorderRadius.circular(90),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 40),
                          child: SizedBox(
                            height: 70,
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: SingleChildScrollView(
                              child: TextField(
                                controller:
                                    CommentaryControllers.commentaryTitle,
                                textAlign: TextAlign.left,
                                maxLines: 4,
                                style: AppTextStyles.h3
                                    .black()
                                    .copyWith(fontSize: 13),
                                decoration: const InputDecoration(
                                  hintText: 'Введите комментарий',
                                    border: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    focusedErrorBorder: InputBorder.none),
                              ),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            context
                                .read<PostDetailsCubit>()
                                .createCommentary(postUuid);
                          },
                          child: Text(
                            AppStrings.sendCommentary,
                            style: AppTextStyles.h3
                                .accent()
                                .copyWith(fontSize: 13).bold900(),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
