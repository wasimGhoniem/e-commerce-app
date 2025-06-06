import 'package:e_commerce_app/core/utils/app_routes.dart';
import 'package:e_commerce_app/features/ui/pages/product/cubit/product_screen_view_model.dart';
import 'package:e_commerce_app/features/ui/pages/product/cubit/product_states.dart';
import 'package:e_commerce_app/features/ui/pages/product/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/flutter_toast_utils.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ProductScreenViewModel.get(context).getAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BlocListener<ProductScreenViewModel, ProductStates>(
              listener: (context, state) {
                if (state is AddCartSuccessStates) {
                  return FlutterToastUtils.showToast('added successfully');
                } else if (state is AddCartErrorStates) {
                  return FlutterToastUtils.showToast(
                      state.failures.errorMessage);
                }
              },
              child: BlocBuilder<ProductScreenViewModel, ProductStates>(
                builder: (context, state) {
                  if (state is ProductErrorStates) {
                    return Column(
                      children: [
                        Text(
                          state.failures.errorMessage,
                          style: AppStyles.semiBold20primary,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              ProductScreenViewModel.get(context)
                                  .getAllProducts();
                            },
                            child: Text(
                              'please try again',
                              style: AppStyles.semiBold20primary,
                            ))
                      ],
                    );
                  } else if (state is ProductSuccessStates ||
                      state is AddCartSuccessStates ||
                      state is ChangeWishListIconStates) {
                    final productList = (state is ProductSuccessStates)
                        ? state.productResponseEntity.data!
                        : context.read<ProductScreenViewModel>().productList;
                    return Expanded(
                        child: GridView.builder(
                            padding: EdgeInsets.only(bottom: 64.h),
                            itemCount: productList.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    childAspectRatio: 2 / 3.4.h,
                                    crossAxisSpacing: 16.w,
                                    mainAxisSpacing: 16.h,
                                    crossAxisCount: 2),
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    AppRoutes.productDetailsRoute,
                                    arguments: productList[index],
                                  );
                                },
                                child: ProductItem(
                                  item: productList[index],
                                ),
                              );
                            }));
                  } else {
                    return Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ),
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    ));
  }
// Widget buildProductList(){
//   return
// }
}
