import 'package:flutter/material.dart';
ListTile buildListTile(
    {
      required BuildContext context,
      required String nameList,
      required IconData typeIcon,
      required VoidCallback fun}) {
  return ListTile(
    leading: Icon(
      typeIcon,
      color: Theme.of(context).iconTheme.color,
    ),
    title: Text(
      nameList,
      style: Theme.of(context).textTheme.bodyText1,
    ),
    onTap: fun,
  );
}