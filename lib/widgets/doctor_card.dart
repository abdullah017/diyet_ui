import 'package:fit_diyet/model/diyetisyen_model.dart';
import 'package:fit_diyet/model/doctor_model.dart';
import 'package:flutter/material.dart';

class DoctorCard extends StatelessWidget {
  final Doctor doctor;
  final Diyetisyen diyetisyen;
  DoctorCard({this.doctor, this.diyetisyen});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      margin: EdgeInsets.only(left: 18.0, bottom: 2.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        width: 150.0,
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.network(
                  diyetisyen.profilFotografi,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 12.0),
            Text(
              diyetisyen.adi.toUpperCase(),
                overflow: TextOverflow.clip,
                maxLines: 3,
                textAlign: TextAlign.center,
                style: theme.textTheme.subtitle1),
            SizedBox(height: 6.0),
            Text(diyetisyen.kategori,
                overflow: TextOverflow.clip,
                maxLines: 5,
                textAlign: TextAlign.center,
                style: theme.textTheme.subtitle2),
          ],
        ),
      ),
    );
  }
}
