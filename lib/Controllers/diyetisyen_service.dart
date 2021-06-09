import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

const baseUrl = "https://www.fitdiyet.online/api/";

var token;

class DiyetisyenService {
  static Future getDiyetisyenler() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var url =
        baseUrl + "diyetisyenler" + "?" + "token=" + localStorage.get("token");
    return http.get(Uri.parse(url));
  }

  static Future getDiyetisyen(int id) {
    var url = baseUrl + "diyetisyen/$id";
    return http.get(Uri.parse(url));
  }

  static Future postDiyetisyen(String adtxt, kaloritxt, birimtxt) async {
    var url = baseUrl + "besinler";
    var map = new Map<String, dynamic>();
    map['besin_adi'] = adtxt;
    map['besin_kalori'] = kaloritxt;
    map['besin_birimi'] = birimtxt;

    http.Response response = await http.post(
      Uri.parse(url),
      body: map,
    );

    print(response.body);
  }

  static authData(data, apiUrl) async {
    var fullUrl = baseUrl + apiUrl;
    return await http.post(Uri.parse(fullUrl),
        body: jsonEncode(data), headers: _setHeaders());
  }

  static authDataiki(data, apiUrl) async {
    var fullUrl = baseUrl + apiUrl;
    return await http.get(Uri.parse(fullUrl), headers: _setHeaders());
  }

  static getData(apiUrl) async {
    var fullUrl = baseUrl + apiUrl;
    await _getToken();
    return await http.get(Uri.parse(fullUrl), headers: _setHeaders());
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
