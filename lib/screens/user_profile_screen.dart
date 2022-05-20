import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:test_task_rest/constants/constants.dart';
import 'package:test_task_rest/models/user_model.dart';
import 'package:test_task_rest/router/router.dart';
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
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0,
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
        title: Text(
          widget.user.username,
          style: const TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 12, left: 12, right: 12, top: 6),
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
                              const CircularProgressIndicator(
                               color: Constants.themeColor,),
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
                    style: const TextStyle(color: Constants.themeColor),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 1, bottom: 1),
                    child: Text(
                      widget.user.company.catchPhrase,
                      style: const TextStyle(
                          fontStyle: FontStyle.italic, color: Colors.black),
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
              Icons.home, 'Город', widget.user.address.city, context),
          discriptionCard(
              Icons.email_outlined, 'Email', widget.user.email, context),
          userProfileInfo(
              context, const TextStyle(color: Colors.black), widget.user),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, RouteGenerator.USER_POSTS,
                        arguments: {
                          'user': widget.user,
                          'userpostid': widget.user.id
                        });
                  },
                  child: Card(
                    color: Constants.themeColor,
                    elevation: 2.0,
                    child: Column(children: const [
                      SizedBox(
                        height: 15,
                      ),
                      Icon(
                        Icons.post_add,
                        color: Colors.white,
                      ),
                      Text(
                        'Посты',
                        style: TextStyle(color: Colors.white),
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
                    Navigator.pushNamed(context, RouteGenerator.USER_ALBUMS,
                        arguments: {
                          'useralbumid': widget.user.id,
                          'user': widget.user
                        });
                  },
                  child: Card(
                    color: Constants.themeColor,
                    elevation: 2.0,
                    child: Column(children: const [
                      SizedBox(
                        height: 15,
                      ),
                      Icon(
                        Icons.photo_album_outlined,
                        color: Colors.white,
                      ),
                      Text(
                        'Альбомы',
                        style: TextStyle(color: Colors.white),
                      )
                    ]),
                  ),
                ),
                width: 90,
                height: 90,
              ),
            ],
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 45),
              child: SizedBox(
                width: 140,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, RouteGenerator.HOME);
                  },
                  child: const Center(
                    child: Text(
                      'Назад',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
