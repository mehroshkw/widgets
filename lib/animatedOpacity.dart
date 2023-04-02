import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:widgets/animatedPadding.dart';

class AnimOpacity extends StatefulWidget {
  const AnimOpacity({Key? key}) : super(key: key);

  @override
  State<AnimOpacity> createState() => _AnimOpacityState();
}

class _AnimOpacityState extends State<AnimOpacity> {
  double opacityLvl = 1.0;
  @override
  Widget build(BuildContext context) {
    void _changeOpacity() {
      setState(() => opacityLvl = opacityLvl == 0 ? 1.0 : 0.0);
    }

    return Scaffold(
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AnimatedOpacity(
                  opacity: opacityLvl,
                  duration: const Duration(seconds: 3),
                  child: Image.asset('assets/images/splash3.png')),
              ElevatedButton(
                onPressed: _changeOpacity,
                child: const Text('Fade Logo'),
              ),
              SizedBox(
          height: 20,
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return AnimPadding();
              }));
            },
            child: Text("tap to see Animated Padding"))
            ]),
      ),
    );
  }
}
