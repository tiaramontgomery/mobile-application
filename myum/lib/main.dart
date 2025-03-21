import 'package:flutter/material.dart';
import 'dashboard.dart';
import 'customcard.dart';

void main() {
  runApp(const MyUM());
}


class MyUM extends StatelessWidget {
  const MyUM({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyUmApp(),
    );
  }
}

class MyUmApp extends StatefulWidget {
  const MyUmApp({super.key});

  @override
  State<MyUmApp> createState() => _MyUmAppState();
}

class _MyUmAppState extends State<MyUmApp> {

  int currentIndex = 0;
  //https://news.miami.edu/_assets/images-stories/2025/03/chief-rivero-retirement-hero-940x529.jpg
  //Established in 1925 during the region's famous real estate boom, the University now comprises 12 schools and colleges serving undergraduate and graduate students in nearly 350 majors and programs.

  //class collections of data
  var img = [
    "https://news.miami.edu/_assets/images-stories/2025/03/foods-that-prevent-cancer-and-heart-disease-hero-790x527.jpg","https://news.miami.edu/_assets/images-stories/2025/03/field-hockey-video-hero-790x527.jpg","https://news.miami.edu/_assets/images-stories/2025/03/first-year-admitted-student-program-hero-790x527.jpg",
  ];
  var title=[
    "Foods to fortify","A winning formula","Global start for University students",
  ];
  var summary=[
    "Experts in nutrition science from across the University of Miami offer their thoughts on some of the best foods to help us ward off chronic disease.","More than just a team, the University of Miami's Field Hockey Club fosters camaraderie and teamwork through travel, competition, and a shared passion.","The Start Abroad program offered to spring-admitted students at the University of Miami provides a unique and exciting first-year international experience.",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text("MyUm"),
      backgroundColor: Colors.deepOrange,
    ),
    body: Center(
      child: <Widget>[
        Dashboard(),
        ListView(
          children: <Widget>[
            Customcard(img[0], title[0], summary[0]),
            Customcard(img[1], title[1], summary[1]),
            Customcard(img[2], title[2], summary[2]),
           
          ],
        ),
        Text("Page $currentIndex"),
        Text("Page $currentIndex"),
      ][currentIndex],
    ),
    bottomNavigationBar: NavigationBar( onDestinationSelected: (int index){
      setState(() {
        currentIndex = index;
      });
    },
      destinations: <Widget>[
      NavigationDestination(icon: Icon(Icons.dashboard), label: "Dashboard"),
      NavigationDestination(icon: Icon(Icons.pages), label: "Page 1"),
      NavigationDestination(icon: Icon(Icons.pages), label: "Page 2"),
      NavigationDestination(icon: Icon(Icons.pages), label: "Page 3"),
    ]),
    );
  }
}

