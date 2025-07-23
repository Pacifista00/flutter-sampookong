import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  void _changeLanguage(BuildContext context, String languageCode) {
    final newLocale = Locale(languageCode);
    context.setLocale(newLocale);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD22027),
      appBar: AppBar(
        backgroundColor: const Color(0xFFD22027),
        elevation: 0,
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.language, color: Colors.white),
            onSelected: (String value) => _changeLanguage(context, value),
            itemBuilder:
                (BuildContext context) => const [
                  PopupMenuItem(value: 'id', child: Text('Bahasa Indonesia')),
                  PopupMenuItem(value: 'en', child: Text('English')),
                ],
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'welcome'.tr(),
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                'description'.tr(),
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              Image.asset(
                'assets/images/ilustrasi.png',
                width: 200,
                height: 200,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 60),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFEDE00),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                    vertical: 14,
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/scanner');
                },
                child: Text(
                  'scan_qr'.tr(),
                  style: const TextStyle(
                    fontSize: 20,
                    color: Color(0xFF414042),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
