import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:widgets/auto_complete.dart';

class AppbarScreen extends StatefulWidget {
  const AppbarScreen({Key? key}) : super(key: key);

  @override
  State<AppbarScreen> createState() => _AppbarScreenState();
}

class _AppbarScreenState extends State<AppbarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Appbar"),
        backgroundColor: Colors.amberAccent,
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.alarm)),
        ],
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25))),
      ),
      body: Center(
          child: Container(
        alignment: Alignment.center,
        color: Colors.amberAccent,
        height: 350.0,
        width: double.infinity,
        child: AspectRatio(
          aspectRatio: 80 / 10,
          child: Container(
            color: Colors.brown,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return AutoCorrect();
                }));
              },
              child: Text("Click"),
            ),
          ),
        ),
      )),
    );
  }
}
