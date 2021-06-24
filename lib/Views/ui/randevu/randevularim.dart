import 'dart:convert';

import 'package:fit_diyet/Controllers/diyetisyen_service.dart';
import 'package:fit_diyet/Models/randevu_model.dart';
import 'package:fit_diyet/Views/widgets/appbar/arrow_back_appbar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Randevularim extends StatefulWidget {
  const Randevularim({Key key}) : super(key: key);

  @override
  _RandevularimState createState() => _RandevularimState();
}

class _RandevularimState extends State<Randevularim> {
  Future<Randevu> getRandevu() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var url = baseUrl +
        "danisan/randevularim" +
        "?" +
        "token=" +
        localStorage.getString("token");
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return Randevu.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(
          'Randevularınıza erişilemiyor.\nEğer bir randevunuz yoksa lütfen randevu oluşturun.');
    }
  }

  Future<Randevu> randevu;
  @override
  void initState() {
    super.initState();
    randevu = getRandevu();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: arrowBackAppBar(context),
      body: Center(
        child: FutureBuilder<Randevu>(
          future: randevu,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: Color(0xff654769),
                elevation: 10,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        leading: Icon(
                          Icons.access_time_rounded,
                          size: 50,
                          color: Colors.white,
                        ),
                        title: Center(
                          child: Text(
                            'Diyetisyeniniz: ${snapshot.data.diyetisyen}',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        subtitle: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Randevu Saati: ${snapshot.data.saat}",
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Randevu Tarihi: ${snapshot.data.tarih}",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else if (snapshot.hasData == null) {
              return Text("Herhangi bir randevunuz bulunmamakta");
            }

            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
