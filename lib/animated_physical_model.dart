import 'package:flutter/material.dart';
import 'package:widgets/animated_position.dart';

class PhyModel extends StatefulWidget {
  PhyModel({Key? key}) : super(key: key);

  @override
  State<PhyModel> createState() => _PhyModelState();
}

class _PhyModelState extends State<PhyModel> {
  bool flat = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedPhysicalModel(
            shape: BoxShape.rectangle,
            elevation: flat ? 1.0 : 0.0,
            color: Colors.white,
            shadowColor: Colors.black,
            curve: Curves.fastOutSlowIn,
            duration: const Duration(milliseconds: 500),
            child: const SizedBox(
              height: 200.0,
              width: 200.0,
              child: const Icon(Icons.android_outlined),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            child: const Text("Click"),
            onPressed: () {
              setState(() {
                flat = !flat;
              });
            },
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return const AnimPosition();
                }));
              },
              child: const Text("tap to see Animated Positioned"))
        ],
      )),
    );
  }
}
