
import 'package:daeawt_scan/features/login/screens/login_screen.dart';
import 'package:daeawt_scan/features/profile/screens/profile_screen.dart';
import 'package:daeawt_scan/features/scanned/screens/scanne_screen.dart';
import 'package:flutter/material.dart';

import '../../core/utils/app_strings.dart';
import '../../features/home/screens/home_screen.dart';
import '../../features/splash/presentation/screens/splash_screen.dart';


class Routes{
  //all strings
  static const String initialRoute = "/";
  static const String loginRoute = "/login";
  static const String homeRoute = "/home";
  static const String profileRoute = "/profile";
  static const String scannedRoute = "/scannedScreen";

}

class AppRoutes{
  //on generate route
 static Route onGenerateRoute( RouteSettings settings){
  switch(settings.name){

    case Routes.initialRoute:
      return MaterialPageRoute(builder: (context) =>const SplashScreen(),);

    case Routes.loginRoute:
      return MaterialPageRoute(builder: (context) =>const LoginScreen(),);

    case Routes.homeRoute:
      return MaterialPageRoute(builder: (context) =>const HomeScreen(),);

    case Routes.profileRoute:
      return MaterialPageRoute(builder: (context) =>const ProfileScreen(),);

    case Routes.scannedRoute:
      return MaterialPageRoute(builder: (context) =>const ScannedScreen(),);



    default:
      return undefinedRoute();
  }
  }
  static Route<dynamic> undefinedRoute(){
   return MaterialPageRoute(
     builder: (context) {
     return const Scaffold(
       body: Center(child: Text(AppStrings.noRouteFound),),
     );
   },);
  }
}
