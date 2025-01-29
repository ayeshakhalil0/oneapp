import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'dart:io';
import '../widgets/video_background.dart';

class LoginSignupCommonBackground extends StatefulWidget {
  final Widget child;

  const LoginSignupCommonBackground({required this.child, Key? key})
      : super(key: key);

  @override
  _LoginSignupCommonBackgroundState createState() =>
      _LoginSignupCommonBackgroundState();
}

class _LoginSignupCommonBackgroundState
    extends State<LoginSignupCommonBackground> {
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
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          const VideoBackground(),
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: widget.child,
            ),
          ),
        ],
      ),
    );
  }
}
