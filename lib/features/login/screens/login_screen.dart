
import 'package:daeawt_scan/core/widgets/my_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../../core/widgets/bottom_curve.dart';
import '../../../config/routes/app_routes.dart';
import '../../../core/utils/app_strings.dart';
import '../../../core/widgets/custom_buttom.dart';
import '../cubit/login_cubit.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    //formKey.currentState!.validate();
  }

  @override
  Widget build(BuildContext context) {
    LoginCubit cubit = context.read<LoginCubit>();
    return Form(
      key: formKey,
      child: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ClipPath(
                      clipper: BottomCurveClipper(),
                      child: Container(
                          decoration: const BoxDecoration(
                              gradient: LinearGradient(colors: [
                                AppColors.orange2,
                                AppColors.primary,
                              ])),
                          padding: const EdgeInsets.only(left: 20, bottom: 10),
                          height: 300,
                          //color: Colors.orange,
                          child: Image.asset(
                            ImageAssests.askanDawat,
                          )),
                    ),
                  ),
                  const Text(
                    AppStrings.login,
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
                  ).tr(),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    AppStrings.loginToCreateInvitation,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                  ).tr(),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: TextFormField(
                        maxLines: 1,
                        autofocus: false,
                        cursorColor: AppColors.primary,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        onChanged: (data) {
                          formKey.currentState!.validate();
                          cubit.loginModel.email = data;
                          cubit.checkValidLoginData();
                        },
                        // controller: cubit.emailControl,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'field_reguired'.tr();
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 5),
                            prefixIcon: const Icon(
                              Icons.mail_outlined,
                              color: AppColors.primary,
                            ),
                            hintText: 'email'.tr(),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            fillColor: AppColors.grey1,
                            filled: true),
                      )),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: TextFormField(
                        maxLines: 1,
                        autofocus: false,
                        cursorColor: AppColors.primary,
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.next,
                        onChanged: (data) {
                          formKey.currentState!.validate();
                          cubit.loginModel.password = data;
                          cubit.checkValidLoginData();
                        },
                        // controller: cubit.emailControl,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'field_reguired'.tr();
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 5),
                            prefixIcon: const Icon(
                              Icons.lock_outline,
                              color: AppColors.primary,
                            ),
                            hintText: 'password'.tr(),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            fillColor: AppColors.grey1,
                            filled: true),
                      )),

                   SizedBox(
                    height: MediaQuery.of(context).size.height*0.1,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.homeRoute);
                    },
                      child: MyButton(label: AppStrings.login.tr())),
                  const SizedBox(
                    height: 25,
                  ),


                  const SizedBox(
                    height: 35,
                  ),

                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
