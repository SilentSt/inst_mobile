import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:inst_mobile/cubit/navigation/cubit.dart';
import 'package:inst_mobile/cubit/profile/profile_cubit.dart';
import 'package:inst_mobile/cubit/profile_edit/cubit.dart';
import 'package:inst_mobile/data/temp_data.dart';
import 'package:inst_mobile/resources/app_colors.dart';
import 'package:inst_mobile/resources/app_strings.dart';
import 'package:inst_mobile/ui/styles/app_text_styles.dart';

class ProfileEditScene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileEditCubit, ProfileEditState>(
        builder: (context, state) {
      var size = MediaQuery.of(context).size;
      if (state is ProfileEditLoadingState) {
        return Center(
          child: CircularProgressIndicator(color: AppColors.darkGreen),
        );
      }
      if (state is ProfileEditLoadedState) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            leading: IconButton(
                onPressed: () {
                  context.read<ProfileCubit>().dropState();
                  context.read<NavigationCubit>().pushToProfileScene(TempData.me!.toSmallUser());
                },
                icon: SvgPicture.asset(
                  AppStrings.arrowBackPath,
                ),
            ),
            title: Text(
              AppStrings.editProfileTitle,
              style: AppTextStyles.h1.black().bold900(),
            ),
            centerTitle: true,
          ),
          body: SafeArea(
              child: SingleChildScrollView(
            child: SizedBox(
              width: size.width,
              height: size.height*0.9,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(alignment: AlignmentDirectional.center, children: [
                      context.read<ProfileEditCubit>().changed
                          ? (context.read<ProfileEditCubit>().file != null
                              ? Container(
                                  width: 180.0,
                                  height: 180.0,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: FileImage(File(context
                                              .read<ProfileEditCubit>()
                                              .file!
                                              .path)))))
                              : CircleAvatar(
                                  backgroundColor: AppColors.lightGrey,
                                  radius: 90))
                          : (TempData.me!.photo.isNotEmpty
                              ? Container(
                                  width: 180.0,
                                  height: 180.0,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: NetworkImage(TempData.me!
                                              .photo)))) //SizedBox(child: Image.network(TempData.me!.photo),width: 180,height: 180,)
                              : CircleAvatar(
                                  backgroundColor: AppColors.lightGrey,
                                  radius: 90)),
                      Center(
                        child: IconButton(
                            icon: SvgPicture.asset(
                              AppStrings.addPath,
                              color: AppColors.snow,
                            ),
                            onPressed: () {
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
                                                        context.read<ProfileEditCubit>().replaceAvatar(true);
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text(
                                                        AppStrings.gallery,
                                                        style: AppTextStyles.h2
                                                            .green()
                                                            .bold500(),
                                                      ))),
                                              SizedBox(
                                                  height: 40,
                                                  child: TextButton(
                                                      onPressed: () {
                                                        context.read<ProfileEditCubit>().replaceAvatar(false);
                                                        Navigator.pop(context);
                                                      },
                                                      child: Text(AppStrings.camera,
                                                          style: AppTextStyles.h2
                                                              .green()
                                                              .bold500())))
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  });
                            }),
                      )
                    ]),
                    SizedBox(
                      height: 10,
                    ),
                    // CustomTextField(
                    //     title: AppStrings.emailTitle,
                    //     controller: ProfileEditControllers.emailController),
                    // CustomTextField(
                    //   title: AppStrings.passwordTitle,
                    //   controller: ProfileEditControllers.passwordController,
                    //   obfuscation: true,
                    // ),
                    // SingleChildScrollView(
                    //   child: CustomTextField(
                    //       title: AppStrings.status,
                    //       controller:
                    //           ProfileEditControllers.descriptionController,
                    //       maxLines: 2),
                    // ),
                    //TODO:button removed
                    // CustomDarkButton(
                    //     size: size,
                    //     text: AppStrings.acceptEdit,
                    //     func: () {
                    //       context.read<ProfileEditCubit>().applyChanges();
                    //     })
                  ],
                ),
              ),
            ),
          )),
        );
      }
      if (state is ProfileEditSuccessState) {
        context.read<ProfileCubit>().dropState();
        context.read<NavigationCubit>().pushToProfileScene(TempData.me!.toSmallUser());
      }
      if(state is ProfileEditAvatarChangedState)
        {
          context.read<ProfileEditCubit>().applyAvatar();
        }

      return SizedBox.shrink();
    });
  }
}
