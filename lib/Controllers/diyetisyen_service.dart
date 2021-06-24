import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

const baseUrl = "https://www.fitdiyet.online/api/";

var token;

class DiyetisyenService {
    static getRandevu() async {
     SharedPreferences localStorage = await SharedPreferences.getInstance();
      var url = baseUrl +
          "danisan/randevularim" +
          "?" +
          "token=" +
          localStorage.getString("token");
       await http.get(
          Uri.parse(
              url),
        );
    
   }

  static Future postDiyetisyen(
      String adTxt,
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
      aciklamaTxt) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var url = baseUrl + "danisanlar/update?token=" + localStorage.get("token");
    var map = new Map<String, dynamic>();
    map['adi'] = adTxt;
    map['soyad'] = soyadTxt;
    map['tc'] = tcTxt;
    map['telefon'] = telefonTxt;
    map['cinsiyet'] = cinsiyetTxt;
    map['yas'] = yasTxt;
    map['danisan_boy'] = boyTxt;
    map['danisan_kilo'] = kiloTxt;
    map['kronik_rahatsizlik'] = rahatsizlikTxt;
    map['ilac'] = ilacTxt;
    map['alkol'] = alkolTxt;
    map['disari_yemek'] = disariyemekTxt;
    map['gunluk_ogun'] = gunlukogunTxt;
    map['gunluk_su'] = gunluksuTxt;
    map['hedef_kilo'] = hedefkiloTxt;
    map['sevilen_besin'] = sevilenbesinTxt;
    map['sevilmeyen_besin'] = sevilmeyenbesinTxt;
    map['aciklama'] = aciklamaTxt;

    http.Response response = await http.post(
      Uri.parse(url),
      body: map,
    );

    print(response.body);
  }

  static authData(data, apiUrl) async {
    try {
      var fullUrl = baseUrl + apiUrl;
      return await http.post(Uri.parse(fullUrl),
          body: jsonEncode(data), headers: _setHeaders());
    } catch (e) {
      print(e);
    }
  }

  static authDataiki(data, apiUrl) async {
    try {
      var fullUrl = baseUrl + apiUrl;
      return await http.get(Uri.parse(fullUrl), headers: _setHeaders());
    } catch (e) {
      print(e);
      HttpException(e);
    }
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
