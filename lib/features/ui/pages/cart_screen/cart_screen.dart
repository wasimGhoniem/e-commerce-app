import 'package:e_commerce_app/core/utils/app_assets.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:e_commerce_app/core/utils/flutter_toast_utils.dart';
import 'package:e_commerce_app/features/ui/pages/cart_screen/cubit/cart_states.dart';
import 'package:e_commerce_app/features/ui/pages/cart_screen/cubit/cart_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../domain/entities/GetCartResponseEntity.dart';
import 'cart_item.dart';

class CartScreen extends StatefulWidget {
  CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CartViewModel.get(context).getCartData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cart',
          style: AppStyles.light18hintText.copyWith(fontSize: 20),
        ),
        centerTitle: true,
        actions: [
          Icon(
            Icons.search_outlined,
            color: AppColors.primaryColor,
          ),
          Padding(
              padding: EdgeInsets.only(right: 16.w, left: 32.w),
              child: BlocBuilder<CartViewModel, CartStates>(
                builder: (BuildContext context, state) {
                  return Badge(
                    alignment: AlignmentDirectional.topStart,
                    label: Text(
                        CartViewModel.get(context).cartItemNumber.toString()),
                    backgroundColor: AppColors.primaryColor,
                    child: Image.asset(
                      AppAssets.cartImage,
                      height: 36.h,
                    ),
                  );
                },
              )),
        ],
      ),
      body: BlocConsumer<CartViewModel, CartStates>(
        listener: (context, state) {
          if (state is DeleteItemInCartSuccessState) {
            return FlutterToastUtils.showToast('item deleted .');
          }
        },
        bloc: CartViewModel.get(context)..getCartData(),
        builder: (context, state) {
          if (state is GetCartErrorState) {
            return Column(
              children: [
                Text(
                  state.failures.errorMessage,
                  style: AppStyles.semiBold20primary,
                ),
                ElevatedButton(
                    onPressed: () {
                      CartViewModel.get(context).getCartData();
                    },
                    child: Text(
                      'please try again',
                      style: AppStyles.semiBold20primary,
                    ))
              ],
            );
            //success
          } else if (state is UpdateItemInCartErrorState) {
            return Column(
              children: [
                Text(
                  state.failures.errorMessage,
                  style: AppStyles.semiBold20primary,
                ),
                ElevatedButton(
                    onPressed: () {
                      CartViewModel.get(context).getCartData();
                    },
                    child: Text(
                      'please try again',
                      style: AppStyles.semiBold20primary,
                    ))
              ],
            );
            //success
          } else if (state is DeleteItemInCartErrorState) {
            return Column(
              children: [
                Text(
                  state.failures.errorMessage,
                  style: AppStyles.semiBold20primary,
                ),
                ElevatedButton(
                    onPressed: () {
                      CartViewModel.get(context).getCartData();
                    },
                    child: Text(
                      'please try again',
                      style: AppStyles.semiBold20primary,
                    ))
              ],
            );
            //success
          } else if (state is GetCartSuccessState) {
            List<GetCartProductsEntity> itemList =
                state.getCartResponseEntity.data!.products!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Expanded(
                      child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(
                      height: 24.h,
                    ),
                    itemBuilder: (context, index) {
                      return CartItem(
                        item: itemList[index],
                      );
                    },
                    itemCount: itemList.length,
                  )),
                  _buildCheckOut(
                      totalPrice: state
                          .getCartResponseEntity.data!.totalCartPrice!
                          .toInt()),
                ],
              ),
            );
          } else if (state is DeleteItemInCartSuccessState) {
            List<GetCartProductsEntity> itemList =
                state.getCartResponseEntity.data!.products!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Expanded(
                      child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(
                      height: 24.h,
                    ),
                    itemBuilder: (context, index) {
                      return CartItem(
                        item: itemList[index],
                      );
                    },
                    itemCount: itemList.length,
                  )),
                  _buildCheckOut(
                      totalPrice: state
                          .getCartResponseEntity.data!.totalCartPrice!
                          .toInt()),
                ],
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              ),
            );
          }
        },
      ),
    );
  }

  _buildCheckOut({required int totalPrice}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Total price',
              style: AppStyles.light18hintTextColor,
            ),
            SizedBox(
              height: 12.h,
            ),
            Text(
              'EGP $totalPrice',
              style: AppStyles.light14hTextColor.copyWith(fontSize: 18),
            ),
          ],
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(15.sp),
              backgroundColor: AppColors.primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
            ),
            onPressed: () {},
            child: Row(
              children: [
                Text(
                  'CheckOut',
                  style: AppStyles.medium18White,
                ),
                SizedBox(
                  width: 8.w,
                ),
                Icon(
                  Icons.arrow_forward,
                  color: AppColors.whiteColor,
                )
              ],
            ))
      ],
    );
  }
}
