import 'dart:io';

import 'package:daeawt_scan/core/utils/app_colors.dart';
import 'package:daeawt_scan/core/widgets/custom_buttom.dart';
import 'package:daeawt_scan/features/scan/cubit/scan_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../../config/routes/app_routes.dart';
import '../../../core/widgets/my_button.dart';
//import 'package:barcode_scan/barcode_scan.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({Key? key}) : super(key: key);

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
Barcode? result;
QRViewController? controller;

// In order to get hot reload to work we need to pause the camera if the platform
// is android, or resume the camera if the platform is iOS.
@override
void reassemble() {
  super.reassemble();
  if (Platform.isAndroid) {
    controller!.pauseCamera();
  } else if (Platform.isIOS) {
    controller!.resumeCamera();
  }
}

final formKey = GlobalKey<FormState>();

void _onQRViewCreated(QRViewController controller) {
  this.controller = controller;
  controller.scannedDataStream.listen((scanData) {
    print("lllll");
    print(scanData.code);
   context.read<ScanCubit>().scanData(context,scanData.code);
  });
}

@override
void dispose() {
  controller?.dispose();
  super.dispose();
}

  @override
  Widget build(BuildContext context) {
    // final scanResult = this.scanResult;
    ScanCubit cubit = context.read<ScanCubit>();

    return BlocBuilder<ScanCubit, ScanState>(
      builder: (context, state) {
        return Scaffold(
            resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: QRView(
                      key: qrKey,
                      onQRViewCreated: _onQRViewCreated,

                    ),
                  ),
                  ),

              ),
              Positioned(
                top: 10,
                bottom: 0,
                left: 0,
                right: 0,
                child:  GestureDetector(
                  onTap: () {
                    FocusScope.of(context).requestFocus(FocusNode());

                  },
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 50,
                          child: Center(
                            child: CustomButton(
                                backgroundColor: AppColors.primary,
                                onPressed: () {
                                  showModalBottomSheet(
                                    backgroundColor: AppColors.transparent,
                                    isScrollControlled: true,
                                    context: context,
                                    builder: (context) => Form(
                                      key: formKey,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            bottom: MediaQuery.of(context).viewInsets.bottom),                                        child: Container(

                                          decoration: const BoxDecoration(
                                              color: AppColors.white,
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(16),
                                                  topRight: Radius.circular(16))),
                                          height:
                                              MediaQuery.of(context).size.height / 2.5,
                                          child: SingleChildScrollView(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Align(
                                                  alignment: Alignment.centerLeft,
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: InkWell(
                                                      onTap: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: const Icon(
                                                        Icons.close,
                                                        color: AppColors.red1,
                                                        size: 30,
                                                        opticalSize: 30,
                                                      ),
                                                    ),
                                                  ),
                                                 ),
                                                const SizedBox(
                                                  height: 15,
                                                ),
                                                Center(
                                                  child: Text(
                                                    'sub_occassion'.tr(),
                                                    style: const TextStyle(
                                                        fontSize: 14,
                                                        fontWeight: FontWeight.bold,
                                                        color: AppColors.black1),
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 15,
                                                ),
                                                Padding(
                                                    padding: const EdgeInsets.all(18.0),
                                                    child: TextFormField(
                                                      maxLines: 1,
                                                      autofocus: false,
                                                      cursorColor: AppColors.primary,
                                                      keyboardType:
                                                          TextInputType.emailAddress,
                                                      textInputAction:
                                                          TextInputAction.next,
                                                      onChanged: (data) {
                                                        formKey.currentState!
                                                            .validate();
                                                        cubit.loginModel.email = data;
                                                        cubit.checkValidLoginData();
                                                      },
                                                      // controller: cubit.emailControl,
                                                      validator: (value) {
                                                        if (value == null ||
                                                            value.isEmpty) {
                                                          return 'field_reguired'.tr();
                                                        }
                                                        return null;
                                                      },
                                                      decoration: InputDecoration(
                                                          contentPadding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  vertical: 8,
                                                                  horizontal: 5),
                                                          prefixIcon: const Icon(
                                                            Icons.mail_outlined,
                                                            color: AppColors.primary,
                                                          ),
                                                          hintText: 'email'.tr(),
                                                          border: OutlineInputBorder(
                                                            borderSide: BorderSide.none,
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                    10.0),
                                                          ),
                                                          fillColor: AppColors.grey1,
                                                          filled: true),
                                                    )),
                                                Padding(
                                                    padding: const EdgeInsets.symmetric(
                                                        horizontal: 18.0),
                                                    child: TextFormField(
                                                      maxLines: 1,
                                                      autofocus: false,
                                                      cursorColor: AppColors.primary,
                                                      keyboardType:
                                                          TextInputType.visiblePassword,
                                                      textInputAction:
                                                          TextInputAction.next,
                                                      onChanged: (data) {
                                                        formKey.currentState!
                                                            .validate();
                                                        cubit.loginModel.password =
                                                            data;
                                                        cubit.checkValidLoginData();
                                                      },
                                                      // controller: cubit.emailControl,
                                                      validator: (value) {
                                                        if (value == null ||
                                                            value.isEmpty) {
                                                          return 'field_reguired'.tr();
                                                        }
                                                        return null;
                                                      },
                                                      decoration: InputDecoration(
                                                          contentPadding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  vertical: 8,
                                                                  horizontal: 5),
                                                          prefixIcon: const Icon(
                                                            Icons.lock_outline,
                                                            color: AppColors.primary,
                                                          ),
                                                          hintText: 'password'.tr(),
                                                          border: OutlineInputBorder(
                                                            borderSide: BorderSide.none,
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                    10.0),
                                                          ),
                                                          fillColor: AppColors.grey1,
                                                          filled: true),
                                                    )),
                                                const SizedBox(
                                                  height: 15,
                                                ),
                                                InkWell(
                                                    onTap: () {
                                                      if (formKey.currentState!
                                                          .validate()) {
                                                        cubit.login(context);
                                                      }
                                                      //   Navigator.pushNamed(context, Routes.homeRoute);
                                                    },
                                                    child:
                                                        MyButton(label: 'login'.tr())),
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
                                      ),
                                    ),
                                  );
                                },
                                text: "addocaation".tr()),
                          ),
                        ),
                       //   Expanded(child: Container()),
                        //

                        // const SizedBox(
                        //   height: 20,
                        // )
                        // // MobileScanner(
                        // //   // fit: BoxFit.contain,
                        // //   onDetect: (capture) {
                        // //     final List<Barcode> barcodes = capture.barcodes;
                        // //     final Uint8List? image = capture.image;
                        // //     for (final barcode in barcodes) {
                        // //       debugPrint('Barcode found! ${barcode.rawValue}');
                        // //     }
                        // //   },
                        // // ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                left: 0,
                right: 0,
                child:
              Center(
                child: CustomButton(
                  backgroundColor: AppColors.primary,
                  text: "show_menu".tr(),
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.scannedRoute,
                        arguments: [
                          cubit.userDataModel!.invitationModel,
                          0
                        ]);
                  },
                ),
              ),)
            ],
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
