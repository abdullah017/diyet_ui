import 'package:fit_diyet/helpers/theme_settings.dart';
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Widget CustomAppBar() {
  return AppBar(
    elevation: 0,
    backgroundColor: kTransparentBackgroundColor,
    centerTitle: true,
    title: Text(
      'FİT DİYET',
      style: TextStyle(
        color: kAppbarTextBlack,
      ),
    ),
  );
}
