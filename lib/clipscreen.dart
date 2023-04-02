import 'package:flutter/material.dart';

class ClipScreen extends StatelessWidget {
  const ClipScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ClipPath(
        clipper: MyClipper(),
        child: Container(
          width: double.infinity,
          height: 300,
          color: Colors.redAccent[100],
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  Path getClip(Size size) {
    return Path()
      ..lineTo(0, size.height)
      ..quadraticBezierTo(
        size.width / 4,
        size.height - 40,
        size.width / 2,
        size.height - 20,
      )
      ..quadraticBezierTo(
        3 / 4 * size.width,
        size.height,
        size.width,
        size.height - 30,
      )
      ..lineTo(size.width, 0);
      }
      
    bool shouldReclip(covariant CustomClipper<Path> oldclipper) {
      return false;
    
  }
}
