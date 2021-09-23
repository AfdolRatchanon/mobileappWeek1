//import 'dart:html';

import 'package:firstdart/backend/database.dart';
import 'package:firstdart/config/constant.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  var email, password;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Form(
        key: formKey,
        child: Container(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: size.height * 0.03,
                ),
                Text(
                  'KMUTNB Login',
                  style: TextStyle(fontSize: 25, color: pColor),
                ),
                SizedBox(
                  height: size.height * 0.04,
                ),
                Container(
                  width: size.width * 0.9,
                  child: TextFormField(
                      style: TextStyle(color: Colors.black, fontSize: 20),
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.alternate_email,
                          color: pColor,
                          size: size.height * 0.05,
                        ),
                        hintText: "Email",
                      ),
                      onSaved: (value) {
                        email = value!.trim();
                      }),
                ),
                SizedBox(
                  height: size.height * 0.04,
                ),
                Container(
                  width: size.width * 0.9,
                  child: TextFormField(
                      style: TextStyle(color: Colors.black, fontSize: 20),
                      obscureText: true,
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.lock,
                          color: pColor,
                          size: size.height * 0.05,
                        ),
                        hintText: "Password",
                      ),
                      onSaved: (value) {
                        password = value!.trim();
                      }),
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                Container(
                  width: size.width * 0.8,
                  height: size.height * 0.08,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        side: BorderSide(color: pColor)),
                    onPressed: () {
                      formKey.currentState!.save();
                      var local = DBLocal();
                      local.login(email, password).then((response) {
                        if (response) {
                          print("Success");
                          Navigator.pushNamed(context, 'Dashboard');
                        } else {
                          print("Fail");
                          final bar = SnackBar(
                            content: Text('ไม่พบข้อมูล'),
                            backgroundColor: Colors.red[900],
                          );
                          ScaffoldMessenger.of(context).showSnackBar(bar);
                        }
                      });
                    },
                    color: pColor,
                    textColor: Colors.white,
                    child: Text("login".toUpperCase(),
                        style: TextStyle(fontSize: 16)),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                Text(
                  'All rights reserved',
                  style: TextStyle(
                    fontSize: 16,
                    color: sColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
