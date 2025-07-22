import 'package:flutter/material.dart';
import 'package:panorama_viewer/panorama_viewer.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'package:easy_localization/easy_localization.dart';

class Panorama2Screen extends StatefulWidget {
  const Panorama2Screen({super.key});

  @override
  State<Panorama2Screen> createState() => _Panorama2ScreenState();
}

class _Panorama2ScreenState extends State<Panorama2Screen> {
  late List<VideoPlayerController> _videoControllers;
  late List<ChewieController> _chewieControllers;
  bool _isVideoReady = false;

  bool _isMinimized = false;
  ChewieController? _currentChewieController;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeVideoPlayers();
    });
  }

  Future<void> _initializeVideoPlayers() async {
    final localeCode = context.locale.languageCode;

    final videoPaths = [
      'assets/videos/$localeCode-panggung-utama.mp4',
      'assets/videos/$localeCode-patung-laksamana-zheng-he.mp4',
      'assets/videos/$localeCode-tempat-pemujaan-dewa-bumi-tho-tee-kong.mp4',
      'assets/videos/$localeCode-tempat-pemujaan-klenteng-besar.mp4',
      'assets/videos/$localeCode-tempat-pemujaan-makam-kyai-juru-mudi.mp4',
    ];

    _videoControllers = [];
    _chewieControllers = [];

    for (var path in videoPaths) {
      try {
        final videoController = VideoPlayerController.asset(path);
        await videoController.initialize();
        final chewieController = ChewieController(
          videoPlayerController: videoController,
          autoPlay: false,
          looping: false,
        );
        _videoControllers.add(videoController);
        _chewieControllers.add(chewieController);
      } catch (e) {
        debugPrint("Gagal memuat video: $path");
        final dummyController = VideoPlayerController.asset('');
        _videoControllers.add(dummyController);
        _chewieControllers.add(
          ChewieController(
            videoPlayerController: dummyController,
            autoPlay: false,
            looping: false,
          ),
        );
      }
    }

    setState(() {
      _isVideoReady = true;
    });
  }

  void _showVideoDialog(ChewieController chewieController) {
    if (!_isVideoReady ||
        !chewieController.videoPlayerController.value.isInitialized) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Video belum siap atau tidak tersedia')),
      );
      return;
    }

    setState(() {
      _currentChewieController = chewieController;
      _isMinimized = false;
    });

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.all(10),
          child: Stack(
            children: [
              AspectRatio(
                aspectRatio:
                    chewieController.videoPlayerController.value.aspectRatio,
                child: Chewie(controller: chewieController),
              ),
              Positioned(
                top: 10,
                right: 30,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black45,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 1),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.minimize,
                          color: Colors.white,
                          size: 13,
                        ),
                        tooltip: 'Minimize',
                        onPressed: () {
                          setState(() {
                            _isMinimized = true;
                          });
                          Navigator.of(context).pop();
                        },
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 13,
                        ),
                        tooltip: 'Close',
                        onPressed: () {
                          chewieController.pause();
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _maximizeVideo() {
    if (_currentChewieController != null) {
      _showVideoDialog(_currentChewieController!);
    }
  }

  @override
  void dispose() {
    for (var controller in _videoControllers) {
      controller.dispose();
    }
    for (var controller in _chewieControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Panorama Viewer'),
        backgroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          !_isVideoReady
              ? const Center(child: CircularProgressIndicator())
              : PanoramaViewer(
                sensorControl: SensorControl.orientation,
                hotspots: [
                  _buildHotspot(150, -20, 0, Icons.info, Colors.blue),
                  _buildHotspot(-48, -20, 3, Icons.info, Colors.blue),
                  _buildHotspot(-94, -25, 1, Icons.info, Colors.blue),
                  _buildHotspot(31, -22, 4, Icons.info, Colors.blue),
                  _buildHotspot(-14, -22, 2, Icons.info, Colors.blue),
                ],
                child: Image.asset('assets/images/panorama2.jpg'),
              ),
          if (_isMinimized && _currentChewieController != null)
            Positioned(
              bottom: 16,
              right: 16,
              child: Container(
                width: 210,
                height: 112, // 16:9 aspect ratio
                decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 6)],
                ),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Chewie(controller: _currentChewieController!),
                    ),
                    Positioned(
                      top: 4,
                      right: 4,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black38,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(
                                Icons.fullscreen,
                                color: Colors.white,
                                size: 18,
                              ),
                              tooltip: 'Maximize',
                              onPressed: () {
                                setState(() {
                                  _isMinimized = false;
                                });
                                _maximizeVideo();
                              },
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.close,
                                color: Colors.white,
                                size: 18,
                              ),
                              tooltip: 'Close',
                              onPressed: () {
                                setState(() {
                                  _isMinimized = false;
                                  _currentChewieController?.pause();
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  Hotspot _buildHotspot(
    double longitude,
    double latitude,
    int index,
    IconData icon,
    Color color,
  ) {
    return Hotspot(
      longitude: longitude,
      latitude: latitude,
      width: 60,
      height: 60,
      widget: GestureDetector(
        onTap: () {
          _showVideoDialog(_chewieControllers[index]);
        },
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromRGBO(255, 255, 255, 0.7),
            shape: BoxShape.circle,
            border: Border.all(color: color, width: 2),
          ),
          child: Icon(icon, color: color),
        ),
      ),
    );
  }
}
