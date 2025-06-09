import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/core/utils/app_assets.dart';
import 'package:e_commerce_app/domain/entities/GetWishlistResponseEntity.dart';
import 'package:e_commerce_app/features/ui/pages/wishlist_screen/cubit/wishlist_view_model.dart';
import 'package:e_commerce_app/l10n/localization/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../product/cubit/product_screen_view_model.dart';

class WishlistItem extends StatelessWidget {
  final WishlistDataEntity item;

  const WishlistItem({super.key, required this.item});

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
                _buildItemHeader(context),
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
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.r)),
                              backgroundColor: AppColors.primaryColor),
                          onPressed: () {
                            ProductScreenViewModel.get(context)
                                .addToCart(item.id ?? '', context);
                          },
                          child: Text(
                            AppLocalizations.of(context)!.addToWishlist,
                            style: AppStyles.light16White,
                          ),
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
      child: CachedNetworkImage(imageUrl: item.imageCover ?? ''),
    );
  }

  _buildItemHeader(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 8.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              item.title ?? '',
              style: AppStyles.light14hTextColor,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
          SizedBox(
            width: 8.w,
          ),
          InkWell(
              onTap: () {
                //todo delete wishlist item
                WishlistViewModel.get(context)
                    .deleteWishlistItem(item.id ?? '');
              },
              child: Image.asset(AppAssets.blueHeartIcon))
        ],
      ),
    );
  }
}
