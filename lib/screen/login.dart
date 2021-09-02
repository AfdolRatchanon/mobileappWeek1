import 'package:flutter/material.dart';

// ignore: camel_case_types
class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'login',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        //เรียก Login ได้ Container กลับไป
        child: Text("Login"),
      ),
    );
  }
}
