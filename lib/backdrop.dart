import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:widgets/bannerscreen.dart';

class Backdrop extends StatefulWidget {
  const Backdrop({Key? key}) : super(key: key);

  @override
  State<Backdrop> createState() => _BackdropState();
}

class _BackdropState extends State<Backdrop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Text(
            '0' * 10000,
            style: TextStyle(color: Colors.green),
          ),
          Center(
              child: ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 4.0,
                sigmaY: 4.0,
              ),
              child: Container(
                alignment: Alignment.center,
                width: 250,
                height: 250,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return BannerScreen();
                    }));
                  },
                  child: Text("Click"),
                ),
              ),
            ),
          ))
        ],
      ),
    );
  }
}
