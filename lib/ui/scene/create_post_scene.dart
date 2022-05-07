import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:inst_mobile/cubit/create_post/create_post_cubit.dart';
import 'package:inst_mobile/cubit/create_post/create_post_state.dart';
import 'package:inst_mobile/cubit/navigation/cubit.dart';
import 'package:inst_mobile/data/temp_data.dart';
import 'package:inst_mobile/resources/app_colors.dart';
import 'package:inst_mobile/resources/app_strings.dart';
import 'package:inst_mobile/ui/controllers/text_editing_controllers.dart';
import 'package:inst_mobile/ui/styles/app_text_styles.dart';
import 'package:inst_mobile/ui/widget/post_widgets/post_preview.dart';
import 'package:inst_mobile/ui/widget/post_widgets/user_icon.dart';

class CreatePostScene extends StatelessWidget {
  const CreatePostScene({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreatePostCubit, CreatePostState>(
        builder: (context, state) {
      var size = MediaQuery.of(context).size;
      if (state is CreatePostLoadingState) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is CreatePostLoadedState) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: SvgPicture.asset(
                AppStrings.arrowBackPath,
              ),
              onPressed: () {
                context.read<NavigationCubit>().pushToNewsScene();
              },
            ),
            title: Text(
              AppStrings.createPostTitle,
              style: AppTextStyles.h1.black().bold900(),
            ),
            centerTitle: true,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: IconButton(icon: const Icon(Icons.check,size: 30,color: AppColors.darkGreen),onPressed: (){ context.read<CreatePostCubit>().createPost();},),
              )
            ],
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.30,
                      child: Column(
                        children: [
                          SizedBox(
                            width: 350,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                //TODO: widget removed
                                // SizedBox(
                                //   width: size.width - 91,
                                //   child: CustomTextField(
                                //     title: AppStrings.title,
                                //     controller:
                                //         CreatePostControllers.titleController,
                                //     maxLines: 1,
                                //     titleStyle: AppTextStyles.h4.grey(),
                                //     textStyle: AppTextStyles.h4.black(),
                                //   ),
                                // ),
                                PopupMenuButton<Picker>(
                                  itemBuilder: (context) =>
                                      <PopupMenuEntry<Picker>>[
                                    PopupMenuItem<Picker>(
                                      child: Row(
                                        children: const [
                                          Icon(Icons.photo),
                                          Text("Фото")
                                        ],
                                      ),
                                      value: Picker.image,
                                      padding: const EdgeInsets.all(4),
                                    ),
                                    PopupMenuItem<Picker>(
                                      child: Row(
                                        children: const [
                                          Icon(Icons.video_file),
                                          Text("Видео")
                                        ],
                                      ),
                                      value: Picker.video,
                                      padding: const EdgeInsets.all(4),
                                    )
                                  ],
                                  onSelected: (Picker result) {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            contentPadding: EdgeInsets.zero,
                                            content: Expanded(
                                              child: SizedBox(
                                                height: 80,
                                                width: 110,
                                                child: Column(
                                                  children: [
                                                    SizedBox(
                                                        height: 40,
                                                        child: TextButton(
                                                            onPressed: () {
                                                              context.read<CreatePostCubit>().pick(result, PickStorage.gallery);
                                                              Navigator.pop(context);
                                                            },
                                                            child: Text(
                                                              "Галлерея",
                                                              style:
                                                                  AppTextStyles
                                                                      .h2
                                                                      .green()
                                                                      .bold500(),
                                                            ))),
                                                    SizedBox(
                                                        height: 40,
                                                        child: TextButton(
                                                            onPressed: () {
                                                              context.read<CreatePostCubit>().pick(result, PickStorage.camera);
                                                              Navigator.pop(context);
                                                            },
                                                            child: Text(
                                                                "Камера",
                                                                style: AppTextStyles
                                                                    .h2
                                                                    .green()
                                                                    .bold500())))
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        });
                                  },
                                  icon: const Icon(Icons.add,color: AppColors.darkGreen,size: 35,),
                                  padding: EdgeInsets.zero,
                                  shape: RoundedRectangleBorder(
                                      side: const BorderSide(
                                          color: AppColors.darkGreen, width: 2),
                                      borderRadius: BorderRadius.circular(10)),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                      width: 3, color: AppColors.darkGreen),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 15, bottom: 8, top: 4),
                                child: Expanded(
                                  child: SingleChildScrollView(
                                    child: TextField(
                                      style: AppTextStyles.h3.black(),
                                      controller: CreatePostControllers
                                          .descriptionController,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        label: Text(AppStrings.description,style: AppTextStyles.h3.green().bold900(),),
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                      ),
                                      maxLines: 20,
                                      minLines: 1,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        PostPreview(
                            files: context.read<CreatePostCubit>().files),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              UserIcon(
                                  user: TempData.me!.toSmallUser(), size: 60),
                              Padding(
                                padding: const EdgeInsets.only(left: 14),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "@"+TempData.me!.nickname,
                                      textAlign: TextAlign.left,
                                      style: AppTextStyles.h2.black().bold900(),
                                    ),
                                    SizedBox(
                                      child: TextField(
                                        maxLines: 20,
                                        minLines: 1,
                                        enabled: false,
                                        controller: CreatePostControllers
                                            .descriptionController,
                                        textAlign: TextAlign.left,
                                        style: AppTextStyles.h4.black(),
                                        decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                          focusedBorder: InputBorder.none,
                                        ),
                                      ),
                                      width: size.width - 150,
                                    ),
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),

                      ],
                    ),
                    Container(height: 0.6,color: AppColors.darkGrey,width: size.width-80,),
                    const SizedBox(height: 15)
                  ],
                ),
              ),
            ),
          ),
        );
      }
      if(state is CreatedPostSuccessState)
        {
          context.read<NavigationCubit>().pushToNewsScene();
        }
      return const Scaffold();
    });
  }
}
