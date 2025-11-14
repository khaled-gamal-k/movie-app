import 'package:flutter/material.dart';
import 'package:movies/core/theme/app_colors.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TrailerPlayerView extends StatefulWidget {
  final String videoKey, movieTitle;
  const TrailerPlayerView({
    super.key,
    required this.videoKey,
    required this.movieTitle,
  });

  @override
  State<TrailerPlayerView> createState() => _TrailerPlayerViewState();
}

class _TrailerPlayerViewState extends State<TrailerPlayerView> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoKey,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        controlsVisibleAtStart: true,
        enableCaption: true,
      ),
    );
  }

  @override
  void dispose() {
    _controller.pause();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          widget.movieTitle,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
          progressIndicatorColor: Colors.blueAccent,
          progressColors:  const ProgressBarColors(
            playedColor: AppColors.blueAccent,
            handleColor: AppColors.orange,
          ),
        ),
      ),
    );
  }
}
