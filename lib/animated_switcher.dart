import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AnimSwitch extends StatefulWidget {
  const AnimSwitch({Key? key}) : super(key: key);

  @override
  State<AnimSwitch> createState() => _AnimSwitchState();
}

class _AnimSwitchState extends State<AnimSwitch> {
  int _count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              child: Text(
                '$_count',
                style: const TextStyle(
                  fontSize: 40,
                ),
                key: ValueKey(_count),
              ),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return ScaleTransition(
                  scale: animation,
                  child: child,
                );
              },
            ),
            ElevatedButton(
              child: const Text("Add"),
              onPressed: () {
                setState(() {
                  _count += 1;
                });
              },
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
              child: const Text("tap to see Animated Rotation"))
          ],
        ),
      ),
    );
  }
}
