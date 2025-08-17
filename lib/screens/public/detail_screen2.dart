import 'package:flutter/material.dart';
import 'package:sampookong/components/floating_private_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:sampookong/screens/public/ciri_screen.dart';
import 'package:sampookong/helper/navigation_helper.dart';

class DetailScreen2 extends StatelessWidget {
  const DetailScreen2({super.key});

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

            // Accordion - Informasi Umum
            ExpansionTile(
              title: Text(
                'operational'.tr(),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              leading: const Icon(Icons.info, color: Colors.redAccent),
              children: [
                ListTile(
                  leading: Icon(Icons.access_time, color: Colors.redAccent),
                  title: Text('hours_title'.tr()),
                  subtitle: Text('hours'.tr()),
                ),
              ],
            ),

            // Accordion - Alamat
            ExpansionTile(
              title: Text(
                'address_title'.tr(),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              leading: const Icon(Icons.location_on, color: Colors.redAccent),
              children: [
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text('address'.tr(), style: TextStyle(height: 1.5)),
                ),
              ],
            ),

            // Accordion - Fasilitas Umum
            ExpansionTile(
              title: Text(
                'public_facility'.tr(),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              leading: const Icon(Icons.room_service, color: Colors.redAccent),
              children: [
                ListTile(
                  leading: Icon(Icons.child_friendly, color: Colors.redAccent),
                  title: Text('public_facility1'.tr()),
                ),
                ListTile(
                  leading: Icon(Icons.church, color: Colors.redAccent),
                  title: Text('public_facility2'.tr()),
                ),
                ListTile(
                  leading: Icon(Icons.restaurant, color: Colors.redAccent),
                  title: Text('public_facility3'.tr()),
                ),
                ListTile(
                  leading: Icon(
                    Icons.wheelchair_pickup,
                    color: Colors.redAccent,
                  ),
                  title: Text('public_facility4'.tr()),
                ),
                ListTile(
                  leading: Icon(Icons.atm, color: Colors.redAccent),
                  title: Text('public_facility5'.tr()),
                ),
                ListTile(
                  leading: Icon(Icons.wifi, color: Colors.redAccent),
                  title: Text('public_facility6'.tr()),
                ),
              ],
            ),

            // Accordion - Kategori
            ExpansionTile(
              title: Text(
                'category'.tr(),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              leading: const Icon(Icons.category, color: Colors.redAccent),
              children: [
                ListTile(
                  leading: Icon(Icons.attractions, color: Colors.redAccent),
                  title: Text('attractions'.tr()),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Tombol Kembali & Lanjutkan
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      side: const BorderSide(color: Colors.grey),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
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
                      pushSlide(context, const CiriScreen(), fromRight: true);
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
