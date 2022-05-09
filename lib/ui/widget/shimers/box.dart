import 'package:flutter/material.dart';
import 'package:inst_mobile/resources/app_colors.dart';

class ShimmerBox extends StatelessWidget {
  const ShimmerBox({
    Key? key,
    required this.size,
    this.radius = 5,
  }) : super(key: key);

  final Size size;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius,
        ),
        color: AppColors.lightAccentColor,
      ),
      child: SizedBox(
        height: 50,
        width: 50,
      ),
    );
  }
}
