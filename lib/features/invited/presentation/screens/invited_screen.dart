import 'package:easy_localization/easy_localization.dart' as easy;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/models/user_model.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/assets_manager.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../core/widgets/my_svg_widget.dart';
import '../../../../core/widgets/small_bottom_curve.dart';
import '../cubit/invited_cubit.dart';

class InvitedScreen extends StatefulWidget {
  final InvitationModel homeListItemModel;

  const InvitedScreen({Key? key, required this.homeListItemModel})
      : super(key: key);

  @override
  State<InvitedScreen> createState() => _InvitedScreenState();
}

class _InvitedScreenState extends State<InvitedScreen> {
  @override
  Widget build(BuildContext context) {
    String? languageCode =
        easy.EasyLocalization.of(context)?.locale.languageCode;
    InvitedCubit cubit = context.read<InvitedCubit>();
    return Scaffold(
      body: BlocBuilder<InvitedCubit, InvitedState>(
        builder: (context, state) {
          return Column(
            children: [
              ClipPath(
                clipper: SmallBottomCurveClipper(),
                child: Stack(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(colors: [
                        AppColors.orange2,
                        AppColors.primary,
                      ])),
                      padding: const EdgeInsets.symmetric(
                          vertical: 60, horizontal: 40),
                      height: 160,
                      width: double.infinity,
                      child: Center(
                        child: const Text(
                          AppStrings.invited,
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                              color: Colors.white),
                        ).tr(),
                      ),
                      //color: Colors.orange,
                    ),
                    Positioned(
                        left: 20,
                        top: 60,
                        child: Transform.rotate(
                          angle: languageCode == "ar" ? 0 : (3.14),
                          child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                                size: 35,
                              )),
                        ))
                  ],
                ),
              ),
              //ابحث
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 60,
                    child: CustomTextFormField(
                      onChanged: (p0) {
                        cubit.onSearchTextChanged(p0);
                      },
                      hintText: "search".tr(),
                      prefixIcon: const Icon(Icons.search),
                    )),
              ),
              Expanded(
                  child: ListView.separated(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Container(
                      child: Column(
                        children: [
                          Row(
                            children: [

                              Column(
                                children: [
                                  Row(
                                    children: [
                                      const Text(
                                        "المكرم :",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 20),
                                      ),
                                      Text(
                                         cubit.invitees.elementAt(index).name!.length==10?
                                         cubit.invitees.elementAt(index).name!:
                                         cubit.invitees.elementAt(index).name!.replaceRange(9,   cubit.invitees.elementAt(index).name!.length,""),
overflow: TextOverflow.ellipsis,

                                        style: const TextStyle(

                                            fontWeight: FontWeight.w400,
                                            fontSize: 20),
                                      ),
                                    ],
                                  ),

                                ],
                              ),
                              const Spacer(),
                              Center(
                                child: Text(
                                  cubit.invitees.elementAt(index).status==1?"waiting".tr():
                                  cubit.invitees.elementAt(index).status==2?"confirmed".tr():
                                  cubit.invitees.elementAt(index).status==3?"apologies".tr():
                                  cubit.invitees.elementAt(index).status==4?"not_sent".tr():
                                      "faild".tr()
                                  ,
                                  style:  TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color:  cubit.invitees.elementAt(index).status==1|| cubit.invitees.elementAt(index).status==2?AppColors.success:AppColors.red1,
                                      fontSize: 20),
                                ),
                              ),
                              SizedBox(width: MediaQuery.of(context).size.width/6,),
                              const MySvgWidget(
                                  path: ImageAssests.shareIcon, size: 20),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
                // separatorBuilder: (context, index) =>Divider() ,
                itemCount: cubit.invitees.length,
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider();
                },
              ))
            ],
          );
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    context.read<InvitedCubit>().setdata(widget.homeListItemModel);
  }
}
