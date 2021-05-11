import 'package:hive/hive.dart';

part 'comment.g.dart';

@HiveType(typeId: 2)
class Comment {
  @HiveField(0)
  int postId;
  @HiveField(1)
  int id;
  @HiveField(2)
  String name;
  @HiveField(3)
  String email;
  @HiveField(4)
  String body;

  Comment({this.postId, this.id, this.name, this.email, this.body});

  factory Comment.fromJson(dynamic data) {
    return Comment(
        postId: data['postId'],
        id: data['id'],
        name: data['name'],
        email: data['email'],
        body: data['body']);
  }
}
