
import 'package:fit_diyet/Controllers/danisan_service.dart';

import 'package:fit_diyet/Views/widgets/appbar/arrow_back_appbar.dart';
import 'package:fit_diyet/Views/widgets/drawer/profile/profile_form_textfield.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilPage extends StatefulWidget {
  @override
  _ProfilPageState createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  SharedPreferences _prefs;
  final adController = TextEditingController();
  final soyadController = TextEditingController();
  final tcController = TextEditingController();
  final sevilenController = TextEditingController();
  final sevilmeyenController = TextEditingController();
  final aciklamaController = TextEditingController();
  final telefonController = TextEditingController();
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

  _postProfile() {
    DanisanService.postProfile(
      adTxt,
      soyadTxt,
      tcTxt,
      telefonTxt,
      cinsiyetTxt,
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
    );
  }

  int _kronik = 0;
  int _ilac = 0;
  int _alkol = 0;
  int _cinsiyet = 0;
  void _handleCinsiyetValue(int cinsiyet_value) {
    setState(() {
      _cinsiyet = cinsiyet_value;

      switch (_cinsiyet) {
        case 0:
          cinsiyetTxt = _cinsiyet.toString();
          print("rahatsızlığım $cinsiyetTxt");
          break;

        case 1:
          cinsiyetTxt = _cinsiyet.toString();
          print("Cinsiyetim: $cinsiyetTxt");
          break;
      }
    });
  }

  void _handleKronikValue(int kronik_value) {
    setState(() {
      _kronik = kronik_value;

      switch (_kronik) {
        case 0:
          rahatsizlikTxt = _kronik.toString();
          print("rahatsızlığım $rahatsizlikTxt");
          break;

        case 1:
          rahatsizlikTxt = _kronik.toString();
          print("rahatsızlığım $rahatsizlikTxt");
          break;
      }
      print(rahatsizlikTxt);
    });
  }

  void _handleIlacValue(int ilac_value) {
    setState(() {
      _ilac = ilac_value;

      switch (_ilac) {
        case 0:
          ilacTxt = _ilac.toString();
          print("ilac $ilacTxt");
          break;

        case 1:
          ilacTxt = _ilac.toString();
          print("ilac $ilacTxt");
          break;
      }
      print(ilacTxt);
    });
  }

  void _handleAlkolValue(int alkol_value) {
    setState(() {
      _alkol = alkol_value;

      switch (_alkol) {
        case 0:
          alkolTxt = _alkol.toString();
          print("Alkol $alkolTxt");
          break;

        case 1:
          alkolTxt = _alkol.toString();
          print("Alkol $alkolTxt");
          break;
      }
      print(alkolTxt);
    });
  }

  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  String userName;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: arrowBackAppBar(context),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(15),
          child: Column(
            children: <Widget>[
              Stack(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        ProfileFormTextField(
                          lblText: "Ad",
                          hntText: userName,
                          klavyeTipi: TextInputType.name,
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
                          klavyeTipi: TextInputType.name,
                          txtController: soyadController,
                          onchanged: (String soyad) {
                            soyadTxt = soyad;
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ProfileFormTextField(
                          txtController: tcController,
                          klavyeTipi: TextInputType.number,
                          lblText: "T.C",
                          onchanged: (String tc) {
                            tcTxt = tc;
                          },
                        ),
                        ProfileFormTextField(
                          txtController: telefonController,
                          klavyeTipi: TextInputType.phone,
                          lblText: "Telefon",
                          onchanged: (String telefon) {
                            telefonTxt = telefon;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Align(
                          child: Text("Yaş"),
                          alignment: Alignment.centerLeft,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        DropdownButtonFormField<String>(
                          hint: yasTxt == null
                              ? Text('Yaş')
                              : Text(
                                  yasTxt,
                                  style: TextStyle(color: Colors.blue),
                                ),
                          isExpanded: true,
                          iconSize: 30.0,
                          style: TextStyle(color: Colors.blue),
                          validator: (value) {
                            if (value?.isEmpty ?? true) {
                              return 'Lütfen tüm alanları doldurunuz';
                            }
                            return null;
                          },
                          items:
                              List<int>.generate(100, (int index) => index + 1)
                                  .map(
                            (yas) {
                              return DropdownMenuItem<String>(
                                value: yas.toString(),
                                child: Text(yas.toString()),
                              );
                            },
                          ).toList(),
                          onChanged: (yas) {
                            setState(
                              () {
                                yasTxt = yas;
                              },
                            );
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: Text(
                            "Cinsiyet",
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            new Radio(
                              value: 0,
                              groupValue: _cinsiyet,
                              onChanged: _handleCinsiyetValue,
                            ),
                            new Text(
                              'Erkek',
                              style: new TextStyle(fontSize: 16.0),
                            ),
                            new Radio(
                              value: 1,
                              groupValue: _cinsiyet,
                              onChanged: _handleCinsiyetValue,
                            ),
                            new Text(
                              'Kadın',
                              style: new TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                          ],
                        ),
                        Align(
                          child: Text("Boy"),
                          alignment: Alignment.centerLeft,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        DropdownButtonFormField(
                          hint: boyTxt == null
                              ? Text('Boy(cm)')
                              : Text(
                                  boyTxt,
                                  style: TextStyle(color: Colors.blue),
                                ),
                          isExpanded: true,
                          iconSize: 30.0,
                          style: TextStyle(color: Colors.blue),
                          validator: (value) {
                            if (value?.isEmpty ?? true) {
                              return 'Lütfen tüm alanları doldurunuz';
                            }
                            return null;
                          },
                          items:
                              List<int>.generate(300, (int index) => index + 1)
                                  .map(
                            (boy) {
                              return DropdownMenuItem<String>(
                                value: boy.toString(),
                                child: Text(boy.toString()),
                              );
                            },
                          ).toList(),
                          onChanged: (boy) {
                            setState(
                              () {
                                boyTxt = boy;
                              },
                            );
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Align(
                          child: Text("Kilo"),
                          alignment: Alignment.centerLeft,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        DropdownButtonFormField(
                          hint: kiloTxt == null
                              ? Text('Kilo')
                              : Text(
                                  kiloTxt,
                                  style: TextStyle(color: Colors.blue),
                                ),
                          isExpanded: true,
                          iconSize: 30.0,
                          style: TextStyle(color: Colors.blue),
                          validator: (value) {
                            if (value?.isEmpty ?? true) {
                              return 'Lütfen tüm alanları doldurunuz';
                            }
                            return null;
                          },
                          items:
                              List<int>.generate(300, (int index) => index + 1)
                                  .map(
                            (kilo) {
                              return DropdownMenuItem<String>(
                                value: kilo.toString(),
                                child: Text(kilo.toString()),
                              );
                            },
                          ).toList(),
                          onChanged: (kilo) {
                            setState(
                              () {
                                kiloTxt = kilo;
                              },
                            );
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Text(
                            "Kronik bir rahatsızlığınız var mı?",
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            new Radio(
                              value: 0,
                              groupValue: _kronik,
                              onChanged: _handleKronikValue,
                            ),
                            new Text(
                              'Evet',
                              style: new TextStyle(fontSize: 16.0),
                            ),
                            new Radio(
                              value: 1,
                              groupValue: _kronik,
                              onChanged: _handleKronikValue,
                            ),
                            new Text(
                              'Hayır',
                              style: new TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Text(
                            "İlaç kullanıyor musunuz?",
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            new Radio(
                              value: 0,
                              groupValue: _ilac,
                              onChanged: _handleIlacValue,
                            ),
                            new Text(
                              'Evet',
                              style: new TextStyle(fontSize: 16.0),
                            ),
                            new Radio(
                              value: 1,
                              groupValue: _ilac,
                              onChanged: _handleIlacValue,
                            ),
                            new Text(
                              'Hayır',
                              style: new TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Text(
                            "Alkol kullanıyor musunuz?",
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            new Radio(
                              value: 0,
                              groupValue: _alkol,
                              onChanged: _handleAlkolValue,
                            ),
                            new Text(
                              'Evet',
                              style: new TextStyle(fontSize: 16.0),
                            ),
                            new Radio(
                              value: 1,
                              groupValue: _alkol,
                              onChanged: _handleAlkolValue,
                            ),
                            new Text(
                              'Hayır',
                              style: new TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        DropdownButtonFormField(
                          hint: disariyemekTxt == null
                              ? Text('Dışarıda yemek yeme sıklığınız?')
                              : Text(
                                  disariyemekTxt,
                                  style: TextStyle(color: Colors.blue),
                                ),
                          isExpanded: true,
                          iconSize: 30.0,
                          style: TextStyle(color: Colors.blue),
                          validator: (value) {
                            if (value?.isEmpty ?? true) {
                              return 'Lütfen tüm alanları doldurunuz';
                            }
                            return null;
                          },
                          items: [
                            'Hergün',
                            'Haftada 2-3',
                            'Haftada 1',
                            'Nadiren'
                          ].map(
                            (disariyemek) {
                              return DropdownMenuItem<String>(
                                value: disariyemek,
                                child: Text(disariyemek),
                              );
                            },
                          ).toList(),
                          onChanged: (disariyemek) {
                            setState(
                              () {
                                disariyemekTxt = disariyemek;
                                print(disariyemekTxt);
                              },
                            );
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        DropdownButtonFormField(
                          hint: gunlukogunTxt == null
                              ? Text('Günlük kaç öğün tüketiyorsunuz?')
                              : Text(
                                  gunlukogunTxt,
                                  style: TextStyle(color: Colors.blue),
                                ),
                          isExpanded: true,
                          iconSize: 30.0,
                          style: TextStyle(color: Colors.blue),
                          validator: (value) {
                            if (value?.isEmpty ?? true) {
                              return 'Lütfen tüm alanları doldurunuz';
                            }
                            return null;
                          },
                          items: [
                            '5 veya daha fazla',
                            '3 ila 5 arası',
                            'En fazla 3'
                          ].map(
                            (gunlukogun) {
                              return DropdownMenuItem<String>(
                                value: gunlukogun,
                                child: Text(gunlukogun),
                              );
                            },
                          ).toList(),
                          onChanged: (gunlukogun) {
                            setState(
                              () {
                                gunlukogunTxt = gunlukogun;
                                print(gunlukogunTxt);
                              },
                            );
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        DropdownButtonFormField(
                          hint: gunluksuTxt == null
                              ? Text('Günlük ne kadar su tüketiyorsunuz?')
                              : Text(
                                  gunluksuTxt,
                                  style: TextStyle(color: Colors.blue),
                                ),
                          isExpanded: true,
                          iconSize: 30.0,
                          style: TextStyle(color: Colors.blue),
                          validator: (value) {
                            if (value?.isEmpty ?? true) {
                              return 'Lütfen tüm alanları doldurunuz';
                            }
                            return null;
                          },
                          items: [
                            '3 litreden fazla',
                            '2-3 litre',
                            '1-2 litre',
                            '1 litreden az',
                          ].map(
                            (gunluksu) {
                              return DropdownMenuItem<String>(
                                value: gunluksu,
                                child: Text(gunluksu),
                              );
                            },
                          ).toList(),
                          onChanged: (gunluksu) {
                            setState(
                              () {
                                gunluksuTxt = gunluksu;
                                print(gunluksuTxt);
                              },
                            );
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        DropdownButtonFormField(
                          hint: hedefkiloTxt == null
                              ? Text('Hedef Kilo')
                              : Text(
                                  hedefkiloTxt,
                                  style: TextStyle(color: Colors.blue),
                                ),
                          isExpanded: true,
                          iconSize: 30.0,
                          style: TextStyle(color: Colors.blue),
                          validator: (value) {
                            if (value?.isEmpty ?? true) {
                              return 'Lütfen tüm alanları doldurunuz';
                            }
                            return null;
                          },
                          items:
                              List<int>.generate(100, (int index) => index + 1)
                                  .map(
                            (hedefkilo) {
                              return DropdownMenuItem<String>(
                                value: hedefkilo.toString(),
                                child: Text(hedefkilo.toString()),
                              );
                            },
                          ).toList(),
                          onChanged: (hedefkilo) {
                            setState(
                              () {
                                hedefkiloTxt = hedefkilo;
                                print(hedefkiloTxt);
                              },
                            );
                          },
                        ),
                        ProfileFormTextField(
                          txtController: sevilenController,
                          klavyeTipi: TextInputType.text,
                          lblText:
                              "Beslenme programında olmasını istediğiniz besinler",
                          onchanged: (String sevilenbesin) {
                            sevilenbesinTxt = sevilenbesin;
                          },
                        ),
                        ProfileFormTextField(
                          txtController: sevilmeyenController,
                          klavyeTipi: TextInputType.text,
                          lblText:
                              "Beslenme programında olmasını istemediğiniz besinler",
                          onchanged: (String sevilmeyenbesin) {
                            sevilmeyenbesinTxt = sevilmeyenbesin;
                          },
                        ),
                        ProfileFormTextField(
                          txtController: aciklamaController,
                          klavyeTipi: TextInputType.text,
                          lblText: "Diğer Belirtmek İstedikleriniz",
                          onchanged: (String aciklama) {
                            aciklamaTxt = aciklama;
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: MaterialButton(
                                color: Theme.of(context).accentColor,
                                shape: StadiumBorder(),
                                child: Text(
                                  "GÜNCELLE",
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () async {
                                  if (_formKey.currentState.validate()) {
                                    _formKey.currentState.save();
                                    _postProfile();
                                    _prefs =
                                        await SharedPreferences.getInstance();
                                    _prefs.setString('adi', adTxt);
                                    userName = _prefs.getString("adi");
                                    print(userName);
                                    _prefs.setString('soyad', soyadTxt);
                                    //localStorage.setString('id', body['id'].toString());

                                  } else {
                                    print("validation failed");
                                  }
                                },
                              ),
                            ),
                            SizedBox(width: 20),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
