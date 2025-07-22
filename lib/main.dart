import 'package:flutter/material.dart';
import 'package:sampookong/panorama/panorama1_screen.dart';
import 'package:sampookong/panorama/panorama2_screen.dart';
import 'package:sampookong/panorama/panorama3_screen.dart';
import 'screens/qr_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/home_screen.dart';
import 'screens/welcome_screen.dart';
import 'screens/gallery_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/description': (context) => const WelcomeScreen(),
        '/scanner': (context) => const QrScreen(),
        '/home': (context) => const HomeScreen(),
        '/gallery': (context) => const GalleryScreen(),
        '/panorama1': (context) => const Panorama1Screen(),
        '/panorama2': (context) => const Panorama2Screen(),
        '/panorama3': (context) => const Panorama3Screen(),
      },
    );
  }
}
