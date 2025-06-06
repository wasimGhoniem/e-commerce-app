import 'package:e_commerce_app/core/utils/flutter_toast_utils.dart';
import 'package:e_commerce_app/features/ui/pages/wishlist_screen/cubit/wishlist_states.dart';
import 'package:e_commerce_app/features/ui/pages/wishlist_screen/cubit/wishlist_view_model.dart';
import 'package:e_commerce_app/features/ui/pages/wishlist_screen/wishlist_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../domain/entities/GetWishlistResponseEntity.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WishlistViewModel.get(context).getWishlistItems();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
      child: Column(
        children: [
          BlocConsumer<WishlistViewModel, WishlistStates>(
            listener: (context, state) {
              if (state is DeleteWishlistSuccessState) {
                return FlutterToastUtils.showToast('item deleted ');
              }
            },
            builder: (context, state) {
              if (state is GetWishlistErrorState) {
                return Column(
                  children: [
                    Text(
                      state.failures.errorMessage,
                      style: AppStyles.semiBold20primary,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          WishlistViewModel.get(context).getWishlistItems();
                        },
                        child: Text(
                          'please try again',
                          style: AppStyles.semiBold20primary,
                        ))
                  ],
                );
              } else if (state is DeleteWishlistErrorState) {
                return Column(
                  children: [
                    Text(
                      state.failures.errorMessage,
                      style: AppStyles.semiBold20primary,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          WishlistViewModel.get(context).getWishlistItems();
                        },
                        child: Text(
                          'please try again',
                          style: AppStyles.semiBold20primary,
                        ))
                  ],
                );
              } else if (state is GetWishlistSuccessState) {
                List<WishlistDataEntity> itemsList =
                    state.getWishlistResponseEntity.data!;
                return Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) =>
                          WishlistItem(item: itemsList[index]),
                      separatorBuilder: (context, index) => SizedBox(
                            height: 37.h,
                          ),
                      itemCount: itemsList.length),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
