import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

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
        // Jika belum play, set asset dulu
        await _player.setAsset('assets/audios/gerbang.mp3');
        await _player.play();
      } else {
        await _player.stop();
      }
    } catch (e) {
      print("Error playing audio: $e");
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
              const Text(
                'Sam Poo Kong merupakan klenteng bersejarah yang mencerminkan perpaduan budaya Tionghoa dan Jawa, dibangun di lokasi yang diyakini pernah disinggahi Laksamana Zheng He pada tahun 1416. Tempat ini berasal dari gua batu yang dijadikan tempat ibadah, dan kini telah berkembang menjadi kompleks klenteng yang megah, dengan pembangunan ulang gedung utamanya pada tahun 2002–2005.',
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
                child: const Text(
                  'Lanjutkan',
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
