import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:easy_localization/easy_localization.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AudioPlayer _player = AudioPlayer();
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();

    // Pantau perubahan status playing
    _player.playerStateStream.listen((state) {
      setState(() {
        isPlaying = state.playing;
      });
    });
  }

  Future<void> _toggleAudio() async {
    try {
      if (!_player.playing) {
        final langCode = context.locale.languageCode; // "id", "en"
        String audioPath;

        if (langCode == 'en') {
          audioPath = 'assets/audios/gerbang-en.mp3';
        } else {
          // Default (Indonesia atau lainnya)
          audioPath = 'assets/audios/gerbang.mp3';
        }

        await _player.setAsset(audioPath);
        await _player.play();
      } else {
        await _player.stop();
      }
    } catch (e) {
      // print("Error playing audio: $e");
    }
  }

  @override
  void dispose() {
    _player.dispose();
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
                  Navigator.pushReplacementNamed(context, '/gallery');
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
