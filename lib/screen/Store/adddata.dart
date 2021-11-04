import 'package:firebase_database/firebase_database.dart';
import 'package:firstdart/config/constant.dart';
import 'package:flutter/material.dart';

class AddData extends StatefulWidget {
  const AddData({Key? key}) : super(key: key);

  @override
  _AddDataState createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  String? name, price, status;
  final formKey = GlobalKey<FormState>();

  //NOTE กำหนดค่าเริ่มต้นสำหรับส่งข้อมูลไปที่ firebase
  //REVIEW อ้าง firebase ไปที่ Store ถ้าไม่มีจะสร้างใหม่
  final dbfirebase = FirebaseDatabase.instance.reference().child('Store');

  //NOTE แยก thead ออกมา
  Future<void> createData() async {
    await dbfirebase.push().set({
      'product': name,
      'price': price,
      'status': status,
    }).then((dynamic value) {
      print(value);
    }).catchError((onError) {
      print(onError.code);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                txtName(),
                txtPrice(),
                txtStatus(),
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
      margin: EdgeInsets.fromLTRB(15, 20, 15, 20),
      child: TextFormField(
        style: TextStyle(
          fontSize: 24,
          color: pColor,
        ),
        decoration: InputDecoration(
          labelText: 'Product:',
          icon: Icon(Icons.production_quantity_limits),
          hintText: 'Input your Product Name',
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'กรุณาใส่ข้อมูลด้วย';
          } else if (value.length < 2) {
            return 'กรุณาใส่ข้อมูลมากกว่า 2 ตัวอักษร';
          }
        },
        onSaved: (value) {
          name = value;
        },
      ),
    );
  }

  Widget txtPrice() {
    return Container(
      margin: EdgeInsets.fromLTRB(15, 20, 15, 20),
      child: TextFormField(
        keyboardType: TextInputType.number,
        style: TextStyle(
          fontSize: 24,
          color: pColor,
        ),
        decoration: InputDecoration(
          labelText: 'Price:',
          icon: Icon(Icons.price_change),
          hintText: 'Input your Product Price',
        ),
        validator: (value) {},
        onSaved: (value) {
          price = value;
        },
      ),
    );
  }

  Widget txtStatus() {
    return Container(
      margin: EdgeInsets.fromLTRB(15, 20, 15, 20),
      child: TextFormField(
        //obscureText: true,
        style: TextStyle(
          fontSize: 24,
          color: pColor,
        ),
        decoration: InputDecoration(
          labelText: 'Status:',
          icon: Icon(Icons.description),
          hintText: 'Input your Product Status',
        ),
        onSaved: (value) {
          status = value;
        },
      ),
    );
  }

  Widget btnSubmit() => ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: pColor,
        ),
        onPressed: () {
          if (formKey.currentState!.validate()) {
            formKey.currentState!.save();
            print(name);
            print(price);
            print(status);
            createData();
            formKey.currentState!.reset();
          }
        },
        child: Text('Sava'),
      );
}
