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

  String adTxt;
  String soyadTxt;
  String tcTxt;
  String telefonTxt;
  String yasTxt;
  String boyTxt;
  String kiloTxt;
  String rahatsizlikTxt;
  String ilacTxt;
  String alkolTxt;
  String disariyemekTxt;
  String gunlukogunTxt;
  String gunluksuTxt;
  String hedefkiloTxt;
  String sevilenbesinTxt;
  String sevilmeyenbesinTxt;
  String aciklamaTxt;
  String cinsiyetTxt;

  _postDiyetisyen() {
    DiyetisyenService.postDiyetisyen(
        adTxt,
        soyadTxt,
        tcTxt,
        telefonTxt,
        yasTxt,
        boyTxt,
        kiloTxt,
        rahatsizlikTxt,
        ilacTxt,
        alkolTxt,
        disariyemekTxt,
        gunlukogunTxt,
        gunluksuTxt,
        hedefkiloTxt,
        sevilenbesinTxt,
        sevilmeyenbesinTxt,
        aciklamaTxt,
        cinsiyetTxt);
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
                      adTxt = adi;
                    },
                  ),

                  SizedBox(
                    height: 10,
                  ),
                  ProfileFormTextField(
                    lblText: "Soyad",
                    txtController: kaloriController,
                    onchanged: (String soyad) {
                      soyadTxt = soyad;
                    },
                  ),
                  ProfileFormTextField(
                    txtController: birimController,
                    lblText: "T.C",
                    onchanged: (String tc) {
                      tcTxt = tc;
                    },
                  ),
                  ProfileFormTextField(
                    txtController: birimController,
                    lblText: "Yaş",
                    onchanged: (String yas) {
                      yasTxt = yas;
                    },
                  ),
                  ProfileFormTextField(
                    txtController: birimController,
                    lblText: "Boy",
                    onchanged: (String boy) {
                      boyTxt = boy;
                    },
                  ),

                  ProfileFormTextField(
                    txtController: birimController,
                    lblText: "Kilo",
                    onchanged: (String kilo) {
                      kiloTxt = kilo;
                    },
                  ),

                  ProfileFormTextField(
                    txtController: birimController,
                    lblText: "Yaş",
                    onchanged: (String rahatsizlik) {
                      rahatsizlikTxt = rahatsizlik;
                    },
                  ),

                  ProfileFormTextField(
                    txtController: birimController,
                    lblText: "İlaç",
                    onchanged: (String ilac) {
                      ilacTxt = ilac;
                    },
                  ),

                  ProfileFormTextField(
                    txtController: birimController,
                    lblText: "Alkol",
                    onchanged: (String alkol) {
                      alkolTxt = alkol;
                    },
                  ),

                  ProfileFormTextField(
                    txtController: birimController,
                    lblText: "Dışarıda Yenilen Yemek",
                    onchanged: (String disariyemek) {
                      disariyemekTxt = disariyemek;
                    },
                  ),

                  ProfileFormTextField(
                    txtController: birimController,
                    lblText: "Günlük Tüketilen Öğün",
                    onchanged: (String gunlukogun) {
                      gunlukogunTxt = gunlukogun;
                    },
                  ),

                  ProfileFormTextField(
                    txtController: birimController,
                    lblText: "Günlük Tüketilen Su",
                    onchanged: (String gunluksu) {
                      gunluksuTxt = gunluksu;
                    },
                  ),

                  ProfileFormTextField(
                    txtController: birimController,
                    lblText: "Hedef Kilo",
                    onchanged: (String hedefkilo) {
                      hedefkiloTxt = hedefkilo;
                    },
                  ),

                  ProfileFormTextField(
                    txtController: birimController,
                    lblText: "Sevilen Besinler",
                    onchanged: (String sevilenbesin) {
                      sevilenbesinTxt = sevilenbesin;
                    },
                  ),

                  ProfileFormTextField(
                    txtController: birimController,
                    lblText: "Sevilmeyen Besinler",
                    onchanged: (String sevilmeyenbesin) {
                      sevilmeyenbesinTxt = sevilmeyenbesin;
                    },
                  ),

                  ProfileFormTextField(
                    txtController: birimController,
                    lblText: "Diğer Belirtmek İstedikleriniz",
                    onchanged: (String aciklama) {
                      aciklamaTxt = aciklama;
                    },
                  ),

                  // ProfileFormTextField(
                  //                   txtController: birimController,
                  //                   lblText: "Dışarıda Yenilen Yemek",
                  //                   onchanged: (String disariyemek) {
                  //                     disariyemekTxt = disariyemek;
                  //                   },
                  //                 ),

                  SizedBox(
                    height: 10,
                  ),

                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("CİNSİYET:"),
                      new Radio(
                        value: 0,
                        groupValue: _radioValue,
                        onChanged: _handleRadioValueChange,
                      ),
                      new Text(
                        'ERKEK',
                        style: new TextStyle(fontSize: 16.0),
                      ),
                      new Radio(
                        value: 1,
                        groupValue: _radioValue,
                        onChanged: _handleRadioValueChange,
                      ),
                      new Text(
                        'KADIN',
                        style: new TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
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
