import 'package:ecommerce/ui/home/homeScreen/cubit/HomeScreenStates.dart';
import 'package:ecommerce/ui/home/homeScreen/cubit/HomeScreenViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widget/CustomBottomNavigationBar.dart';

class HomeScreenView extends StatelessWidget {
  static const String routeName = 'home';
  HomeScreenViewModel homeScreenViewModel= HomeScreenViewModel();
  HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeScreenViewModel,HomeScreenStates>
      (
      bloc: homeScreenViewModel,
      listener: (context, state) {},
      builder:(context, state) {
        return Scaffold(
          bottomNavigationBar: buildCustomBottomNavigationBar(
              selectedIndex: HomeScreenViewModel.selectedIndex,
              context: context,
              onTabFunction: (index){
                homeScreenViewModel.ChangeBottomNavigationBar(index);
              }
          ),
          body: homeScreenViewModel.
          tabs[HomeScreenViewModel.selectedIndex],
        );
      },
    );
  }
}

