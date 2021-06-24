import 'dart:convert';
import 'package:fit_diyet/Controllers/diyetisyen_service.dart';
import 'package:fit_diyet/Models/diyetisyen_model.dart';
import 'package:fit_diyet/Views/ui/doctor/doctor_detail.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class CategoriesView extends StatefulWidget {
  final Diyetisyen diyetisyenModel;
  const CategoriesView({Key key, this.diyetisyenModel}) : super(key: key);
  @override
  _CategoriesViewState createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  // ignore: deprecated_member_use
  List<Diyetisyen> diyetisyenler = new List<Diyetisyen>();
  final DiyetisyenService diyetisyenService = DiyetisyenService();
  Diyetisyen diyetisyenModel = Diyetisyen();

  List<Diyetisyen> parseDateBringDiyetisyen(String responseBody) {
    final parsed =
        jsonDecode(responseBody.toString()).cast<Map<String, dynamic>>();

    return parsed.map<Diyetisyen>((json) => Diyetisyen.fromJson(json)).toList();
  }

  Future<List<Diyetisyen>> getDiyetisyen() async {
    //
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var url = baseUrl +
        "diyetisyenler" +
        "?" +
        "token=" +
        localStorage.getString("token");
    await http.get(
      Uri.parse(url),
    );
    var response = await http.get(Uri.parse(url));
    print('response geliyor : ' + response.body);

    if (response.statusCode == 200) {
      print('asd');
      List<dynamic> list = await jsonDecode(response.body);

      list.map((e) {
        diyetisyenModel = Diyetisyen.fromJson(e);
        print('ss ' + diyetisyenModel.adi.toString());
      }).toList();

      setState(() {
        diyetisyenler = parseDateBringDiyetisyen(response.body);
      });

      return (json.decode(response.body) as List)
          .map((e) => Diyetisyen.fromJson(e))
          .toList();
    } else {
      throw Exception('Not Network ${response.statusCode}');
    }
  }

  initState() {
    super.initState();
    getDiyetisyen();
    diyetisyenModel = widget.diyetisyenModel;
  }

  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'FİT DİYET',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.0),
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                height: 200.0,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: diyetisyenler.length,
                  itemBuilder: (context, index) {
                    var diyetisyen = diyetisyenler[index];
                    return GestureDetector(
                      onTap: () {
                        print("BURAYA ODAKLAN:${diyetisyenler[index]}");
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => DiyetisyenListViewDetail(
                              diyetisyen: diyetisyen,
                            ),
                          ),
                        );
                      },
                      child: _buildCategoriesList(
                        diyetisyenler[index],
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoriesList(Diyetisyen items) {
    return Card(
      margin: EdgeInsets.all(8.0),
      elevation: 50,
      shadowColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: ExpansionTile(
        leading: Icon(Icons.category),
        title: Text(
          items.kategori,
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
        ),
        children: <Widget>[
          ListTile(
            title: Text(
              "${items.adi[0].toUpperCase()}${items.adi.substring(1)} ${items.soyad[0].toUpperCase()}${items.soyad.substring(1)}",
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
          )
        ],
      ),
    );
  }
}
