import 'package:fit_diyet/widgets/appbar/arrow_back_appbar.dart';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class ProfilPage extends StatefulWidget {
  @override
  _ProfilPageState createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  final adController = TextEditingController();
  final kaloriController = TextEditingController();
  final birimController = TextEditingController();
  bool _autofocus = false;

  String adtxt;
  String kaloritxt;
  String birimtxt;
  String kategoritxt;
  postTest() async {
    final url = 'https://fitdiyet.online/api/besinler';
    var map = new Map<String, dynamic>();
    map['besin_adi'] = adtxt;
    map['besin_kalori'] = kaloritxt;
    map['besin_birimi'] = birimtxt;

    http.Response response = await http.post(
      Uri.parse(url),
      body: map,
    );

    print(response.body);
  }

  int _radioValue = 0;
  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;

      switch (_radioValue) {
        case 0:
          break;

        case 1:
          break;

        case 2:
          break;
      }
      print(_radioValue);
    });
  }

  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: arrowBackAppBar(context),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    autofocus: _autofocus,
                    decoration: InputDecoration(labelText: "Ad"),
                    onChanged: (String adi) {
                      adtxt = adi;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    controller: adController,
                  ),

                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: "Kalori"),
                    onChanged: (String kalori) {
                      kaloritxt = kalori;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    controller: kaloriController,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: "Birim"),
                    onChanged: (String birim) {
                      birimtxt = birim;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    controller: birimController,
                  ),

                  SizedBox(
                    height: 10,
                  ),
                  // TextFormField(
                  //   decoration: InputDecoration(labelText: "kategori"),
                  //   onChanged: (int ) {
                  //     kategoritxt = value;
                  //   },
                  //   validator: (value) {
                  //     if (value == null || value.isEmpty) {
                  //       return 'Please enter some text';
                  //     }
                  //     return null;
                  //   },
                  //   controller: myController,
                  // ),

                  SizedBox(
                    height: 10,
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     Text("CİNSİYET:"),
                  //     new Radio(
                  //       value: 0,
                  //       groupValue: _radioValue,
                  //       onChanged: _handleRadioValueChange,
                  //     ),
                  //     new Text(
                  //       'ERKEK',
                  //       style: new TextStyle(fontSize: 16.0),
                  //     ),
                  //     new Radio(
                  //       value: 1,
                  //       groupValue: _radioValue,
                  //       onChanged: _handleRadioValueChange,
                  //     ),
                  //     new Text(
                  //       'KADIN',
                  //       style: new TextStyle(
                  //         fontSize: 16.0,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: MaterialButton(
                          color: Theme.of(context).accentColor,
                          child: Text(
                            "Kaydet",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            postTest();
                            _formKey.currentState.save();
                            if (_formKey.currentState.validate()) {
                              postTest();
                            } else {
                              print("validation failed");
                            }
                          },
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: MaterialButton(
                          color: Theme.of(context).accentColor,
                          child: Text(
                            "Temizle",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            _formKey.currentState.reset();
                            adController.clear();
                            kaloriController.clear();
                            birimController.clear();
                           
                          },
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
