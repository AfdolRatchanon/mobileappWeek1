import 'country.dart';
import 'city.dart';

main() {
  //create Object
  country ct = country("Turkey", "Ankara");
  //country ct = country.setCapital("Ankara");
  //ct.setAnimal("Elephant"); // แก้ไขข้อมูลแบบ Static ไม่ได้
  //Output
  print("Object Country \n");
  print("Welcome to " + ct.showProvice() + " " + ct.getNCountry() + ".");
  print("Animal : " + country.Animal + ".");
  print("Color : " + country.Color + ".");

  city c = city("Turkey", "Ankara", "Istanbul");
  print("\nObject city \n");
  print("Welcome to " + c.getNCity() + " " + c.getNCountry());
  print("Problem : " + c.callProblem());
}
