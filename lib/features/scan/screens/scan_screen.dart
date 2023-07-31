import 'package:daeawt_scan/core/utils/app_colors.dart';
import 'package:daeawt_scan/core/widgets/custom_buttom.dart';
import 'package:daeawt_scan/features/scan/cubit/scan_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart' as sheet;

import '../../../config/routes/app_routes.dart';
import '../../../core/widgets/my_button.dart';
//import 'package:barcode_scan/barcode_scan.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({Key? key}) : super(key: key);

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {

  // ScanResult? scanResult;
  // static final _possibleFormats = BarcodeFormat.values.toList()
  //   ..removeWhere((e) => e == BarcodeFormat.unknown);
  // List<BarcodeFormat> selectedFormats = [..._possibleFormats];
  // var _selectedCamera = -1;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _scan();

  }

  @override
  Widget build(BuildContext context) {
    // final scanResult = this.scanResult;
    ScanCubit cubit = context.read<ScanCubit>();

    return BlocBuilder<ScanCubit, ScanState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Stack(
              children: [
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child:
                    MobileScanner(
                      // fit: BoxFit.contain,
                      controller: MobileScannerController(
                        detectionSpeed: DetectionSpeed.normal,
                        facing: CameraFacing.back,
                        torchEnabled: true,

                      ),
                      onDetect: (capture) {
                        final List<Barcode> barcodes = capture.barcodes;
                        final Uint8List? image = capture.image;
                        for (final barcode in barcodes) {
                          debugPrint('Barcode found! ${barcode.rawValue}');
                        }
                      },
                    ),
                  ),
                ),

                Column(
                  children: [
                    SizedBox(height: 20,),
                    Center(
                      child: CustomButton(
                        backgroundColor: AppColors.primary,
                          onPressed: () {
                            sheet.showMaterialModalBottomSheet(
                              context: context,
                              builder: (context) => Container(
                                height: MediaQuery.of(context).size.height/2,
                                child:             SingleChildScrollView(
                                  child: Column(
                                    children: [

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
                                             // formKey.currentState!.validate();
                                           //   cubit.loginModel.email = data;
                                            //  cubit.checkValidLoginData();
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
                                              // formKey.currentState!.validate();
                                              // cubit.loginModel.password = data;
                                              // cubit.checkValidLoginData();
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
                                            // if(formKey.currentState!.validate()){
                                            //   cubit.login(context);}
                                            //   Navigator.pushNamed(context, Routes.homeRoute);
                                          },
                                          child: MyButton(label: 'login'.tr())),
                                      const SizedBox(
                                        height: 25,
                                      ),


                                      const SizedBox(
                                        height: 35,
                                      ),

                                    ],
                                  ),
                                ),

                              ),
                            );
                          }, text: "أضف مناسبة أخرى"),
                    ),
                    Spacer(),

                    Center(
                      child: CustomButton(
                        backgroundColor: AppColors.primary,
                          text: "اظهار القائمة الممسوحة ضوئيا",
                          onPressed: () {
                        Navigator.pushNamed(
                            context, Routes.scannedRoute,
                            arguments: [cubit.userDataModel!.invitationModel, 0]);
                      },),
                    ),
SizedBox(height: 20,)
                    // MobileScanner(
                    //   // fit: BoxFit.contain,
                    //   onDetect: (capture) {
                    //     final List<Barcode> barcodes = capture.barcodes;
                    //     final Uint8List? image = capture.image;
                    //     for (final barcode in barcodes) {
                    //       debugPrint('Barcode found! ${barcode.rawValue}');
                    //     }
                    //   },
                    // ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

// Future<void> _scan() async {
//   try {
//     final result = await BarcodeScanner.scan(
//       options: ScanOptions(
//         strings: {
//           'cancel': "Cancel",
//           'flash_on': "Flash on",
//           'flash_off': "Flash off",
//         },
//         restrictFormat: selectedFormats,
//         useCamera: _selectedCamera,
//         autoEnableFlash: false,
//         android: AndroidOptions(
//           aspectTolerance: 0.04,
//           useAutoFocus: true,
//         ),
//       ),
//     );
//     setState(() => scanResult = result as ScanResult?);
//   } on PlatformException catch (e) {
//     setState(() {
//       scanResult = ScanResult(
//         type: ResultType.Error,
//         rawContent: e.code == BarcodeScanner.cameraAccessDenied
//             ? 'The user did not grant the camera permission!'
//             : 'Unknown error: $e',
//       );
//     });
//   }
// }
}
