import 'package:flutter/material.dart';
import 'package:test_task_rest/api/json_place_holder_api.dart';
import 'package:test_task_rest/models/user_model.dart';
import 'package:test_task_rest/router/router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          actions: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
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
            'Мои друзья',
            style: TextStyle(
                color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: FutureBuilder<List<User>>(
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              var users = snapshot.data;
              return ListView.builder(
                  itemCount: users.length,
                  itemBuilder: ((context, index) {
                    return ListTile(
                      title: Text(
                        users[index].name,
                        style: const TextStyle(color: Colors.black),
                      ),
                      subtitle: Text(users[index].username,
                          style: const TextStyle(color: Colors.black)),
                      onTap: () {
                        Navigator.pushNamed(
                            context, RouteGenerator.USER_PROFILE,
                            arguments: users[index]);
                      },
                    );
                  }));
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
            } else {
              return Container();
            }
          }),
          future: JsonPlaceHolderApi().fetchAllUsersData(),
        ));
  }
}
