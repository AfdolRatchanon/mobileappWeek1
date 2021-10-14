import 'package:better_player/better_player.dart';
import 'package:firstdart/config/constant.dart';
import 'package:flutter/material.dart';
import 'package:firstdart/config/constant.dart';

class packeageVideo extends StatefulWidget {
  const packeageVideo({Key? key}) : super(key: key);

  @override
  _packeageVideoState createState() => _packeageVideoState();
}

class _packeageVideoState extends State<packeageVideo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
        children: [
          Icon(
            Icons.video_call,
            color: sColor,
          ),
          Text(
            "  Video",
            style: TextStyle(color: sColor),
          ),
        ],
      )),
      body: Center(
        child: BetterPlayer.network(
          "https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4",
          betterPlayerConfiguration: BetterPlayerConfiguration(
            autoPlay: true,
          ),
        ),
      ),
    );
  }
}
