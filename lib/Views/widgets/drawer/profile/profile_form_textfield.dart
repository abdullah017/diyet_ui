import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProfileFormTextField extends StatelessWidget {
  final TextEditingController txtController;
  final Function onchanged;
  final String lblText;

  const ProfileFormTextField(
      {Key key, this.txtController, this.onchanged, this.lblText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      decoration: InputDecoration(labelText: lblText),
      onChanged: onchanged,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      controller: txtController,
    );
  }
}
