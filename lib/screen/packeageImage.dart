import 'dart:io';

import 'package:firstdart/config/constant.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class packageImage extends StatefulWidget {
  const packageImage({Key? key}) : super(key: key);

  @override
  _packageImageState createState() => _packageImageState();
}

class _packageImageState extends State<packageImage> {
  var file;
  Future<void> showDialogSelectPhoto(BuildContext context) async {
    return await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text("text"),
            actions: [],
          );
        });
  }

  Future<void> openCamera() async {
    var picker = ImagePicker();
    //NOTE สร้าง OBJ ไว้เก็บภาพและเรียกใช้ผ่าน gallery หรืv camera
    var Photo = await picker.pickImage(source: ImageSource.camera);

    //NOTE setState เพื่อ Refresh หน้าจอใหม่
    setState(() {
      file = File(Photo!.path);
    });

    //REVIEW แก้ null ด้วยการใส่ !
    file = File(Photo!.path);
    print(file);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
        children: [
          Icon(
            Icons.image,
            color: sColor,
          ),
          Text(
            "  Image",
            style: TextStyle(color: sColor),
          ),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("Open Camera");
          openCamera();
        },
        child: Icon(Icons.camera),
        backgroundColor: pColor,
      ),
      body: Center(
        child: file == null ? Text('Not Found') : Image.file(file),
      ),
    );
  }
}
