import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:widgets/animatedPadding.dart';
import 'package:widgets/animated_position.dart';

class Modes extends StatefulWidget {
  const Modes({Key? key}) : super(key: key);

  @override
  State<Modes> createState() => _ModesState();
}

class _ModesState extends State<Modes> {
  @override
  Widget build(BuildContext context) {
    int _currentIndex = 1;
    List<Widget> _pages = <Widget>[];
    @override
    void initState() {
      _pages.add(AnimPadding());
      _pages.add(AnimPosition());
      _pages.add(AnimPadding());
      _pages.add(AnimPadding());
      _pages.add(AnimPadding());
      super.initState();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Light and Dark Mode"),
        actions: [
          IconButton(onPressed: (){
            Get.isDarkMode ? Get.changeTheme(ThemeData.light()) :
                Get.changeTheme(ThemeData.dark());
          }, icon: Icon(Icons.lightbulb))
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 2.0,
        clipBehavior: Clip.antiAlias,
        child: Container(
          height: kBottomNavigationBarHeight,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(
                  color: Colors.grey,
                  width: 0.5,
                ),
              ),
            ),
            child: BottomNavigationBar(
                currentIndex: _currentIndex,
                backgroundColor: Colors.white,
                selectedItemColor: Colors.blue,

                onTap: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.category), label: 'Category'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.settings_outlined), label: 'Setting'),
                  BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.settings_outlined), label: 'Setting'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.category), label: 'Category'),
                ]),
          ),
        ),
      ),
      floatingActionButtonLocation:
      FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          backgroundColor: _currentIndex == 1 ? Colors.blue : Colors.blueGrey,
          child: Icon(Icons.home),
          onPressed: () => setState(() {
            _currentIndex = 1;
          }),
        ),
      ),
      body: Center(
        child: Text(Get.isDarkMode ? 'Dark Mode' : 'Light Mode',
        style: Theme.of(context).textTheme.headline4,
        ),
      ),
    );
  }
}
