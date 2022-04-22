import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';
import 'package:inst_mobile/resources/app_colors.dart';

class UserIcon extends StatelessWidget {
  const UserIcon({
    Key? key,
    required this.path,
    required this.size,
  }) : super(key: key);
  final String path;
  final double size;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(90),
        child: ImageNetwork(
          height: size,
          width: size,
          image: path,
          duration: 1500,
          curve: Curves.easeIn,
          fitAndroidIos: BoxFit.cover,
          fitWeb: BoxFitWeb.cover,
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
