import 'package:day_tracker/Screens/addPage.dart';
import 'package:flutter/material.dart';

class MyDisplay extends StatefulWidget {
  const MyDisplay({super.key});

  @override
  State<MyDisplay> createState() => _MyDisplayState();
}

class _MyDisplayState extends State<MyDisplay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient( begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.white, Color.fromARGB(255, 144, 203, 255)])
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        
                        Navigator.push(context, MaterialPageRoute(builder: (ctx)=>MyAdd()));
                      },
                      child: Container(
                        
                        width: 80,
                        height: 40,
                        color: const Color.fromARGB(255, 108, 208, 255),
                        child: Center(child: Text('New',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20),)),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}