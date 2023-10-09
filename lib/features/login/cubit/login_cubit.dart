import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:meta/meta.dart';

import '../../../config/routes/app_routes.dart';

import '../../../core/preferences/preferences.dart';
import '../../../core/remote/service_api.dart';
import '../../../core/utils/appwidget.dart';
import '../../../core/utils/toast_message_method.dart';
import '../model/login_model.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {

  LoginCubit(this.api) : super(LoginInitial());

  LoginModel loginModel = LoginModel();
  bool isLoginValid=false;
  final ServiceApi api;

  void login(BuildContext context) async {
    AppWidget.createProgressDialog(context, 'wait'.tr());
    final response = await api.postLogin(loginModel);
    response.fold(
          (failure) => {Navigator.pop(context), emit(LoginFailure())},
          (loginModel) {
        if (loginModel.code == 406||loginModel.code == 410) {
          Navigator.pop(context);
          toastMessage("no_invitation".tr(), context);
          // errorGetBar(translateText(AppStrings.noEmailError, context));
          emit(LoginLoaded());
        } else if (loginModel.code == 200) {
          Navigator.pop(context);
          Preferences.instance.setUser(loginModel.data!).then((value) {
            Navigator.pushNamedAndRemoveUntil(context, Routes.homeRoute, (route) => false);
            // emit(OnLoginSuccess(response));
          });
        }else{}
      },
    );
  }

  void checkValidLoginData() {
    if (loginModel.isDataValid()) {
      isLoginValid = true;
      emit(OnLoginVaild());
    } else {
      isLoginValid = false;

      emit(OnLoginVaildFaild());
    }
  }

}
