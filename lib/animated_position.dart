import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:widgets/animated_rotation.dart';

class AnimPosition extends StatefulWidget {
  const AnimPosition({Key? key}) : super(key: key);

  @override
  State<AnimPosition> createState() => _AnimPositionState();
}

class _AnimPositionState extends State<AnimPosition> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            width: 200,
            height: 350,
            child: Stack(
              children: [
                AnimatedPositioned(
                    width: selected ? 200 : 50.0,
                    height: selected ? 50.0 : 200.0,
                    top: selected ? 50.0 : 150.0,
                    curve: Curves.fastOutSlowIn,
                    duration: const Duration(seconds: 2),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selected = !selected;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    )),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return AnimRotate();
                }));
              },
              child: const Text("tap to see Animated Rotation"))
        ],
      ),
    );
  }
}
