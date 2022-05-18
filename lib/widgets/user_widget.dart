 import 'package:flutter/material.dart';
import 'package:test_task_rest/models/user_model.dart';

ExpansionTile userProfileInfo(BuildContext context, TextStyle textDefaultTheme, User user) {
    return ExpansionTile(
          collapsedIconColor: Theme.of(context).iconTheme.color,
          textColor: Colors.black,
          children: [
            discriptionCard(Icons.phone, 'Phone', user.phone,context ),
            discriptionCard(Icons.web, 'Website', user.website, context),
            discriptionCard(Icons.work_outline_rounded, 'Company',
                user.company.name, context),
            discriptionCard(
                Icons.accessibility_rounded, 'Bs', user.company.bs, context),
            discriptionCard(Icons.home_work_outlined, 'Address',
                user.address.street + ' ' + user.address.suite, context),
          ],
          title: Text("Information", style: textDefaultTheme),
          iconColor: Theme.of(context).iconTheme.color,
        );
  }

  Padding discriptionCard(IconData icon, String text, String title, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, bottom: 4),
      child: Row(
        children: [
          Icon(
            icon,
            size: 13,
            color: Colors.grey,
          ),
          const SizedBox(
            width: 4,
          ),
          Text(
            '$text: ' + title,
            style: TextStyle(
                color: Theme.of(context).textSelectionTheme.selectionColor),
          ),
        ],
      ),
    );
  }