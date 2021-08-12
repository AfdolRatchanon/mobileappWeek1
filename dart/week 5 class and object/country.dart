class country {
  //Property
  String nCountry/*= "Turkey"*/;
  String _capital/*= "Ankara"*/;
  static var Animal = "Gray Wolf";
  static var Color = "Red";
  //Constructor
  country(this.nCountry, this._capital);

  //Counstructor Redirectiing
  country.setName(String nCountry) : this(nCountry, "non name capital");
  country.setCapital(String capital) : this("non name country", capital);
  country.original(String nCountry, String capital)
      : this("Thailand", "Bangkok");

  //Methods
  //  set Propertry
  setNCountry(String nCountry) => this.nCountry = nCountry;
  setCapital(String capital) => this._capital = capital;
  //setAnimal(String animal) => this.Animal = animal; ไม่ได้ Error

  //  get Propertry
  String getNCountry() => this.nCountry;
  String getCapital() => this._capital;

  //  Other
  String showProvice() => this._capital;
}
