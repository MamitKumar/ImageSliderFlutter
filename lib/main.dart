import 'package:flutter/material.dart';
import 'package:scroolingstoryslider/Screenon.dart';
void main() {
  runApp(const ScreenApp());
}

class ScreenApp extends StatelessWidget {
  const ScreenApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Georgia',
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize: 30.0,  color: Colors.white,fontFamily: 'Roboto',fontWeight: FontWeight.w400 ),
          headline4: TextStyle(fontSize: 27.0,  color: Colors.black,fontFamily: 'Roboto' ),
          headline2: TextStyle(fontSize: 20.0, fontFamily: 'Roboto', color: Colors.white ,),
          headline3: TextStyle(fontSize: 17.0, fontFamily: 'Roboto'),
          headline6: TextStyle(fontSize: 22.0,color: Colors.white ),
          headline5: TextStyle(fontSize: 40.0,  color: Colors.pinkAccent, fontWeight: FontWeight.bold,),
          bodyText2: TextStyle(fontSize: 16.0, fontFamily: 'Hind'),
          bodyText1:  TextStyle(fontSize: 14.0, fontFamily: 'Hind',color: Colors.green),
          button:  TextStyle(fontSize: 20.0, fontFamily: 'Hind',color: Colors.black),
        ),
      ),
      home: Scaffold(
        body: MyApp(),
      ),
    );
  }
}

