import 'package:flutter/material.dart';
import 'package:sampookong/components/floating_private_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:sampookong/helper/navigation_helper.dart';
import 'package:sampookong/screens/public/detail_screen2.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const SizedBox(height: 32),
            Text(
              'information'.tr(),
              style: TextStyle(
                fontSize: 24,
                height: 1.5,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'information_desc'.tr(),
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            const SizedBox(height: 20),

            // Accordion - Opsi Layanan
            ExpansionTile(
              title: Text(
                'services'.tr(),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              leading: const Icon(Icons.store, color: Color(0xFFD22027)),
              children: [
                ListTile(
                  leading: Icon(Icons.store, color: Color(0xFFD22027)),
                  title: Text('services1'.tr()),
                ),
              ],
            ),

            // Accordion - Aksesibilitas
            ExpansionTile(
              title: Text(
                'accessibility'.tr(),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              leading: const Icon(Icons.accessible, color: Color(0xFFD22027)),
              children: [
                ListTile(
                  leading: Icon(
                    Icons.wheelchair_pickup,
                    color: Color(0xFFD22027),
                  ),
                  title: Text('accessibility1'.tr()),
                ),
                ListTile(
                  leading: Icon(Icons.local_parking, color: Color(0xFFD22027)),
                  title: Text('accessibility2'.tr()),
                ),
                ListTile(
                  leading: Icon(Icons.wc, color: Color(0xFFD22027)),
                  title: Text('accessibility3'.tr()),
                ),
              ],
            ),

            // Accordion - Fasilitas
            ExpansionTile(
              title: Text(
                'facility'.tr(),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              leading: const Icon(Icons.room_service, color: Color(0xFFD22027)),
              children: [
                ListTile(
                  leading: Icon(Icons.wc, color: Color(0xFFD22027)),
                  title: Text('facility1'.tr()),
                ),
              ],
            ),

            // Accordion - Parkir
            ExpansionTile(
              title: Text(
                'park'.tr(),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              leading: const Icon(
                Icons.local_parking,
                color: Color(0xFFD22027),
              ),
              children: [
                ListTile(
                  leading: Icon(Icons.local_parking, color: Color(0xFFD22027)),
                  title: Text('park1'.tr()),
                ),
                ListTile(
                  leading: Icon(Icons.local_parking, color: Color(0xFFD22027)),
                  title: Text('park2'.tr()),
                ),
                ListTile(
                  leading: Icon(Icons.local_parking, color: Color(0xFFD22027)),
                  title: Text('park3'.tr()),
                ),
              ],
            ),

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
                        const DetailScreen2(),
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
