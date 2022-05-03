import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:video_player/video_player.dart';

import '../../resources/app_strings.dart';

class VideoPreviewPlayer extends StatefulWidget {
  const VideoPreviewPlayer({Key? key, required this.videoSrc}) : super(key: key);

  final File videoSrc;

  @override
  State<VideoPreviewPlayer> createState() => _VideoPreviewPlayerState();
}

class _VideoPreviewPlayerState extends State<VideoPreviewPlayer> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(widget.videoSrc)
      ..initialize().then((value) => setState(() {}));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? GestureDetector(
      onTap: () {
        _controller.value.isPlaying
            ? _controller.pause()
            : _controller.play();
      },
      child: SizedBox(
        height: 150,
        width: 300,
        child: AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: VideoPlayer(_controller),
        ),
      ),
    )
        : Container();
  }
}
