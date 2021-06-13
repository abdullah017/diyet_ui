
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

const baseUrl = "https://www.fitdiyet.online/api/";

var token;

class AuthService {
  static authData(data, apiUrl) async {
    try {
      var fullUrl = baseUrl + apiUrl;
      return await http.get(Uri.parse(fullUrl), headers: _setHeaders());
    } catch (e) {
      print(e);
      HttpException(e);
    }
  }

  static _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };

  static _getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = (localStorage.get("token"));
  }
}
