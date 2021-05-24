import 'package:fit_diyet/helpers/size_settings.dart';
import 'package:fit_diyet/model/doctor_model.dart';
import 'package:fit_diyet/views/doctor/doctor_detail.dart';
import 'package:fit_diyet/widgets/doctor_card.dart';
import 'package:fit_diyet/widgets/home_custom_appbar.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        appBar: HomeAppBar(),
        drawer: Drawer(),
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
                    itemCount: doctorList.length,
                    scrollDirection: Axis.horizontal,
                    physics: ScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      var doctor = doctorList[index];

                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => DiyetisyenListViewDetail(
                                doctorModel: doctorList[index],
                              ),
                            ),
                          );
                        },
                        child: DoctorCard(doctor: doctor),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
