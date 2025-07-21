import 'package:flutter/material.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Menu Utama')),
      body: const Center(
        child: Text(
          'Selamat datang di menu utama!',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
