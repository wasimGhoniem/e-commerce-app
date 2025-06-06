import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';

class BuildAnnouncement extends StatelessWidget {
  final List<String> imageList;

  const BuildAnnouncement({super.key, required this.imageList});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.r),
      child: ImageSlideshow(
          height: 200.h,
          indicatorColor: AppColors.primaryColor,
          indicatorBackgroundColor: AppColors.whiteColor,
          isLoop: false,
          autoPlayInterval: 3000,
          children: imageList.map((imagePath) {
            return Image.asset(imagePath);
          }).toList()),
    );
  }
}
