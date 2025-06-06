import 'package:e_commerce_app/core/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';
import '../pages/cart_screen/cubit/cart_states.dart';
import '../pages/cart_screen/cubit/cart_view_model.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.searchScreenRoute);
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(45.r),
                      border: Border.all(color: AppColors.primaryColor)),
                  child: IgnorePointer(
                    child: TextField(
                      readOnly: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(45.r),
                            borderSide: BorderSide(
                              color: AppColors.primaryColor,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(45.r),
                            borderSide: BorderSide(
                              color: AppColors.primaryColor,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(45.r),
                            borderSide: BorderSide(
                              color: AppColors.primaryColor,
                            ),
                          ),
                          hintText: 'what do you search for?',
                          hintStyle:
                              AppStyles.light18hintText.copyWith(fontSize: 12),
                          prefixIcon: Icon(
                            Icons.search,
                            color: AppColors.primaryColor,
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 8.h)),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 12.w,
            ),
            IconButton(onPressed: () {
              Navigator.pushNamed(context, AppRoutes.cartRoute);
            }, icon: BlocBuilder<CartViewModel, CartStates>(
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
            ))
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(100.h);
}
