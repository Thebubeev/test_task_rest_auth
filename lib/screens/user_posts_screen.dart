import 'package:flutter/material.dart';
import 'package:test_task_rest/api/json_place_holder_api.dart';
import 'package:test_task_rest/constants/constants.dart';
import 'package:test_task_rest/models/posts_model.dart';
import 'package:test_task_rest/models/user_model.dart';
import 'package:test_task_rest/router/router.dart';
import 'package:test_task_rest/widgets/discription_post_widget.dart';

class UserPostScreen extends StatelessWidget {
  final int userpostid;
  final User user;
  const UserPostScreen(
      {Key key, @required this.userpostid, @required this.user})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            elevation: 0,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            actions: [
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, RouteGenerator.MAIN);
                },
                child: Row(
                  children: const [
                    Text(
                      'Выйти',
                      style: TextStyle(color: Colors.black),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Icon(
                      Icons.exit_to_app,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                  ],
                ),
              )
            ],
            backgroundColor: Colors.white,
            title: const Text(
              'Посты',
              style: TextStyle(color: Colors.black),
            )),
        body: FutureBuilder<List<Posts>>(
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              var posts = snapshot.data;
              return ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: ((context, index) {
                    if (posts[index].userId == userpostid) {
                      return DescriptionPostWidget(
                          userpostid: userpostid,
                          user: user,
                          index: index,
                          posts: posts,
                          textDefaultColor: Colors.black);
                    } else {
                      return Container();
                    }
                  }));
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
            } else {
              return Container();
            }
          }),
          future: JsonPlaceHolderApi().fetchAllPostsData(),
        ));
  }
}
