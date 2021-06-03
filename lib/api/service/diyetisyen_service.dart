import 'dart:async';
import 'package:http/http.dart' as http;

const baseUrl = "https://www.fitdiyet.online/api/";

class DiyetisyenService {
  static Future getDiyetisyenler() {
    var url = baseUrl + "diyetisyenler";
    return http.get(Uri.parse(url));
  }

  static Future getDiyetisyen(int id) {
    var url = baseUrl + "diyetisyen/$id";
    return http.get(Uri.parse(url));
  }

   static Future postDiyetisyen(int id,String adi) {
    var url = baseUrl + "diyetisyen/$id";
    return http.post(Uri.parse(url));
  }

}
