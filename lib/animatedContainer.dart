import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Animatedcon extends StatefulWidget {
  const Animatedcon({Key? key}) : super(key: key);

  @override
  State<Animatedcon> createState() => _AnimatedconState();
}

class _AnimatedconState extends State<Animatedcon> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          setState(() {
            selected = !selected;
          });
        },
        child: Center(
          child: AnimatedContainer(
            width: selected ? 400.0 : 200.0,
            height: selected ? 200.0 : 400.0,
            color: selected ? Colors.amber : Colors.purple,
            alignment:
                selected ? Alignment.center : AlignmentDirectional.topCenter,
            // decoration: BoxDecoration(
            //   color:Colors.red,
            //   // borderRadius: _borderRadius,
            // ),

            duration: Duration(seconds: 2),
            curve: Curves.fastOutSlowIn,
            child: FlutterLogo(
              size: 75,
            ),
          ),
        ),
      ),
    );
  }
}
