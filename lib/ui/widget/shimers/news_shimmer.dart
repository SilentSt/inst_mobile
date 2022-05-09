import 'package:flutter/material.dart';
import 'package:inst_mobile/resources/app_colors.dart';
import 'package:inst_mobile/ui/widget/shimers/box.dart';
import 'package:shimmer/shimmer.dart';

class NewsShimmer extends StatefulWidget {
  const NewsShimmer({Key? key}) : super(key: key);

  @override
  State<NewsShimmer> createState() => _NewsShimmerState();
}

class _NewsShimmerState extends State<NewsShimmer> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Shimmer.fromColors(
        enabled: true,
        baseColor: AppColors.baseShimmer,
        highlightColor: AppColors.highlightShimmer,
        child: SizedBox(
          height: MediaQuery.of(context).size.height-50,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: 16,
                  ),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width-32,
                    child: SingleChildScrollView(
                      child: SizedBox(
                        child: Row(
                          children: List.generate(
                            4,
                            (index) => Padding(
                              padding: const EdgeInsets.only(right: 16,),
                              child: Column(
                                children: [
                                  ShimmerBox(
                                    size: Size(
                                      64,
                                      64,
                                    ),
                                    radius: 90,
                                  ),
                                  ShimmerBox(
                                    size: Size(
                                      60,
                                      10,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 1,
                  child: const ColoredBox(
                    color: AppColors.lightGrey,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          ShimmerBox(
                            size: Size(
                              32,
                              32,
                            ),
                            radius: 90,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          ShimmerBox(
                            size: Size(
                              60,
                              14,
                            ),
                          ),
                        ],
                      ),
                      ShimmerBox(
                        size: Size(
                          16,
                          4.6,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                ShimmerBox(
                  size: Size(
                    MediaQuery.of(context).size.width,
                    MediaQuery.of(context).size.width,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ShimmerBox(
                        size: Size(
                          112,
                          18,
                        ),
                      ),
                      ShimmerBox(
                        size: Size(
                          18,
                          18,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ShimmerBox(
                  size: Size(
                    MediaQuery.of(context).size.width - 32,
                    18,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ShimmerBox(
                    size: Size(
                      42,
                      10,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          ShimmerBox(
                            size: Size(
                              32,
                              32,
                            ),
                            radius: 90,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          ShimmerBox(
                            size: Size(
                              60,
                              14,
                            ),
                          ),
                        ],
                      ),
                      ShimmerBox(
                        size: Size(
                          16,
                          4.6,
                        ),
                      ),
                    ],
                  ),
                ),
                ShimmerBox(
                  size: Size(
                    MediaQuery.of(context).size.width,
                    MediaQuery.of(context).size.width,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
