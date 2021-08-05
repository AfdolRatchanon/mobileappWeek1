void main() {
  print("you generation : " + calGenAD(2000));
  print("\nList have : " + callcolor("Black").toString() + " Item");
  callweb('Google', protocal: "https", port: 443);
}

// ArrowFunc and if type short-hand
String calGenAD(int year) => (year < 1926)
    ? "non"
    : (year < 1946)
        ? "Silent"
        : (year < 1965)
            ? "BabyBoomer"
            : (year < 1980)
                ? "X"
                : (year < 1997)
                    ? "Y"
                    : "Z";

//FunctionReturnType, methode of List and Position Parameter
int callcolor([String newColor = "White"]) {
  List<dynamic> color = ['Red', 'Green', 'Blue'];
  color.add(newColor);
  for (var item in color) {
    print(item);
  }

  return color.length;
}

// ArrowFunc and Nameed Parameter
void callweb(String web, {int port = 80, String protocal = "http"}) =>
    print("$protocal $web : $port");
