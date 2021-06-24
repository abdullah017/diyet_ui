import 'dart:convert';

import 'package:fit_diyet/Controllers/diyetisyen_service.dart';
import 'package:fit_diyet/Models/diyetlistesi_model.dart';
import 'package:fit_diyet/Models/randevu_model.dart';
import 'package:fit_diyet/Views/helpers/size_settings.dart';
import 'package:fit_diyet/Views/widgets/appbar/arrow_back_appbar.dart';
import 'package:fit_diyet/Views/widgets/diyetisyen_card.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class DiyetListelerim extends StatefulWidget {
  const DiyetListelerim({Key key}) : super(key: key);

  @override
  _DiyetListelerimState createState() => _DiyetListelerimState();
}

class _DiyetListelerimState extends State<DiyetListelerim> {
// ignore: deprecated_member_use
  List<Diyetlistesi> diyetListesi = new List<Diyetlistesi>();
  final DiyetisyenService diyetisyenService = DiyetisyenService();
  Diyetlistesi diyetListesiModel = Diyetlistesi();

  List<Diyetlistesi> parseDateBringDiyetisyen(String responseBody) {
    final parsed =
        jsonDecode(responseBody.toString()).cast<Map<String, dynamic>>();

    return parsed
        .map<Diyetlistesi>((json) => Diyetlistesi.fromJson(json))
        .toList();
  }

  Future<List<Diyetlistesi>> getDiyetisyen() async {
    //
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var url = baseUrl +
        "danisanlar/program/list" +
        "?" +
        "token=" +
        localStorage.getString("token");
    await http.get(
      Uri.parse(url),
    );
    var response = await http.get(Uri.parse(url));
    print('response geliyor : ' + response.body);

    if (response.statusCode == 200) {
      print('asd');
      List<dynamic> list = await jsonDecode(response.body);

      list.map((e) {
        diyetListesiModel = Diyetlistesi.fromJson(e);
        print('ss ' + diyetListesiModel.diyetisyen.toString());
      }).toList();

      setState(() {
        diyetListesi = parseDateBringDiyetisyen(response.body);
      });

      return (json.decode(response.body) as List)
          .map((e) => Diyetlistesi.fromJson(e))
          .toList();
    } else {
      throw Exception('Not Network ${response.statusCode}');
    }
  }

  initState() {
    super.initState();
    getDiyetisyen();
  }

  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: arrowBackAppBar(context),
      body: SingleChildScrollView(
          padding: EdgeInsets.all(8.0),
          child: Column(children: [
            Expanded(
              flex: 0,
              child: Container(
                width: double.infinity,
                height: displayHeight(context) * 0.9,
                child: ListView.builder(
                    itemCount: diyetListesi.length,
                    scrollDirection: Axis.vertical,
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      var danisan = diyetListesi[index];
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
                                  Icons.food_bank,
                                  size: 50,
                                  color: Colors.white,
                                ),
                                title: Center(
                                  child: Text(
                                    'ÖĞÜN: ${danisan.ogun}',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                subtitle: Column(
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "BESİN: ${danisan.besin}",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    // Text(
                                    //   "Randevu Tarihi: ${randevu.tarih}",
                                    //   style: TextStyle(color: Colors.white),
                                    // ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ),
          ])),
    );
  }
}
