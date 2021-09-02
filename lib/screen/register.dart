import 'package:flutter/material.dart';

class register extends StatefulWidget {
  @override
  _registerState createState() => _registerState();
}

class _registerState extends State<register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Regiter',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        child: Text(
          "Register",
        ),
      ),
    );
  }
}
