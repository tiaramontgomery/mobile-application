import 'package:flutter/material.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Quiz()
    );
  }
}

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
 
  // class variables
  int groupValue = 2;
  //currentQuestion is used to iterate the array/list
  int currentQuestion = 0;
  //question[currentQuestion] same as question[0]
  //keep track of the score
  int score = 0;

  Color backgroundColor = Colors.white;

  var questions = ['You can’t hum while holding your nose.', 'The Atlantic Ocean is the largest ocean on Earth.', 'Your brain generates enough electricity to power a light bulb.'];
  var answers = [1,0,1];
  //display correct/incorrect
  String result = "";

  //class methods

  checkAnswer(int answer){

    print('User answered $answer');

    if (answers[currentQuestion] == answer){
      print('Correct');
      score++;
      result = 'Correct!';
      backgroundColor = Colors.green;
    }else{
      print('Incorrect');
      result = 'Incorrect!';
      backgroundColor = Colors.red;
    }

    //if answer is true or false, set the score and show the results of correct/incorrect
    //set the groupValue to activate the radio
  
    setState(() {
      groupValue = answer;
    });
    

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
      backgroundColor: Colors.cyan,
      title: Text("Quiz App"),), 
      body: Padding(
        padding: EdgeInsets.all(36.6),
      child: Column(
        children: <Widget>[
          Text(questions[currentQuestion]),
          Row(
            children: <Widget>[
            Radio(value:1, groupValue: groupValue, onChanged: (e)=>{checkAnswer(e!)}),
            Text("True",
            ),
            Radio(value:0, groupValue: groupValue, onChanged: (e)=>{checkAnswer(e!)}),
            Text("False"),
          ],),
          Padding(
            padding: EdgeInsets.all(15.0),
          child: TextButton(onPressed: ()=>{setState(() {
            if (currentQuestion < questions.length - 1) {
                currentQuestion++;
              } else {
              currentQuestion = 0; 
              score = 0; 
              }
            groupValue = 2; //reset radio button
            result = ""; 
            backgroundColor = Colors.white;
          })}, 
          style: TextButton.styleFrom(
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
          ),
        
          child: Text("Next")),),
          Padding(
          padding: EdgeInsets.all(15.0),
          child: Text(result,
          style: TextStyle(backgroundColor: Colors.lightGreenAccent) ),),
          Text("Score: $score",
          style: TextStyle(fontSize: 40)),
        ],     
      ),),
    );
  }
}