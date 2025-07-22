import 'package:flutter/material.dart';
import 'package:panorama_viewer/panorama_viewer.dart';

class Panorama1Screen extends StatelessWidget {
  const Panorama1Screen({super.key});

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
          child: Image.asset('assets/images/panorama1.jpg'),
        ),
      ),
    );
  }
}
