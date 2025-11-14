import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:movies/core/extensions/widgets_extensions.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_text_style.dart';

class BlurRating extends StatelessWidget {
  const BlurRating({super.key, required this.voteAverage});
  final double? voteAverage;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 10,
      left: 10,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.star, color: AppColors.orange, size: 16),
              3.width,
              Text(
                voteAverage?.toStringAsFixed(1) ?? '1.2',
                style: AppTextStyles.semiBold12Orange(
                  context,
                ).copyWith(letterSpacing: 1.5),
              ),
            ],
          ).paddingAll(5),
        ),
      ),
    );
  }
}
