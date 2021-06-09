import 'dart:convert';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:fit_diyet/Controllers/diyetisyen_service.dart';
import 'package:fit_diyet/Views/ui/home/home.dart';
import 'package:fit_diyet/Views/ui/login_screens/login_views.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                            /////////////// name////////////

                            // TextField(
                            //   style: TextStyle(color: Color(0xFF000000)),
                            //   controller: firstNameController,
                            //   cursorColor: Color(0xFF9b9b9b),
                            //   keyboardType: TextInputType.text,
                            //   decoration: InputDecoration(
                            //     prefixIcon: Icon(
                            //       Icons.account_circle,
                            //       color: Colors.grey,
                            //     ),
                            //     hintText: "Firstname",
                            //     hintStyle: TextStyle(
                            //         color: Color(0xFF9b9b9b),
                            //         fontSize: 15,
                            //         fontWeight: FontWeight.normal),
                            //   ),
                            // ),
                            TextField(
                              style: TextStyle(color: Color(0xFF000000)),
                              controller: lastNameController,
                              cursorColor: Color(0xFF9b9b9b),
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.account_circle,
                                  color: Colors.grey,
                                ),
                                hintText: "Lastname",
                                hintStyle: TextStyle(
                                    color: Color(0xFF9b9b9b),
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),

                            /////////////// Email ////////////

                            TextField(
                              style: TextStyle(color: Color(0xFF000000)),
                              controller: mailController,
                              cursorColor: Color(0xFF9b9b9b),
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.mail,
                                  color: Colors.grey,
                                ),
                                hintText: "Email ",
                                hintStyle: TextStyle(
                                    color: Color(0xFF9b9b9b),
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),

                            /////////////// password ////////////

                            TextField(
                              style: TextStyle(color: Color(0xFF000000)),
                              cursorColor: Color(0xFF9b9b9b),
                              controller: passwordController,
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
                            ),
                            //  TextField(
                            //     style: TextStyle(color: Color(0xFF000000)),
                            //     controller: phoneController,
                            //     cursorColor: Color(0xFF9b9b9b),
                            //     keyboardType: TextInputType.text,
                            //     decoration: InputDecoration(
                            //       prefixIcon: Icon(
                            //         Icons.mobile_screen_share,
                            //         color: Colors.grey,
                            //       ),
                            //       hintText: "Phone",
                            //       hintStyle: TextStyle(
                            //           color: Color(0xFF9b9b9b),
                            //           fontSize: 15,
                            //           fontWeight: FontWeight.normal),
                            //     ),
                            //   ),

                            /////////////// SignUp Button ////////////

                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: FlatButton(
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        top: 8, bottom: 8, left: 10, right: 10),
                                    child: Text(
                                      _isLoading
                                          ? 'Creating...'
                                          : 'Create account',
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
                                  onPressed: _isLoading ? _register : null),
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
                          'Already have an Account',
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
            )
          ],
        ),
      ),
    );
  }

  // void _handleLogin() async {
  //   setState(() {
  //     _isLoading = true;
  //   });

  //   var data = {
  //     'rol': lastNameController.text,
  //     'email': mailController.text,
  //     'password': passwordController.text,
  //   };

  //   var res = await CallApi().postData(data, 'register');
  //   var body = json.decode(res.body);
  //   if (body['success'] == true) {
  //     SharedPreferences localStorage = await SharedPreferences.getInstance();
  //     localStorage.setString('token', body['token']);
  //     localStorage.setString('kullanici', json.encode(body['kullanici']));

  //     Navigator.push(
  //         context, new MaterialPageRoute(builder: (context) => Home()));
  //   }

  //   setState(() {
  //     _isLoading = !_isLoading;
  //   });
  // }

  // Future<http.Response> postRequest() async {
  //   var url = 'https://fitdiyet.online/api/register';

  //   Map<dynamic, dynamic> data = {
  //     'rol': lastNameController.text,
  //     'email': mailController.text,
  //     'password': passwordController.text,
  //   };
  //   //encode Map to JSON
  //   var body = json.encode(data);

  //   var response = await http.post(Uri.parse(url),
  //       headers: {
  //         "Content-Type": "application/json",
  //       },
  //       body: body);
  //   SharedPreferences localStorage = await SharedPreferences.getInstance();
  //   localStorage.setString('token',json.encode(body['token']));
  //   localStorage.setString('kullanici', response.body);
  //   Navigator.push(
  //       context, new MaterialPageRoute(builder: (context) => HomeView()));
  //   print("${response.statusCode}");
  //   print("${response.body}");
  //   return response;
  // }
  void _register() async {
    setState(() {
      _isLoading = true;
    });
    var data = {
      'rol': lastNameController.text,
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
