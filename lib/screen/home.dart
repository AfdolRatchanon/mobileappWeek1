import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text"),
      ),
      body: Container(
        color: Colors.orange[200],
        alignment: Alignment.center,
        child: Stack(
          children: [
            Positioned(
              child: Text(
                "Test",
                style: TextStyle(fontSize: 30),
              ),
              top: 20,
              left: 20,
            )
          ],
        ),
      ),
    );
  }
}
