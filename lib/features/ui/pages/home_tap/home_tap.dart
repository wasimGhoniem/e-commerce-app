import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:e_commerce_app/dependency_injection/di.dart';
import 'package:e_commerce_app/domain/entities/CategoryResponseEntity.dart';
import 'package:e_commerce_app/features/ui/pages/home_tap/cubit/home_tap_states.dart';
import 'package:e_commerce_app/features/ui/pages/home_tap/cubit/home_tap_view_model.dart';
import 'package:e_commerce_app/features/ui/pages/home_tap/widgets/brand.dart';
import 'package:e_commerce_app/features/ui/pages/home_tap/widgets/build_announcement.dart';
import 'package:e_commerce_app/features/ui/pages/home_tap/widgets/category.dart';
import 'package:e_commerce_app/l10n/localization/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../domain/entities/BrandResponseEntity.dart';

class HomeTap extends StatefulWidget {
  const HomeTap({super.key});

  @override
  State<HomeTap> createState() => _HomeTapState();
}

class _HomeTapState extends State<HomeTap> {
  late HomeTapViewModel viewModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel = getIt<HomeTapViewModel>();
    viewModel.getData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                BuildAnnouncement(imageList: viewModel.imagePathList),
                SizedBox(
                  height: 24.h,
                ),
                lineBreak(AppLocalizations.of(context)!.categories),
                SizedBox(
                  height: 16.h,
                ),
                BlocBuilder<HomeTapViewModel, HomeTapStates>(
                  bloc: viewModel,
                  builder: (context, state) {
                    if (state is HomeDataState &&
                        state.categoryFailures != null) {
                      return Column(
                        children: [
                          Text(
                            state.categoryFailures!.errorMessage,
                            style: AppStyles.semiBold20primary,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                viewModel.getData();
                              },
                              child: Text(
                                AppLocalizations.of(context)!.pleaseTryAgain,
                                style: AppStyles.semiBold20primary,
                              ))
                        ],
                      );
                    } else if (state is HomeDataState) {
                      return buildCategorySection(list: state.categoryList);
                    } else {
                      return Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primaryColor,
                        ),
                      );
                    }
                    return Container();
                  },
                ),
                SizedBox(
                  height: 24.h,
                ),
                lineBreak(AppLocalizations.of(context)!.brands),
                SizedBox(
                  height: 16.h,
                ),
                BlocBuilder<HomeTapViewModel, HomeTapStates>(
                  bloc: viewModel,
                  builder: (context, state) {
                    if (state is HomeDataState && state.brandFailures != null) {
                      return Column(
                        children: [
                          Text(
                            state.brandFailures!.errorMessage,
                            style: AppStyles.semiBold20primary,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                viewModel.getData();
                              },
                              child: Text(
                                AppLocalizations.of(context)!.pleaseTryAgain,
                                style: AppStyles.semiBold20primary,
                              ))
                        ],
                      );
                    } else if (state is HomeDataState) {
                      return buildBrandSection(list: state.brandList);
                    } else {
                      return Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primaryColor,
                        ),
                      );
                    }
                    return Container();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget lineBreak(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text, style: AppStyles.light18hintText),
        Text(AppLocalizations.of(context)!.viewAll,
            style: AppStyles.light18hintText.copyWith(fontSize: 12))
      ],
    );
  }

  Widget buildCategorySection({required List<CategoryDataEntity> list}) {
    return SizedBox(
      height: 270.h,
      width: double.infinity,
      child: GridView.builder(
          scrollDirection: Axis.horizontal,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16.h,
            mainAxisSpacing: 16.w,
          ),
          itemCount: list.length,
          itemBuilder: (context, index) {
            return Category(item: list[index]);
          }),
    );
  }

  Widget buildBrandSection({required List<BrandEntity> list}) {
    return SizedBox(
      height: 270.h,
      width: double.infinity,
      child: GridView.builder(
          scrollDirection: Axis.horizontal,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16.h,
            mainAxisSpacing: 16.w,
          ),
          itemCount: list.length,
          itemBuilder: (context, index) {
            return Brand(item: list[index]);
          }),
    );
  }
}
