import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inst_mobile/cubit/navigation/cubit.dart';
import 'package:inst_mobile/resources/app_strings.dart';
import 'package:inst_mobile/ui/styles/app_text_styles.dart';
import 'package:inst_mobile/ui/widget/buttons/app_button.dart';

class StartScene extends StatelessWidget {
  const StartScene({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          backgroundColor: Colors.white,
          shadowColor: Colors.transparent,
          elevation: 0,
          title: Text(
            AppStrings.appName,
            style: AppTextStyles.h2.black().bold700(),
          ),
          centerTitle: true,
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * .9,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      height: 32,
                      width: 32,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(90),
                        child: Image.asset(AppStrings.testImage),
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      'photosbygwen',
                      style: AppTextStyles.h4.black().bold600().size(12),
                    )
                  ],
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: SizedBox(
                        width: 16,
                        height: 16,
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 15,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 24,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: SizedBox(
                        width: 16,
                        height: 16,
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          SizedBox(child: Image.asset(AppStrings.testImage), width: 400,),
          const SizedBox(
            height: 20,
          ),
          AppButton.accent(
            action: context.read<NavigationCubit>().pushToAuthScene,
            size: Size(MediaQuery.of(context).size.width * .9, 30),
            text: AppStrings.loginButton,
          ),
          const SizedBox(
            height: 24,
          ),
          AppButton.outlined(
            action:
                context.read<NavigationCubit>().pushToRegistrationScene,
            textStyle: AppTextStyles.h4.black(),
            size: Size(MediaQuery.of(context).size.width * .9, 30),
            text: AppStrings.registerButton,
          ),
          const SizedBox(
            height: 50,
          ),
          Text(
            AppStrings.forgotPassword,
            style: AppTextStyles.h4.black(),
          ),
        ],
      ),
    );
  }
}
