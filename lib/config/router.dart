import 'package:flutter/material.dart';
import 'package:test_task_rest/screens/home_screen.dart';
import 'package:test_task_rest/screens/user_albums_screen.dart';
import 'package:test_task_rest/screens/user_posts_screen.dart';
import 'package:test_task_rest/screens/user_profile_screen.dart';

class RouteGenerator {
  static const MAIN = '/';
  static const USER_PROFILE = 'user_profile';
  static const USER_POSTS = 'user_posts';
  static const USER_ALBUMS = 'user_albums';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arg = settings.arguments;
    switch (settings.name) {
      case MAIN:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case USER_PROFILE:
        return MaterialPageRoute(
            builder: (_) => UserProfileScreen(
                  user: arg,
                ));

      case USER_POSTS:
        Map<String, Object> args = settings.arguments;
        return MaterialPageRoute(
            builder: (_) => UserPostScreen(
                  user: args['user'],
                  userpostid:  args['userpostid'],
                ));

                case USER_ALBUMS:
        Map<String, Object> args = settings.arguments;
        return MaterialPageRoute(
            builder: (_) => UserAlbumScreen(
                  user: args['user'],
                  useralbumid:  args['useralbumid'],
                ));
    }
    return MaterialPageRoute(builder: (_) => const HomeScreen());
  }
}
