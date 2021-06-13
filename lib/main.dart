import 'package:fit_diyet/Views/ui/home/home.dart';
import 'package:fit_diyet/Views/ui/login_screens/login_views.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var token = prefs.getString('token');
  print(token);
  runApp(MaterialApp(
    home: token == null ? Login() : HomeView(),
    debugShowCheckedModeBanner: false,
  ));
}
// NOTE
//      Main fonksiyonu içerisinde varolan yapı şuna yarar;
//      Eğer kullanıcı giriş yapmış ve giriş yaptığı token uygulama hafızasına kaydolmuşsa
//      bu kullanıcıya bir daha hesap şifre sorma içeriye al diyor..
