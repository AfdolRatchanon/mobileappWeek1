import 'country.dart';
import 'city.dart';

main() {
/*
  //create Object
  country ct = country("Turkey", "Istanbul");
  //country ct = country.setCapital("Ankara");
  ct.setAnimal("Elephant"); // แก้ไขข้อมูลแบบ Static ไม่ได้
  //Output
  print("Welcome to " + ct.showProvice() + " " + ct.name + ".");
  print("Animal : " + country.Animal + ".");
  print("Color : " + country.Color + ".");
*/
  city c = city(/*"Turkey", "Istanbul"*/);
  print(c.name + " " + c.showProvice());
  print("Problem : " + c.callProblem());
}

/*

class City {
  //Property
  var Name;

  //Constructor
  City(this.Name);

  //Methods
  showStrength() => print("showStrength");
}


class dreamCountry extends Country with City {
  var firstName;
}
*/