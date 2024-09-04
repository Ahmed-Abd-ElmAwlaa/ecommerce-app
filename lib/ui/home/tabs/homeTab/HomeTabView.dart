import 'package:ecommerce/data/di.dart';
import 'package:ecommerce/ui/home/tabs/homeTab/cubit/HomeTabStates.dart';
import 'package:ecommerce/ui/home/tabs/homeTab/cubit/HomeTabViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../utils/my_assets.dart';
import '../../../utils/my_colors.dart';
import 'widgets/annountcements_section.dart';
import 'widgets/categories_or_brands_section.dart';
import 'widgets/custom_search_with_shopping_cart.dart';
import 'widgets/row_section_widgets.dart';

class HomeTab extends StatelessWidget {
  HomeTabViewModel homeTabViewModel = HomeTabViewModel(
      getCategoriesUseCase: injectGetCategoriesUseCase(),
      getBrandsUseCase: injectBrandsUseCase());

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeTabViewModel, HomeTabStates>(
      bloc: homeTabViewModel..getCategories()..getBrands(),
      builder: (context, state) {
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 17.w),
            child: SingleChildScrollView(
              child: Column(
                //mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Image.asset(
                    MyAssets.logo,
                    color: AppColors.primaryColor,
                  ),
                  SizedBox(
                    height: 18.h,
                  ),
                  CustomSearchWithShoppingCart(),
                  SizedBox(
                    height: 16.h,
                  ),
                  AnnouncementsSection(
                      sliderImages: homeTabViewModel.sliderImages),
                  SizedBox(
                    height: 16.h,
                  ),
                  RowSectionWidget(name: 'Categories'),
                  SizedBox(
                    height: 24.h,
                  ),
                  state is HomeTabCategoryLoadingStates
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: AppColors.primaryColor,
                          ),
                        )
                      :
                      // Text(homeTabViewModel.
                      // categoriesList.length.toString()),
                      CategoriesOrBrandsSection(
                          list: homeTabViewModel.categoriesList),
                  SizedBox(
                    height: 24.h,
                  ),
                  RowSectionWidget(name: 'Brands'),
                  SizedBox(
                    height: 24.h,
                  ),
                  state is HomeTabBrandLoadingStates
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: AppColors.primaryColor,
                          ),
                        )
                      : CategoriesOrBrandsSection(
                          list: homeTabViewModel.brandsList,
                        ),

                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
