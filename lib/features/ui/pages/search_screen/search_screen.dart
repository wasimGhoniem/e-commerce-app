import 'package:e_commerce_app/core/utils/app_assets.dart';
import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:e_commerce_app/dependency_injection/di.dart';
import 'package:e_commerce_app/features/ui/pages/product/widgets/product_item.dart';
import 'package:e_commerce_app/features/ui/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/utils/app_routes.dart';
import 'cubit/search_states.dart';
import 'cubit/search_view_model.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late SearchViewModel viewModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel = getIt<SearchViewModel>();
    viewModel.searchController.addListener(() {
      // This will be called every time the text changes
      viewModel.filterProducts(viewModel.searchController.text);
    });
  }

  @override
  void dispose() {
    //remove listener
    viewModel.searchController.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Search',
          style: AppStyles.semiBold20primary,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocProvider<SearchViewModel>(
          create: (context) => viewModel,
          child: Column(
            children: [
              SizedBox(
                height: 12.h,
              ),
              BlocBuilder<SearchViewModel, SearchStates>(
                builder: (context, state) {
                  return Column(
                    children: [
                      _buildSearchToggle(),
                      SizedBox(height: 16.h),
                      CustomTextFormField(
                        controller: viewModel.searchController,
                        hint: viewModel.isSearchByName
                            ? 'Enter Product Name'
                            : 'Enter Product Price',
                        textStyle: AppStyles.textColor14,
                        borderRadius: 15.r,
                      ),
                    ],
                  );
                },
              ),
              SizedBox(
                height: 16.h,
              ),
              BlocBuilder<SearchViewModel, SearchStates>(
                builder: (context, state) {
                  if (state is SearchErrorState) {
                    return Column(
                      children: [
                        Text(
                          state.failures.errorMessage,
                          style: AppStyles.semiBold20primary,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              //todo call search
                            },
                            child: Text(
                              'please try again',
                              style: AppStyles.semiBold20primary,
                            ))
                      ],
                    );
                  } else if (state is SearchSuccessState) {
                    return Expanded(
                        child: GridView.builder(
                            padding: EdgeInsets.only(bottom: 64.h),
                            itemCount: viewModel.searchResults.length,
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
                                    arguments: viewModel.searchResults[index],
                                  );
                                },
                                child: ProductItem(
                                  item: viewModel.searchResults[index],
                                ),
                              );
                            }));
                  } else {
                    return Column(
                      children: [
                        SizedBox(
                          height: 100.h,
                        ),
                        Center(
                          child: Lottie.asset(AppAssets.searchAnimation),
                        ),
                      ],
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchToggle() {
    return ToggleButtons(
      isSelected: [
        viewModel.isSearchByName,
        !viewModel.isSearchByName,
      ],
      onPressed: (int index) {
        viewModel.searchController.clear();
        viewModel.clearSearch();

        if ((index == 0 && !viewModel.isSearchByName) ||
            (index == 1 && viewModel.isSearchByName)) {
          viewModel.toggleSearchCriteria();
        }
      },
      borderRadius: BorderRadius.circular(16.r),
      selectedColor: AppColors.whiteColor,
      fillColor: AppColors.primaryColor,
      color: AppColors.primaryColor,
      borderColor: AppColors.primaryColor,
      selectedBorderColor: AppColors.primaryColor,
      constraints: BoxConstraints(
        minHeight: 64.h,
        minWidth: 194.w,
      ),
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.text_fields, size: 22.sp),
              SizedBox(width: 8.w),
              Text(
                'by Name',
                style: TextStyle(fontSize: 22.sp),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.attach_money, size: 22.sp),
              SizedBox(width: 8.w),
              Text(
                'by Price',
                style: TextStyle(fontSize: 22.sp),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
