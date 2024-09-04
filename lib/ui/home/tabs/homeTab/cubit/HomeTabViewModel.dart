import 'package:ecommerce/domain/useCases/CategoriesUseCase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../domain/entities/CategoryOrBrandResponseEntity.dart';
import '../../../../../domain/useCases/BrandsUseCase.dart';
import '../../../../utils/my_assets.dart';
import 'HomeTabStates.dart';

class HomeTabViewModel extends Cubit<HomeTabStates>{

  GetCategoriesUseCase getCategoriesUseCase;
  GetBrandsUseCase getBrandsUseCase;

  HomeTabViewModel({required this.getCategoriesUseCase,
    required this.getBrandsUseCase}):
        super(HomeTabBrandInitialStates());

  List<String> sliderImages = [
    MyAssets.announcement1,
    MyAssets.announcement2,
    MyAssets.announcement3
  ];
  List<CategoryOrBrandEntity>categoriesList=[];
  void getCategories()async{


    emit(HomeTabCategoryLoadingStates(loadingMessage:
    "loading..."));

    var either = await getCategoriesUseCase.invoke();
    // categoriesList=[
    //   CategoryOrBrandEntity(name:"name" ,
    //       id:"id" ,
    //       image: "image",
    //       slug: "slug"),
    //   CategoryOrBrandEntity(name:"name2" ,
    //       id:"id2" ,
    //       image: "image2",
    //       slug: "slug2")];


    either.fold(
            (error) {

      emit(HomeTabCategoryErrorStates(errorMessage: error));
      // categoriesList=[
      //   CategoryOrBrandEntity(name:"name" ,
      //       id:"id" ,
      //       image: "image",
      //       slug: "slug"),
      //   CategoryOrBrandEntity(name:"name2" ,
      //       id:"id2" ,
      //       image: "image2",
      //       slug: "slug2"),
      //   CategoryOrBrandEntity(name:"name2" ,
      //       id:"id2" ,
      //       image: "image2",
      //       slug: "slug2"),
      //   CategoryOrBrandEntity(name:"name2" ,
      //       id:"id2" ,
      //       image: "image2",
      //       slug: "slug2"),
      // ];

    }, (response){
      // categoriesList=[
      //   CategoryOrBrandEntity(name:"name" ,
      //       id:"id" ,
      //       image: "image",
      //       slug: "slug"),
      //   CategoryOrBrandEntity(name:"name2" ,
      //       id:"id2" ,
      //       image: "image2",
      //       slug: "slug2"),
      //   CategoryOrBrandEntity(name:"name2" ,
      //       id:"id2" ,
      //       image: "image2",
      //       slug: "slug2"),
      //   CategoryOrBrandEntity(name:"name2" ,
      //       id:"id2" ,
      //       image: "image2",
      //       slug: "slug2"),
      // ];

      categoriesList=response.data??[];
      emit(HomeTabCategorySuccessStates(categoryResponseEntity:
      response));
    },
    );
  }

  List<CategoryOrBrandEntity>brandsList=[];

  void getBrands()async{
    emit(HomeTabBrandLoadingStates(loadingMessage: "loading..."));
    var either = await getBrandsUseCase.invoke();
    either.fold((error) {
      emit(HomeTabBrandErrorStates(errorMessage: error));
    }, (response){
      brandsList=response.data??[];
      emit(HomeTabBrandSuccessStates(brandResponseEntity: response));
    });
  }

}