import 'package:flutter/material.dart';
import 'package:grind_lab/core/resources/media_res.dart';
import 'package:injectable/injectable.dart';
import 'package:video_player/video_player.dart';

@lazySingleton
class VideoPreloaderService {
  VideoPlayerController? _controller;

  Future<void> initializeWelcomeVideo() async {
    if (_controller != null && _controller!.value.isInitialized) {
      return;
    }
    _controller = VideoPlayerController.asset(MediaRes.welcomeVideo);
    await _controller!.initialize();
    await _controller!.setLooping(true);
    await _controller!.setVolume(0.0);
  }

  VideoPlayerController? get controller => _controller;

  void pause() {
    _controller?.pause();
  }

  void play() {
    _controller?.play();
  }

  void dispose() {
    _controller?.dispose();
    _controller = null;
  }
}
