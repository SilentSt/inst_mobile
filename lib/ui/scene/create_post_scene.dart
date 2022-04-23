import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inst_mobile/cubit/create_post/create_post_cubit.dart';
import 'package:inst_mobile/cubit/create_post/create_post_state.dart';
import 'package:inst_mobile/cubit/navigation/cubit.dart';

import 'package:inst_mobile/resources/app_strings.dart';
import 'package:inst_mobile/ui/controllers/text_editing_controllers.dart';
import 'package:inst_mobile/ui/styles/app_text_styles.dart';
import 'package:inst_mobile/ui/widget/custom_text_field.dart';

class CreatePostScene extends StatelessWidget{
  const CreatePostScene({Key? key}) : super(key: key);

  final String fileName = "";

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreatePostCubit,CreatePostState>(
      builder: (context,state){
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            leading: IconButton(icon:Image.asset(AppStrings.arrowBackPath,), onPressed: (){ context.read<NavigationCubit>().pushToAuthScene(); },),
            title: Text(AppStrings.createPostTitle,
            style: AppTextStyles.h1.black().bold500(),),
          ),
          body: SafeArea(
            child: Column(
              children: [
                CustomTextField(title: AppStrings.title, controller: CreatePostControllers.titleController),
                CustomTextField(title: AppStrings.description, controller: CreatePostControllers.descriptionController),

              ],
            ),
          ),
        );
      }
    );
  }

}