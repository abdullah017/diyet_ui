import 'package:fit_diyet/views/account/account_info.dart';
import 'package:fit_diyet/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController controller = TextEditingController();
  String initialCountry = 'TR';
  PhoneNumber number = PhoneNumber(isoCode: 'TR');
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FİT DİYET',
      home: Scaffold(
        appBar: CustomAppBar(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Image(
                  fit: BoxFit.cover,
                  width: 150,
                  image: AssetImage(
                    "assets/password_code.png",
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                child: Text(
                  "TELEFON NUMARASI",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              InternationalPhoneNumberInput(
                onInputChanged: (PhoneNumber number) {
                  print(number.phoneNumber);
                },
                onInputValidated: (bool value) {
                  print(value);
                },
                selectorConfig: SelectorConfig(
                  selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                ),
                ignoreBlank: false,
                autoValidateMode: AutovalidateMode.disabled,
                selectorTextStyle: TextStyle(color: Colors.black),
                initialValue: number,
                textFieldController: controller,
                formatInput: false,
                keyboardType: TextInputType.numberWithOptions(
                    signed: true, decimal: true),
                inputBorder: InputBorder.none,
                onSaved: (PhoneNumber number) {
                  if (number != null) {
                    print('On Saved: $number');
                  } else {
                    print("null döndü");
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Text(
                  "Giriş yapmak için telefon numaranızı girin ve sms ile aktivasyon kodunuzu alın",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Spacer(),
              ElevatedButton(
                onPressed: () {
                  //formKey.currentState.save();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AccountInfo()));
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
                child: Text(
                  "Kodu Gönder",
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void getPhoneNumber(String phoneNumber) async {
    PhoneNumber number =
        await PhoneNumber.getRegionInfoFromPhoneNumber(phoneNumber, 'TR');

    setState(() {
      this.number = number;
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
