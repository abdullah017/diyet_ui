import 'package:fit_diyet/Models/diyetisyen_model.dart';
import 'package:flutter/material.dart';

Widget buildCategoriesList(Diyetisyen items) {
  return Card(
    margin: EdgeInsets.all(8.0),
    elevation: 50,
    shadowColor: Colors.black,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
    child: ExpansionTile(
      leading: Icon(Icons.category),
      title: Text(
        items.kategori,
        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
      ),
      children: <Widget>[
        ListTile(
          title: Text(
            items.adi,
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
        )
      ],
    ),
  );
}
