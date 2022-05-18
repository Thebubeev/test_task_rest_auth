import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test_task_rest/constants/constants.dart';
import 'package:test_task_rest/models/albums_model.dart';
import 'package:test_task_rest/models/comment.dart';
import 'package:test_task_rest/models/comment_model.dart';
import 'package:test_task_rest/models/posts_model.dart';
import 'package:test_task_rest/models/user_model.dart';

class JsonPlaceHolderApi {
  Future<List<User>> fetchAllUsersData() async {
    final responce = await http.get(
        Uri.parse(
          Constants.URL + Constants.USERS,
        ),
        headers: {"Content-Type": "application/json"});

    if (responce.statusCode == 200) {
      final List jsonResponse = json.decode(responce.body);

      return jsonResponse.map((user) => User.fromJson(user)).toList();
    } else {
      throw Exception('Error: ${responce.reasonPhrase}');
    }
  }

  Future<List<Posts>> fetchAllPostsData() async {
    final responce = await http.get(
        Uri.parse(
          Constants.URL + Constants.POSTS,
        ),
        headers: {"Content-Type": "application/json"});

    if (responce.statusCode == 200) {
      final List jsonResponse = json.decode(responce.body);

      return jsonResponse.map((post) => Posts.fromJson(post)).toList();
    } else {
      throw Exception('Error: ${responce.reasonPhrase}');
    }
  }

  Future<List<Albums>> fetchAllAlbumsData() async {
    final responce = await http.get(
        Uri.parse(
          Constants.URL + Constants.ALBUMS,
        ),
        headers: {"Content-Type": "application/json"});

    if (responce.statusCode == 200) {
      final List jsonResponse = json.decode(responce.body);

      return jsonResponse.map((post) => Albums.fromJson(post)).toList();
    } else {
      throw Exception('Error: ${responce.reasonPhrase}');
    }
  }

  Future<List<Comments>> fetchAllCommentsOfThePostData(int postid) async {
    final responce = await http.get(
        Uri.parse(
          Constants.URL + Constants.POSTS + '/$postid' + Constants.COMMENTS,
        ),
        headers: {"Content-Type": "application/json"});

    if (responce.statusCode == 200) {
      final List jsonResponse = json.decode(responce.body);

      return jsonResponse.map((post) => Comments.fromJson(post)).toList();
    } else {
      throw Exception('Error: ${responce.reasonPhrase}');
    }
  }

  Future<Comment> sendCommentsToThePost(int postid, Comment comment) async {
    final responce = await http.post(
        Uri.parse(
          Constants.URL + Constants.POSTS + '/$postid',
        ),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(comment.toJson()));

    Comment comments = Comment.fromJson(jsonDecode(responce.body));
    return comments;
  }
}
