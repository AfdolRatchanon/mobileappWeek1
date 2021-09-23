import 'package:firstdart/backend/database.dart';
import 'package:firstdart/config/constant.dart';
import 'package:flutter/material.dart';

class register extends StatefulWidget {
  @override
  _registerState createState() => _registerState();
}

class _registerState extends State<register> {
  //REVIEW GlobalKey<FormState> เพื่อเก็บสถานะและจัดการ Form ได้
  final formKey = GlobalKey<FormState>();
  var name, surname, email, password, confirm, buffPass;

  @override
  Widget build(BuildContext context) {
    //REVIEW ทำให้ส่วนบนพวกนาฬิกา แบตรี่หายไป โดยใช้ SafeArea
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Regiter',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Form(
          //REVIEW formKey มาจาก GlobalKey<FormState>() เพื่อสามารถแก้สถานะและบันทึกได้
          key: formKey,
          //REVIEW ในแทนส่วน Container เป็นตัวที่สามารถเลือนสก่อได้ โดยใช้ SingleChildScrollView มี Scroll ให้เลือนได้
          child: SingleChildScrollView(
            child: Column(
              children: [
                //NOTE step 1 static element component
                Container(
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: TextFormField(
                    //REVIEW จัดการ style ของ TextFormField
                    style: TextStyle(fontSize: 24, color: pColor),
                    //REVIEW Set Propety ของ TextFormField
                    decoration: InputDecoration(
                        //REVIEW เปลี่ยนชื่อ TextFormField
                        labelText: 'Name',
                        //REVIEW เปลี่ยน icon TextFormField
                        icon: Icon(Icons.account_circle_outlined),
                        //REVIEW เพิ่ม placeholder TextFormField
                        hintText: 'Input your name'),
                    //REVIEW validator ใช้เช็คข้อมูล
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'กรุณากรอกชื่อ';
                      } else if (value.length < 2) {
                        return 'กรุณากรอกตัวอักษรมากกว่า 1 ตัว';
                      }
                    },
                    onSaved: (value) {
                      //NOTE .trim จะลบช่องว่างให้ในการเก็บข้อมูล
                      name = value!.trim();
                    },
                  ),
                ),
                textSername(),
                textEmail(),
                textPass(),
                textConfirm(),
                btnSubmit(),
                //creatTextField(),
              ],
            ),
          ),
        ),
      ),
    );
  }

//NOTE step 2 fuction emlement component and step 3
  Widget creatTextField(/*[String name = null, String hidt = ""]*/) {
    //var name, hidt, size, color;
    return Container(
      margin: EdgeInsets.fromLTRB(10, 10, 10, 10) /*all(30)*/,
      child: TextFormField(
        //REVIEW จัดการ style ของ TextFormField
        style: TextStyle(fontSize: 24, color: pColor),
        //REVIEW Set Propety ของ TextFormField
        decoration: InputDecoration(
            //REVIEW เปลี่ยนชื่อ TextFormField
            labelText: 'Sername',
            //REVIEW เปลี่ยน icon TextFormField
            icon: Icon(Icons.account_circle_outlined),
            //REVIEW เพิ่ม placeholder TextFormField
            hintText: 'Input your Sername'),
      ),
    );
  }

  Widget textSername() {
    //var name, hidt, size, color;
    return Container(
      margin: EdgeInsets.fromLTRB(10, 10, 10, 10) /*all(30)*/,
      child: TextFormField(
          //REVIEW จัดการ style ของ TextFormField
          style: TextStyle(fontSize: 24, color: pColor),
          //REVIEW Set Propety ของ TextFormField
          decoration: InputDecoration(
              //REVIEW เปลี่ยนชื่อ TextFormField
              labelText: 'Sername',
              //REVIEW เปลี่ยน icon TextFormField
              icon: Icon(Icons.house_outlined),
              //REVIEW เพิ่ม placeholder TextFormField
              hintText: 'Input your Sername'),
          validator: (value) {
            if (value!.isEmpty) {
              return 'กรุณากรอกนามสกุล';
            } else if (value.length < 2) {
              return 'กรุณากรอกนามสกุลมากกว่า 1 ตัวอักษร';
            }
          },
          onSaved: (value) {
            //NOTE .trim จะลบช่องว่างให้ในการเก็บข้อมูล
            surname = value!.trim();
          }),
    );
  }

  Widget textEmail() {
    //var name, hidt, size, color;
    return Container(
      margin: EdgeInsets.fromLTRB(10, 10, 10, 10) /*all(30)*/,
      child: TextFormField(
        //REVIEW ช่วยให้กรอก email ได้ง่ายขึ้น
        keyboardType: TextInputType.emailAddress,
        //REVIEW จัดการ style ของ TextFormField
        style: TextStyle(fontSize: 24, color: pColor),
        //REVIEW Set Propety ของ TextFormField
        decoration: InputDecoration(
            //REVIEW เปลี่ยนชื่อ TextFormField
            labelText: 'Email',
            //REVIEW เปลี่ยน icon TextFormField
            icon: Icon(Icons.alternate_email),
            //REVIEW เพิ่ม placeholder TextFormField
            hintText: 'Input your Email'),
        validator: (value) {
          if (!(value!.contains('@'))) {
            return 'กรุณากรอกในรูปแบบอีเมล';
          }
          if (!(value.contains('.'))) {
            return 'กรุณากรอกในรูแบบอีเมล';
          }
        },
        onSaved: (value) {
          //NOTE .trim จะลบช่องว่างให้ในการเก็บข้อมูล
          email = value!.trim();
        },
      ),
    );
  }

  Widget textPass() {
    //var name, hidt, size, color;
    return Container(
      margin: EdgeInsets.fromLTRB(10, 10, 10, 10) /*all(30)*/,
      child: TextFormField(
        //REVIEW ทำให้ไม่เห็น Password
        obscureText: true,
        //REVIEW จัดการ style ของ TextFormField
        style: TextStyle(fontSize: 24, color: pColor),
        //REVIEW Set Propety ของ TextFormField
        decoration: InputDecoration(
            //REVIEW เปลี่ยนชื่อ TextFormField
            labelText: 'Password',
            //REVIEW เปลี่ยน icon TextFormField
            icon: Icon(Icons.lock),
            //REVIEW เพิ่ม placeholder TextFormField
            hintText: 'Input your Password'),
        validator: (value) {
          if (value!.isEmpty) {
            buffPass = value;
            return 'กรุณากรอกรหัสผ่าน';
          } else if (value.length < 7) {
            buffPass = value;
            return 'กรุณากรอกรหัสผ่านมากกว่า 6 ตัวอักษร';
          } else {
            buffPass = value;
          }
        },
        onSaved: (value) {
          buffPass = value;
          password = value;
        },
      ),
    );
  }

  Widget textConfirm() {
    //var name, hidt, size, color;
    return Container(
      margin: EdgeInsets.fromLTRB(10, 10, 10, 10) /*all(30)*/,
      child: TextFormField(
        //REVIEW ทำให้ไม่เห็น Password
        obscureText: true,
        //REVIEW จัดการ style ของ TextFormField
        style: TextStyle(fontSize: 24, color: pColor),
        //REVIEW Set Propety ของ TextFormField
        decoration: InputDecoration(
            //REVIEW เปลี่ยนชื่อ TextFormField
            labelText: 'Confirm',
            //REVIEW เปลี่ยน icon TextFormField
            icon: Icon(Icons.lock),
            //REVIEW เพิ่ม placeholder TextFormField
            hintText: 'Input your Confirm Password'),
        validator: (value) {
          if (value != buffPass) {
            return 'กรุณากรอกรหัสผ่านให้ถูกต้อง';
          }
        },
      ),
    );
  }

  Widget btnSubmit() => ElevatedButton(
      style: ElevatedButton.styleFrom(primary: pColor),
      onPressed: () {
        var local = DBLocal();

        print('button click');
        if (formKey.currentState!.validate()) {
          //NOTE สั่งให้ form save
          //FIXME อย่าลืม
          formKey.currentState!.save();
          local.register(name, surname, email, password);
          /*print('_____________');
          print(' save success');
          print('_____________');
          print("Name : $name");
          print("Surname : $surname");
          print("Email : $email");
          print("Password : $password");*/
          formKey.currentState!.reset();
          Navigator.pushNamed(context, 'login');
        }
        //print("Buffer Password : $buffPass");
      },
      child: Text('Submit'));
}
