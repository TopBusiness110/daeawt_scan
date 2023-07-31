import 'dart:async';


import 'package:daeawt_scan/core/utils/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/models/user_model.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../../preferences/preferences.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer;

  _goNext() {
    //  Navigator.pushNamed(context, Routes.chooseCountryRoute);
    _getStoreUser();
  }

  _startDelay() async {
    _timer = Timer(
      const Duration(milliseconds: 2500),
      () {
        // Preferences.instance.clearUserData();
        _goNext();
      },
    );
  }

  Future<void> _getStoreUser() async {
    UserModel userModel = await Preferences.instance.getUserModel();
    if (userModel.data != null) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        Routes.homeRoute,
        ModalRoute.withName(
          Routes.initialRoute,
        ),
      );
    } else {
      Navigator.pushReplacementNamed(
        context,
        Routes.loginRoute,
      );
    }
  }

  @override
  void initState() {
    super.initState();
    // context.read<SplashCubit>().getAdsOfApp();
    _startDelay();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
                alignment: Alignment.topLeft,
                child: Image.asset(
                  ImageAssests.splashLeftCorner,
                  width: MediaQuery.of(context).size.width * 0.75,
                )),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.2),
              child: Center(
                child: SizedBox(
                    //height: 200,
                    width: MediaQuery.of(context).size.width * 0.8,//todo-->
                    child: Text("askan_dawat".tr(),
                    textAlign: TextAlign.center,style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 40,
                        fontWeight: FontWeight.bold
                      ),)),
              ),
            ),
            const Spacer(),
            Align(
                alignment: Alignment.bottomRight,
                child: Image.asset(
                  ImageAssests.splashRightCorner,
                  width: MediaQuery.of(context).size.width * 0.95,
                )),
          ],
        ),
      )
          //Image.asset(ImageAssests.splashImage)
          ),
    );
  }
}
