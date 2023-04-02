import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ModalBarrier extends StatefulWidget {
  const ModalBarrier({Key? key}) : super(key: key);

  @override
  State<ModalBarrier> createState() => _ModalBarrierState();
}

class _ModalBarrierState extends State<ModalBarrier>
    with SingleTickerProviderStateMixin {
  bool isPressed = false;
  late Widget _animatedMB;
  late AnimationController _animationController;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    ColorTween _colorTween = ColorTween(
        begin: Colors.blue.withOpacity(0.5),
        end: Colors.orange.withOpacity(0.5));
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    _colorAnimation = _colorTween.animate(_animationController);
    _animatedMB = AnimatedModalBarrier(
      color: _colorAnimation,
      dismissible: true,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(children: [
            SizedBox(
              width: 100.0,
              height: 250.0,
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(primary: Colors.blueAccent),
                      onPressed: () {
                        setState(() {
                          isPressed = true;
                          _animationController.reset();
                          _animationController.forward();
                          Future.delayed(Duration(seconds: 3), () {
                            setState(() {
                              isPressed = false;
                            });
                          });
                        });
                      },
                      child: Text("Press")),
                  if (isPressed) _animatedMB,
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
