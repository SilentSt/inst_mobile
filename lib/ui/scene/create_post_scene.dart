import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:inst_mobile/cubit/create_post/create_post_cubit.dart';
import 'package:inst_mobile/cubit/create_post/create_post_state.dart';
import 'package:inst_mobile/cubit/navigation/cubit.dart';
import 'package:inst_mobile/data/temp_data.dart';
import 'package:inst_mobile/resources/app_colors.dart';
import 'package:inst_mobile/resources/app_strings.dart';
import 'package:inst_mobile/ui/controllers/text_editing_controllers.dart';
import 'package:inst_mobile/ui/styles/app_text_styles.dart';
import 'package:inst_mobile/ui/widget/post_widgets/user_icon.dart';

class CreatePostScene extends StatelessWidget {
  const CreatePostScene({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreatePostCubit, CreatePostState>(
      builder: (context, state) {
        if (state is CreatePostWithContentState) {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(42),
              child: AppBar(
                elevation: 1,
                backgroundColor: AppColors.snow,
                leading: IconButton(
                  onPressed: () {
                    context.read<NavigationCubit>().pushToNewsScene();
                  },
                  icon: SvgPicture.asset(
                    AppStrings.arrowBackPath,
                  ),
                ),
                title: Text(
                  'Описание',
                  style: AppTextStyles.h1.bold700().black(),
                ),
                actions: [
                  IconButton(
                    onPressed: () {
                      context.read<CreatePostCubit>().create(state.content);
                      context.read<NavigationCubit>().pushToNewsScene();
                    },
                    icon: Icon(
                      Icons.check,
                      color: AppColors.accentColor,
                    ),
                  ),
                ],
              ),
            ),
            backgroundColor: AppColors.snow,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 25),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    UserIcon(
                      user: TempData.me!.toSmallUser(),
                      size: 44,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height - 50,
                      width: MediaQuery.of(context).size.width * 0.63,
                      child: TextField(
                        maxLength: 255,
                        maxLines: 20,
                        controller: CreatePostControllers.descriptionController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          errorBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                          hintText: 'Добавьте подпись . . .',
                          counter: SizedBox(),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 44,
                      width: 44,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: Colors.black,
                          ),
                        ),
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: FutureBuilder<Uint8List>(
                            future: state.content.first.readAsBytes(),
                            builder: (context, snapshot) {
                              if (snapshot.data == null) {
                                return SizedBox();
                              }
                              return Image.memory(
                                snapshot.data!,
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        if (state is CreatePostNoContentState) {
          context.read<NavigationCubit>().pushToNewsScene();
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
