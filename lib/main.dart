import 'package:firstdart/config/constant.dart';
import 'package:firstdart/screen/home.dart';
import 'package:firstdart/screen/index.dart';
import 'package:firstdart/screen/login.dart';
import 'package:firstdart/screen/register.dart';
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(KMUTNB());

class KMUTNB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //หน้าแรกของ APP
      home: index(),
      // เหมือน Link ของเว็บ แต่ดีกว่า
      routes: {
        'index': (context) => index(),
        'login': (context) => login(),
        'register': (context) => register(),
      },
      theme: ThemeData(primaryColor: pColor, secondaryHeaderColor: sColor),
    );
  }
}
