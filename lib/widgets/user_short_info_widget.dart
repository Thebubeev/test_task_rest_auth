import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class UserShortInfoWidget extends StatelessWidget {
  final String name;
  const UserShortInfoWidget({
   @required this.name,
    Key key,
    @required this.widget,
  }) : super(key: key);

  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Row(
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
              name,
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
    );
  }
}
