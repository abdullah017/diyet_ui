import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

const baseUrl = "https://www.fitdiyet.online/api/";

var token;

class DanisanService {
  static Future postProfile(
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

  static Future postRandevuAyar(String saat, tarih,int id) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var url = baseUrl + "saat/insert?token=" + localStorage.get("token");
    var map = new Map<String, dynamic>();
    map['saat'] = saat;
    map['tarih'] = tarih;


    http.Response response = await http
        .post(
      Uri.parse(url),
      body: map,
    )
        .catchError((e) {
      print(e);
    });
    print(response.body);
  }

  static Future getProfile() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var url = baseUrl +
        "danisanlar/" +
        localStorage.get("id") +
        "?" +
        "token=" +
        localStorage.get("token");
    return http
        .get(
      Uri.parse(url),
    )
        .catchError((error, stackTrace) {
      print("inner: $error");
    });
  }
}
