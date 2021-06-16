import 'dart:convert';
import 'package:fit_diyet/Controllers/authantication_service.dart';

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
  bool _obscureText = true;
  final _formKey = GlobalKey<FormState>();
  var email;
  var password;

  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        body: Container(
          color: Colors.teal,
          child: Stack(
            children: <Widget>[
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
                                        hintText: "E-Posta",
                                        hintStyle: TextStyle(
                                            color: Color(0xFF9b9b9b),
                                            fontSize: 15,
                                            fontWeight: FontWeight.normal),
                                      ),
                                      onChanged: (value) {
                                        email = value.trim();
                                        print(email);
                                      },
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
                                      style:
                                          TextStyle(color: Color(0xFF000000)),
                                      cursorColor: Color(0xFF9b9b9b),
                                      keyboardType: TextInputType.text,
                                      obscureText: _obscureText,
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(
                                          Icons.vpn_key,
                                          color: Colors.grey,
                                        ),
                                        suffixIcon: IconButton(
                                            icon: Icon(
                                              _obscureText
                                                  ? Icons.visibility
                                                  : Icons.visibility_off,
                                              color: Colors.grey,
                                            ),
                                            onPressed: _toggle),
                                        hintText: "Parola",
                                        hintStyle: TextStyle(
                                            color: Color(0xFF9b9b9b),
                                            fontSize: 15,
                                            fontWeight: FontWeight.normal),
                                      ),
                                      onChanged: (value) {
                                        password = value.trim();
                                        print(password);
                                      },
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
                                              top: 8,
                                              bottom: 8,
                                              left: 10,
                                              right: 10),
                                          child: Text(
                                            _isLoading ? 'Giriş' : 'Giriş',
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
                                                new BorderRadius.circular(
                                                    20.0)),
                                        onPressed: () {
                                          if (_formKey.currentState
                                              .validate()) {
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
                                'Yeni Hesap Oluşturun',
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

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _login() async {
    setState(() {
      _isLoading = true;
    });
    var data = {'email': email, 'password': password};

    var res = await AuthService.loginData(
        data, 'giris?email=$email&password=$password');
    var body = json.decode(res.body);
    if (body["giris"] == 0) {
      return showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text("Giriş Hatası"),
          content: Text(
              "Giriş yaptığınız hesabın sisteme kayıtlı ve doğru olduğundan emin olun.\nVe tekrar giriş yapmayı deneyin"),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: Text("okay"),
            ),
          ],
        ),
      );
    } else {
      SharedPreferences localStorage = await SharedPreferences.getInstance();

      localStorage.setString('token', body['token'].toString());
      localStorage.setString('rol', body['rol'].toString());
      print(token);
      print(rol);
      print(body);
      Navigator.push(
        context,
        new MaterialPageRoute(builder: (context) => HomeView()),
      );
    }

    setState(() {
      _isLoading = false;
    });
  }
}
