
import 'package:fit_diyet/model/doctor_model.dart';
import 'package:fit_diyet/views/doctor/doctor_detail.dart';
import 'package:flutter/material.dart';

class CategoriesView extends StatefulWidget {
  final Doctor doctorModel;

  const CategoriesView({Key key, this.doctorModel}) : super(key: key);
  @override
  _CategoriesViewState createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  Doctor doctorModel;
  @override
  void initState() {
    doctorModel = widget.doctorModel;
    super.initState();
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
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: doctorList.length,
                itemBuilder: (BuildContext context, int index) {
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
                    child: _buildCategoriesList(
                      doctorList[index],
                    ),
                  );
                },
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

  Widget _buildCategoriesList(Doctor items) {
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
          items.specialist,
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
        ),
        children: <Widget>[
          ListTile(
            title: Text(
              items.name,
              style: TextStyle(fontWeight: FontWeight.w700),
            ),
          )
        ],
      ),
    );
  }
}
