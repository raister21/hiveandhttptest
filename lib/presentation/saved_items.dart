import 'package:datatest/model/comment.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class SavedItemPage extends StatefulWidget {
  @override
  _SavedItemPageState createState() => _SavedItemPageState();
}

class _SavedItemPageState extends State<SavedItemPage> {
  final commentsBox = Hive.box<Comment>('myComments');

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(flex: 1, child: Icon(Icons.arrow_back)),
        Expanded(
          flex: 7,
          child: Container(
            child: ListView.builder(
                itemCount: commentsBox.length,
                itemBuilder: (context, index) {
                  return Text(commentsBox.getAt(index).body);
                }),
          ),
        ),
      ],
    );
  }
}
