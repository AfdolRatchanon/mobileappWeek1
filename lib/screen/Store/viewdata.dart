import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class ViewData extends StatefulWidget {
  const ViewData({Key? key}) : super(key: key);

  @override
  _ViewDataState createState() => _ViewDataState();
}

class _ViewDataState extends State<ViewData> {
  //NOTE ประกาศตัวแปรอ้างอิงไปยัง child ของ firebaseที่เราต้องการ
  final dbfirebase = FirebaseDatabase.instance.reference().child("Store");

  //NOTE Fucntion for edit data in firebase
  Future<void> updateData(String key) async {
    try {
      await dbfirebase.child(key).update({
        'status': "ขายแล้ว",
      }).then((value) {
        print("Success");
      }).catchError((onError) {
        print(onError.code);
        print(onError.massage);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: FirebaseAnimatedList(
        query: dbfirebase,
        itemBuilder: (context, snapshot, animation, index) {
          return Container(
              height: 100,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Card(
                  elevation: 3,
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Icon(Icons.production_quantity_limits),
                    ),
                    title: Text('${snapshot.value['product']}'),
                    subtitle: Row(
                      children: [
                        Text("ราคา : " + '${snapshot.value['price']}'),
                        Text(" สถานะ : " + '${snapshot.value['status']}'),
                      ],
                    ),
                    trailing: Column(
                      children: [
                        Expanded(
                          child: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              print('ลบข้อมุล');
                              dbfirebase.child(snapshot.key!).remove();
                            },
                          ),
                        ),
                        Expanded(
                          child: IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              print("แก้ไข");
                              print(snapshot.key!);
                              updateData(snapshot.key!);
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ));
          //Text('${snapshot.value['product']}');
        },
      ),
    );
  }
}
