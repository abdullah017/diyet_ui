import 'dart:convert';

import 'package:fit_diyet/Controllers/diyetisyen_service.dart';
import 'package:fit_diyet/Views/ui/home/home.dart';
import 'package:fit_diyet/Views/ui/login_screens/login_views.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController rolController = TextEditingController();

  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _isLoading = true;
  var email;
  var password;
  var rePassword;

  @override
  void initState() {
    super.initState();
    rolController = new TextEditingController(text: '2');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Stack(
            children: <Widget>[
              /////////////  background/////////////
              new Container(
                decoration: new BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.0, 0.4, 0.9],
                    colors: [
                      Color(0xFFFF835F),
                      Color(0xFFFC663C),
                      Color(0xFFFF3F1A),
                    ],
                  ),
                ),
              ),

              Positioned(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Card(
                            elevation: 4.0,
                            color: Colors.white,
                            margin: EdgeInsets.only(left: 20, right: 20),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Form(
                                    key: _formKey,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        TextFormField(
                                          controller: mailController,
                                          style: TextStyle(
                                            color: Color(0xFF000000),
                                          ),
                                          cursorColor: Color(0xFF9b9b9b),
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          decoration: InputDecoration(
                                            prefixIcon: Icon(
                                              Icons.email,
                                              color: Colors.grey,
                                            ),
                                            hintText: "Email",
                                            hintStyle: TextStyle(
                                                color: Color(0xFF9b9b9b),
                                                fontSize: 15,
                                                fontWeight: FontWeight.normal),
                                          ),
                                          validator: (emailValue) {
                                            if (emailValue.isEmpty) {
                                              return 'Lütfen E-Postanızı girin';
                                              // NOTE BURASI EMAİL DEĞERİ BOŞ MU ONU KONTROL EDER
                                            }
                                            if (!emailValue.contains("@")) {
                                              return 'Lütfen E-Postanızı doğru biçimde giriniz';
                                              // NOTE BURASI EMAİL DEĞERİ İÇİNDE @ İŞARETİ VARMI ONU KONTROL EDER
                                            }
                                            if (!emailValue.contains(RegExp(
                                                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$'))) {
                                              return 'Lütfen E-Postanızı doğru biçimde giriniz';
                                              // NOTE BURASI EMAİL DOĞRU YAZILMIŞMI ONU KONTROL EDER
                                            } else {
                                              email = emailValue;
                                              return null;
                                            }
                                          },
                                        ),
                                        TextFormField(
                                          controller: passwordController,
                                          style: TextStyle(
                                              color: Color(0xFF000000)),
                                          cursorColor: Color(0xFF9b9b9b),
                                          keyboardType: TextInputType.text,
                                          obscureText: true,
                                          decoration: InputDecoration(
                                            prefixIcon: Icon(
                                              Icons.vpn_key,
                                              color: Colors.grey,
                                            ),
                                            hintText: "Password",
                                            hintStyle: TextStyle(
                                                color: Color(0xFF9b9b9b),
                                                fontSize: 15,
                                                fontWeight: FontWeight.normal),
                                          ),
                                          validator: (passwordValue) {
                                            if (passwordValue.isEmpty) {
                                              return 'Lütfen parolanızı girin';
                                            }
                                            if (passwordValue.length < 6) {
                                              return 'Lütfen 6 karakterden oluşan bir parola girin';
                                            }
                                            if (passwordValue.length > 20) {
                                              return 'Lütfen en fazla 20 karakterden oluşan bir parola girin';
                                            }
                                            password = passwordValue;
                                            return null;
                                          },
                                        ),
                                        TextFormField(
                                          style: TextStyle(
                                              color: Color(0xFF000000)),
                                          cursorColor: Color(0xFF9b9b9b),
                                          keyboardType: TextInputType.text,
                                          obscureText: true,
                                          decoration: InputDecoration(
                                            prefixIcon: Icon(
                                              Icons.vpn_key,
                                              color: Colors.grey,
                                            ),
                                            hintText: "Parolanızı tekrar girin",
                                            hintStyle: TextStyle(
                                                color: Color(0xFF9b9b9b),
                                                fontSize: 15,
                                                fontWeight: FontWeight.normal),
                                          ),
                                          validator: (rePasswordValue) {
                                            if (rePasswordValue.isEmpty) {
                                              return 'Lütfen parolanızı girin';
                                            }
                                            if (rePasswordValue != password) {
                                              return 'Parolalar eşleşmiyor';
                                            } else {
                                              rePassword = rePasswordValue;
                                              return null;
                                            }
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  /////////////// SignUp Button ////////////

                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: FlatButton(
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: 8,
                                            bottom: 8,
                                            left: 10,
                                            right: 10),
                                        child: Text(
                                          _isLoading
                                              ? 'Hesabı oluştur'
                                              : 'Tamamlanıyor...',
                                          textDirection: TextDirection.ltr,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15.0,
                                            decoration: TextDecoration.none,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ),
                                      color: Colors.red,
                                      disabledColor: Colors.grey,
                                      shape: new RoundedRectangleBorder(
                                          borderRadius:
                                              new BorderRadius.circular(20.0)),
                                      onPressed: () {
                                        if (_formKey.currentState.validate()) {
                                          _register();
                                          print('HER ŞEY TAMAM');
                                        } else {
                                          print('ÜZGÜNÜM');
                                        }
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          /////////////// already have an account ////////////
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    new MaterialPageRoute(
                                        builder: (context) => Login()));
                              },
                              child: Text(
                                'Hesabınız varsa giriş yapmak için dokunun',
                                textDirection: TextDirection.ltr,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.0,
                                  decoration: TextDecoration.none,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _register() async {
    setState(() {
      _isLoading = true;
    });
    var data = {
      'rol': rolController.text,
      'email': mailController.text,
      'password': passwordController.text,
    };

    var res = await DiyetisyenService.authData(data, 'register');
    var body = json.decode(res.body);
    // if (body['success']) {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    print(body);
    //print(body[0]["token"]);

    localStorage.setString('token', body[0]['token'].toString());
    //localStorage.setString('user', json.encode(body['user']));
    Navigator.push(
      context,
      new MaterialPageRoute(builder: (context) => HomeView()),
    );
    //}

    setState(() {
      _isLoading = false;
    });
  }
}
