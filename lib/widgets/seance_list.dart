import 'package:fit_diyet/model/seance_model.dart';

import 'package:flutter/material.dart';

Widget buildSeancesList(Seance items) {
  return Card(
    margin: EdgeInsets.all(8.0),
    elevation: 50,
    shadowColor: Colors.black,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
    child: ExpansionTile(
      title: Text(
        items.month,
        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
      ),
      children: <Widget>[
        ListTile(
          title: Text(
            "${items.seance} -- ${items.price}₺",
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
        )
      ],
    ),
  );
}
