import 'package:fit_diyet/views/home/home.dart';
import 'package:fit_diyet/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class AccountInfo extends StatefulWidget {
  @override
  _AccountInfoState createState() => _AccountInfoState();
}

class _AccountInfoState extends State<AccountInfo> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  // ignore: unused_field
  bool _checkbox = false;
  bool _checkboxListTile = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: CustomAppBar(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                child: Container(
                  child: Image(
                    fit: BoxFit.cover,
                    width: 150,
                    image: AssetImage(
                      "assets/password_code.png",
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                child: Text(
                  "HESAP BİLGİLERİ",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: Form(
                  key: this._formKey,
                  child: ListView(
                    children: <Widget>[
                      TextFormField(
                        keyboardType: TextInputType
                            .emailAddress, // Use email input type for emails.
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          hintText: 'İsim',
                          labelText: 'İsim',
                        ),
                        //validator: this._validateEmail,
                        // onSaved: (String value) {
                        // this._data.email = value;
                        //}
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        obscureText: true, // Use secure text for passwords.
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide: BorderSide(color: Colors.red),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide: BorderSide(color: Colors.red),
                            ),
                            hintText: 'Soyisim',
                            labelText: 'Soyisim'),
                        // validator: this._validatePassword,
                        // onSaved: (String value) {
                        //  this._data.password = value;
                        //}
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        keyboardType: TextInputType
                            .emailAddress, // Use email input type for emails.
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          hintText: 'you@example.com',
                          labelText: 'E-mail Adresi',
                        ),
                        //validator: this._validateEmail,
                        // onSaved: (String value) {
                        // this._data.email = value;
                        //}
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CheckboxListTile(
                        checkColor: Colors.white,
                        shape: CircleBorder(),
                        controlAffinity: ListTileControlAffinity.leading,
                        title: Text(
                            'Fit Diyet uygulaması Kullanıcı Sözleşmesini okudum ve onaylıyorum'),
                        value: _checkboxListTile,
                        onChanged: (value) {
                          setState(() {
                            _checkboxListTile = !_checkboxListTile;
                          });
                        },
                      ),
                      ElevatedButton(
                        onPressed: () {
                          //formKey.currentState.save();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeView()));
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.red),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                        child: Text(
                          "KAYDOL",
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                      )
                    ],
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
