import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:easy_localization/easy_localization.dart';

class QrScreen extends StatefulWidget {
  const QrScreen({super.key});

  @override
  State<QrScreen> createState() => _QrScreenState();
}

class _QrScreenState extends State<QrScreen> {
  bool _isScanned = false;

  void _handleScan(BarcodeCapture capture) {
    for (final barcode in capture.barcodes) {
      final String? code = barcode.rawValue;

      if (code != null && !_isScanned) {
        setState(() => _isScanned = true);

        if (code == 't0urgu1de') {
          Navigator.pushReplacementNamed(context, '/home');
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('${'scan_failed'.tr()} : $code')),
          );

          Future.delayed(const Duration(seconds: 2), () {
            setState(() => _isScanned = false);
          });
        }
        break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('scan_qr'.tr())),
      body: Stack(
        children: [
          MobileScanner(
            controller: MobileScannerController(
              detectionSpeed: DetectionSpeed.noDuplicates,
            ),
            onDetect: _handleScan,
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'scan_instructions'.tr(),
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
