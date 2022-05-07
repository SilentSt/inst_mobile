import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';
import '../../resources/app_colors.dart';

class ImagePost extends StatelessWidget {
  const ImagePost({Key? key, required this.imageSrc}) : super(key: key);

  final String imageSrc;

  @override
  Widget build(BuildContext context) {
    return SizedBox(child: ImageNetwork(
      height: 300,
      width: MediaQuery.of(context).size.width,
      image: imageSrc,
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
