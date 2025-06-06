import 'package:e_commerce_app/core/utils/app_assets.dart';
import 'package:e_commerce_app/features/ui/pages/product/cubit/product_screen_view_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/custom_app_bar.dart';
import '../cart_screen/cubit/cart_view_model.dart';
import 'cubit/home_states.dart';
import 'cubit/home_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewModel viewModel = HomeViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.screenList;
    CartViewModel.get(context).getCartData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeViewModel, HomeStates>(
      bloc: viewModel,
      builder: (BuildContext context, state) {
        return Scaffold(
            appBar: CustomAppBar(),
            body: viewModel.screenList[viewModel.selectedIndex],
            bottomNavigationBar: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.r),
                  topRight: Radius.circular(15.r),
                ),
                child: BottomNavigationBar(
                    onTap: viewModel.changeSelectedIndex,
                    items: [
                      buildBottomNavigationBarItem(
                          AppAssets.selectedHomeIcon,
                          AppAssets.unselectedHomeIcon,
                          viewModel.selectedIndex == 0),
                      buildBottomNavigationBarItem(
                          AppAssets.selectedProductIcon,
                          AppAssets.unselectedProductIcon,
                          viewModel.selectedIndex == 1),
                      buildBottomNavigationBarItem(
                          AppAssets.selectedFavoriteIcon,
                          AppAssets.unselectedFavoriteIcon,
                          viewModel.selectedIndex == 2),
                      buildBottomNavigationBarItem(
                          AppAssets.selectedProfileIcon,
                          AppAssets.unselectedProfileIcon,
                          viewModel.selectedIndex == 3),
                    ])));
      },
    );
  }

  BottomNavigationBarItem buildBottomNavigationBarItem(
      String selectedIcon, String unselectedIcon, bool isSelected) {
    return BottomNavigationBarItem(
      icon:
          isSelected ? Image.asset(selectedIcon) : Image.asset(unselectedIcon),
      label: '',
    );
  }
}
