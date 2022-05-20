import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:test_task_rest/api/json_place_holder_api.dart';
import 'package:test_task_rest/constants/constants.dart';
import 'package:test_task_rest/models/comment.dart';
import 'package:test_task_rest/models/comment_model.dart';
import 'package:test_task_rest/models/posts_model.dart';
import 'package:test_task_rest/models/user_model.dart';
import 'package:test_task_rest/widgets/comment_input_widget.dart';
import 'package:test_task_rest/widgets/comment_post_widget.dart';
import 'package:test_task_rest/widgets/discription_dialog_post_widget.dart';
import 'package:test_task_rest/widgets/user_short_info_widget.dart';

import '../router/router.dart';

class DescriptionPostWidget extends StatefulWidget {
  const DescriptionPostWidget({
    Key key,
    @required this.userpostid,
    @required this.user,
    @required this.index,
    @required this.posts,
    @required this.textDefaultColor,
  }) : super(key: key);

  final int userpostid;
  final User user;
  final List<Posts> posts;
  final Color textDefaultColor;
  final int index;

  @override
  State<DescriptionPostWidget> createState() => _DescriptionPostWidgetState();
}

class _DescriptionPostWidgetState extends State<DescriptionPostWidget> {
  String firstHalf;
  String secondHalf;

  bool _flag = true;
  final _key = GlobalKey<FormState>();

  TextEditingController textController = TextEditingController();

  @override
  void initState() {
    super.initState();

    final text = widget.posts[widget.index].body;
    if (text.length > 70) {
      firstHalf = text.substring(0, 70);
      secondHalf = text.substring(70, text.length);
    } else {
      firstHalf = text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    final post = widget.posts[widget.index];
    return Form(
      key: _key,
      child: Padding(
        padding: const EdgeInsets.only(top: 12, bottom: 12, left: 6),
        child: Card(
          color: Colors.white,
          elevation: 0.6,
          child: Column(children: [
            UserShortInfoWidget(
              widget: widget,
              name: widget.user.name,
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: ListTile(
                onTap: () async {
                  await showGeneralDialog(
                      context: context,
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return DiscriptionDialogPostWidget(
                          name: widget.user.name,
                          widget: widget,
                          post: post,
                        );
                      });
                },
                title: Text(
                  post.title,
                  style: TextStyle(
                      color: widget.textDefaultColor,
                      fontSize: 19,
                      fontStyle: FontStyle.italic),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(left: 4, right: 4, top: 6),
                  child: secondHalf.isEmpty
                      ? Text(firstHalf)
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(_flag
                                ? (firstHalf + "...")
                                : (firstHalf + secondHalf)),
                            InkWell(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    _flag ? "Показать полностью..." : "",
                                    style: const TextStyle(
                                      color: Constants.themeColor,
                                    ),
                                  ),
                                ],
                              ),
                              onTap: () {
                                setState(() {
                                  _flag = !_flag;
                                });
                              },
                            ),
                          ],
                        ),
                ),
              ),
            ),
            CommentInputWidget(
              globalKey: _key,
              post: post,
              textController: textController,
            ),
            FutureBuilder<List<Comments>>(
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var comments = snapshot.data;
                  return SizedBox(
                    height: 170,
                    child: ListView.builder(
                      itemBuilder: ((context, index) {
                        if (comments[index].postId == post.id) {
                          return CommentPostWidget(
                              name: comments[index].email,
                              comment: comments[index].body);
                        } else {
                          return Container();
                        }
                      }),
                      itemCount: comments.length,
                    ),
                  );
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Constants.themeColor,
                    ),
                  );
                }
                if (snapshot.hasError) {
                  return const Center(
                    child: Text('Something went wrong...'),
                  );
                }
                return Container();
              },
              future:
                  JsonPlaceHolderApi().fetchAllCommentsOfThePostData(post.id),
            ),
          ]),
        ),
      ),
    );
  }
}
