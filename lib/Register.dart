import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:form_application/widget/CustomTextField.dart';
import 'package:string_validator/string_validator.dart';

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  late String userName, email, password, confirmPassword, city = 'رفح';

  bool isAccept = false;

  saveuserName(String value) {
    this.userName = value;
  }

  saveemail(String value) {
    this.email = value;
  }

  savepassword(String value) {
    this.password = value;
  }

  saveconfirmPassword(String value) {
    this.confirmPassword = value;
  }

  savecity(String value) {
    this.city = value;
  }

  saveisAccept(bool value) {
    this.isAccept = value;
  }

  validateNullValue(value) {
    if (value == null || value == "") {
      return 'required Field';
    }
  }

  validateUserName(value) {}
  validateEmail(value) {
    if (value == null || value == "") {
      return 'required Field';
    } else if (this.password.length < 6) {
      return 'password is week';
    }
  }

  validatePassword(value) {
    if (value == null || value == "") {
      return 'required Field';
    } else if (this.password.length < 6) {
      return 'password is week';
    }
  }

  validateConfirmPassword(value) {
    if (value == null || value == "") {
      return 'required Field';
    } else if (this.confirmPassword != password) {
      return 'password not matched';
    }
  }

  validateCity(value) {}
  validateisAccept(value) {}
  GlobalKey<FormState> formkey = GlobalKey();

  GlobalKey<ScaffoldState> scaffoldkey = GlobalKey();

  List<String> cities = [
    'رفح',
    'خانيونس',
    'دير البلح',
    'المغازي',
    'الزايدة',
    'النصيرات',
    'البريج',
    'المغراقة'
  ];

  SaveForm() {
    if (formkey.currentState!.validate()) {
      if (isAccept == true) {
        formkey.currentState?.save();
      } else {
        scaffoldkey.currentState?.showSnackBar(
            SnackBar(content: Text('you have to accept our condition')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      key: scaffoldkey,
      appBar: AppBar(title: Text('Register')),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        margin: EdgeInsets.all(10),
        child: Form(
            key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomTextField(
                    label: 'User Name',
                    savefun: saveuserName,
                    validationfun: validateNullValue),
                CustomTextField(
                    label: 'Email',
                    savefun: saveemail,
                    validationfun: validateEmail),
                CustomTextField(
                    label: 'Password',
                    savefun: savepassword,
                    validationfun: validatePassword),
                CustomTextField(
                    label: 'Confirm Password',
                    savefun: saveconfirmPassword,
                    validationfun: validateConfirmPassword),
                CustomTextField(
                    label: 'City',
                    savefun: savecity,
                    validationfun: validateNullValue),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black)),
                  child: DropdownButton<String>(
                      hint: Text(city),
                      items: cities
                          .map((e) => DropdownMenuItem(
                                child: Text(e),
                                value: e,
                              ))
                          .toList(),
                      onChanged: (value) {
                        this.city = value.toString();
                        setState(() {});
                      }),
                ),
                CheckboxListTile(
                    title: Text('accepted all condition'),
                    value: isAccept,
                    onChanged: (value) {
                      this.isAccept = value!;
                      setState(() {});
                    }),
                Container(
                  width: double.infinity,
                  height: 55,
                  child: RaisedButton(
                    color: Colors.lightBlue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    child: Text('submit'),
                    onPressed: () {
                      SaveForm();
                    },
                  ),
                )
              ],
            )),
      ),
    );
  }
}
