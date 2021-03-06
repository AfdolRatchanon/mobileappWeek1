import 'package:firebase_core/firebase_core.dart';
import 'package:firstdart/config/constant.dart';
import 'package:firstdart/screen/dashboard.dart';
import 'package:firstdart/screen/firebaseLoing.dart';
import 'package:firstdart/screen/firebaseRegister.dart';
import 'package:firstdart/screen/index.dart';
import 'package:firstdart/screen/login.dart';
import 'package:firstdart/screen/packeageImage.dart';
import 'package:firstdart/screen/packeageLocation.dart';
import 'package:firstdart/screen/packeageVideo.dart';
import 'package:firstdart/screen/store.dart';
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//void main() => runApp(KMUTNB());
Future<void> main() async {
  //NOTE open Connection to Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(KMUTNB());
}

class KMUTNB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //หน้าแรกของ APP
      home: index(),
      //REVIEW เรียก class index() ไม่ได้เรียกเชื่อไฟล์ index.dart
      //REVIEW เหมือน Link ของเว็บ แต่ดีกว่า
      routes: {
        'index': (context) => index(),
        'login': (context) => FirebaseLogin(),
        'register': (context) => FirebaseRegister(),
        'Dashboard': (context) => Dashboard(),
        'Image': (context) => packageImage(),
        'Video': (context) => packeageVideo(),
        'Location': (context) => packeageLocation(),
        'Store': (context) => Store(),
      },
      theme: ThemeData(primaryColor: pColor, secondaryHeaderColor: sColor),
    );
  }
}
