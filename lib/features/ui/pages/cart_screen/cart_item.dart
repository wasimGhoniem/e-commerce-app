import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:e_commerce_app/features/ui/pages/cart_screen/cubit/cart_view_model.dart';
import 'package:e_commerce_app/l10n/localization/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../domain/entities/GetCartResponseEntity.dart';

class CartItem extends StatelessWidget {
  final GetCartProductsEntity item;

  const CartItem({super.key, required this.item});

  final int itemCount = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 142.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18.r),
          border: Border.all(
            color: AppColors.primary30Opacity,
          )),
      child: Row(
        children: [
          _buildImageContainer(),
          SizedBox(
            width: 8.w,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildItemHeader(
                    onTap: () => CartViewModel.get(context)
                        .deleteItemInCart(item.product!.id ?? '')),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 8.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${AppLocalizations.of(context)!.currency} ${item.price ?? ''}',
                        style: AppStyles.light14hTextColor,
                      ),
                      Container(
                        height: 50.h,
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                                onPressed: () {
                                  CartViewModel.get(context).updateItemInCart(
                                      item.product!.id ?? '',
                                      item.count!.toInt() - 1);
                                },
                                icon: Icon(
                                  Icons.remove_circle_outline_rounded,
                                  color: AppColors.whiteColor,
                                  size: 25.sp,
                                )),
                            Text(
                              item.count.toString(),
                              style: AppStyles.light12White,
                            ),
                            IconButton(
                                //todo increment count
                                onPressed: () {
                                  CartViewModel.get(context).updateItemInCart(
                                      item.product!.id ?? '',
                                      item.count!.toInt() + 1);
                                },
                                icon: Icon(
                                  Icons.add_circle_outline_rounded,
                                  color: AppColors.whiteColor,
                                  size: 25.sp,
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildImageContainer() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: AppColors.primary30Opacity,
          )),
      child: CachedNetworkImage(imageUrl: item.product!.imageCover ?? ''),
    );
  }

  _buildItemHeader({required VoidCallback onTap}) {
    return Padding(
      padding: EdgeInsets.only(right: 8.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              item.product!.title ?? '',
              style: AppStyles.light14hTextColor,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
          SizedBox(
            width: 8.w,
          ),
          InkWell(
              onTap: onTap,
              child: Icon(
                Icons.delete_outline,
                color: AppColors.primaryColor,
              ))
        ],
      ),
    );
  }
}
