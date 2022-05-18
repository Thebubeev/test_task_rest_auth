import 'package:flutter/material.dart';
import 'package:test_task_rest/api/json_place_holder_api.dart';
import 'package:test_task_rest/models/user_model.dart';
import 'package:test_task_rest/screens/user_profile_screen.dart';
import 'package:test_task_rest/widgets/change_theme_widget.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  final textDefaultTheme =
      TextStyle(color: Theme.of(context).textSelectionTheme.selectionColor);
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          elevation: 0,
          actions: [ChangeThemeidget()],
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Text(
            'My friends',
            style: TextStyle(
                color: Theme.of(context).textSelectionTheme.selectionColor),
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
                        style:textDefaultTheme,
                      ),
                      subtitle: Text(users[index].username,
                          style: textDefaultTheme),
                      trailing: Text(users[index].id.toString(),
                          style: textDefaultTheme),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) =>
                                    UserProfileScreen(user: users[index])));
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
