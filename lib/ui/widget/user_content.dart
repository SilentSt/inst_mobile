import 'package:flutter/material.dart';

import '../../cubit/profile/profile_cubit.dart';
import '../../resources/app_strings.dart';
import '../styles/app_text_styles.dart';

class UserContent extends StatelessWidget {
  const UserContent({
    Key? key,
    required ProfileCubit cubit,
  }) : _cubit = cubit, super(key: key);

  final ProfileCubit _cubit;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      margin: const EdgeInsets.all(0),
      child: SizedBox(
        height: 450,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: _cubit.images.isEmpty
              ? const Center(
            child: Padding(
                padding: EdgeInsets.only(top: 60),
                child: Text(
                  AppStrings.noImages,
                  style: AppTextStyles.h3,
                  textAlign: TextAlign.center,
                )),
          )
              : GridView.count(
              crossAxisCount: 3, children: _cubit.images),
        ),
      ),
    );
  }
}