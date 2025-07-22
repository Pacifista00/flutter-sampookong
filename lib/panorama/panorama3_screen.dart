import 'package:flutter/material.dart';
import 'package:panorama_viewer/panorama_viewer.dart';

class Panorama3Screen extends StatelessWidget {
  const Panorama3Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Foto 360°'),
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: PanoramaViewer(
          sensorControl: SensorControl.orientation,
          // Pindahkan child ke paling bawah
          child: Image.asset('assets/images/panorama3.jpg'),
        ),
      ),
    );
  }
}
