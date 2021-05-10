import 'package:datatest/model/commentAdapter.dart';
import 'package:datatest/presentation/home.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

Future<void> main() async {
  final filesDir = await path_provider.getApplicationDocumentsDirectory();

  Hive.init(filesDir.path);
  Hive.registerAdapter(CommentAdapter());
  runApp(MyApp());
  final myCommentsBox = Hive.box('myComments');
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SafeArea(child: Scaffold(body: HomePage())),
    );
  }
}
