import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:e_commerce_app/features/ui/pages/product_details_screen/widgets/custom_image_slide_show.dart';
import 'package:e_commerce_app/features/ui/pages/product_details_screen/widgets/custom_rating_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

import '../../../../domain/entities/ProductResponseEntity.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  bool isDescriptionExpanded = false;

  @override
  Widget build(BuildContext context) {
    ProductEntity item =
        ModalRoute.of(context)!.settings.arguments as ProductEntity;
    List<String> itemImagesList = item.images!;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text('Product Details',
                style: AppStyles.light14hTextColor.copyWith(fontSize: 20)),
            centerTitle: true,
            actions: [
              Icon(
                Icons.search,
                color: AppColors.primaryColor,
                size: 30.h,
              ),
              SizedBox(
                width: 26.w,
              ),
              Icon(Icons.shopping_basket_outlined,
                  color: AppColors.primaryColor, size: 30.h),
              SizedBox(
                width: 16.w,
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 300.h,
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(vertical: 16.h),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.primary30Opacity),
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Stack(
                      children: [
                        CustomImageSlideShow(itemImagesList: itemImagesList),
                        Positioned(
                          top: 2.h,
                          right: 2.w,
                          child: CircleAvatar(
                            radius: 25.r,
                            backgroundColor: AppColors.transparentColor,
                            child: Center(
                              child: IconButton(
                                  onPressed: () {
                                    //todo add to favorite
                                  },
                                  icon: Icon(
                                    Icons.favorite_border_rounded,
                                    color: AppColors.primaryColor,
                                  )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 250.w,
                        child: Text(
                          item.title ?? '',
                          style: AppStyles.light14hTextColor
                              .copyWith(fontSize: 18),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                      Text(
                        'EGP ${item.price}',
                        style:
                            AppStyles.light14hTextColor.copyWith(fontSize: 18),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  CustomRatingRow(item: item),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Description',
                    style: AppStyles.light14hTextColor.copyWith(fontSize: 18),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  ReadMoreText(
                    item.description ?? '',
                    trimMode: TrimMode.Line,
                    trimLines: 2,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: 'Show less',
                    moreStyle: AppStyles.light14hTextColor,
                    lessStyle: AppStyles.light14hTextColor,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total price',
                            style: AppStyles.light18hintTextColor,
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Text(
                            'EGP ${item.price}',
                            style: AppStyles.light14hTextColor
                                .copyWith(fontSize: 18),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 26,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                          onPressed: () {},
                          child: Row(
                            children: [
                              Icon(
                                Icons.shopping_basket_outlined,
                                color: AppColors.whiteColor,
                              ),
                              SizedBox(
                                width: 12.w,
                              ),
                              Text(
                                'Add to cart',
                                style: AppStyles.medium18White,
                              )
                            ],
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 64.h,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
