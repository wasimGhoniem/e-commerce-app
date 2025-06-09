import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/core/utils/app_assets.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:e_commerce_app/features/ui/pages/product/cubit/product_screen_view_model.dart';
import 'package:e_commerce_app/features/ui/pages/product/cubit/product_states.dart';
import 'package:e_commerce_app/features/ui/pages/wishlist_screen/cubit/wishlist_view_model.dart';
import 'package:e_commerce_app/l10n/localization/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../domain/entities/ProductResponseEntity.dart';

class ProductItem extends StatelessWidget {
  final ProductEntity item;

  const ProductItem({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: AppColors.primary30Opacity, width: 2),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15.r),
                      topLeft: Radius.circular(15.r)),
                  child: CachedNetworkImage(
                    imageUrl: item.imageCover!,
                    width: double.infinity,
                    height: 128.h,
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
                Positioned(
                  top: 2.h,
                  right: 2.w,
                  child: Center(
                    child: InkWell(onTap: () {
                      ProductScreenViewModel.get(context)
                          .toggleWishlist(item.id ?? '');
                      //todo add to wishlist
                      WishlistViewModel.get(context)
                          .addProductToWishlist(item.id ?? '');
                    }, child:
                        BlocBuilder<ProductScreenViewModel, ProductStates>(
                      builder: (context, state) {
                        final isWishlist = ProductScreenViewModel.get(context)
                            .wishlistProductIds
                            .contains(item.id);
                        return isWishlist
                            ? Image.asset(AppAssets.blueHeartIcon)
                            : Image.asset(AppAssets.whiteHeartIcon);
                      },
                    )),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    item.title!,
                    style: AppStyles.light14hTextColor,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${AppLocalizations.of(context)!.currency} ${item.price}',
                        style:
                            AppStyles.light14hTextColor.copyWith(fontSize: 11),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        '${AppLocalizations.of(context)!.currency} ${(item.price! * 1.2).toInt()}',
                        style: AppStyles.light11Discount.copyWith(
                          decoration: TextDecoration.lineThrough,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Row(
                    children: [
                      Text(
                        '${AppLocalizations.of(context)!.review} (${item.ratingsAverage})',
                        style: AppStyles.light18hintTextColor
                            .copyWith(fontSize: 10),
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.orange,
                        size: 15.h,
                      ),
                      SizedBox(
                        width: 32.w,
                      ),
                      InkWell(
                        onTap: () {
                          //todo add item to cart
                          ProductScreenViewModel.get(context)
                              .addToCart(item.id ?? '', context);
                        },
                        child: CircleAvatar(
                          radius: 14.r,
                          backgroundColor: AppColors.primaryColor,
                          child: Icon(
                            Icons.add,
                            color: AppColors.whiteColor,
                            size: 22.h,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
