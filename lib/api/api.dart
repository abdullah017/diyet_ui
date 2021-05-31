import 'dart:async';
import 'package:http/http.dart' as http;

const baseUrl = "https://www.fitdiyet.online/api";

class API {
  static Future getUsers() {
    var url = baseUrl + "/diyetisyenler";
    return http.get(Uri.parse(url));
    
  }
}
