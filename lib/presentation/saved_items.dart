import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class SavedItemPage extends StatefulWidget {
  @override
  _SavedItemPageState createState() => _SavedItemPageState();
}

class _SavedItemPageState extends State<SavedItemPage> {
  final commentsBox = Hive.box('myComments');

  @override
  Widget build(BuildContext context) {
    print(commentsBox.getAt(0));
    return Column(
      children: [
        Expanded(flex: 1, child: Icon(Icons.arrow_back)),
        Expanded(
          flex: 7,
          child: Column(
            children: [],
          ),
        ),
      ],
    );
  }
}
