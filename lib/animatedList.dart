import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:widgets/animatedOpacity.dart';

class AnimatedLists extends StatefulWidget {
  const AnimatedLists({Key? key}) : super(key: key);

  @override
  State<AnimatedLists> createState() => _AnimatedListsState();
}

class _AnimatedListsState extends State<AnimatedLists> {
  final items = [];
  final GlobalKey<AnimatedListState> _key = GlobalKey();

  void _addItems() {
    items.insert(0, "Item ${items.length + 1}");
    _key.currentState!.insertItem(0, duration: const Duration(seconds: 1));
  }

  void _removeItem(int index) {
    _key.currentState!.removeItem(
      index,
      (_, animation) {
        return SizeTransition(
          sizeFactor: animation,
          child: const Card(
            margin: EdgeInsets.all(10),
            color: Colors.amber,
            child: ListTile(
              title: Text(
                "Deleted",
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
          ),
        );
      },
      duration: const Duration(milliseconds: 300),
    );
    items.removeAt(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        SizedBox(
          height: 80,
        ),
        Expanded(
            child: AnimatedList(
          key: _key,
          initialItemCount: 0,
          padding: EdgeInsets.all(10),
          itemBuilder: (context, index, animation) {
            return SizeTransition(
              key: UniqueKey(),
              sizeFactor: animation,
              child: Card(
                margin: const EdgeInsets.all(10),
                color: Colors.lightBlue,
                child: ListTile(
                  title: Text(
                    items[index],
                    style: TextStyle(fontSize: 24),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      _removeItem(index);
                    },
                  ),
                ),
              ),
            );
          },
        )),
        IconButton(
          onPressed: _addItems,
          icon: Icon(Icons.add),
        ),
        SizedBox(
          height: 20,
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return AnimOpacity();
              }));
            },
            child: Text("tap to see Animated Opacity"))
      ]),
    );
  }
}
