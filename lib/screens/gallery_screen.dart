import 'package:flutter/material.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Galeri')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildGalleryItem(
            context,
            imagePath: 'assets/images/thumbnail1.png',
            routeName: '/panorama1',
          ),
          const SizedBox(height: 16),
          _buildGalleryItem(
            context,
            imagePath: 'assets/images/thumbnail2.png',
            routeName: '/panorama2',
          ),
          const SizedBox(height: 16),
          _buildGalleryItem(
            context,
            imagePath: 'assets/images/thumbnail3.png',
            routeName: '/panorama3',
          ),
        ],
      ),
    );
  }

  Widget _buildGalleryItem(
    BuildContext context, {
    required String imagePath,
    required String routeName,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Stack(
        children: [
          Image.asset(
            imagePath,
            height: 180,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 12,
            right: 12,
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, routeName);
              },
              icon: const Icon(Icons.search),
              label: const Text('Telusuri'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black.withOpacity(0.6),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                textStyle: const TextStyle(fontSize: 14),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
