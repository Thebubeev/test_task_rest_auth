import 'package:flutter/cupertino.dart';

class Comment {
  final String title;
  final String body;
  final int userId;

  Comment({@required this.title, @required this.body, @required this.userId});

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(title: json['title'], body: json['body'], userId: json['userId']);
  }

    Map<String, dynamic> toJson() => {
        "title": title,
        "body": body,
        "userId": userId,
      };
}
