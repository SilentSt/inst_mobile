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
              size: Size(100, 100),
              radius: 90,
            ),
            const SizedBox(height: 18,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  3,
                  (index) => Column(
                    children: [
                      ShimmerBox(
                        size: Size(
                          20,
                          12,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      ShimmerBox(
                        size: Size(
                          78,
                          14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 27,),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ShimmerBox(
                      size: Size(100, 14),
                    ),
                    const SizedBox(
                      height: 11,
                    ),
                    ShimmerBox(
                      size: Size(150, 14),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 26,),
            ShimmerBox(
              size: Size(MediaQuery.of(context).size.width - 32, 30),
            ),
            const SizedBox(height: 48,),
            Expanded(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 500,
                child: GridView.count(
                  crossAxisCount: 3,
                  children: List.generate(
                    12,
                    (index) => Padding(
                      padding: const EdgeInsets.all(0.5),
                      child: ShimmerBox(
                        size: Size(
                          124,
                          124,
                        ),
                        radius: 0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
