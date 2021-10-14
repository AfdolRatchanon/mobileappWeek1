import 'package:firstdart/config/constant.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class packeageLocation extends StatefulWidget {
  const packeageLocation({Key? key}) : super(key: key);

  @override
  _packeageLocationState createState() => _packeageLocationState();
}

class _packeageLocationState extends State<packeageLocation> {
  dynamic latitude = "";
  dynamic longitude = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
  }

  Future<void> getLocation() async {
    //NOTE คำสั่งดึง Location
    var location = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print(location);
    print(location.latitude);
    print(location.longitude);

    setState(() {
      //NOTE ใส่ '${...}' เพื่อแปลงเป็น String
      latitude = '${location.latitude}';
      longitude = '${location.longitude}';
    });

    //การแปลง ละติจูด และลองจิจูด เป็นสถานที่จริง
    var addressTrue =
        await placemarkFromCoordinates(location.latitude, location.longitude);
    print(addressTrue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
        children: [
          Icon(
            Icons.location_on_outlined,
            color: sColor,
          ),
          Text(
            "  Location",
            style: TextStyle(color: sColor),
          ),
        ],
      )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "ละติจูด " + latitude,
              style: TextStyle(fontSize: 30),
            ),
            Text(
              "ลองจิจูด " + longitude,
              style: TextStyle(fontSize: 30),
            )
          ],
        ),
      ),
    );
  }
}
