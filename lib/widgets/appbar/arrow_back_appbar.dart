import 'package:flutter/material.dart';

Widget arrowBackAppBar(BuildContext context) {
  return AppBar(
    centerTitle: true,
    title: Text(
      'FİT DİYET',
      style: TextStyle(color: Colors.black),
    ),
    leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        }),
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
    elevation: 0,
    backgroundColor: Colors.transparent,
  );
}
