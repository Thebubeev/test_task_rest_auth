import 'package:flutter/material.dart';
import 'package:test_task_rest/screens/home_screen.dart';
import 'package:test_task_rest/screens/user_profile_screen.dart';

class RouteGenerator {
  static const MAIN = '/';
  static const USER_PROFILE = 'user_profile';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arg = settings.arguments;
    switch (settings.name) {
      case USER_PROFILE:
        return MaterialPageRoute(builder: (_) => UserProfileScreen());
    }
    return MaterialPageRoute(builder: (_) => const HomeScreen());
  }
}
