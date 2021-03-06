import 'package:firebase_auth/firebase_auth.dart';
import 'package:firstdart/config/constant.dart';
import 'package:firstdart/model/TCT.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  var data;

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
    print("Function Logout Activated");
  }

  @override
  void initState() {
    // TODO: implement initState เขียนโปรแกรมก่อนมันสร้างหน้า widget
    // NOTE เขียน API ในนี้
    super.initState();
    print("Hello");
    callAPI();
  }

  //REVIEW สร้าง function เรียน API โดยเขียนแบบ Asyconus เพื่อให้รอข้อมูลก่อนทำงาน
  Future<void> callAPI() async {
    var url = Uri.parse("https://www.boredapi.com/api/activity");
    //NOTE ใส่ await เพื่อรอให้รับข้อมูลเสร็จก่อน
    var response = await http.get(url);

    //NOTE stausCode บอกรหัสการทำงานการ GET
    print(response.statusCode);

    //NOTE body ได้ข้อมูลเป็น JSON
    //FIXME flutter ไม่สารถถึง JSON มาใช้ได้ต้องแปลงเป็น Object ก่อน โดยใช้เว็บ //https://app.quicktype.io/
    print(response.body);
    setState(() {
      data = tctFromJson(response.body);
    });

    /*
    print(data.activity);
    print(data.type);
    print(data.price);*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: sColor),
              child: Text(
                'Package',
                style: TextStyle(fontSize: 20, color: pColor),
              ),
            ),
            ListTile(
              title: Text(
                "Video",
                style: TextStyle(fontSize: 18, color: tColor),
              ),
              leading: Icon(
                Icons.video_call,
                color: tColor,
              ),
              onTap: () {
                print("Menu Video");
                Navigator.pushNamed(context, 'Video');
              },
            ),
            ListTile(
              title: Text(
                "Image",
                style: TextStyle(fontSize: 18, color: tColor),
              ),
              leading: Icon(
                Icons.image,
                color: tColor,
              ),
              onTap: () {
                print("Menu Image");
                Navigator.pushNamed(context, 'Image');
              },
            ),
            ListTile(
              title: Text(
                "Location",
                style: TextStyle(fontSize: 18, color: tColor),
              ),
              leading: Icon(
                Icons.location_on_outlined,
                color: tColor,
              ),
              onTap: () {
                print("Menu Location");
                Navigator.pushNamed(context, 'Location');
              },
            ),
            ListTile(
              title: Text(
                "Store",
                style: TextStyle(fontSize: 18, color: tColor),
              ),
              leading: Icon(
                Icons.store,
                color: Colors.green,
              ),
              onTap: () {
                print("Menu Store");
                Navigator.pushNamed(context, 'Store');
              },
            ),
            ListTile(
              title: Text(
                "Logout",
                style: TextStyle(fontSize: 18, color: Colors.red),
              ),
              leading: Icon(
                Icons.logout_outlined,
                color: Colors.red,
              ),
              onTap: () {
                logout();
                Navigator.of(context).pop();
                Navigator.pushNamed(context, 'index', arguments: []);
                print("Logout Success");
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.api),
            SizedBox(
              width: 20,
            ),
            Text("Dashboard")
          ],
        ),
      ),
      body: SingleChildScrollView(
        //FIXME มี err เพราะว่าการทำงานของ init ทำงานแบบ asyconus ซึ่งข้อมูลยังไม่มาทำให้อ่านข้อมูลไม่ได้
        //REVIEW ใส่ ? หลังตัวแปรเพื่ออนุญาตให้ ตัวแปรเป็นค่า Null
        child: Center(
          child: Column(children: [
            SizedBox(
              height: 10,
            ),
            Text(
              "Activity : " + (data?.activity ?? "loading.."),
              style: TextStyle(fontSize: 30, color: pColor),
            ),

            SizedBox(
              height: 30,
            ),

            Text("Type : " + (data?.type ?? ''),
                style: TextStyle(fontSize: 30, color: tColor)),

            SizedBox(
              height: 30,
            ),

            //FIXME ใส่ '${ตัวแปร}' เพื่อแปลงเป็น string
            Text("Price : " + '${data?.price ?? ""}',
                style: TextStyle(fontSize: 30, color: pColor)),

            SizedBox(
              height: 30,
            ),

            Text("Participants : " + '${data?.participants ?? ""}',
                style: TextStyle(fontSize: 30, color: tColor)),
          ]),
        ),
      ),
    );
  }
}
