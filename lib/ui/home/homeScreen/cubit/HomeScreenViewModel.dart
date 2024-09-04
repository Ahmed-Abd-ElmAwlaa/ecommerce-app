import 'package:ecommerce/ui/home/homeScreen/cubit/HomeScreenStates.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../tabs/favoriteTab/FavoriteTab.dart';
import '../../tabs/homeTab/HomeTabView.dart';
import '../../tabs/productTab/product_list_tab.dart';
import '../../tabs/profileTab/ProfileTab.dart';

class HomeScreenViewModel extends Cubit<HomeScreenStates>{
  HomeScreenViewModel():super(HomeScreenInitialState());
  static int selectedIndex = 0;
  List<Widget> tabs=[
    HomeTab(),
    ProductListTab(),
    FavoriteTab(),
    ProfileTab()
  ];
  void ChangeBottomNavigationBar(int newIndex){
    HomeScreenInitialState();
    selectedIndex=newIndex;
    emit(ChangeBottomNavigationBarState());
  }

}