
import 'package:daeawt_scan/features/login/screens/login_screen.dart';
import 'package:daeawt_scan/features/profile/screens/profile_screen.dart';
import 'package:flutter/material.dart';

import '../../core/models/user_model.dart';
import '../../core/utils/app_strings.dart';
import '../../features/apology/presentation/screens/apolory_screen.dart';
import '../../features/confirmed/presentation/screens/confirmed_screen.dart';
import '../../features/contact_us/presentation/screens/contact_us.dart';
import '../../features/failed/presentation/screens/failed_screen.dart';
import '../../features/home/screens/home_screen.dart';
import '../../features/invited/presentation/screens/invited_screen.dart';
import '../../features/messages/presentation/screens/messages_screen.dart';
import '../../features/not_sent/presentation/screens/not_sent_screen.dart';
import '../../features/scan/screens/scan_screen.dart';
import '../../features/scanned/presentation/screens/scanned_screen.dart';
import '../../features/splash/presentation/screens/splash_screen.dart';
import '../../features/waiting/presentation/screens/waiting_screen.dart';


class Routes{
  //all strings
  static const String initialRoute = "/";
  static const String loginRoute = "/login";
  static const String homeRoute = "/home";
  static const String profileRoute = "/profile";
  static const String messagesRoute = "/messagesScreen";
  static const String scannedRoute = "/scannedScreen";
  static const String scanRoute = "/scanScreen";
  static const String confirmedRoute = "/confirmedScreen";
  static const String waitingRoute = "/waitingScreen";
  static const String apologyRoute = "/apologyScreen";
  static const String failedRoute = "/failedScreen";
  static const String notSentRoute = "/notSentScreen";
  static const String invitedRoute = "/invitedScreen";
  static const String contactUsRoute = "/contactUsScreen";


}

class AppRoutes{
  //on generate route
 static Route onGenerateRoute( RouteSettings settings){
  switch(settings.name){

    case Routes.initialRoute:
      return MaterialPageRoute(builder: (context) =>const SplashScreen(),);
    case Routes.contactUsRoute:
      return MaterialPageRoute(builder: (context) =>  const ContactUsScreen(),);
    case Routes.loginRoute:
      return MaterialPageRoute(builder: (context) =>const LoginScreen(),);

    case Routes.homeRoute:
      return MaterialPageRoute(builder: (context) =>const HomeScreen(),);

    case Routes.profileRoute:
      return MaterialPageRoute(builder: (context) =>const ProfileScreen(),);

    case Routes.scanRoute:
      return MaterialPageRoute(builder: (context) => ScanScreen(),);

    case Routes.messagesRoute:
      InvitationModel homeListItemModel=settings.arguments as  InvitationModel;

      return MaterialPageRoute(builder: (context) =>    MessagesScreen(homeListItemModel:homeListItemModel),);
    case Routes.scannedRoute:
      List<dynamic> data=settings.arguments as  List<dynamic>;

      return MaterialPageRoute(builder: (context) =>    ScannedScreen(homeListItemModel: data[0], isfromHome: data[1],),);

    case Routes.confirmedRoute:
      InvitationModel homeListItemModel=settings.arguments as  InvitationModel;

      return MaterialPageRoute(builder: (context) =>    ConfirmedScreen(homeListItemModel: homeListItemModel),);

    case Routes.waitingRoute:
      InvitationModel homeListItemModel=settings.arguments as  InvitationModel;

      return MaterialPageRoute(builder: (context) =>    WaitingScreen(homeListItemModel: homeListItemModel),);

    case Routes.apologyRoute:
      InvitationModel homeListItemModel=settings.arguments as  InvitationModel;

      return MaterialPageRoute(builder: (context) =>    ApologyScreen(homeListItemModel: homeListItemModel),);

    case Routes.failedRoute:
      InvitationModel homeListItemModel=settings.arguments as  InvitationModel;

      return MaterialPageRoute(builder: (context) =>    FailedScreen(homeListItemModel: homeListItemModel),);

    case Routes.notSentRoute:
      InvitationModel homeListItemModel=settings.arguments as  InvitationModel;

      return MaterialPageRoute(builder: (context) =>    NotSentScreen(homeListItemModel: homeListItemModel),);
    case Routes.invitedRoute:
      InvitationModel homeListItemModel=settings.arguments as  InvitationModel;

      return MaterialPageRoute(builder: (context) =>    InvitedScreen(homeListItemModel: homeListItemModel,),);

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
