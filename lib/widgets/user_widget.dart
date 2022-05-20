import 'package:flutter/material.dart';
import 'package:test_task_rest/constants/constants.dart';
import 'package:test_task_rest/models/user_model.dart';

ExpansionTile userProfileInfo(BuildContext context, User user) {
  return ExpansionTile(
    collapsedIconColor: const Color.fromARGB(255, 102, 87, 161),
    iconColor: const Color.fromARGB(255, 102, 87, 161),
    children: [
      discriptionCard(Icons.phone, 'Телефон', user.phone, context),
      discriptionCard(Icons.web, 'Вебсайт', user.website, context),
      discriptionCard(
          Icons.work_outline_rounded, 'Компания', user.company.name, context),
      discriptionCard(
          Icons.accessibility_rounded, 'Bs', user.company.bs, context),
      discriptionCard(Icons.home_work_outlined, 'Адрес',
          user.address.street + ' ' + user.address.suite, context),
    ],
    title: const Text(
      "Дополнительная информация",
      style: TextStyle(color: Constants.themeColor),
    ),
  );
}

Padding discriptionCard(
    IconData icon, String text, String title, BuildContext context) {
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
          style: const TextStyle(color: Colors.black),
        ),
      ],
    ),
  );
}
