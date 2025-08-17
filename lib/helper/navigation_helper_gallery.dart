import 'package:flutter/material.dart';
import 'package:sampookong/panorama/panorama1_screen.dart';
import 'package:sampookong/panorama/panorama2_screen.dart';
import 'package:sampookong/panorama/panorama3_screen.dart';

/// Helper untuk mendorong halaman dengan animasi geser
void pushNamedSlide(BuildContext context, String routeName) {
  Navigator.of(context).push(
    PageRouteBuilder(
      pageBuilder: (_, __, ___) => _getPageFromRoute(routeName),
      transitionDuration: const Duration(milliseconds: 300),
      reverseTransitionDuration: const Duration(milliseconds: 300),
      transitionsBuilder: (_, animation, __, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        final curve = Curves.easeInOut;
        final tween = Tween(
          begin: begin,
          end: end,
        ).chain(CurveTween(curve: curve));
        return SlideTransition(position: animation.drive(tween), child: child);
      },
    ),
  );
}

Widget _getPageFromRoute(String routeName) {
  switch (routeName) {
    case '/panorama1':
      return Panorama1Screen();
    case '/panorama2':
      return Panorama2Screen();
    case '/panorama3':
      return Panorama3Screen();
    default:
      return Scaffold(body: Center(child: Text('Route tidak ditemukan')));
  }
}
