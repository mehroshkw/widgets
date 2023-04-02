import 'package:flutter/material.dart';
import 'package:widgets/clipscreen.dart';

class ClipRectPrc extends StatefulWidget {
  const ClipRectPrc({Key? key}) : super(key: key);

  @override
  State<ClipRectPrc> createState() => _ClipRectPrcState();
}

class _ClipRectPrcState extends State<ClipRectPrc> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          width: 300,
          height: 400,
          child: Text("mehrosh"),
          transform: Matrix4.rotationZ(4.9),
          color: Colors.greenAccent,
        ),
    );
  }
}

class NewClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return const Rect.fromLTWH(50, 100, 200, 300);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) {
    return false;
  }
}


