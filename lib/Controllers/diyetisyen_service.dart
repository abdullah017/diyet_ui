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

  static Future postDiyetisyen(String adtxt,kaloritxt,birimtxt) async {
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
}
