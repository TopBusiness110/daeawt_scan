import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:meta/meta.dart';

import '../../../config/routes/app_routes.dart';

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

 // final GoogleSignIn _googleSignIn = GoogleSignIn();

  //When the user taps the Google sign-in button, call the signInWithGoogle method:
  // Future<UserCredential> logInWithGoogle() async {
  //   // Trigger the Google authentication flow.
  //   final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
  //
  //   // Obtain the auth details from the request.
  //   final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
  //
  //   // Create a new credential.
  //   final OAuthCredential credential = GoogleAuthProvider.credential(
  //     accessToken: googleAuth?.accessToken,
  //     idToken: googleAuth?.idToken,
  //   );
  //
  //   // Once signed in, return the UserCredential.
  //   return await FirebaseAuth.instance.signInWithCredential(credential);
  // }
  //
  // saveUserDataByGoogleSignIn(BuildContext context) async {
  //   AppWidget.createProgressDialog(context, "Loading");
  //   UserCredential userCredential = await logInWithGoogle();
  //   final response = await api.registerWithGoogle(userCredential);
  //
  //   response.fold(
  //         (failure) => {Navigator.pop(context), emit(LoginWithGoogleLoading())},
  //         (loginModel) {
  //       print("------------------ ${loginModel.code}");
  //       if (loginModel.code == 409 || loginModel.code == 410) {
  //         Navigator.pop(context);
  //         toastMessage("exists_email".tr(), context);
  //         // errorGetBar(translateText(AppStrings.noEmailError, context));
  //         emit(LoginWithGoogleFailure());
  //       } else if (loginModel.code == 200) {
  //         emit(LoginWithGoogleSuccess());
  //         Navigator.pop(context);
  //         Navigator.pushReplacementNamed(context, Routes.homeRoute);
  //         Preferences.instance.setUser(loginModel).then((value) {
  //           Navigator.pushNamedAndRemoveUntil(
  //               context, Routes.homeRoute, (route) => false);
  //           // emit(OnLoginSuccess(response));
  //         });
  //       }
  //     },
  //   );
  //
  // }

  void login(BuildContext context) async {
    // AppWidget.createProgressDialog(context, 'wait'.tr());
    // final response = await api.postLogin(loginModel);
    // response.fold(
    //       (failure) => {Navigator.pop(context), emit(LoginFailure())},
    //       (loginModel) {
    //     if (loginModel.code == 406||loginModel.code == 410) {
    //       Navigator.pop(context);
    //       toastMessage("invaild_email".tr(), context);
    //       // errorGetBar(translateText(AppStrings.noEmailError, context));
    //       emit(LoginLoaded());
    //     } else if (loginModel.code == 200) {
    //       Navigator.pop(context);
    //       Preferences.instance.setUser(loginModel).then((value) {
    //         Navigator.pushNamedAndRemoveUntil(context, Routes.homeRoute, (route) => false);
    //         // emit(OnLoginSuccess(response));
    //       });
    //     }
    //   },
    // );
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
