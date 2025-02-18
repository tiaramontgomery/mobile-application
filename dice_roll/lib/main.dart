import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const DiceRollMain());
}

//MaterialApp widget (stl shortcut)
class DiceRollMain extends StatelessWidget {
  const DiceRollMain({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DiceRoll(),
    );
  }
}
// End MaterialApp

// stf shortcut
class DiceRoll extends StatefulWidget {
  const DiceRoll({super.key});

  @override
  State<DiceRoll> createState() => _DiceRollState();
}

class _DiceRollState extends State<DiceRoll> {
  int diceNumber = 1;
  int diceNumber2 = 1;
  int total=0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dice Roll",
        style: TextStyle(
          color: Colors.white,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),),
        backgroundColor: Colors.amber ,
      ),
      body: 
      Center(
        child: TextButton(
        onPressed: () => setState((){
          //Random.NextInt(n) returns a random value between 0 and n-1
          diceNumber = Random().nextInt(6) + 1;
          diceNumber2 = Random().nextInt(6) + 1;
          total = diceNumber + diceNumber2;
        }), 
        child: Column(
          children: [
            Image.asset("images/dice-$diceNumber.png", width: 200,
            height: 200,),
            Image.asset("images/dice-$diceNumber2.png", width: 200, height: 200),
            Text("You rolled a total of $total")
          ],
        //Text('You rolled a: $diceNumber'))
        )
      ),
      )
    );
  }
}