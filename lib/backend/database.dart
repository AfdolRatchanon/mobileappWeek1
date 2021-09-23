import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

//NOTE อะไรก็ตามที่ใช้เวลาในการทำต้องมี await
class DBLocal {
  var dbname = "TCT"; //REVIEW name of DataBase

  Future<Database> connectDB() async {
    //NOTE fuction connect DataBase
    //REVIEW หาตำแหน่ง Path ในตัว Mobile Device
    //FIXME//เขียนเองก็ได้ แต่ติดตั้ง packeage เสริมดีกว่า
    var directory = await getApplicationDocumentsDirectory();
    //print("Directory :  $directory");
    //REVIEW'location = '/data/user/0/com.example.firstdart/app_flutter'+'/TCT'
    //join is concatenate
    var location = join(directory.path, this.dbname);
    //print("Location :  $location");

    //NOTE Create DB File
    //REVIEW databaseFactoryIo คือ class ที่สร้างหรือเปิดไฟล์ DB ได้
    var createDB = databaseFactoryIo;
    var db = await createDB.openDatabase(location);
    //print("DB : $db");

    return db;
  }

  Future<void> register(name, surname, email, password) async {
    print("$name $surname $email $password");
    var db = await this.connectDB();
    //กำหนด store
    var store = intMapStoreFactory.store('user');
    print("Store :  $store");

    var user = await store.add(db, {
      'name': name,
      'surname': surname,
      'email': email,
      'password': password
    });
    print("User : $user");

    //var data = await store.find(db);
    //REVIEW callback function
    await store
        .find(db)
        .then((value) => {print(value)})
        .catchError((onError) => {print(onError)});
    //print(data);

    db.close();
  }

  Future<bool> login(email, password) async {
    var db = await this.connectDB();
    var store = intMapStoreFactory.store('user');
    var status = false;
    //REVIEW ดึงข้อมูลมาแสดง Methode ของ store มีหลายอย่างลองเล่นได้
    var user = await store.find(db);

    for (var item in user) {
      //print(item['email']);
      if (item['email'] == email && item['password'] == password) {
        //print("Login Success");
        status = true;
      } else {
        //print("Login False");
        status = false;
      }
    }
    return status;
  }
}
