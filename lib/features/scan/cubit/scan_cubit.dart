import 'package:bloc/bloc.dart';
import 'package:daeawt_scan/config/routes/app_routes.dart';
import 'package:daeawt_scan/features/home/cubit/home_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../core/models/user_model.dart';
import '../../../core/preferences/preferences.dart';
import '../../../core/remote/service_api.dart';
import '../../../core/utils/appwidget.dart';
import '../../../core/utils/toast_message_method.dart';
import '../../login/model/login_model.dart';

part 'scan_state.dart';

class ScanCubit extends Cubit<ScanState> {
  SingleUserDataModel? userDataModel;
  LoginModel loginModel = LoginModel();
  bool isLoginValid = false;
  final ServiceApi api;

  ScanCubit(this.api) : super(ScanInitial()) {
    getuserData();
  }

  getuserData() async {
    userDataModel = await Preferences.instance.getUserModel();
    emit(UserLoaded());
  }

  void login(BuildContext context) async {
    AppWidget.createProgressDialog(context, 'wait'.tr());
    final response = await api.postLogin(loginModel);
    response.fold(
      (failure) => {Navigator.pop(context), emit(LoginFailure())},
      (loginModel) {
        if (loginModel.code == 406 || loginModel.code == 410) {
          Navigator.pop(context);
          toastMessage("no_invitation".tr(), context);
          // errorGetBar(translateText(AppStrings.noEmailError, context));
          emit(LoginLoaded());
        } else if (loginModel.code == 200) {
          Navigator.pop(context);
          Preferences.instance.setUser(loginModel.data).then((value) {
            Navigator.pop(context);
            context.read<HomeCubit>().getuserData();

            getuserData();
            //   Navigator.pushNamedAndRemoveUntil(context, Routes.homeRoute, (route) => false);
            // emit(OnLoginSuccess(response));
          });
        }
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

  Future<void> scanData(BuildContext context, String? code) async {
    AppWidget.createProgressDialog(context, 'wait'.tr());
    final response = await api.ScanIvitation(int.parse(code!));
    response.fold(
          (failure) => {Navigator.pop(context), emit(LoginFailure())},
          (loginModel) {
        if (loginModel.code == 406 || loginModel.code == 410) {
          Navigator.pop(context);
          toastMessage("no_invitation".tr(), context);
          // errorGetBar(translateText(AppStrings.noEmailError, context));
          emit(LoginLoaded());
        } else if (loginModel.code == 200) {
          Navigator.pop(context);
         toastMessage("success".tr(), context);
        }
        else{
          toastMessage("invitation_not_found".tr(), context);

        }
      },
    );
  }
}
