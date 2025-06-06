import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyles {

  static TextStyle semiBold24White=GoogleFonts.poppins(
    color: AppColors.whiteColor,
    fontSize: 24,
    fontWeight: FontWeight.w600
  );

  static TextStyle semiBold18White = GoogleFonts.poppins(
      color: AppColors.whiteColor, fontSize: 18, fontWeight: FontWeight.w600);
  static TextStyle light16White = GoogleFonts.poppins(
      color: AppColors.whiteColor, fontSize: 16, fontWeight: FontWeight.w300);
  static TextStyle textColor14 = GoogleFonts.poppins(
      color: AppColors.textColor, fontSize: 14, fontWeight: FontWeight.w300);
  static TextStyle light12White = GoogleFonts.poppins(
      color: AppColors.whiteColor, fontSize: 12, fontWeight: FontWeight.w300);
  static TextStyle errorStyle = GoogleFonts.poppins(
      color: AppColors.redColor, fontSize: 14, fontWeight: FontWeight.w300);
  static TextStyle medium18White = GoogleFonts.poppins(
      color: AppColors.whiteColor, fontSize: 18, fontWeight: FontWeight.w500);
  static TextStyle light18hintTextColor=GoogleFonts.poppins(
      color: AppColors.hintTextColor,
      fontSize: 18,
      fontWeight: FontWeight.w300
  );
  static TextStyle regular18White = GoogleFonts.poppins(
      color: AppColors.hintTextColor,
      fontSize: 18,
      fontWeight: FontWeight.w400);
  static TextStyle semiBold20primary = GoogleFonts.poppins(
      color: AppColors.primaryColor, fontSize: 18, fontWeight: FontWeight.w600);
  static TextStyle light18hintText = GoogleFonts.poppins(
      color: AppColors.textColor, fontSize: 18, fontWeight: FontWeight.w300);
  static TextStyle light14hTextColor = GoogleFonts.poppins(
      color: AppColors.textColor, fontSize: 14, fontWeight: FontWeight.w400);
  static TextStyle light11Discount = GoogleFonts.poppins(
      color: AppColors.discountTextColor,
      fontSize: 11,
      fontWeight: FontWeight.w400);
}