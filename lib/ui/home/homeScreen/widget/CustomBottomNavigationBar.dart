import 'package:ecommerce/ui/utils/my_assets.dart';
import 'package:ecommerce/ui/utils/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildCustomBottomNavigationBar(
    {required int selectedIndex,
    required Function(int) onTabFunction,
    required BuildContext context}) {
  return ClipRRect(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(20.r),
      topRight: Radius.circular(20.r)
    ),
    child: BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      onTap: onTabFunction,
      currentIndex: selectedIndex,
      backgroundColor: AppColors.primaryColor,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: [
        BottomNavigationBarItem(icon:
        CircleAvatar(
          foregroundColor:
          selectedIndex == 0 ?
          AppColors.primaryColor:AppColors.whiteColor,
          backgroundColor:
          selectedIndex == 0 ?
          AppColors.whiteColor : Colors.transparent,
          radius: 20.r,
          child: ImageIcon(
            size: 40.sp,
            const AssetImage(
                MyAssets.notSelectedHomeIcon
            )
          ),
        ),
        label: "Home"),
        BottomNavigationBarItem(
            icon: CircleAvatar(
              foregroundColor: selectedIndex == 1
                  ? AppColors.primaryColor
                  : AppColors.whiteColor,
              backgroundColor: selectedIndex == 1
                  ? AppColors.whiteColor
                  : Colors.transparent,
              radius: 20.r,
              child: ImageIcon(
                size: 40.sp,
                const AssetImage(
                  MyAssets.notSelectedCategoryIcon,
                ),
              ),
            ),
            label: "CATEGORY"),
        BottomNavigationBarItem(
            icon: CircleAvatar(
              foregroundColor: selectedIndex == 2
                  ? AppColors.primaryColor
                  : AppColors.whiteColor,
              backgroundColor: selectedIndex == 2
                  ? AppColors.whiteColor
                  : Colors.transparent,
              radius: 20.r,
              child: ImageIcon(
                size: 40.sp,
                const AssetImage(
                  MyAssets.notSelectedWishlistIcon,
                ),
              ),
            ),
            label: "WISHLIST"),
        BottomNavigationBarItem(
            icon: CircleAvatar(
              foregroundColor: selectedIndex == 3
                  ? AppColors.primaryColor
                  : AppColors.whiteColor,
              backgroundColor: selectedIndex == 3
                  ? AppColors.whiteColor
                  : Colors.transparent,
              radius: 20.r,
              child: ImageIcon(
                size: 40.sp,
                const AssetImage(
                  MyAssets.notSelectedAccountIcon,
                ),
              ),
            ),
            label: "ACCOUNT")
        //BottomNavigationBarItem(icon: icon)
      ],
    ),
  );
}
