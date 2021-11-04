import 'package:firebase_auth/firebase_auth.dart';
import 'package:firstdart/config/constant.dart';
import 'package:firstdart/screen/firebaseLoing.dart';
import 'package:firstdart/screen/login.dart';
import 'package:flutter/material.dart';

class FirebaseRegister extends StatefulWidget {
  const FirebaseRegister({Key? key}) : super(key: key);

  @override
  _FirebaseRegisterState createState() => _FirebaseRegisterState();
}

class _FirebaseRegisterState extends State<FirebaseRegister> {
  var name, surname, email, password, conpwd, confirmpassword;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Firebase Register'),
        ),
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                // txtName(),
                // txtsurName(),
                txtEmail(),
                txtPassword(),
                txtconfirmPassword(),
                btnSubmit(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget txtName() {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 20, 10, 10),
      child: TextFormField(
        style: TextStyle(
          fontSize: 24.0,
          color: pColor,
        ),
        decoration: InputDecoration(
          labelText: 'Name:',
          icon: Icon(Icons.account_circle_outlined),
          hintText: 'Input your name',
        ),
        validator: (String? value) {
          if (value!.isEmpty) {
            return 'กรุณากรอกชื่อ';
          } else if (value.length < 2) {
            return "กรุณากรอกข้อมูลมากกว่า 2 ตัวอักษร";
          }
        },
        onSaved: (String? value) {
          name = value!.trim();
        },
      ),
    );
  }

  Widget txtsurName() {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 20, 10, 10),
      child: TextFormField(
        style: TextStyle(
          fontSize: 24.0,
          color: pColor,
        ),
        decoration: InputDecoration(
          labelText: 'Surname:',
          icon: Icon(Icons.account_circle),
          hintText: 'Input your surname',
        ),
        validator: (String? value) {
          if (value!.isEmpty) {
            return 'กรุณากรอกนามสกุล';
          } else if (value.length < 2) {
            return "กรุณากรอกข้อมูลมากกว่า 2 ตัวอักษร";
          }
        },
        onSaved: (String? value) {
          surname = value!.trim();
        },
      ),
    );
  }

  Widget txtEmail() {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 20, 10, 10),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        style: TextStyle(
          fontSize: 24.0,
          color: pColor,
        ),
        decoration: InputDecoration(
          labelText: 'Email:',
          icon: Icon(Icons.email),
          hintText: 'Input your email',
        ),
        validator: (String? value) {
          if (value!.isEmpty) {
            return 'กรุณากรอกอีเมล';
          } else if (!(value.contains('@'))) {
            return "กรุณากรอกอีเมลให้ถูกต้อง";
          } else if (!(value.contains('.'))) {
            return "กรุณากรอกอีเมลให้ถูกต้อง";
          }
        },
        onSaved: (String? value) {
          email = value!.trim();
        },
      ),
    );
  }

  Widget txtPassword() {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 20, 10, 10),
      child: TextFormField(
        obscureText: true,
        style: TextStyle(
          fontSize: 24.0,
          color: pColor,
        ),
        decoration: InputDecoration(
          labelText: 'Password:',
          icon: Icon(Icons.password),
          hintText: 'Input your password',
        ),
        validator: (String? value) {
          if (value!.isEmpty) {
            conpwd = value;
            return 'กรุณากรอกรหัสผ่าน';
          } else if (value.length < 6) {
            conpwd = value;
            return 'กรุณากรอกรหัสผ่านมากกว่า 6 ตัวอักษร';
          } else {
            conpwd = value;
          }
        },
        onSaved: (String? value) {
          password = value!.trim();
          conpwd = value;
        },
      ),
    );
  }

  Widget txtconfirmPassword() {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 20, 10, 10),
      child: TextFormField(
        obscureText: true,
        style: TextStyle(
          fontSize: 24.0,
          color: pColor,
        ),
        decoration: InputDecoration(
          labelText: 'ConfirmPassword:',
          icon: Icon(Icons.password),
          hintText: 'Input your confirmPassword',
        ),
        validator: (String? value) {
          if (value!.isEmpty) {
            return 'กรุณายืนยันรหัสผ่าน';
          } else if (value != conpwd) {
            return 'กรุณายืนยันรหัสผ่านให้ถูกต้อง';
          }
        },
        // onSaved: (String? value){
        //   confirmpassword = value!.trim();
        // },
      ),
    );
  }

  Widget btnSubmit() => Container(
        margin: EdgeInsets.fromLTRB(10, 20, 10, 10),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: pColor,
          ),
          onPressed: () {
            if (formKey.currentState!.validate()) {
              formKey.currentState!.save();
              registerFirebase();
            }
          },
          child: Text('Submit'),
        ),
      );

  Future<void> registerFirebase() async {
    // Send Email and Password go to Firebase
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          //NOTE เขียน Navigator โดยไม่ได้อยู่ใน Scaffold
          .then((value) {
        MaterialPageRoute materialPageRoute = MaterialPageRoute(
            builder: (BuildContext context) => FirebaseLogin());
        Navigator.of(context).pushAndRemoveUntil(
            materialPageRoute, (Route<dynamic> route) => false);
      }).catchError((onError) {
        var msg = '${onError}';
        showAlert(msg);
      });
    } catch (e) {}
  }

  void showAlert(String message) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: ListTile(
              leading: Icon(
                Icons.alarm_on,
                color: Colors.red,
                size: 32,
              ),
              title: Text(
                "พบข้อผิดพลาด",
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
            content: (Text(message)),
            //NOTE ButtonExit Popup (dialog)
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("ปิด"))
            ],
          );
        });
  }
}
