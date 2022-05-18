import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:test_task_rest/api/json_place_holder_api.dart';
import 'package:test_task_rest/models/albums_model.dart';
import 'package:test_task_rest/models/user_model.dart';
import 'package:test_task_rest/widgets/discription_album_widget.dart';
import 'package:test_task_rest/widgets/discription_post_widget.dart';

class UserAlbumScreen extends StatelessWidget {
  final int useralbumid;
  final User user;
  const UserAlbumScreen({Key key, this.useralbumid, this.user})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textDefaultColor =
        Theme.of(context).textSelectionTheme.selectionColor;

    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
            elevation: 0,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Theme.of(context).textSelectionTheme.selectionColor,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            title: Text(
              'Albums',
              style: TextStyle(color: textDefaultColor),
            )),
        body: FutureBuilder<List<Albums>>(
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              var albums = snapshot.data;
              return ListView.builder(
                  itemCount: albums.length,
                  itemBuilder: ((context, index) {
                    if (albums[index].id == useralbumid) {
                      return DiscriptionAlbumWidget(
                        useralbumid:useralbumid,
                          index: index,
                          user: user,
                          albums: albums,
                          textDefaultColor: textDefaultColor);
                    } else {
                      return Container();
                    }
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
          future: JsonPlaceHolderApi().fetchAllAlbumsData(),
        ));
  }
}
