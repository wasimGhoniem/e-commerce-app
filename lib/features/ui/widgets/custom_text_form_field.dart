import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  final String? hint;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int? maxLines;
  final bool enabled;
  final Color? fillColor;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final TextStyle? errorStyle;
  final EdgeInsetsGeometry? contentPadding;
  final double? borderRadius;

  const CustomTextFormField({
    Key? key,
    this.hint,
    this.errorStyle,
    this.controller,
    this.validator,
    this.keyboardType,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLines = 1,
    this.enabled = true,
    this.fillColor,
    this.hintStyle,
    this.textStyle,
    this.contentPadding,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      obscureText: obscureText,
      maxLines: maxLines,
      enabled: enabled,
      style: textStyle ?? TextStyle(color: AppColors.blackColor),
      decoration: InputDecoration(
        errorStyle: errorStyle??AppStyles.errorStyle,
        hintText: hint,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: fillColor ?? AppColors.whiteColor,
        hintStyle: hintStyle ?? TextStyle(color: AppColors.hintTextColor),
        contentPadding: contentPadding ?? EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 16.h,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 8.r),
          borderSide: BorderSide(
            color: AppColors.primaryColor,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 8.r),
          borderSide: BorderSide(
            color: AppColors.primaryColor,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(

          borderRadius: BorderRadius.circular(borderRadius ?? 8.r),
          borderSide: BorderSide(
            color: AppColors.redColor,
            width: 1,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 8.r),
          borderSide: BorderSide(
            color: AppColors.redColor,
            width: 2,
          ),
        ),
      ),
    );
  }
}