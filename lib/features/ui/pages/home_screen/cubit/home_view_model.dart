import 'package:e_commerce_app/features/ui/pages/home_tap/home_tap.dart';

import 'package:e_commerce_app/features/ui/pages/product/product_screen.dart';
import 'package:e_commerce_app/features/ui/pages/profile/profile_screen.dart';
import 'package:e_commerce_app/features/ui/pages/wishlist_screen/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_states.dart';

class HomeViewModel extends Cubit<HomeStates> {
  HomeViewModel() : super(HomeInitialState());

  int selectedIndex = 0;
  List<Widget> screenList = [
    HomeTap(),
    ProductScreen(),
    WishlistScreen(),
    ProfileScreen()
  ];

  void changeSelectedIndex(int index) {
    selectedIndex = index;
    emit(ChangeSelectedIndexState());
  }
}
