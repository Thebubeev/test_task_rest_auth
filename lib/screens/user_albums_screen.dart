import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:test_task_rest/api/json_place_holder_api.dart';
import 'package:test_task_rest/constants/constants.dart';
import 'package:test_task_rest/models/albums_model.dart';
import 'package:test_task_rest/models/user_model.dart';

class UserAlbumScreen extends StatelessWidget {
  final int useralbumid;
  final User user;
  const UserAlbumScreen({Key key, this.useralbumid, this.user})
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
              'Альбомы',
              style: TextStyle(color: Colors.black),
            )),
        body: FutureBuilder<List<Albums>>(
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              var albums = snapshot.data;
              return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 150,
                      childAspectRatio: 1,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5),
                  itemCount: albums.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: CachedNetworkImageProvider(
                                  albums[index].url)),
                          borderRadius: BorderRadius.circular(10)),
                    );
                  });
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
          future: JsonPlaceHolderApi().fetchAllAlbumsData(),
        ));
  }
}
