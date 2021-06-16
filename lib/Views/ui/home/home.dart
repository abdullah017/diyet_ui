import 'dart:convert';
import 'package:fit_diyet/Controllers/authantication_service.dart';
import 'package:fit_diyet/Views/helpers/size_settings.dart';
import 'package:fit_diyet/Models/diyetisyen_model.dart';
import 'package:fit_diyet/Controllers/diyetisyen_service.dart';
import 'package:fit_diyet/Views/ui/categories/categories.dart';
import 'package:fit_diyet/Views/ui/doctor/doctor_detail.dart';
import 'package:fit_diyet/Views/ui/drawers/profil_page.dart';
import 'package:fit_diyet/Views/ui/login_screens/login_views.dart';
import 'package:fit_diyet/Views/widgets/doctor_card.dart';
import 'package:fit_diyet/Views/widgets/drawer/drawer_header.dart';
import 'package:fit_diyet/Views/widgets/drawer/drawer_item.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // ignore: deprecated_member_use
  var diyetisyenler = List<Diyetisyen>();

  initState() {
    super.initState();
    _getDiyetisyen();
  }

  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {
                showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return Column(
                      children: [
                        bildirimler(
                          "RANDEVUNUZ OLUŞTURULDU",
                          "3 dk önce",
                        ),
                        bildirimler(
                          "RANDEVUNUZ OLUŞTURULDU",
                          "3 dk önce",
                        ),
                        bildirimler(
                          "RANDEVUNUZ OLUŞTURULDU",
                          "3 dk önce",
                        ),
                      ],
                    );
                  },
                );
              },
              color: Colors.black,
            ),
          ],
          leading: Builder(
            builder: (context) => IconButton(
              icon: Icon(
                Icons.menu_rounded,
                color: Colors.black,
              ),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
          title: Text(
            "FİT DİYET",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          backgroundColor: Colors.transparent,
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              createHeader(),
              createDrawerItem(
                icon: Icons.person,
                text: 'Profilim',
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ProfilPage(),
                    ),
                  );
                },
              ),
              createDrawerItem(
                icon: Icons.event,
                text: 'Diyet Listelerim',
              ),
              createDrawerItem(
                icon: Icons.format_list_numbered,
                text: 'Tarfilerim',
              ),
              Divider(),
              createDrawerItem(icon: Icons.straighten, text: 'Ölçümlerim'),
              createDrawerItem(icon: Icons.event, text: 'Randevularım'),
              createDrawerItem(icon: Icons.message, text: 'Mesajlarım'),
              createDrawerItem(
                  icon: Icons.exit_to_app, text: 'Çıkış', onTap: logout),
              Divider(),
              createDrawerItem(icon: Icons.bug_report, text: 'Hata bildirin'),
              ListTile(
                title: Text('0.0.1'),
                onTap: () {},
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "HOŞGELDİN HASAN\nBUGÜN NASILSIN?",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                color: Color(0xff654769),
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const ListTile(
                        leading: Icon(
                          Icons.access_time_rounded,
                          size: 50,
                          color: Colors.white,
                        ),
                        title: Text('Randevu',
                            style: TextStyle(color: Colors.white)),
                        subtitle: Text(
                          'Yakınlarda bir randevunuz bulunmamaktadır.',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: Container(
                  width: displayWidth(context),
                  height: displayHeight(context) * 0.2,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    border: Border.all(
                      color: Color(0xff69C7B7),
                    ),
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xff69C7B7),
                    //borderRadius: BorderRadius.circular(100),
                  ),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CategoriesView(),
                        ),
                      );
                      print('BANA BASTINmmasdfasd');
                    },
                    child: Text(
                      "Kategorini Seç\nHemen Başla",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50),
              Expanded(
                flex: 0,
                child: Container(
                  width: double.infinity,
                  height: 200.0,
                  child: ListView.builder(
                      itemCount: diyetisyenler.length,
                      scrollDirection: Axis.horizontal,
                      physics: ScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        var diyetisyen = diyetisyenler[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => DiyetisyenListViewDetail(
                                  diyetisyen: diyetisyenler[index],
                                ),
                              ),
                            );
                          },
                          child: DoctorCard(diyetisyen: diyetisyen),
                        );
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding bildirimler(String mesaj, gecenSure) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            mesaj,
            style: TextStyle(
              fontSize: 15.0,
            ),
          ),
          Text(
            gecenSure,
          ),
        ],
      ),
    );
  }

  _getDiyetisyen() async {
    DiyetisyenService.getDiyetisyenler().then(
      (response) {
        setState(
          () {
            Iterable list = json.decode(response.body);
            diyetisyenler =
                list.map((model) => Diyetisyen.fromJson(model)).toList();
          },
        );
      },
    );
    // ).catchError(
    //   (error, stackTrace) {
    //     print("AHA BİR HATA YAKALADIM: $error");
    //     if (error != null) {
    //       Navigator.push(
    //         context,
    //         new MaterialPageRoute(builder: (context) => Login()),
    //       );
    //     }
    //   },
    // );
  }

  void logout() async {
    //var res = await DiyetisyenService.getData('/logout');
    //var body = json.decode(res.body);
    // if(body['success']){
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    localStorage.remove('user');
    localStorage.remove('token');
    Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
  }
}
