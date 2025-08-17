import 'package:flutter/material.dart';
import 'package:sampookong/components/floating_private_button.dart';
import 'package:easy_localization/easy_localization.dart';

class DoaScreen extends StatelessWidget {
  const DoaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const SizedBox(height: 32),
            Text(
              'doa_title'.tr(),
              style: TextStyle(
                fontSize: 24,
                height: 1.5,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'doa_head'.tr(),
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 20),
            Text('doa_desc'.tr(), style: TextStyle(fontSize: 16, height: 1.5)),
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
                // Expanded(
                //   child: ElevatedButton(
                //     style: ElevatedButton.styleFrom(
                //       backgroundColor: const Color(0xFFD22027),
                //       padding: const EdgeInsets.symmetric(vertical: 14),
                //     ),
                //     onPressed: () {
                //       Navigator.pushNamed(context, '/building');
                //     },
                //     child: const Text(
                //       'Lanjutkan',
                //       style: TextStyle(fontSize: 18, color: Colors.white),
                //     ),
                //   ),
                // ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: const FloatingPrivateButton(),
    );
  }
}
