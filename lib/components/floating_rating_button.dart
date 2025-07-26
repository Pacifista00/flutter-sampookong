import 'package:flutter/material.dart';

class FloatingRatingButton extends StatelessWidget {
  const FloatingRatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.pushNamed(context, '/rating');
      },
      backgroundColor: Colors.blueAccent,
      child: const Icon(Icons.star_rate),
    );
  }
}
