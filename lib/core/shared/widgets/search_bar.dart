import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_style.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key, this.onChanged, this.onFilterTap});

  final ValueChanged<String>? onChanged;
  final VoidCallback? onFilterTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: AppColors.soft,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: TextFormField(
        onChanged: onChanged,
        cursorColor: AppColors.grey,
        style: AppTextStyles.medium14Grey(context),
        decoration: InputDecoration(
          hintText: "Search",
          hintStyle: AppTextStyles.medium14Grey(context),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 14.h,
          ),

          // 🔍 Left Search Icon
          prefixIcon: Padding(
            padding: EdgeInsets.only(left: 14.w, right: 10.w),
            child: Icon(
              CupertinoIcons.search,
              color: AppColors.grey,
              size: 20.sp,
            ),
          ),

          // 🧩 Filter Button
          suffixIcon: InkWell(
            borderRadius: BorderRadius.circular(15.r),
            onTap: onFilterTap,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              decoration: const BoxDecoration(
                border: Border(
                  left: BorderSide(color: AppColors.grey, width: 1),
                ),
              ),
              child: Icon(
                Icons.filter_alt_outlined,
                color: AppColors.white,
                size: 18.sp,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
