import 'package:day_tracker/Screens/addPage.dart';
import 'package:day_tracker/Screens/display.dart';
import 'package:day_tracker/Screens/home.dart';
import 'package:flutter/material.dart';

  void main(){
    runApp(MyApp());
  }

class MyApp extends StatelessWidget {
  const MyApp({super.key});



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyAdd(
        
      ),
    );
  }
}