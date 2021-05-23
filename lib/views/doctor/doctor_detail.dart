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

  @override
  void initState() {
    doctorModel = widget.doctorModel;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(30, 50, 30, 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    height: 50,
                    width: 50,
                    child: IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black54),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                  Text(
                    'FİT DİYET',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Container(height: 24, width: 24),
                ],
              ),
            ),
            Card(
              elevation: 50,
              shadowColor: Colors.black,
              color: Colors.greenAccent[100],
              child: SizedBox(
                width: displayWidth(context) * 0.9,
                height: displayHeight(context) * 0.5,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.green[500],
                        radius: 50,
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                              "https://pbs.twimg.com/profile_images/1304985167476523008/QNHrwL2q_400x400.jpg"), //NetworkImage
                          radius: 100,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'GeeksforGeeks',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.green[900],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'GeeksforGeeks is a computer science portal',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.green[900],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 25,
                            height: 25,
                            color: Colors.red,
                          ),
                          Container(
                            width: 25,
                            height: 25,
                            color: Colors.red,
                          ),
                          Container(
                            width: 25,
                            height: 25,
                            color: Colors.red,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
