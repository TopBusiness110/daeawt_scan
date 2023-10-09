import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../config/routes/app_routes.dart';
import '../../../core/preferences/preferences.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_strings.dart';
import '../../../core/utils/assets_manager.dart';
import '../../../core/widgets/manage_circle_network_image.dart';
import '../../../core/widgets/my_svg_widget.dart';
import '../cubit/profile_cubit.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  PackageInfo? packageInfo ;

  final InAppReview inAppReview = InAppReview.instance;
  @override
  void initState() {
    super.initState();
    setuppackage();
  }
  @override
  Widget build(BuildContext context) {
    String languageCode = EasyLocalization.of(context)!.currentLocale!.languageCode;
    return BlocConsumer<ProfileCubit, ProfileState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    ProfileCubit cubit = context.read<ProfileCubit>();
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          // alignment: Alignment.bottomCenter,
          children: [
            const SizedBox(height: 20,),

            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 100,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        AppStrings.myAccount,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w700),
                      ).tr(),
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 35,
                          ))
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height* 0.97,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(40)),
              ),
              child:ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  SizedBox(height: 20,),
                  SizedBox(
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    child:
                    Stack(children: [
                      Positioned(
                        top: 100 * 0.1,
                        right: MediaQuery.of(context).size.width * .3,
                        child: const CircleAvatar(
                          radius: 4,
                          backgroundColor: AppColors.primary,
                        ),
                      ),
                      Positioned(
                        top: 100* .1,
                        left: MediaQuery.of(context).size.width * .3,
                        child: const CircleAvatar(
                          radius: 4,
                          backgroundColor: AppColors.primary,
                        ),
                      ),

                      // second row of circles
                      Positioned(
                        top: 100* .3,
                        right: MediaQuery.of(context).size.width * 0.05,
                        child: CircleAvatar(
                          radius: 3,
                          backgroundColor: AppColors.primary,
                        ),
                      ),
                      Positioned(
                        top: 100* .3,
                        left: MediaQuery.of(context).size.width * 0.05,
                        child: CircleAvatar(
                          radius: 3,
                          backgroundColor: AppColors.primary,
                        ),
                      ),

                      // second row of circles
                      Positioned(
                        top: 100* .3,
                        left: MediaQuery.of(context).size.width * 0.21,
                        child: CircleAvatar(
                          radius: 3,
                          backgroundColor: AppColors.primary,
                        ),
                      ),
                      Positioned(
                        top: 100* .3,
                        right: MediaQuery.of(context).size.width * 0.21,
                        child: const CircleAvatar(
                          radius: 3,
                          backgroundColor: AppColors.primary,
                        ),
                      ),

                      //third row of circles
                      Positioned(
                        top: 100* 0.15,
                        right: MediaQuery.of(context).size.width * 0.13,
                        child: const CircleAvatar(
                          radius: 4,
                          backgroundColor: AppColors.primary,
                        ),
                      ),
                      Positioned(
                        top: 100* 0.15,
                        left: MediaQuery.of(context).size.width * 0.13,
                        child: const CircleAvatar(
                          radius: 4,
                          backgroundColor: AppColors.primary,
                        ),
                      ),
                      Positioned(child:  Container(
                        height: 90,
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(color: AppColors.grey3, width: 3)),
                        child:cubit.userModel==null||cubit.userModel!.userModel!.user!.image!.isEmpty? Image.asset(ImageAssests.profileImage):
                        ManageCircleNetworkImage(imageUrl: cubit.userModel!.userModel!.user!.image!,
                          height: 90,
                          width: 90,
                        ),
                      ),
                        top: 0,
                        left: 0,
                        right: 0,
                      )

                    ],),
                  ),

                  Center(
                    child:  Text(
                      cubit.userModel!=null?cubit.userModel!.userModel!.user!.name!:'',
                      style: TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 14),
                    ),
                  ),
                  Center(
                    child:  Text(
                      cubit.userModel!=null?cubit.userModel!.userModel!.user!.phone!:'',
                      style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 14),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 6),
                    width: MediaQuery.of(context).size.width * 0.85,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10),
                        border:
                        Border.all(width: 2, color: AppColors.grey3)),
                    child: InkWell(
                      onTap: () {
                        cubit.changeApplicationLanguage(context);
                    //     EasyLocalization.of(context)?.setLocale(Locale('en', ''));
                      },
                      child: Row(
                        children: [
                          Image.asset(ImageAssests.languageIcon),
                          const SizedBox(
                            width: 15,
                          ),
                          const Text(
                            "language",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w700),
                          ).tr(),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4,
                          ),
                          Localizations.localeOf(context) == Locale("en")
                              ? Text(cubit.arabicSymbol)
                              : Text(cubit.englishSymbol)
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.contactUsRoute);
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 6),
                      width: MediaQuery.of(context).size.width * 0.85,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(10),
                          border:
                          Border.all(width: 2, color: AppColors.grey3)),
                      child: Row(
                        children: [
                          Image.asset(ImageAssests.contactUsIcon),
                          const SizedBox(
                            width: 15,
                          ),
                          const Text(
                            "contact_us",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w700),
                          ).tr(),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      shareApp();
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 6),
                      width: MediaQuery.of(context).size.width * 0.85,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(10),
                          border:
                          Border.all(width: 2, color: AppColors.grey3)),
                      child: Row(
                        children: [
                          Image.asset(ImageAssests.shareAppIcon),
                          const SizedBox(
                            width: 15,
                          ),
                          const Text(
                            "share_app",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w700),
                          ).tr(),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      rateApp();
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 6),
                      width: MediaQuery.of(context).size.width * 0.85,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(10),
                          border:
                          Border.all(width: 2, color: AppColors.grey3)),
                      child: Row(
                        children: [
                          Image.asset(ImageAssests.rateAppIcon),
                          const SizedBox(
                            width: 15,
                          ),
                          const Text(
                           "rate_app",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w700),
                          ).tr(),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Preferences.instance.clearUserData();
                      Navigator.pushNamedAndRemoveUntil(context, Routes.loginRoute,(route) {
                        return false;
                      },);
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 6),
                      width: MediaQuery.of(context).size.width * 0.85,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(10),
                          border:
                          Border.all(width: 2, color: AppColors.grey3)),
                      child: Row(
                        children: [
                          Image.asset(ImageAssests.logOutIcon),
                          const SizedBox(
                            width: 15,
                          ),
                          const Text(
                            "logout",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w700),
                          ).tr(),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(

                        child: Image.asset(ImageAssests.facebookIcon),
                        onTap: () {
                          _openSocialUrl(
                              url: cubit.setting!
                                  .data.facebook);
                        },
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                          onTap: () {
                            _openSocialUrl(
                                url: cubit.setting!
                                    .data.instagram);
                          },
                          child: Image.asset(ImageAssests.instagramIcon)),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                          onTap: () {
                            _openSocialUrl(
                                url: cubit.setting!
                                    .data.twitter);
                          },
                          child: Image.asset(ImageAssests.twitterIcon)),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                          onTap: () {
                            _openSocialUrl(
                                url: cubit.setting!
                                    .data.linkedin);
                          },
                          child: Image.asset(ImageAssests.linkedInIcon)),
                    ],
                  ),
                  SizedBox(height: 150,),
                ],
              ),
            ) ,



            //
            //  //first 2 circles

            //
            //  //profile image
            //  Positioned(
            //      top: 100* 0.22,
            //      child:,
            //
            //  //all fields
            // // Positioned(
            //    // top: 100* 0.17,
            //    // right: 0,
            //    // left: 0,
            //    // bottom: 0,
            //  //  child:
            //    SingleChildScrollView(
            //      child: Column(
            //        children: [
            //          const Text(
            //            'محمد محمد',
            //            style: TextStyle(
            //                fontWeight: FontWeight.w700, fontSize: 14),
            //          ),
            //          const Text(
            //            '01030504268',
            //            style: TextStyle(
            //                fontWeight: FontWeight.w400, fontSize: 14),
            //          ),
            //          Container(
            //            margin: const EdgeInsets.symmetric(
            //                horizontal: 20, vertical: 10),
            //            padding: const EdgeInsets.symmetric(
            //                horizontal: 10, vertical: 6),
            //            width: MediaQuery.of(context).size.width * 0.85,
            //            decoration: BoxDecoration(
            //                shape: BoxShape.rectangle,
            //                borderRadius: BorderRadius.circular(10),
            //                border:
            //                    Border.all(width: 2, color: AppColors.grey3)),
            //            child: InkWell(
            //              onTap: () {
            //                cubit.changeApplicationLanguage(context);
            //                // EasyLocalization.of(context)?.setLocale(Locale('en', ''));
            //              },
            //              child: Row(
            //                children: [
            //                  Image.asset(ImageAssests.languageIcon),
            //                  const SizedBox(
            //                    width: 15,
            //                  ),
            //                  const Text(
            //                    AppStrings.language,
            //                    style: TextStyle(
            //                        fontSize: 14, fontWeight: FontWeight.w700),
            //                  ).tr(),
            //                  SizedBox(
            //                    width: MediaQuery.of(context).size.width * 0.4,
            //                  ),
            //                  Localizations.localeOf(context) == Locale("en")
            //                      ? Text(cubit.arabicSymbol)
            //                      : Text(cubit.englishSymbol)
            //                ],
            //              ),
            //            ),
            //          ),
            //          InkWell(
            //            onTap: () {
            //              Navigator.pushNamed(context, Routes.contactUsRoute);
            //            },
            //            child: Container(
            //              margin: const EdgeInsets.symmetric(
            //                  horizontal: 20, vertical: 10),
            //              padding: const EdgeInsets.symmetric(
            //                  horizontal: 10, vertical: 6),
            //              width: MediaQuery.of(context).size.width * 0.85,
            //              decoration: BoxDecoration(
            //                  shape: BoxShape.rectangle,
            //                  borderRadius: BorderRadius.circular(10),
            //                  border:
            //                      Border.all(width: 2, color: AppColors.grey3)),
            //              child: Row(
            //                children: [
            //                  Image.asset(ImageAssests.contactUsIcon),
            //                  const SizedBox(
            //                    width: 15,
            //                  ),
            //                  const Text(
            //                    AppStrings.contactUs,
            //                    style: TextStyle(
            //                        fontSize: 14, fontWeight: FontWeight.w700),
            //                  ).tr(),
            //                ],
            //              ),
            //            ),
            //          ),
            //          Container(
            //            margin: const EdgeInsets.symmetric(
            //                horizontal: 20, vertical: 10),
            //            padding: const EdgeInsets.symmetric(
            //                horizontal: 10, vertical: 6),
            //            width: MediaQuery.of(context).size.width * 0.85,
            //            decoration: BoxDecoration(
            //                shape: BoxShape.rectangle,
            //                borderRadius: BorderRadius.circular(10),
            //                border:
            //                    Border.all(width: 2, color: AppColors.grey3)),
            //            child: Row(
            //              children: [
            //                Image.asset(ImageAssests.shareAppIcon),
            //                const SizedBox(
            //                  width: 15,
            //                ),
            //                const Text(
            //                  AppStrings.shareApp,
            //                  style: TextStyle(
            //                      fontSize: 14, fontWeight: FontWeight.w700),
            //                ).tr(),
            //              ],
            //            ),
            //          ),
            //          Container(
            //            margin: const EdgeInsets.symmetric(
            //                horizontal: 20, vertical: 10),
            //            padding: const EdgeInsets.symmetric(
            //                horizontal: 10, vertical: 6),
            //            width: MediaQuery.of(context).size.width * 0.85,
            //            decoration: BoxDecoration(
            //                shape: BoxShape.rectangle,
            //                borderRadius: BorderRadius.circular(10),
            //                border:
            //                    Border.all(width: 2, color: AppColors.grey3)),
            //            child: Row(
            //              children: [
            //                Image.asset(ImageAssests.rateAppIcon),
            //                const SizedBox(
            //                  width: 15,
            //                ),
            //                const Text(
            //                  AppStrings.rateApp,
            //                  style: TextStyle(
            //                      fontSize: 14, fontWeight: FontWeight.w700),
            //                ).tr(),
            //              ],
            //            ),
            //          ),
            //          InkWell(
            //            onTap: () {
            //              Navigator.pushReplacementNamed(
            //                  context, Routes.loginRoute);
            //            },
            //            child: Container(
            //              margin: const EdgeInsets.symmetric(
            //                  horizontal: 20, vertical: 10),
            //              padding: const EdgeInsets.symmetric(
            //                  horizontal: 10, vertical: 6),
            //              width: MediaQuery.of(context).size.width * 0.85,
            //              decoration: BoxDecoration(
            //                  shape: BoxShape.rectangle,
            //                  borderRadius: BorderRadius.circular(10),
            //                  border:
            //                      Border.all(width: 2, color: AppColors.grey3)),
            //              child: Row(
            //                children: [
            //                  Image.asset(ImageAssests.logOutIcon),
            //                  const SizedBox(
            //                    width: 15,
            //                  ),
            //                  const Text(
            //                    AppStrings.logout,
            //                    style: TextStyle(
            //                        fontSize: 14, fontWeight: FontWeight.w700),
            //                  ).tr(),
            //                ],
            //              ),
            //            ),
            //          ),
            //          Row(
            //            mainAxisAlignment: MainAxisAlignment.center,
            //            children: [
            //              Image.asset(ImageAssests.facebookIcon),
            //              const SizedBox(
            //                width: 10,
            //              ),
            //              Image.asset(ImageAssests.instagramIcon),
            //              const SizedBox(
            //                width: 10,
            //              ),
            //              Image.asset(ImageAssests.twitterIcon),
            //              const SizedBox(
            //                width: 10,
            //              ),
            //              Image.asset(ImageAssests.linkedInIcon),
            //            ],
            //          )
            //        ],
            //      ),
            //    ),
            //  ),

            //social media row
            // Positioned(
            //     top: 100* 0.89,
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: [
            //         Image.asset(ImageAssests.facebookIcon),
            //         const SizedBox(
            //           width: 10,
            //         ),
            //         Image.asset(ImageAssests.instagramIcon),
            //         const SizedBox(
            //           width: 10,
            //         ),
            //         Image.asset(ImageAssests.twitterIcon),
            //         const SizedBox(
            //           width: 10,
            //         ),
            //         Image.asset(ImageAssests.linkedInIcon),
            //       ],
            //     )),
          ],
        ),
      ),
    );
  },
);
  }
  void shareApp() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    String url = '';
    String packageName = packageInfo.packageName;

    if (Platform.isAndroid) {
      url = "https://play.google.com/store/apps/details?id=${packageName}";
    } else if (Platform.isIOS) {
      url = 'https://apps.apple.com/us/app/${packageName}';
    }
    await FlutterShare.share(title: "walaa", linkUrl: url);
  }

  Future<void> rateApp() async {

    if (await inAppReview.isAvailable()) {
      inAppReview.requestReview();
    }

    //
    // RateMyApp rateMyApp = RateMyApp(
    //  preferencesPrefix: 'rateMyApp_',
    //  minDays: 0,
    //  minLaunches: 1,
    //  remindDays: 0,
    //  remindLaunches: 1,
    //
    // );
    //
    // await rateMyApp.init().then((value) async =>
    // {if(rateMyApp.shouldOpenDialog) {
    //  rateMyApp.showRateDialog(
    //
    //   context,
    //   title: 'Rate this app',
    //   message: 'If you like this app, please take a little bit of your time to review it !\nIt really helps us and it shouldn\'t take you more than one minute.',
    //   rateButton: 'RATE',
    //   noButton: 'NO THANKS',
    //   laterButton: 'MAYBE LATER',
    //  )
    // }
    // else{
    //   should=  (await rateMyApp.isNativeReviewDialogSupported)!,
    //   if(should){
    //    await rateMyApp.launchNativeReviewDialog()}
    //   else{
    //    rateMyApp.launchStore()
    //   }
    //   // print("ddkdkkdkdkjfj")
    //  }});


  }

  Future<void> setuppackage() async {
    packageInfo=   await PackageInfo.fromPlatform();

  }
  void _openSocialUrl({required String url}) async {
    Uri uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(uri,
          webViewConfiguration: const WebViewConfiguration(
              enableJavaScript: true, enableDomStorage: true));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          'invalidUrl'.tr(),
          style: const TextStyle(fontSize: 14.0),
        ),
        backgroundColor: AppColors.primary,
        elevation: 8.0,
        duration: const Duration(seconds: 3),
      ));
    }
  }

}
