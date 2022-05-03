import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_network/image_network.dart';
import 'package:inst_mobile/data/models/user.dart';
import 'package:inst_mobile/resources/app_colors.dart';

import '../../cubit/navigation/navigation_cubit.dart';
import '../../cubit/profile/profile_cubit.dart';

class UserIcon extends StatelessWidget {
  const UserIcon({
    Key? key,
    required this.user,
    required this.size,
  }) : super(key: key);
  final GetSmallUser user;
  final double size;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(90),
        child: ImageNetwork(
          height: size,
          width: size,
          image: user.photo,
          duration: 1500,
          curve: Curves.easeIn,
          fitAndroidIos: BoxFit.cover,
          fitWeb: BoxFitWeb.cover,
          onTap: (){
            context.read<ProfileCubit>().clearData();
            context.read<NavigationCubit>().pushToProfileScene(user);
          },
          onLoading: const CircularProgressIndicator(
            color: AppColors.darkGreen,
          ),
          onError: const Icon(
            Icons.error,
            color: Colors.red,
          ),
        ));
  }
}
