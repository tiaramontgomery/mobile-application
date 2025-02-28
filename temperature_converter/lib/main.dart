import 'package:flutter/material.dart';

void main() {
  runApp(const TemperatureConverterMain());
}

class TemperatureConverterMain extends StatelessWidget {
  const TemperatureConverterMain({super.key});

  // This widget is the root of your application.
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      home: TemperatureConverter(),
      );
      
  }
}

class TemperatureConverter extends StatefulWidget {
  const TemperatureConverter({super.key});

  @override
  State<TemperatureConverter> createState() => _TemperatureConverterState();
}

class _TemperatureConverterState extends State<TemperatureConverter> {
 //All class variables
 int groupValue = 0;
 double T = 0; //temperature to convert
 double R = 0; //converted value

 //Holds the display text for the last Text wedget
 String converted = "";

 double sliderValue = 0; //needs to be dynamic
 Color sliderColor = Colors.black;

 //custom methods/functions

 performConversion(int value){
  setState((){
  groupValue = value;
    //Formulas
    //C = (F-32) X (5/9)
    //F = (C x 9/5) + 32
    //value holds the value of the checked radio button 1 or 2
    if (value == 1){
      //F to C
      R = (T - 32) * (5/9);
      converted = "$R C";
      sliderValue = R; 
    } else if (value == 2){
      //C to F
      R = (T * 9/5) + (32);
      converted = "$R F";
      sliderValue = R; 
    }

      if (groupValue == 1 ){
        if (sliderValue < 0) {
        sliderColor = Colors.deepPurple;
      } else if (sliderValue < 11) {
        sliderColor = Colors.blue;
      } else if (sliderValue < 22) {  
        sliderColor = Colors.green;
      } else if (sliderValue < 27) {
        sliderColor = Colors.yellow;
      } else {
        sliderColor = Colors.red;
      }
      } else{
        if (sliderValue < 32) {
        sliderColor = Colors.deepPurple;
      } else if (sliderValue < 52) {
        sliderColor = Colors.blue;
      } else if (sliderValue < 72) {
        sliderColor = Colors.green;
      } else if (sliderValue < 82) {
        sliderColor = Colors.yellow;
      } else {
        sliderColor = Colors.red;
      }
      }

    print (R);
  });
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Temperature Converter"),
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: EdgeInsets.all(36.0),
        child: Column(
          children: <Widget>[
            SizedBox( height: 10.0),
            TextField(
              decoration: InputDecoration(labelText: "Enter Temperature"),
              onChanged: (String value) {
                //TODO something with value
                if (value == ""){
                  
                } else{
                  T = double.parse(value);
                }
              },
            ),
            SizedBox( height: 10.0),
            Row(
              children: <Widget>[ 
                Radio(
                value: 1, //F to C option 1
                groupValue: groupValue, 
                onChanged: (e)=> {
                  //TODO conversion logic
                  performConversion(e!)
                }),
                Text('F to C'),
                SizedBox(height: 10.0,),
                Radio(
                value: 2, //F to C option 1
                groupValue: groupValue, 
                onChanged: (e)=> {
                  //TODO conversion logic
                  performConversion(e!)
                }),
                Text('C to F'),
              ]
            ),
            SizedBox( height: 10.0),
            TextButton(
            onPressed: ()=>{
              setState(() {
                //Perform clearing operations
                converted = "";
                groupValue = 0;
                sliderValue = 0;
              })
            }, 
            child: Text('Clear')),
            SizedBox( height: 20.0),
            Text(converted),
            SizedBox( height: 10.0),
            Slider(
            value: sliderValue.clamp(0, 100), 
            min: 0, 
            max: 100,
            activeColor: sliderColor,
             onChanged: (newValue) {
            setState(() {
            sliderValue = newValue;
