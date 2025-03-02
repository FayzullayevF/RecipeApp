import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

class RecipeDetailVideo extends StatefulWidget {
  const RecipeDetailVideo({
    super.key,
    required this.videoUrl,
  });

  final String videoUrl;

  @override
  State<RecipeDetailVideo> createState() => _RecipeDetailVideoState();
}

class _RecipeDetailVideoState extends State<RecipeDetailVideo> {
  late final VideoPlayerController controller;


  @override
  void initState() {
    super.initState();
    // shu pageni ochganda yonchasiga ko'rinishi uchun
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);


    controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl));
    controller.initialize().then(
          (value) => setState(() {
            controller.play();
          }),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: VideoPlayer(controller),
    );
  }
}

// video_player
// VideoPlayerController
//   .play, pause, seekTo, value.isPlaying, value.position, setPlaybackSpeed, setVolume 0 1
// SystemChrome.setPreferredOrientation