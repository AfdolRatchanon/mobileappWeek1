import 'package:firstdart/config/constant.dart';
import 'package:flutter/material.dart';

class index extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //ดึงขนาดหน้าจอของผู้ใช้มากำหนดขนาดรูป set picture Dynamic
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        alignment: Alignment.center,
        child: Stack(
          children: [
            Positioned(
                top: -85,
                left: -95,
                child: Image(
                  image: NetworkImage(
                      'https://www.freeiconspng.com/uploads/orange-circle-png-3.png'),
                  width: size.width * 0.4,
                )),
            Positioned(
                bottom: -95,
                left: -85,
                child: Image(
                  image: NetworkImage(
                      'https://www.freeiconspng.com/uploads/orange-circle-png-3.png'),
                  width: size.width * 0.4,
                )),
            Column(
              //Property ในการจัดเรียนง
              //mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Image.asset(
                  "asset/image/LOGO-KMUTNB--300x300.png",
                  //นำตัวแปร size มาใช้เพื่อกำหนดขนาดภาพแบบ Dynamic
                  width: size.width * 0.4,
                  /*height: size.height * 0.4*/
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Welcome to KMUTNB",
                  style: TextStyle(
                      color: /*Colors.orange*/ pColor,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                // Image(
                //   image: NetworkImage(
                //       'https://images.unsplash.com/photo-1548504769-900b70ed122e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=800&q=80'),
                //   width: size.width * 0.95,
                //   /*height: size.height * 0.95*/
                // ),
                Image.asset(
                  "asset/image/undraw_mobile_development_8gyo.png",
                  //นำตัวแปร size มาใช้เพื่อกำหนดขนาดภาพแบบ Dynamic
                  width: size.width * 0.99,
                  /*height: size.height * 0.4*/
                ),
                // ปุ่ม
                ElevatedButton(
                    onPressed: () {
                      print("Login");
                      Navigator.pushNamed(context, 'login');
                    },
                    child: Text("Login"),
                    style: ElevatedButton.styleFrom(
                      primary: /*Colors.orange*/ pColor,
                      padding: EdgeInsets.fromLTRB(120, 15, 120, 15),
                      shape: StadiumBorder(),
                    )),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      print("Sing Up");
                      Navigator.pushNamed(context, 'register');
                    },
                    child: Text("Sing Up"),
                    style: ElevatedButton.styleFrom(
                      primary: /*Colors.orange*/ pColor,
                      padding: EdgeInsets.fromLTRB(114, 15, 114, 15),
                      shape: StadiumBorder(),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
