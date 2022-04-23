import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inst_mobile/cubit/create_post/create_post_cubit.dart';
import 'package:inst_mobile/cubit/create_post/create_post_state.dart';
import 'package:inst_mobile/cubit/navigation/cubit.dart';
import 'package:inst_mobile/resources/app_strings.dart';
import 'package:inst_mobile/ui/controllers/text_editing_controllers.dart';
import 'package:inst_mobile/ui/styles/app_text_styles.dart';
import 'package:inst_mobile/ui/widget/custom_text_field.dart';
import 'package:inst_mobile/ui/widget/file_picker_field.dart';
import 'package:inst_mobile/ui/widget/post_preview.dart';
import 'package:inst_mobile/ui/widget/user_icon.dart';

class CreatePostScene extends StatelessWidget {
  const CreatePostScene({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreatePostCubit, CreatePostState>(
        builder: (context, state) {
          var size = MediaQuery.of(context).size;
      if (state is CreatePostLoadingState) {
        return SizedBox.shrink();
      }
      if (state is CreatePostLoadedState) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            leading: IconButton(
              icon: Image.asset(
                AppStrings.arrowBackPath,
              ),
              onPressed: () {
                context.read<NavigationCubit>().pushToAuthScene();
              },
            ),
            title: Text(
              AppStrings.createPostTitle,
              style: AppTextStyles.h1.black().bold500(),
            ),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: size.height*0.30,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          CustomTextField(
                              title: AppStrings.title,
                              controller: CreatePostControllers.titleController),
                          FilePickerField(
                              title: AppStrings.fileChoose,
                              func: () {
                                context.read<CreatePostCubit>().pickImage();
                              },
                              choosedFiles:
                                  context.read<CreatePostCubit>().fileName),
                          CustomTextField(
                              title: AppStrings.description,
                              controller:
                                  CreatePostControllers.descriptionController,
                              maxLines: 20),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      PostPreview(files: context.read<CreatePostCubit>().files),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            UserIcon(path: "", size: 63),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Text(
                                  CreatePostControllers.titleController.text,
                                  textAlign: TextAlign.left,
                                  style: AppTextStyles.h2.black().font().bold900(),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    width: size.width*0.54,
                                    child: Text(
                                      CreatePostControllers
                                          .descriptionController.text,
                                      textAlign: TextAlign.left,
                                      style: AppTextStyles.h4.black().font(),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      }
      return Scaffold();
    });
  }
}
