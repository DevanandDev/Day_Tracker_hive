import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

// ignore: must_be_immutable
class MyView extends StatelessWidget {
  String? category;
  String? timeSpend;
  String? dateAndTime;
  String? description;

  MyView(
      {super.key,
      required this.category,
      required this.timeSpend,
      required this.dateAndTime,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 238, 247, 255),
          title: Padding(
            padding: const EdgeInsets.only(left: 80,),
            child: Text('About',style: TextStyle(fontWeight: FontWeight.bold),),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 17),
              child: Icon(Icons.notifications),
            )
          ],
        ),
        body: Center(
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.white, Color.fromARGB(255, 144, 203, 255)])),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               
                Padding(
                  padding: const EdgeInsets.only(left: 45 ),
                  child: Row(
                    children: [
                      Text(
                        'Category :   ',
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Text(
                        '$category',
                        style:
                            TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                      )
                    ],
                  ),
                ),
                Gap(10),
                Padding(
                    padding: const EdgeInsets.only(left: 30 ),
                  child: Row(
                    children: [
                      Text(
                        'TimeSpent :   ',
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Text('$timeSpend',
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 18))
                    ],
                  ),
                ),
                Gap(10),
              
                Gap(10),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 190,top: 10),
                        child: Text(
                          'Discription',
                          style:
                              TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),Gap(5),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)
                        ),
                        width: 300,
                        height: 200,
                        
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text('$description',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 15)),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
