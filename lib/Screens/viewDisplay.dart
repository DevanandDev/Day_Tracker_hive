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
    return Scaffold(
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
              Row(
                children: [
                  Text(
                    'Category :   ',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    '$category',
                    style:
                        TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
                  )
                ],
              ),
              Gap(10),
              Row(
                children: [
                  Text(
                    'TimeSpent :   ',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text('$timeSpend',
                      style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 20))
                ],
              ),
              Gap(10),
              Row(
                children: [
                  Text(
                    'Date :   ',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text('$dateAndTime',
                      style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 20))
                ],
              ),
              Gap(10),
              Column(
                children: [
                  Text(
                    'Discription :   ',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Container(
                    width: 300,
                    height: 200,
                    color: Colors.white,
                    child: Text('$description',
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 20)),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
