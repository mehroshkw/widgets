import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:widgets/backdrop.dart';

class AutoCorrect extends StatefulWidget {
  const AutoCorrect({Key? key}) : super(key: key);

  @override
  State<AutoCorrect> createState() => _AutoCorrectState();
}

class _AutoCorrectState extends State<AutoCorrect> {
  static const List<String> listItems = <String>[
    'apple',
    'banana',
    'melon',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 200,
          ),
          Autocomplete<String>(
            optionsBuilder: (TextEditingValue textEditingValue) {
              if (textEditingValue.text == '') {
                return const Iterable<String>.empty();
              }
              return listItems.where((String item) {
                return item.contains(textEditingValue.text.toLowerCase());
              });
            },
            onSelected: (String item) {
              print('The $item was selected');
            },
          ),
          SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return Backdrop();
              }));
            },
            child: Text("Click"),
          ),
        ],
      ),
    );
  }
}
