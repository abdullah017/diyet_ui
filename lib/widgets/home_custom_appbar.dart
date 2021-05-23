// ignore: non_constant_identifier_names
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Widget HomeAppBar() {
  return AppBar(
    elevation: 0,
    centerTitle: true,
    actions: [
      IconButton(
        icon: Icon(Icons.notifications),
        onPressed: () {},
        color: Colors.black,
      ),
    ],
    leading: Builder(
      builder: (context) => IconButton(
        icon: Icon(
          Icons.menu_rounded,
          color: Colors.black,
        ),
        onPressed: () => Scaffold.of(context).openDrawer(),
      ),
    ),
    title: Text(
      "FİT DİYET",
      style: TextStyle(
        color: Colors.black,
      ),
    ),
    backgroundColor: Colors.transparent,
  );
}
