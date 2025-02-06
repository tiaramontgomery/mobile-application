// Comments
// Variable and Data types
// Control flow and looping
// Functions and methods
// Void creates a function that does not return a value
// main() is just the name of the function (reserved for dart)
// { code to be executed when the function runs }

void main() {
  //call the function
  greeting();
  print (addTwo(20));
  int result = addTwo(30);
  print(result);

  var inferredString = "Tiara";
  String explicitString = "Montgomery";

  print(inferredString +" " + explicitString);

  //null safety

  int? someNumber;
  print(someNumber);
  someNumber= 12;
  print(someNumber);

  //late keyword - late variables that get intitalized later in the code
  late int willBeNumber;
  //
  int? goals;
  //Control the flow of the program to avoid error
  if (goals != null){
    print(goals +2);
  } else {
    print ("the variable goals is null");
  }

  //Built-in data types
//Numeric
int age = 3;
num count = 21;
double temp = 30.2;
//Booleans (true or false)
bool isReady = true;
//Collections: lists, arrays, and maps
//Strings for expressing text
String school = "University of Miami";

//String concatenation
print("My school is" +" "+ school);

//Using placeholders to insert variables inside strings

print("My school is $school");

//Built-in types operations
print("my school name has ${school.length} characters");

if(school.length > 20){
  print("This name is really long");
} else {
  print ("Your school has a short name");
}

//Control operators
//== equals
//!= not equal
//% modulus
//arithmetic operators (+,-,*,/.%)

//Math shortcuts
int x = 10;
x = x + 5; //15
//same as
x += 5; //20 -=,*=,/=

bool isHere = false; //!isHere flips it to true
// || or operator at least one condtion must be true
if (isHere || (school.length <10)){
    // do something
}
// && and operator all conditions must be true
if (!isHere && (school.length <10)){
    // do something
}

//while loop
int counter = 0;
while (counter < 2) {
  print(counter);
  counter ++;
}

//do while
do{
  print(counter);
  counter;

} while(counter<20);


}
// Variable declaration
// type indentifier/name = value;
// Dynamic types
// var identifier/name = value

// Custom functions

void greeting(){
  print("hello");
}

// Operations with options or parameters

int addTwo(int number){
  return number+2;
}


