import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/routes/app_routes.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_strings.dart';
import '../../../core/utils/assets_manager.dart';
import '../../../core/widgets/manage_circle_network_image.dart';
import '../../../core/widgets/my_svg_widget.dart';
import '../../../preferences/preferences.dart';
import '../cubit/profile_cubit.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

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
            const SizedBox(height: 100,),

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
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ).tr(),
                      Transform.rotate(
                        angle:languageCode=="ar"?0:(3.14) ,
                        child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                              size: 35,
                            )),)
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height* 0.85,
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
                        child:cubit.userModel==null||cubit.userModel!.data!.user!.image.isEmpty? Image.asset(ImageAssests.profileImage):
                        ManageCircleNetworkImage(imageUrl: cubit.userModel!.data!.user!.image,
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
                      cubit.userModel!=null?cubit.userModel!.data!.user!.name:'',
                      style: TextStyle(
                          fontWeight: FontWeight.w700, fontSize: 18),
                    ),
                  ),
                  Center(
                    child:  Text(
                      cubit.userModel!=null?cubit.userModel!.data!.user!.phone:'',
                      style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 18),
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
                       // cubit.changeApplicationLanguage(context);
                        // EasyLocalization.of(context)?.setLocale(Locale('en', ''));
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
                                fontSize: 18, fontWeight: FontWeight.w700),
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
                     // Navigator.pushNamed(context, Routes.contactUsRoute);
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
                                fontSize: 18, fontWeight: FontWeight.w700),
                          ).tr(),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                     // shareApp();
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
                                fontSize: 18, fontWeight: FontWeight.w700),
                          ).tr(),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                    //  rateApp();
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
                                fontSize: 18, fontWeight: FontWeight.w700),
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
                                fontSize: 18, fontWeight: FontWeight.w700),
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
                          // _openSocialUrl(
                          //     url: cubit.setting!
                          //         .data.facebook);
                        },
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                          onTap: () {
                            // _openSocialUrl(
                            //     url: cubit.setting!
                            //         .data.instagram);
                          },
                          child: Image.asset(ImageAssests.instagramIcon)),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                          onTap: () {
                            // _openSocialUrl(
                            //     url: cubit.setting!
                            //         .data.twitter);
                          },
                          child: Image.asset(ImageAssests.twitterIcon)),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                          onTap: () {
                            // _openSocialUrl(
                            //     url: cubit.setting!
                            //         .data.linkedin);
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
            //                fontWeight: FontWeight.w700, fontSize: 18),
            //          ),
            //          const Text(
            //            '01030504268',
            //            style: TextStyle(
            //                fontWeight: FontWeight.w400, fontSize: 18),
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
            //                        fontSize: 18, fontWeight: FontWeight.w700),
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
            //                        fontSize: 18, fontWeight: FontWeight.w700),
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
            //                      fontSize: 18, fontWeight: FontWeight.w700),
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
            //                      fontSize: 18, fontWeight: FontWeight.w700),
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
            //                        fontSize: 18, fontWeight: FontWeight.w700),
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
}
