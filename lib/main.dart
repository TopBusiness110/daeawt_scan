import 'package:daeawt_scan/app_bloc_observer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
//import 'firebase_options.dart';
import 'package:daeawt_scan/injector.dart' as injector;

import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  // await PushNotificationService.instance.initialise();
  // await FlutterWindowManager.clearFlags(FlutterWindowManager.FLAG_SECURE);
  // await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE)
  //     .then((value) {
  //   print('************************************************');
  //   print(value);
  //   print('************************************************');
  // });
  // await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
  //AppColors.getPrimaryColor();
  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  // await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
  //   alert: true,
  //   badge: true,
  //   sound: true,
  // );
  // await pushNotificationService!.initialise();
  // await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
  //   alert: true,
  //   badge: true,
  //   sound: true,
  // );
  await injector.setUp();
  Bloc.observer = AppBlocObserver();

  runApp( 
    EasyLocalization(
        supportedLocales: [Locale("ar",""),Locale("en","")],
        path: "assets/lang",
      saveLocale: true,
      startLocale:const Locale("ar","") ,
      fallbackLocale: const Locale("ar",""),
        child: Phoenix(child:DawatScan() ,),
    ),
  );
}


