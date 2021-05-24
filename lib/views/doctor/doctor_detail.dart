import 'package:fit_diyet/helpers/size_settings.dart';
import 'package:fit_diyet/model/doctor_model.dart';
import 'package:flutter/material.dart';

/// [Detay Sayfası]
class DiyetisyenListViewDetail extends StatefulWidget {
  final Doctor doctorModel;

  const DiyetisyenListViewDetail({Key key, this.doctorModel}) : super(key: key);

  @override
  _DiyetisyenListViewDetailState createState() =>
      _DiyetisyenListViewDetailState();
}

class _DiyetisyenListViewDetailState extends State<DiyetisyenListViewDetail> {
  Doctor doctorModel;

  bool isFavori = false;
  Color favoriColor = Colors.white;

  void _addFavori() {
    setState(() {
      isFavori = !isFavori;
      isFavori
          ? favoriColor = Color(0xffff0000)
          : favoriColor = Color(0xffffffff);
      print('FAVORİ ÇALIŞTI => $isFavori');
    });
  }

  @override
  void initState() {
    doctorModel = widget.doctorModel;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'FİT DİYET',
              style: TextStyle(color: Colors.black),
            ),
            leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                }),
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 15,
                ),
                Card(
                  elevation: 50,
                  shadowColor: Colors.black,
                  color: Colors.purple[700],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: SizedBox(
                    width: displayWidth(context) * 0.9,
                    height: displayHeight(context) * 0.3,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Align(
                                  alignment: Alignment.topRight,
                                  child: IconButton(
                                      icon: Icon(
                                        Icons.favorite,
                                        color: favoriColor,
                                      ),
                                      onPressed: _addFavori),
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.green[500],
                                    radius: 40,
                                    backgroundImage: AssetImage(
                                      doctorModel.image,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              doctorModel.name,
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              doctorModel.specialist,
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white54,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Flexible(
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.orange,
                                      ),
                                      borderRadius: BorderRadius.circular(5.0),
                                      color: Colors.orange[700],
                                    ),
                                    child: IconButton(
                                      icon: Icon(Icons.message),
                                      onPressed: () {},
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.orange,
                                      ),
                                      borderRadius: BorderRadius.circular(5.0),
                                      color: Colors.orange[700],
                                    ),
                                    child: IconButton(
                                      icon: Icon(Icons.video_call_sharp),
                                      onPressed: () {},
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.orange,
                                      ),
                                      borderRadius: BorderRadius.circular(5.0),
                                      color: Colors.orange[700],
                                    ),
                                    child: IconButton(
                                      icon: Icon(Icons.phone),
                                      onPressed: () {},
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                // Text(
                //   "HAKKINDA",
                //   style: TextStyle(color: Colors.black, fontSize: 20),
                // ),
                SizedBox(
                  height: 15,
                ),
                Card(
                  elevation: 50,
                  shadowColor: Colors.black,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: SizedBox(
                    width: displayWidth(context) * 0.9,
                    height: displayHeight(context) * 0.3,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              "HAKKINDA",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              doctorModel.about,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    SizedBox(
                      width: displayWidth(context) * 0.9,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'Seans Ücretleri',
                          style: TextStyle(color: Colors.orange),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          shape: StadiumBorder(),
                          elevation: 10,
                          side: BorderSide(
                            color: Colors.orange,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: displayWidth(context) * 0.9,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'Randevu Ücretleri',
                          style: TextStyle(color: Colors.black),
                        ),
                        style: ElevatedButton.styleFrom(
                          elevation: 10,
                          primary: Colors.white,
                          shape: StadiumBorder(),
                          side: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
