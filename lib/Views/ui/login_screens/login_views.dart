import 'dart:convert';
import 'package:fit_diyet/Controllers/diyetisyen_service.dart';
import 'package:fit_diyet/Views/ui/home/home.dart';
import 'package:fit_diyet/Views/ui/register/register.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  var email;
  var password;
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  _showMsg(msg) {
    final snackBar = SnackBar(
      content: Text(msg),
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {
          // Some code to undo the change!
        },
      ),
    );
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        color: Colors.teal,
        child: Stack(
          children: <Widget>[
            Positioned(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
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
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              TextFormField(
                                controller: mailController,
                                style: TextStyle(
                                  color: Color(0xFF000000),
                                ),
                                cursorColor: Color(0xFF9b9b9b),
                                keyboardType: TextInputType.emailAddress,
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
                                style: TextStyle(color: Color(0xFF000000)),
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
                                    return 'Parolanızı lütfen doğru giriniz';
                                  }
                                  if (passwordValue.length > 20) {
                                    return 'Parolanızı lütfen doğru giriniz';
                                  }
                                  password = passwordValue;
                                  return null;
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: FlatButton(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top: 8, bottom: 8, left: 10, right: 10),
                                    child: Text(
                                      _isLoading ? 'Proccessing...' : 'Login',
                                      textDirection: TextDirection.ltr,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15.0,
                                        decoration: TextDecoration.none,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                  color: Colors.teal,
                                  disabledColor: Colors.grey,
                                  shape: new RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(20.0)),
                                  onPressed: () {
                                    if (_formKey.currentState.validate()) {
                                      _login();
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) => SignUp()));
                        },
                        child: Text(
                          'Create new Account',
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
            )
          ],
        ),
      ),
    );
  }

  void _login() async {
    setState(() {
      _isLoading = true;
    });
    var data = {'email': email, 'password': password};

    var res = await DiyetisyenService.authDataiki(
        data, 'giris?email=$email&password=$password');
    var body = json.decode(res.body);
    // if (body['success']) {

    SharedPreferences localStorage = await SharedPreferences.getInstance();

    //print(body[0]["token"]);
    print(body['token']);
    print(body);
    print(body['token']);
    localStorage.setString('token', body['token'].toString());
    print(body);
    //localStorage.setString('user', json.encode(body['user']));
    // if (body["giriş başarısız"]) {
    //   Navigator.push(
    //     context,
    //     new MaterialPageRoute(builder: (context) => Login()),
    //   );
    // }
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
