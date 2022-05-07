import 'package:flutter/material.dart';
import 'package:inst_mobile/resources/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerBox extends StatelessWidget {
  const ShimmerBox({
    Key? key,
    required this.size,
    this.radius = 0,
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
      child: Shimmer.fromColors(
        child: SizedBox(
          height: 50,
          width: 50,
        ),
        enabled: true,
        baseColor: AppColors.lightGrey,
        highlightColor: AppColors.lightAccentColor,
        loop: 5,
      ),
    );
  }
}
