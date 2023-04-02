import 'package:flutter/material.dart';
import 'package:widgets/animatedDefaultText.dart';

class AnimatedCroFade extends StatefulWidget {
  AnimatedCroFade({Key? key}) : super(key: key);

  @override
  State<AnimatedCroFade> createState() => _AnimatedCroFadeState();
}

class _AnimatedCroFadeState extends State<AnimatedCroFade> {
  bool _bool = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            height: 100,
          ),
          TextButton(
              onPressed: () {
                setState(() {
                  _bool = !_bool;
                });
              },
              child: const Text(
                'Switch',
                style: TextStyle(
                  color: Colors.black,
                ),
              )),
          AnimatedCrossFade(
            duration: const Duration(seconds: 2),
            firstChild: Image.asset(
              'assets/images/1.jpg',
              width: double.infinity,
            ),
            secondChild: Image.asset(
              'assets/images/2.jpg',
              width: double.infinity,
            ),
            crossFadeState:
                _bool ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          ),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(onPressed: (){ Navigator.push(context, MaterialPageRoute(builder: (_){
                return AnimatedDefaultText();
              }));}, child: Text("tap to see Animated Default Text"))
        ],
      ),
    );
  }
}
