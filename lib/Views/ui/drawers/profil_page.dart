import 'package:fit_diyet/Controllers/diyetisyen_service.dart';
import 'package:fit_diyet/Views/widgets/appbar/arrow_back_appbar.dart';
import 'package:fit_diyet/Views/widgets/drawer/profile/profile_form_textfield.dart';

import 'package:flutter/material.dart';

class ProfilPage extends StatefulWidget {
  @override
  _ProfilPageState createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  final adController = TextEditingController();
  final kaloriController = TextEditingController();
  final birimController = TextEditingController();

  String adtxt;
  String kaloritxt;
  String birimtxt;
  String kategoritxt;
  _postDiyetisyen() {
    DiyetisyenService.postDiyetisyen(adtxt, kaloritxt, birimtxt);
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
                  ProfileFormTextField(
                    lblText: "Ad",
                    txtController: adController,
                    onchanged: (String adi) {
                      adtxt = adi;
                    },
                  ),

                  SizedBox(
                    height: 10,
                  ),
                  ProfileFormTextField(
                    lblText: "Kalori",
                    txtController: kaloriController,
                    onchanged: (String kalori) {
                      kaloritxt = kalori;
                    },
                  ),
                  ProfileFormTextField(
                    txtController: birimController,
                    lblText: "Birim",
                    onchanged: (String birim) {
                      birimtxt = birim;
                    },
                  ),

                  SizedBox(
                    height: 10,
                  ),

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
                            //_postDiyetisyen();
                           // _formKey.currentState.save();
                            if (_formKey.currentState.validate()) {
                              _postDiyetisyen();
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
