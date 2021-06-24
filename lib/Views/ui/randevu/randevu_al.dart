import 'package:fit_diyet/Controllers/danisan_service.dart';
import 'package:fit_diyet/Views/widgets/appbar/arrow_back_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class RandevuAyarlari extends StatefulWidget {
  final int dytId;
  const RandevuAyarlari({Key key, this.dytId}) : super(key: key);

  @override
  _RandevuAyarlariState createState() => _RandevuAyarlariState();
}

class _RandevuAyarlariState extends State<RandevuAyarlari> {
  String _date = "Tarih Seçin";
  String _timeStart = "Saat Seçin";

  String _allTime;
  int dy_Id;
  @override
  void initState() {
    super.initState();
    dy_Id = widget.dytId;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: arrowBackAppBar(context),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Randevu almak için tarih ve saat seçin.",
              ),
              SizedBox(
                height: 25,
              ),
              // ignore: deprecated_member_use
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                elevation: 4.0,
                onPressed: () {
                  DatePicker.showDatePicker(context,
                      theme: DatePickerTheme(
                        containerHeight: 210.0,
                      ),
                      showTitleActions: true,
                      minTime: DateTime(2000, 1, 1),
                      maxTime: DateTime(2022, 12, 31), onConfirm: (date) {
                    print('confirm $date');
                    _date = '${date.year}-${date.month}-${date.day}';
                    setState(() {});
                  }, currentTime: DateTime.now(), locale: LocaleType.tr);
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 50.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.date_range,
                                  size: 18.0,
                                  color: Colors.teal,
                                ),
                                Text(
                                  " $_date",
                                  style: TextStyle(
                                      color: Colors.teal,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Text(
                        "  SEÇ",
                        style: TextStyle(
                            color: Colors.teal,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0),
                      ),
                    ],
                  ),
                ),
                color: Colors.white,
              ),
              SizedBox(
                height: 20.0,
              ),
              // ignore: deprecated_member_use
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                elevation: 4.0,
                onPressed: () {
                  DatePicker.showTimePicker(context,
                      theme: DatePickerTheme(
                        containerHeight: 210.0,
                      ),
                      showTitleActions: true, onConfirm: (time) {
                    print('confirm $time');

                    _timeStart = time.minute <= 9
                        ? '0${time.hour}:0${time.minute}'
                        : '${time.hour}:${time.minute}';
                    setState(() {});
                  }, currentTime: DateTime.now(), locale: LocaleType.tr);
                  setState(() {});
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 50.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.access_time,
                                  size: 18.0,
                                  color: Colors.teal,
                                ),
                                Text(
                                  " $_timeStart",
                                  style: TextStyle(
                                      color: Colors.teal,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Text(
                        "  SEÇ",
                        style: TextStyle(
                            color: Colors.teal,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0),
                      ),
                    ],
                  ),
                ),
                color: Colors.white,
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  MaterialButton(
                    color: Theme.of(context).accentColor,
                    shape: StadiumBorder(),
                    child: Text(
                      "RANDEVU AL",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      if (_date != null && _timeStart != null) {
                        _date = _date.substring(0, 8).trim().toString();
                        _allTime = _timeStart.trim();
                        print(_allTime);
                        // DanisanService.postRandevuAyar(_allTime, _date);
                        postRandevu(_allTime, _date, dy_Id);
                      }
                    },
                  ),
                  SizedBox(width: 20),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future postRandevu(String saat, tarih, int id) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();

    var url = baseUrl +
        "danisan/randevu/insert/$id?token=" +
        localStorage.get("token");
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
    if (response.body.isEmpty) {
      throw Exception('İşlem başarısız.');
    } else {
      return myDialog(context);
    }
  }

  Future<AlertDialog> myDialog(BuildContext context) {
    return showDialog<AlertDialog>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            margin: EdgeInsets.all(8.0),
            child: Form(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text("Randevu alma işlemi başarıyla tamamlandı")
                ],
              ),
            ),
          ),
          actions: <Widget>[
            // ignore: deprecated_member_use
            FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Tamam")),
          ],
        );
      },
    );
  }
}
