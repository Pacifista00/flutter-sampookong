import 'package:flutter/material.dart';

class FloatingPrivateButton extends StatelessWidget {
  const FloatingPrivateButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {
        Navigator.pushNamed(context, '/scanner');
      },
      backgroundColor: Colors.blueAccent,
      label: const Text(
        "Selengkapnya",
        style: TextStyle(fontSize: 16, color: Colors.white),
      ),
    );
  }
}
