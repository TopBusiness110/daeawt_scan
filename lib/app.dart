
// import 'package:screenshot_callback/screenshot_callback.dart';

import 'package:daeawt_scan/features/home/cubit/home_cubit.dart';
import 'package:daeawt_scan/features/login/cubit/login_cubit.dart';
import 'package:daeawt_scan/features/profile/cubit/profile_cubit.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'config/routes/app_routes.dart';
import 'config/themes/app_theme.dart';

import 'core/preferences/preferences.dart';
import 'core/utils/app_colors.dart';
import 'core/utils/app_strings.dart';
import 'package:flutter/material.dart';

import 'package:daeawt_scan/injector.dart' as injector;
import 'dart:developer' as developer;

import 'core/utils/toast_message_method.dart';
import 'features/apology/cubit/appology_cubit.dart';
import 'features/confirmed/cubit/confirmed_cubit.dart';
import 'features/failed/presentation/cubit/faild_cubit.dart';
import 'features/invited/presentation/cubit/invited_cubit.dart';
import 'features/messages/presentation/cubit/messages_cubit.dart';
import 'features/not_sent/cubit/notsent_cubit.dart';
import 'features/scan/cubit/scan_cubit.dart';
import 'features/scanned/presentation/cubit/scanned_cubit.dart';
import 'features/waiting/cubit/waiting_cubit.dart';
// import 'features/downloads_videos/cubit/downloads_videos_cubit.dart';





class DawatScan extends StatefulWidget {
  const DawatScan({Key? key}) : super(key: key);

  @override
  State<DawatScan> createState() => _DawatScanState();
}

class _DawatScanState extends State<DawatScan> {
  // ConnectivityResult _connectionStatus = ConnectivityResult.none;
  //
  // final Connectivity _connectivity = Connectivity();
  // late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  bool isThemes = false;
  String shortcut = 'no action set';

  @override
  void initState() {
    super.initState();
    initConnectivity();
    // _connectivitySubscription =
    //     _connectivity.onConnectivityChanged.listen((event) {
    //       if (event.index == 4) {
    //         toastMessage(
    //           'no_internet_connection'.tr(),
    //           context,
    //           color: AppColors.error,
    //         );
    //       } else if (event == 1 || event == 3) {
    //         toastMessage(
    //           'internet_connection'.tr(),
    //           context,
    //           color: AppColors.success,
    //         );
    //       }
    //       _updateConnectionStatus(event);
    //     });
  }

  @override
  void dispose() {
   // _connectivitySubscription.cancel();
    super.dispose();
  }

  Future<void> initConnectivity() async {
    // late ConnectivityResult result;
    //  try {
    //    result = await _connectivity.checkConnectivity();
    //  } on PlatformException catch (e) {
    //    developer.log('Couldn\'t check connectivity status', error: e);
    //    return;
    //  }
    //   if (!mounted) {
    //     return Future.value(null);
    //   }
    //   return _updateConnectionStatus(result);
    // }

    // Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    //   setState(() {
    //     _connectionStatus = result;
    //   });
    // }
  }
  @override
  Widget build(BuildContext context) {
    // print(text);

    Preferences.instance.savedLang(
      EasyLocalization.of(context)!.locale.languageCode,
    );
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => injector.serviceLocator<LoginCubit>(),
          ),
          BlocProvider(
            create: (_) => injector.serviceLocator<HomeCubit>(),
          ),
          BlocProvider(
            create: (_) => injector.serviceLocator<ProfileCubit>(),
          ),
       BlocProvider(
            create: (_) => injector.serviceLocator<MessagesCubit>(),
          ),

          BlocProvider(
            create: (_) => injector.serviceLocator<ScannedCubit>(),
          ),
          BlocProvider(
            create: (_) => injector.serviceLocator<WaitingCubit>(),
          ),
          BlocProvider(
            create: (_) => injector.serviceLocator<FaildCubit>(),
          ),
          BlocProvider(
            create: (_) => injector.serviceLocator<NotsentCubit>(),
          ),
          BlocProvider(
            create: (_) => injector.serviceLocator<AppologyCubit>(),
          ),
          BlocProvider(
            create: (_) => injector.serviceLocator<ConfirmedCubit>(),
          ),
          BlocProvider(
            create: (_) => injector.serviceLocator<InvitedCubit>(),
          ),
          BlocProvider(
            create: (_) => injector.serviceLocator<ScanCubit>(),
          ),
        ],

          child: GetMaterialApp(
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            theme: appTheme(),
            themeMode: ThemeMode.light,
            darkTheme: ThemeData.light(),
            // standard dark theme
            localizationsDelegates: context.localizationDelegates,
            debugShowCheckedModeBanner: false,
            title: AppStrings.appName,
            onGenerateRoute: AppRoutes.onGenerateRoute,
          ),
        );
  }
}
