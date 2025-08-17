import 'package:flutter/material.dart';
import 'package:sampookong/panorama/panorama1_screen.dart';
import 'package:sampookong/panorama/panorama2_screen.dart';
import 'package:sampookong/panorama/panorama3_screen.dart';
import 'package:sampookong/screens/public/ciri_screen.dart';
import 'package:sampookong/screens/public/detail_screen.dart';
import 'package:sampookong/screens/public/detail_screen2.dart';
import 'package:sampookong/screens/public/bangunan_screen.dart';
import 'package:sampookong/screens/public/doa_screen.dart';
import 'package:sampookong/screens/rating_screen.dart';
import 'screens/qr_screen.dart';
import 'screens/splash_screen.dart';
import 'screens/public/home_screen.dart';
import 'screens/welcome_screen.dart';
import 'screens/gallery_screen.dart';
import 'package:easy_localization/easy_localization.dart';

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('id')],
      path: 'assets/langs',
      fallbackLocale: const Locale('en'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorObservers: [routeObserver],
      title: 'Tour Guide',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
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
        '/rating': (context) => const RatingScreen(),
        '/detail': (context) => const DetailScreen(),
        '/detail-2': (context) => const DetailScreen2(),
        '/ciri': (context) => const CiriScreen(),
        '/building': (context) => const BangunanScreen(),
        '/doa': (context) => const DoaScreen(),
      },
    );
  }
}
