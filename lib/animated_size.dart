import 'package:flutter/material.dart';
import 'package:widgets/animated_switcher.dart';

class AnimSize extends StatefulWidget {
  AnimSize({Key? key}) : super(key: key);

  @override
  State<AnimSize> createState() => _AnimSizeState();
}

class _AnimSizeState extends State<AnimSize> {
  double size = 300.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(child: GestureDetector(
            onTap: () {
              setState(() {
                size = size == 300 ? 100 : 300;
              });
            },
            child: Container(
              color: Colors.amber,
              child: AnimatedSize(
                curve: Curves.easeIn,
                duration: Duration(seconds: 2),
                child: FlutterLogo(size: size),
              ),
            )
            ),
          ),
           const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return AnimSwitch();
                }));
              },
              child: const Text("tap to see Animated Size"))
        ],
      ),
    );
  }
}
