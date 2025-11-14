import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTextStyles {
  // Font Weights (readable naming)
  static const FontWeight fwRegular = FontWeight.w400;
  static const FontWeight fwMedium = FontWeight.w500;
  static const FontWeight fwSemiBold = FontWeight.w600;
  static const FontWeight fwBold = FontWeight.w700;

  // Base Montserrat style
  static final TextStyle _base = GoogleFonts.montserrat();

  // ======================= SemiBold =======================
  static TextStyle semiBold28White(BuildContext context) => _base.copyWith(
    fontWeight: fwSemiBold,
    fontSize: 28.sp,
    color: AppColors.white,
  );

  static TextStyle semiBold24White(BuildContext context) => _base.copyWith(
    fontWeight: fwSemiBold,
    fontSize: 24.sp,
    color: AppColors.white,
  );
  static TextStyle semiBold18White(BuildContext context) => _base.copyWith(
    fontWeight: fwSemiBold,
    fontSize: 18.sp,
    color: AppColors.white,
  );

  static TextStyle semiBold16White(BuildContext context) => _base.copyWith(
    fontWeight: fwSemiBold,
    fontSize: 16.sp,
    color: AppColors.white,
  );
  static TextStyle semiBold14White(BuildContext context) => _base.copyWith(
    fontWeight: fwSemiBold,
    fontSize: 14.sp,
    color: AppColors.white,
  );
  static TextStyle semiBold12White(BuildContext context) => _base.copyWith(
    fontWeight: fwSemiBold,
    fontSize: 12.sp,
    color: AppColors.white,
  );

  static TextStyle semiBold12Orange(BuildContext context) => _base.copyWith(
    fontWeight: fwSemiBold,
    fontSize: 12.sp,
    color: AppColors.orange,
  );
  static TextStyle semiBold14Orange(BuildContext context) => _base.copyWith(
    fontWeight: fwSemiBold,
    fontSize: 14.sp,
    color: AppColors.orange,
  );
  static TextStyle semiBold14Accent(BuildContext context) => _base.copyWith(
    fontWeight: fwSemiBold,
    fontSize: 14.sp,
    color: AppColors.blueAccent,
  );
  static TextStyle semiBold12Accent(BuildContext context) => _base.copyWith(
    fontWeight: fwSemiBold,
    fontSize: 12.sp,
    color: AppColors.blueAccent,
  );
  static TextStyle semiBold14Red(BuildContext context) => _base.copyWith(
    fontWeight: fwSemiBold,
    fontSize: 14.sp,
    color: AppColors.red,
  );

  static TextStyle semiBold12Red(BuildContext context) => _base.copyWith(
    fontWeight: fwSemiBold,
    fontSize: 12.sp,
    color: AppColors.red,
  );

  // ======================= Medium =======================

  static TextStyle medium28White(BuildContext context) => _base.copyWith(
    fontWeight: fwMedium,
    fontSize: 28.sp,
    color: AppColors.white,
  );

  static TextStyle medium24White(BuildContext context) => _base.copyWith(
    fontWeight: fwMedium,
    fontSize: 24.sp,
    color: AppColors.white,
  );
  static TextStyle medium18White(BuildContext context) => _base.copyWith(
    fontWeight: fwMedium,
    fontSize: 18.sp,
    color: AppColors.white,
  );

  static TextStyle medium16White(BuildContext context) => _base.copyWith(
    fontWeight: fwMedium,
    fontSize: 16.sp,
    color: AppColors.white,
  );
  static TextStyle medium14Grey(BuildContext context) => _base.copyWith(
    fontWeight: fwMedium,
    fontSize: 14.sp,
    color: AppColors.grey,
  );
  static TextStyle medium14Accent(BuildContext context) => _base.copyWith(
    fontWeight: fwMedium,
    fontSize: 14.sp,
    color: AppColors.blueAccent,
  );

  static TextStyle medium12WhiteGrey(BuildContext context) => _base.copyWith(
    fontWeight: fwMedium,
    fontSize: 12.sp,
    color: AppColors.whiteGrey,
  );
  static TextStyle medium12Grey(BuildContext context) => _base.copyWith(
    fontWeight: fwMedium,
    fontSize: 12.sp,
    color: AppColors.grey,
  );

  static TextStyle medium10Grey(BuildContext context) => _base.copyWith(
    fontWeight: fwMedium,
    fontSize: 10.sp,
    color: AppColors.grey,
  );

  // ======================= Regular =======================

  static TextStyle regular28White(BuildContext context) => _base.copyWith(
    fontWeight: fwRegular,
    fontSize: 28.sp,
    color: AppColors.white,
  );

  static TextStyle regular24White(BuildContext context) => _base.copyWith(
    fontWeight: fwRegular,
    fontSize: 24.sp,
    color: AppColors.white,
  );
  static TextStyle regular18White(BuildContext context) => _base.copyWith(
    fontWeight: fwRegular,
    fontSize: 18.sp,
    color: AppColors.white,
  );

  static TextStyle regular16Grey(BuildContext context) => _base.copyWith(
    fontWeight: fwRegular,
    fontSize: 16.sp,
    color: AppColors.grey,
  );
  static TextStyle regular14WhiteGrey(BuildContext context) => _base.copyWith(
    fontWeight: fwRegular,
    fontSize: 14.sp,
    color: AppColors.whiteGrey,
  );
  static TextStyle regular12WhiteGrey(BuildContext context) => _base.copyWith(
    fontWeight: fwRegular,
    fontSize: 12.sp,
    color: AppColors.whiteGrey,
  );

  static TextStyle regular12Orange(BuildContext context) => _base.copyWith(
    fontWeight: fwRegular,
    fontSize: 12.sp,
    color: AppColors.orange,
  );

  static TextStyle regular10Red(BuildContext context) => _base.copyWith(
    fontWeight: fwRegular,
    fontSize: 10.sp,
    color: AppColors.red,
  );

  // ======================= Body =======================

  static TextStyle bodySemiBold12Orange(BuildContext context) => _base.copyWith(
    fontWeight: fwSemiBold,
    fontSize: 12.sp,
    color: AppColors.orange,
  );
  static TextStyle bodyMedium12Orange(BuildContext context) => _base.copyWith(
    fontWeight: fwMedium,
    fontSize: 12.sp,
    color: AppColors.orange,
  );
  static TextStyle bodyRegular12Orange(BuildContext context) => _base.copyWith(
    fontWeight: fwRegular,
    fontSize: 12.sp,
    color: AppColors.orange,
  );
}
