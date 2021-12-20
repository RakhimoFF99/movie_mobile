import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:wakelock/wakelock.dart';

class HomeController extends GetxController {
  late VideoPlayerController videoPlayerController;

  ChewieController? chewieController;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  disposeVideo() {
    videoPlayerController.pause();
  }

  @override
  void onClose() {
    videoPlayerController.dispose();
    chewieController!.dispose();
  }

  Future<void> initializePlayer(link) async {
    videoPlayerController = VideoPlayerController.network(link);
    await Future.wait([videoPlayerController.initialize()]);
    chewieController = ChewieController(
        videoPlayerController: videoPlayerController,
        showControlsOnInitialize: true,
        autoPlay: true,
        materialProgressColors: ChewieProgressColors(
            backgroundColor: Colors.teal,
            playedColor: Colors.red,
            handleColor: Colors.cyanAccent,
            bufferedColor: Colors.lightGreen),
        placeholder: Container(
          color: Colors.black,
        ),
        autoInitialize: true);
    Wakelock.enable();
    update();
  }
}
