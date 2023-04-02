import 'package:flutter/material.dart';
import 'package:widgets/animatedList.dart';

class AnimatedIconScreen extends StatefulWidget {
  AnimatedIconScreen({Key? key}) : super(key: key);

  @override
  State<AnimatedIconScreen> createState() => _AnimatedIconScreenState();
}

class _AnimatedIconScreenState extends State<AnimatedIconScreen>
    with TickerProviderStateMixin {
  bool play = false;
  late AnimationController _controller;

  @override
  void initState() {
    _controller =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        SizedBox(
          height: 100,
        ),
        Center(
          child: GestureDetector(
            onTap: () {
              if (play == false) {
                _controller.forward();
                play = true;
              } else {
                _controller.reverse();
                play = false;
              }
            },
            child: AnimatedIcon(
              icon: AnimatedIcons.play_pause,
              progress: _controller,
              size: 100,
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return AnimatedLists();
              }));
            },
            child: Text("tap to see Animated List"))
      ]),
    );
  }
}
