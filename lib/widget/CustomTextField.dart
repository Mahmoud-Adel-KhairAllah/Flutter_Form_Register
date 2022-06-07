import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  late Function savefun;
  late Function validationfun;
  late String label;
  CustomTextField(
      {required this.label,
      required this.savefun,
      required this.validationfun});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextFormField(
      onSaved: ((newValue) => savefun(newValue)),
      validator: (value) => validationfun(value),
      decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
    );
  }
}
