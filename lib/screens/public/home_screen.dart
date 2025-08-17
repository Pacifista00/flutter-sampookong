import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:sampookong/screens/public/detail_screen.dart';
import 'package:video_player/video_player.dart';
import 'package:sampookong/helper/navigation_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late VideoPlayerController _controller;
  bool isPlaying = false;
  bool isInitialized = false;

  Future<void> _toggleAudio() async {
    try {
      if (isInitialized && _controller.value.isPlaying) {
        await _controller.pause();
        setState(() {
          isPlaying = false;
        });
      } else {
        final langCode = context.locale.languageCode; // "id", "en"
        String audioPath =
            langCode == 'en'
                ? 'assets/videos/en-gerbang.mp4'
                : 'assets/videos/id-gerbang.mp4';

        _controller = VideoPlayerController.asset(audioPath);
        await _controller.initialize();
        await _controller.setLooping(false);
        await _controller.play();

        setState(() {
          isPlaying = true;
          isInitialized = true;
        });

        _controller.addListener(() {
          if (!_controller.value.isPlaying &&
              _controller.value.position >= _controller.value.duration) {
            setState(() {
              isPlaying = false;
            });
          }
        });
      }
    } catch (e) {
      print("Error playing mp4 audio: $e");
    }
  }

  @override
  void dispose() {
    if (isInitialized) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD22027),
      appBar: AppBar(backgroundColor: const Color(0xFFD22027), elevation: 0),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'SAM POO KONG',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    'assets/images/gerbang.png',
                    width: 200,
                    height: 200,
                    fit: BoxFit.contain,
                  ),
                  IconButton(
                    iconSize: 64,
                    icon: Icon(
                      isPlaying ? Icons.stop_circle : Icons.play_circle_fill,
                      color: Colors.white,
                    ),
                    onPressed: _toggleAudio,
                  ),
                ],
              ),
              const SizedBox(height: 60),
              Text(
                'sampookong_description'.tr(),
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
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
                  pushSlide(context, const DetailScreen(), fromRight: true);
                },
                child: Text(
                  'next'.tr(),
                  style: TextStyle(fontSize: 20, color: Color(0xFF414042)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
