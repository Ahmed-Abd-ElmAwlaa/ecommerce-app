import 'package:ecommerce/ui/auth/login/login_screen.dart';
import 'package:ecommerce/ui/auth/register/register_screen.dart';
import 'package:ecommerce/ui/home/cart/cart_screen.dart';
import 'package:ecommerce/ui/home/homeScreen/HomeScreenView.dart';
import 'package:ecommerce/ui/home/product_details/product_details_view.dart';
import 'package:ecommerce/ui/home/tabs/productTab/product_list_tab.dart';
import 'package:ecommerce/ui/splash/splash_screen.dart';
import 'package:ecommerce/ui/utils/app_theme.dart';
import 'package:ecommerce/ui/utils/my_bloc_observer.dart';
import 'package:ecommerce/ui/utils/shared_preference_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver() ;
  await SharedPreferenceUtils.init();
  String route;
   var user = SharedPreferenceUtils.getData(key: "Token");
   if(user == null){
     route = LoginScreen.routeName;
   }else{
     route = HomeScreenView.routeName;

   }
  runApp(MyApp(route));
}
class MyApp extends StatelessWidget {
  String route;
  MyApp(this.route);
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(430, 932),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: route,
            routes: {
              SplashScreen.routeName: (context) => SplashScreen(),
              LoginScreen.routeName: (context) => LoginScreen(),
              RegisterScreen.routeName: (context) => RegisterScreen(),
              HomeScreenView.routeName: (context) => HomeScreenView(),
              ProductDetailsView.routeName: (context) => ProductDetailsView(),
              CartScreen.routeName: (context) => CartScreen(),
             },
            theme: AppTheme.mainTheme,
          );
        });
  }
}
