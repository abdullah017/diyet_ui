import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProfileFormTextField extends StatelessWidget {
  final TextEditingController txtController;
  final Function onchanged;
  final String lblText;
  final String hntText;
  final TextInputType klavyeTipi;

  const ProfileFormTextField(
      {Key key,
      this.txtController,
      this.onchanged,
      this.lblText,
      this.klavyeTipi,
      this.hntText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: klavyeTipi,
      decoration: InputDecoration(
        labelText: lblText,
        hintText: hntText,
      ),
      
      onChanged: onchanged,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Lütfen tüm alanları doldurunuz';
        }
        return null;
      },
      controller: txtController,
    );
  }
}
