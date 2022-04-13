import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inst_mobile/resources/app_strings.dart';
import 'package:video_player/video_player.dart';

class VideoHistoryPlayer extends StatefulWidget {
  const VideoHistoryPlayer({Key? key, required this.videoSrc})
      : super(key: key);

  final String videoSrc;

  @override
  State<VideoHistoryPlayer> createState() => _VideoHistoryPlayerState();
}

class _VideoHistoryPlayerState extends State<VideoHistoryPlayer> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        '${AppStrings.apiUrl}/file?file_path=${widget.videoSrc}')
      ..initialize().then((value) => setState(() {}));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, setState) {
      return AlertDialog(
          content: _controller.value.isInitialized
              ? GestureDetector(
                  onTap: () {
                    _controller.value.isPlaying
                        ? _controller.pause()
                        : _controller.play();
                  },
                  child: AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  ),
                )
              : Container());
    });
  }
}
