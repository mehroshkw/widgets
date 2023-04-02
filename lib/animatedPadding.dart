import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:widgets/animated_physical_model.dart';

class AnimPadding extends StatefulWidget {
  const AnimPadding({Key? key}) : super(key: key);

  @override
  State<AnimPadding> createState() => _AnimPaddingState();
}

class _AnimPaddingState extends State<AnimPadding> {
  double padValue = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 80,
        ),
        ElevatedButton(
            onPressed: () {
              setState(() {
                padValue = padValue == 0.0 ? 100.0 : 0.0;
              });
            },
            child: const Text("Change Padding")),
        Text("padding = $padValue"),
        AnimatedPadding(
          padding: EdgeInsets.all(padValue),
          duration: const Duration(seconds: 2),
          curve: Curves.slowMiddle,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 4,
            color: Colors.blueAccent,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return PhyModel();
              }));
            },
            child: const Text("tap to see Animated Opacity"))
      ],
    ));
  }
}
