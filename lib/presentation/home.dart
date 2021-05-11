import 'dart:convert';
import 'package:datatest/data/http_service.dart';
import 'package:datatest/model/comment.dart';
import 'package:datatest/presentation/saved_items.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Comment> data = [];
  HttpClient client = HttpClient();
  final commentsBox = Hive.box<Comment>('myComments');

  _getData() async {
    data = await client.getDataFromApi(
        'https://jsonplaceholder.typicode.com/posts/1/comments');
    setState(() {});
  }

  @override
  void initState() {
    _getData();

    super.initState();
  }

  void _goToSavePage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SavedItemPage()));
  }

  void _saveComment(Comment comment) {
    commentsBox.add(comment);
    print(commentsBox.length);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 7,
          child: Container(
            child: ListView.builder(
                itemCount: data.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Text(data[index].id.toString()),
                    title: Text(data[index].email),
                    subtitle: Text(data[index].body),
                    trailing: TextButton(
                      onPressed: () {
                        _saveComment(data[index]);
                      },
                      child: Icon(Icons.save),
                    ),
                  );
                }),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            child: TextButton(
              onPressed: () {
                _goToSavePage();
              },
              child: Text("Saved items"),
            ),
          ),
        )
      ],
    );
  }
}
