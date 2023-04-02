import 'package:flutter/material.dart';
import 'package:widgets/animatedIcon.dart';

class AnimatedDefaultText extends StatefulWidget {
  AnimatedDefaultText({Key? key}) : super(key: key);

  @override
  State<AnimatedDefaultText> createState() => _AnimatedDefaultTextState();
}

class _AnimatedDefaultTextState extends State<AnimatedDefaultText> {
  bool first = true;
  double fontSizze = 60;
  Color _color = Colors.amber;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisSize: MainAxisSize.min, children: [
        SizedBox(
          height: 60,
        ),
        SizedBox(
          height: 120,
          child: AnimatedDefaultTextStyle(
            duration: Duration(milliseconds: 300),
            style: TextStyle(
              fontSize: fontSizze,
              color: _color,
              fontWeight: FontWeight.bold,
            ),
            child: const Text("Flutter"),
          ),
        ),
        TextButton(
            onPressed: () {
              setState(() {
                fontSizze = first ? 90 : 60;
                _color = first ? Colors.blue : Colors.green;
                first = !first;
              });
            },
            child: const Text("Switch")),
             SizedBox(
            height: 30,
          ),
          ElevatedButton(onPressed: (){ Navigator.push(context, MaterialPageRoute(builder: (_){
                return AnimatedIconScreen();
              }));}, child: Text("tap to see Animated Icon"))
      ]),
    );
  }
}
