import 'dart:convert';

import 'package:fit_diyet/Controllers/authantication_service.dart';

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
                                              return 'L??tfen E-Postan??z?? girin';
                                              // NOTE BURASI EMA??L DE??ER?? BO?? MU ONU KONTROL EDER
                                            }
                                            if (!emailValue.contains("@")) {
                                              return 'L??tfen E-Postan??z?? do??ru bi??imde giriniz';
                                              // NOTE BURASI EMA??L DE??ER?? ??????NDE @ ????ARET?? VARMI ONU KONTROL EDER
                                            }
                                            if (!emailValue.contains(RegExp(
                                                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$'))) {
                                              return 'L??tfen E-Postan??z?? do??ru bi??imde giriniz';
                                              // NOTE BURASI EMA??L DO??RU YAZILMI??MI ONU KONTROL EDER
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
                                              return 'L??tfen parolan??z?? girin';
                                            }
                                            if (passwordValue.length < 6) {
                                              return 'L??tfen 6 karakterden olu??an bir parola girin';
                                            }
                                            if (passwordValue.length > 20) {
                                              return 'L??tfen en fazla 20 karakterden olu??an bir parola girin';
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
                                            hintText: "Parolan??z?? tekrar girin",
                                            hintStyle: TextStyle(
                                                color: Color(0xFF9b9b9b),
                                                fontSize: 15,
                                                fontWeight: FontWeight.normal),
                                          ),
                                          validator: (rePasswordValue) {
                                            if (rePasswordValue.isEmpty) {
                                              return 'L??tfen parolan??z?? girin';
                                            }
                                            if (rePasswordValue != password) {
                                              return 'Parolalar e??le??miyor';
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
                                    // ignore: deprecated_member_use
                                    child: FlatButton(
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            top: 8,
                                            bottom: 8,
                                            left: 10,
                                            right: 10),
                                        child: Text(
                                          _isLoading
                                              ? 'Hesab?? olu??tur'
                                              : 'Tamamlan??yor...',
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
                                          print('HER ??EY TAMAM');
                                        } else {
                                          print('??ZG??N??M');
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
                                'Hesab??n??z varsa giri?? yapmak i??in dokunun',
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

    var res = await AuthService.registerData(data, 'register');
    var body = json.decode(res.body);

    SharedPreferences localStorage = await SharedPreferences.getInstance();
    print(body);
    localStorage.setString('token', body['token'].toString());
    localStorage.setString('rol', body['rol'].toString());
    localStorage.setString('id', body['id'].toString());
    //localStorage.setString('rol', body[0]['rol'].toString());
    //localStorage.setString('id', body[0]['id'].toString());
    print("${localStorage.get(rol)}");
    print("${localStorage.get(token)}");
    if (body["kayit"] == 1) {
      Navigator.push(
        context,
        new MaterialPageRoute(builder: (context) => HomeView()),
      );
    } else if (body["kayit"] == 0) {
      return showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text("Kay??t Hatas??"),
          content: Text(
              "Kay??t yapt??????n??z hesap zaten sisteme kay??tl??.\nL??tfen farkl?? bir e-posta ile kay??t olmay?? deneyin!"),
          actions: <Widget>[
            // ignore: deprecated_member_use
            FlatButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: Text("Tamam"),
            ),
          ],
        ),
      );
    }
  }
}
