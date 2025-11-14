import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies/core/extensions/widgets_extensions.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/theme/app_colors.dart';

class PopularMovieShimmerItem extends StatelessWidget {
  const PopularMovieShimmerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: Row(
        children: [
          Shimmer.fromColors(
            baseColor: AppColors.soft,
            highlightColor: AppColors.grey.withOpacity(0.3),
            child: Container(
              height: 200,
              width: 130,
              decoration: const BoxDecoration(
                color: AppColors.soft,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                ),
              ),
            ),
          ),
          20.width,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                4,
                (index) => Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.h),
                  child: Shimmer.fromColors(
                    baseColor: AppColors.soft,
                    highlightColor: AppColors.grey.withOpacity(0.3),
                    child: Container(
                      height: 14,
                      width: index == 0 ? 150.w : 100.w,
                      decoration: BoxDecoration(
                        color: AppColors.soft,
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
