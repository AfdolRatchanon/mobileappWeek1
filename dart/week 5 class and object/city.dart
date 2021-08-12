import 'country.dart';
import 'problem.dart';

class city extends country with problem {
  //Property
  String nCity; /* = "Istanbul"*/

  //Constructor
  /*city(String country, String capital, String name){
    this.name = name;
  */
  city(String country, String _capital, this.nCity) : super(country, _capital);

  // Methods
  //  Setting
  setNCity(String nCity) => this.nCity = nCity;
  //  Getting
  String getNCity() => this.nCity;
  @override
  String showProvice() => this.nCity;
}
