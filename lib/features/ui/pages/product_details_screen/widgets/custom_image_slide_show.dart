import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';

class CustomImageSlideShow extends StatelessWidget {
  final List<String> itemImagesList;

  const CustomImageSlideShow({super.key, required this.itemImagesList});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.r),
      child: ImageSlideshow(
          height: 300.h,
          indicatorColor: AppColors.primaryColor,
          indicatorBackgroundColor: AppColors.whiteColor,
          isLoop: false,
          children: itemImagesList.map((imagePath) {
            return ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(16.r)),
              child: CachedNetworkImage(
                imageUrl: imagePath,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill,
                errorWidget: (context, url, error) => Icon(
                  Icons.error,
                  color: AppColors.redColor,
                ),
                placeholder: (context, url) => Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            );
          }).toList()),
    );
  }
}
