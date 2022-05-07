import 'package:flutter/material.dart';
import 'package:inst_mobile/resources/app_colors.dart';
import 'package:shimmer/shimmer.dart';

import 'box.dart';

class ProfileShimmer extends StatefulWidget {
  const ProfileShimmer({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileShimmer> createState() => _ProfileShimmerState();
}

class _ProfileShimmerState extends State<ProfileShimmer> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Shimmer.fromColors(
        enabled: true,
        baseColor: AppColors.baseShimmer,
        highlightColor: AppColors.highlightShimmer,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ShimmerBox(
              size: Size(105, 105),
              radius: 90,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ShimmerBox(
                  size: Size(100, 40),
                ),
                ShimmerBox(
                  size: Size(100, 40),
                ),
                ShimmerBox(
                  size: Size(100, 40),
                ),
              ],
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: ShimmerBox(
                size: Size(80, 60),
              ),
            ),
            ShimmerBox(
              size: Size(300, 30),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ShimmerBox(
                  size: Size(
                    MediaQuery.of(context).size.width / 3,
                    MediaQuery.of(context).size.width / 3,
                  ),
                ),
                ShimmerBox(
                  size: Size(
                    MediaQuery.of(context).size.width / 3,
                    MediaQuery.of(context).size.width / 3,
                  ),
                ),
                ShimmerBox(
                  size: Size(
                    MediaQuery.of(context).size.width / 3,
                    MediaQuery.of(context).size.width / 3,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}