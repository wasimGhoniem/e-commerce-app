import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/domain/entities/BrandResponseEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';

class Brand extends StatelessWidget {
  final BrandEntity item;

  const Brand({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 8,
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(15.r)),
            child: CachedNetworkImage(
              imageUrl: item.image ?? '',
              // width: 80.w,
              // height: 80.w,
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
    ;
  }
}
