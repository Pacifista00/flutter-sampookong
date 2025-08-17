import 'package:flutter/material.dart';
import 'package:sampookong/components/floating_private_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:sampookong/helper/navigation_helper.dart';
import 'package:sampookong/screens/public/bangunan_screen.dart';

class CiriScreen extends StatelessWidget {
  const CiriScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const SizedBox(height: 32),
            Text(
              'ciri_title'.tr(),
              style: TextStyle(
                fontSize: 24,
                height: 1.5,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Text('ciri_desc'.tr(), style: TextStyle(fontSize: 16, height: 1.5)),
            const SizedBox(height: 20),

            // Tombol Lanjutkan
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      side: const BorderSide(color: Colors.grey),
                    ),
                    onPressed: () {
                      Navigator.pop(context); // kembali ke halaman sebelumnya
                    },
                    child: const Text(
                      'Kembali',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFD22027),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    onPressed: () {
                      pushSlide(
                        context,
                        const BangunanScreen(),
                        fromRight: true,
                      );
                    },
                    child: const Text(
                      'Lanjutkan',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: const FloatingPrivateButton(),
    );
  }
}
