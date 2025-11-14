import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/extensions/widgets_extensions.dart';
import '../../../core/theme/app_text_style.dart';

import '../../../core/theme/app_colors.dart';
import '../models/onboarding_model.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key, required this.data});
  final OnboardingData data;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        // Background Image
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(data.image),
              fit: BoxFit.cover,
            ),
          ),
        ),

        Container(
          height: 280.h,
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
          decoration: BoxDecoration(
            // color: AppColors.dark.withValues(alpha: 0.75),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [AppColors.dark.withValues(alpha: 0), AppColors.dark],
              stops: const [0, .7],
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              30.height,
              Text(
                data.title,
                style: AppTextStyles.semiBold18White(
                  context,
                ).copyWith(height: 1.4),
                textAlign: TextAlign.center,
              ),
              20.height,
              Text(
                data.subtitle,
                style: AppTextStyles.medium14Grey(context),
                textAlign: TextAlign.center,
              ),
              75.height,
            ],
          ),
        ),
      ],
    );
  }
}
