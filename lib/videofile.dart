import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class videoplay extends StatefulWidget {
  videoplay({super.key});

  final FlickManager flickManager = FlickManager(videoPlayerController: VideoPlayerController.network("https://vod.api.video/vod/viShE2swIqeAlKievDp0dUN/mp4/source.mp4"));
  @override
  State<videoplay> createState() => _videoplayState();
}

class _videoplayState extends State<videoplay> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
           body: Center(
             child: AspectRatio(
               aspectRatio: 16/9,
               child: FlickVideoPlayer(flickManager:widget.flickManager),
             ),
           ),
    );
  }
}
