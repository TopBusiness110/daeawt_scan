
import 'package:daeawt_scan/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
//import 'package:barcode_scan/barcode_scan.dart';

class ScannedScreen extends StatefulWidget {
  const ScannedScreen({Key? key}) : super(key: key);

  @override
  State<ScannedScreen> createState() => _ScannedScreenState();
}

class _ScannedScreenState extends State<ScannedScreen> {

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
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Column(
          children: [
            ElevatedButton(onPressed: (){}, child: Text("أضف مناسبة أخرى")),
            Spacer(),
            Center(
              child: SizedBox(
                width:200,
                height:200,
                child:   MobileScanner(
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
            Spacer(),
            ElevatedButton(onPressed: (){}, child: Text("اظهار القائمة الممسوحة ضوئيا")),

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
      ),
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
