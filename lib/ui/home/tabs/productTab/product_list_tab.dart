import 'package:ecommerce/data/di.dart';
import 'package:ecommerce/ui/home/cart/cart_screen.dart';
import 'package:ecommerce/ui/home/tabs/productTab/cubit/ProductTabStates.dart';
import 'package:ecommerce/ui/home/tabs/productTab/cubit/ProductTabViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../utils/my_assets.dart';
import '../../../utils/my_colors.dart';
import '../../product_details/product_details_view.dart';
import '../homeTab/widgets/custom_text_field.dart';
import 'widgets/grid_view_card_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductListTab extends StatelessWidget {
  ProductTabViewModel productTabViewModel =
  ProductTabViewModel(
      getProductsUseCase: injectGetProductsUseCase(), 
      addToCartUseCase: injectAddToCartUseCase()
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductTabViewModel>(
      create: (context) => productTabViewModel..getProducts(),
      child: BlocBuilder<ProductTabViewModel, ProductTabStates>(
          builder: (context, state) =>
              SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 17.w),
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
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
                        Row(children: [
                          Expanded(
                            child: CustomTextField(),
                          ),
                          SizedBox(
                            width: 24.w,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).
                              pushReplacementNamed(CartScreen.routeName);
                            },
                            child: Badge(
                              label: Text(productTabViewModel.numOfCartItem.toString()),
                              alignment: Alignment.topCenter,
                              child: ImageIcon(
                                const AssetImage(MyAssets.shoppingCart),
                                size: 28.sp,
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ),
                        ]),
                        SizedBox(
                          height: 24.h,
                        ),
                        state is HomeTabProductInitialStates?
                        const Center(
                          child: CircularProgressIndicator(
                            color: AppColors.primaryColor,
                          ),
                        )
                            :
                        Expanded(
                          child: GridView.builder(
                            itemCount: productTabViewModel.
                            productsList.length,
                            gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 2 / 2.4,
                                crossAxisSpacing: 16.w,
                                mainAxisSpacing: 16.h
                            ),
                            itemBuilder: (context, index) {
                              return InkWell(
                                splashColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                    ProductDetailsView.routeName,
                                    arguments: productTabViewModel.productsList[index]
                                  );
                                },
                                child: GridViewCardItem(productEntity:
                                productTabViewModel.productsList[index]),
                              );
                            },
                          ),
                        )
                      ]),
                ),
              )
      ),
    );
  }
}
