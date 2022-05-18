import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:test_task_rest/api/json_place_holder_api.dart';
import 'package:test_task_rest/models/comment.dart';

import '../models/posts_model.dart';

class CommentInputWidget extends StatefulWidget {
  final Posts post;
  final GlobalKey<FormState> globalKey;
  final TextEditingController textController;
  const CommentInputWidget({
    Key key,
    this.globalKey,
    this.post,
    this.textController,
  }) : super(key: key);

  @override
  State<CommentInputWidget> createState() => _CommentInputWidgetState();
}

class _CommentInputWidgetState extends State<CommentInputWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 25, bottom: 15, top: 15),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: SizedBox(
                  width: 30,
                  height: 30,
                  child: CachedNetworkImage(
                    placeholder: (context, _) => CircularProgressIndicator(
                        color: Theme.of(context)
                            .textSelectionTheme
                            .selectionColor),
                    imageUrl:
                        'https://upload.wikimedia.org/wikipedia/commons/7/72/Default-welcomer.png',
                    fit: BoxFit.cover,
                  ))),
        ),
        const SizedBox(
          width: 16,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Leanne Graham',
              style: TextStyle(
                color: Colors.blueGrey,
              ),
            ),
            SizedBox(
              width: 230,
              height: 30,
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'leave a comment...',
                  hintStyle: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                      fontFamily: 'Gilroy'),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
                controller: widget.textController,
                onSaved: (val) {
                  setState(() {
                    widget.textController.text = val.trim();
                  });
                },
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: SizedBox(
              width: 30,
              height: 30,
              child: IconButton(
                  onPressed: () async {
                    if (widget.globalKey.currentState.validate()) {
                      widget.globalKey.currentState.save();
                      await JsonPlaceHolderApi().sendCommentsToThePost(
                          widget.post.id,
                          Comment(
                              title: 'Leanne Graham',
                              body: widget.textController.text.trim(),
                              userId: 1));
                      widget.textController.text = '';
                    }
                  },
                  icon: const Icon(
                    Icons.send,
                    size: 22,
                  ))),
        )
      ],
    );
  }
}
