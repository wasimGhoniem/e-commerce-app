import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../domain/entities/ProductResponseEntity.dart';

class CustomRatingRow extends StatefulWidget {
  final ProductEntity item;

  const CustomRatingRow({super.key, required this.item});

  @override
  State<CustomRatingRow> createState() => _CustomRatingRowState();
}

class _CustomRatingRowState extends State<CustomRatingRow> {
  int itemCount = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              border: Border.all(color: AppColors.primary30Opacity)),
          child: Text(
            '${widget.item.sold} Sold',
            style: AppStyles.light14hTextColor,
          ),
        ),
        SizedBox(width: 16.w),
        Icon(Icons.star, color: Colors.amber, size: 16.h),
        SizedBox(width: 4.w),
        Text(
          '${widget.item.ratingsAverage} (${widget.item.ratingsQuantity})',
          style: AppStyles.light14hTextColor,
        ),
        Spacer(),
        // Quantity Selector
        Container(
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(28.r),
          ),
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  if (itemCount == 0) {
                    return;
                  } else {
                    itemCount--;
                  }
                  setState(() {});
                },
                icon: Icon(Icons.remove_circle_outline,
                    color: AppColors.whiteColor, size: 28.h),
                padding: EdgeInsets.zero,
              ),
              Text(
                "$itemCount",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                onPressed: () {
                  itemCount++;
                  setState(() {});
                },
                icon: Icon(Icons.add_circle_outline,
                    color: AppColors.whiteColor, size: 28.h),
                padding: EdgeInsets.zero,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
