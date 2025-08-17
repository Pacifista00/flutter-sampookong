import 'package:flutter/material.dart';

/// Helper untuk mendorong halaman dengan animasi geser
void pushSlide(BuildContext context, Widget page, {bool fromRight = true}) {
  Navigator.of(context).push(
    PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (_, __, ___) => page,
      transitionsBuilder: (_, animation, __, child) {
        final begin = Offset(fromRight ? 1.0 : -1.0, 0.0);
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

/// Helper untuk kembali dengan animasi geser
void popSlide(BuildContext context) {
  Navigator.of(context).pop();
}
