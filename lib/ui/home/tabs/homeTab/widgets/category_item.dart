import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/domain/entities/CategoryOrBrandResponseEntity.dart';
import 'package:flutter/material.dart';
import '../../../../utils/my_assets.dart';
import '../../../../utils/my_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryOrBrandItem extends StatelessWidget {
  CategoryOrBrandEntity categoryEntity;
  CategoryOrBrandItem({super.key, required this.categoryEntity});
  //todo: categoryOrBrand model

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: CachedNetworkImage(
            imageUrl: categoryEntity.image??"",
            placeholder: (context, url) =>
                Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) =>
                Center(child: CircularProgressIndicator()),
            width: 50,
            height: 50,
          ),
        ),

        // Expanded(
        //   flex: 8,
        //   child: CircleAvatar(
        //      backgroundImage: NetworkImage
        //        (categoryEntity.image??""),
        //     radius: 50.r,
        //   ),
        // ),
        SizedBox(
          height: 8.h,
        ),
        Expanded(
          flex: 2,
          child: Text(categoryEntity.name??"",
            textWidthBasis: TextWidthBasis.longestLine,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: 14.sp,
                  color: AppColors.darkPrimaryColor,
                  fontWeight: FontWeight.normal,
                ),
          ),
        )
      ],
    );
  }
}
