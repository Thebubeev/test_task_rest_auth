import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:test_task_rest/models/user_model.dart';
import 'package:test_task_rest/screens/user_albums_screen.dart';
import 'package:test_task_rest/screens/user_posts_screen.dart';
import 'package:test_task_rest/widgets/user_widget.dart';

class UserProfileScreen extends StatefulWidget {
  final User user;
  const UserProfileScreen({Key key, this.user}) : super(key: key);

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final textDefaultTheme =
        TextStyle(color: Theme.of(context).textSelectionTheme.selectionColor);
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).textSelectionTheme.selectionColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const SizedBox(
                  width: 20,
                ),
                Icon(
                  Icons.call,
                  color: Theme.of(context).iconTheme.color,
                ),
                const SizedBox(
                  width: 25,
                ),
                Icon(
                  Icons.video_call,
                  color: Theme.of(context).iconTheme.color,
                ),
                const SizedBox(
                  width: 20,
                )
              ],
            ),
          )
        ],
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          widget.user.username,
          style: textDefaultTheme,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          bottom: 12,
          left: 12,
          right: 12,
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 12, bottom: 12, left: 16),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: SizedBox(
                        width: 70,
                        height: 70,
                        child: CachedNetworkImage(
                          placeholder: (context, _) =>
                              CircularProgressIndicator(
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
                  Text(
                    widget.user.name,
                    style: textDefaultTheme,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 1, bottom: 1),
                    child: Text(
                      widget.user.company.catchPhrase,
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          color: Theme.of(context)
                              .textSelectionTheme
                              .selectionColor),
                    ),
                  ),
                  Row(
                    children: const [
                      Text(
                        'online',
                        style: TextStyle(color: Colors.grey),
                      ),
                      Icon(
                        Icons.phone_android,
                        size: 13,
                        color: Colors.grey,
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
          discriptionCard(
              Icons.home, 'City', widget.user.address.city, context),
          discriptionCard(
              Icons.email_outlined, 'Email', widget.user.email, context),
          userProfileInfo(context, textDefaultTheme, widget.user),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => UserPostScreen(
                                  userpostid: widget.user.id,
                                  user: widget.user,
                                )));
                  },
                  child: Card(
                    elevation: 2.0,
                    child: Column(children: [
                      const SizedBox(
                        height: 15,
                      ),
                      const Icon(Icons.post_add),
                      Text(
                        'Posts',
                        style: textDefaultTheme,
                      )
                    ]),
                  ),
                ),
                width: 90,
                height: 90,
              ),
              SizedBox(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => UserAlbumScreen(
                                  useralbumid: widget.user.id,
                                  user: widget.user,
                                )));
                  },
                  child: Card(
                    elevation: 2.0,
                    child: Column(children: [
                      const SizedBox(
                        height: 15,
                      ),
                      const Icon(Icons.photo_album_outlined),
                      Text(
                        'Albums',
                        style: textDefaultTheme,
                      )
                    ]),
                  ),
                ),
                width: 90,
                height: 90,
              ),
            ],
          )
        ]),
      ),
    );
  }
}
