import 'country.dart';
import 'problem.dart';

class city extends country with problem {
  //Property
  String name = "Istanbul";

  //Constructor
  city() : super("non country", "non capital");

  @override
  String showProvice() => this.name;
}
