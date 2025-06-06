import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:e_commerce_app/domain/entities/CategoryResponseEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Category extends StatelessWidget {
  final CategoryDataEntity item;

  const Category({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 8,
          child: CircleAvatar(
            radius: 100.r,
            child: ClipOval(
              child: CachedNetworkImage(
                imageUrl: item.image ?? '',
                width: 80.w,
                height: 80.w,
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
            ),
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        Expanded(
            flex: 6,
            child: Text(
              item.name ?? '',
              textAlign: TextAlign.center,
              style: AppStyles.light18hintText.copyWith(fontSize: 14),
            )),
      ],
    );
  }
}
