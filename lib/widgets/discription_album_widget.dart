import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:test_task_rest/models/albums_model.dart';
import 'package:test_task_rest/models/user_model.dart';

class DiscriptionAlbumWidget extends StatelessWidget {
  const DiscriptionAlbumWidget({
    Key key,
    @required this.useralbumid,
    @required this.index,
    @required this.user,
    @required this.albums,
    @required this.textDefaultColor,
  }) : super(key: key);

  final int useralbumid;
  final int index;
  final User user;
  final List<Albums> albums;
  final Color textDefaultColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).primaryColor,
      elevation: 0.6,
      child: Column(children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: SizedBox(
                      width: 70,
                      height: 70,
                      child: CachedNetworkImage(
                        placeholder: (context, _) => CircularProgressIndicator(
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
                  user.name,
                  style: const TextStyle(
                    color: Colors.blueGrey,
                  ),
                ),
                const SizedBox(
                  height: 4,
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
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: ListTile(
            title: Text(
              albums[index].title,
              style: TextStyle(
                  color: textDefaultColor,
                  fontSize: 19,
                  fontStyle: FontStyle.italic),
            ),
          ),
        ),
        SizedBox(
          height: 190,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: ((context, index) {
              if (albums[index].albumId == useralbumid) {
                return Stack(children: [
                  SizedBox(
                    width: 75,
                    height: 75,
                    child: Image.network(albums[index].url),
                  ),
                  Text(albums[index].id.toString())
                ]);
              }
              return Container();
            }),
            itemCount: albums.length,
          ),
        ),
      ]),
    );
  }
}
