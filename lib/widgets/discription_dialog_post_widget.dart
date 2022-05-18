import 'package:flutter/material.dart';
import 'package:test_task_rest/api/json_place_holder_api.dart';
import 'package:test_task_rest/models/comment_model.dart';
import 'package:test_task_rest/widgets/comment_input_widget.dart';
import 'package:test_task_rest/widgets/comment_post_widget.dart';
import 'package:test_task_rest/widgets/user_short_info_widget.dart';

import '../models/posts_model.dart';

class DiscriptionDialogPostWidget extends StatefulWidget {
  final String name;
  final Widget widget;
  final Posts post;
  const DiscriptionDialogPostWidget(
      {Key key, this.name, this.widget, this.post})
      : super(key: key);

  @override
  State<DiscriptionDialogPostWidget> createState() =>
      _DiscriptionDialogPostWidgetState();
}

class _DiscriptionDialogPostWidgetState
    extends State<DiscriptionDialogPostWidget> {
  TextEditingController textController = TextEditingController();
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        key: _key,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Card(
              color: Theme.of(context).primaryColor,
              child: Column(children: [
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    UserShortInfoWidget(name: widget.name, widget: widget),
                    IconButton(
                        onPressed: (() => Navigator.pop(context)),
                        icon: Icon(
                          Icons.close,
                          color: Theme.of(context).iconTheme.color,
                        ))
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: ListTile(
                    title: Text(
                      widget.post.title,
                      style: TextStyle(
                          color: Theme.of(context)
                              .textSelectionTheme
                              .selectionColor,
                          fontSize: 19,
                          fontStyle: FontStyle.italic),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(left: 4, right: 4, top: 6),
                      child: Text(widget.post.body),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                CommentInputWidget(
                  globalKey: _key,
                  post: widget.post,
                  textController: textController,
                ),
                FutureBuilder<List<Comments>>(
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      var comments = snapshot.data;
                      return SizedBox(
                        height: 280,
                        child: ListView.builder(
                          itemBuilder: ((context, index) {
                            if (comments[index].postId == widget.post.id) {
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
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (snapshot.hasError) {
                      return const Center(
                        child: Text('Something went wrong...'),
                      );
                    }
                    return Container();
                  },
                  future: JsonPlaceHolderApi()
                      .fetchAllCommentsOfThePostData(widget.post.id),
                )
              ]),
              elevation: 1),
        ),
      ),
    );
  }
}
