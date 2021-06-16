import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

const baseUrl = "https://www.fitdiyet.online/api/";

var token;
var rol;

class AuthService {
  static registerData(data, apiUrl) async {
    try {
      var fullUrl = baseUrl + apiUrl;
      return await http.post(Uri.parse(fullUrl),
          body: jsonEncode(data), headers: _setHeaders());
    } catch (e) {
      print(e);
    }
  }

  static loginData(data, apiUrl) async {
    try {
      var fullUrl = baseUrl + apiUrl;
      return await http.get(Uri.parse(fullUrl));
    } catch (e) {
      print(e);
      HttpException(e);
    }
  }

  static authDataiki(data, apiUrl) async {
    try {
      var fullUrl = baseUrl + apiUrl;
      return await http.get(Uri.parse(fullUrl));
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

  // static _getToken() async {
  //   SharedPreferences localStorage = await SharedPreferences.getInstance();
  //   token = (localStorage.get("token"));
  // }

  static getRol() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = (localStorage.get("token"));
  }
}
