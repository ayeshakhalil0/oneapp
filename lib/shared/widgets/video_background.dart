import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'dart:io';

class VideoBackground extends StatefulWidget {
  const VideoBackground({Key? key}) : super(key: key);

  @override
  _VideoBackgroundState createState() => _VideoBackgroundState();
}

class _VideoBackgroundState extends State<VideoBackground> {
  late VideoPlayerController _controller;
  bool _isVideoInitialized = false;
  bool _isInitializing = false;

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid || Platform.isIOS) {
      _initializeVideoPlayer();
    } else {
      print("Video playback is not supported on this platform.");
    }
  }

  void _initializeVideoPlayer() {
    if (_isInitializing || _isVideoInitialized) return;

    _isInitializing = true;

    _controller = VideoPlayerController.asset('assets/images/animation.mp4')
      ..initialize().then((_) {
        if (mounted) {
          setState(() {
            _isVideoInitialized = true;
            _isInitializing = false;
          });
          _controller.setLooping(true);
          _controller.play();
        }
      }).catchError((e) {
        print("Error initializing video: $e");
        if (mounted) {
          setState(() {
            _isInitializing = false;
          });
        }
      });
  }

  @override
  void dispose() {
    if (_isVideoInitialized) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF010101),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width,
            child: _isVideoInitialized
                ? ColoredBox(
                    color: Colors.black,
                    child: Center(
                      child: AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                      ),
                    ),
                  )
                : _isInitializing
                    ? const Center(child: CircularProgressIndicator())
                    : const ColoredBox(color: Colors.black),
          ),
          Expanded(
            child: Container(
              color: const Color(0xFF010101),
            ),
          ),
        ],
      ),
    );
  }
}
