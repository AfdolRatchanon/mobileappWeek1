class country {
  //Property
  String name/*= "Turkey"*/;
  String _capital/*= "Ankara"*/;
  static var Animal = "Gray Wolf";
  static var Color = "Red";
  //Constructor
  country(this.name, this._capital);

  //Counstructor Redirectiing
  country.setName(String name) : this(name, "non name capital");
  country.setCapital(String capital) : this("non name country", capital);
  country.original(String name, String capital) : this("Thailand", "Bangkok");

  //Methods
  //  set Propertry
  setName(String name) => this.name = name;
  setCapital(String capital) => this._capital = capital;
  setAnimal(String animal) => this._capital = animal;

  //  get Propertry
  String getName() => this.name;
  String getCapital() => this._capital;

  //  Other
  String showProvice() => this._capital;
}
