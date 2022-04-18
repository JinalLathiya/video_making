import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late VideoPlayerController videoPlayerController;
  late ChewieController chewieController;

  @override
  void initState() {
    //TODO: implement initstate
    super.initState();
    initVideoController();
  }

  initVideoController() async {
    videoPlayerController = VideoPlayerController.asset("assets/videos/1v.mp4");
    videoPlayerController.initialize().then((value) {
      chewieController = ChewieController(
        videoPlayerController: videoPlayerController,
        autoPlay: true,
        looping: true,
      );
      setState(() {});
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          "Video Player Demo",
          style: TextStyle(
            fontSize: 22,
            color: Colors.white.withOpacity(0.7),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white.withOpacity(0.5),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          videoPlayerController.value.isInitialized
              ? SizedBox(
            height: 500,
            child: Chewie(
              controller: chewieController,
            ),
          )
              : const Center(
            child: Text(
              "Sorry .. !! Video can't play 😱",
              style: TextStyle(
                fontSize: 22,
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
    );
  }
}
