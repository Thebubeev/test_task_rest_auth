import 'package:flutter/material.dart';
import 'package:test_task_rest/router/router.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  const CustomAppBar({
    this.title,
    Key key,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
        title: Text(
          title,
          style: const TextStyle(color: Colors.black),
        ));
  }
}
