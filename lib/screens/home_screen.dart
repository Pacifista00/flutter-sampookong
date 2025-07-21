import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
