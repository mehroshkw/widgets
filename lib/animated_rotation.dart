import 'package:flutter/material.dart';
import 'package:widgets/animated_size.dart';

class AnimRotate extends StatefulWidget {
  AnimRotate({Key? key}) : super(key: key);

  @override
  State<AnimRotate> createState() => _AnimRotateState();
}

class _AnimRotateState extends State<AnimRotate> {
  double turns = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(children: [
          SizedBox(
            height: 100,
          ),
          AnimatedRotation(
            turns: turns,
            duration: const Duration(seconds: 2),
            child: Image.asset('assets/images/splash1.png'),
          ),
          ElevatedButton(
              onPressed: () {
                setState(() => turns += 1 / 4);
              },
              child: const Text("Click to Rotate")),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return AnimSize();
                }));
              },
              child: const Text("tap to see Animated Size"))
        ]),
      ),
    );
  }
}
