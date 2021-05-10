class Comment {
  int postId;
  int id;
  String name;
  String email;
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
