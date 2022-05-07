import 'package:flutter/cupertino.dart';
import 'package:video_player/video_player.dart';

import '../../../resources/app_strings.dart';

class VideoPostPlayer extends StatefulWidget {
  const VideoPostPlayer({Key? key, required this.videoSrc}) : super(key: key);

  final String videoSrc;

  @override
  State<VideoPostPlayer> createState() => _VideoPostPlayerState();
}

class _VideoPostPlayerState extends State<VideoPostPlayer> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoSrc)
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
              width: MediaQuery.of(context).size.width,
              child: AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              ),
            ),
          )
        : Container();
  }
}
