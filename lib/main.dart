import 'package:datatest/model/comment.dart';
import 'package:datatest/presentation/home.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {
  Hive.initFlutter();
  Hive.registerAdapter(CommentAdapter());
  await Hive.openBox<Comment>('myComments');
  runApp(MyApp());
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
