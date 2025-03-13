import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyView extends StatelessWidget {
  String? category;
  String? timeSpend;
  String? dateAndTime;
  String? description;

   MyView({super.key,
   required this.category,
   required this.timeSpend,
   required this.dateAndTime,
   required this.description
   });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Center(
            child: Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      Text('Category : ',style: TextStyle(fontWeight: FontWeight.bold),),
                      Text('$category')
                      ],
                  ),
                  Row(
                    children: [
                      Text('TimeSpent : ',style: TextStyle(fontWeight: FontWeight.bold),),
                      Text('$timeSpend')
                      ],
                  ),
                  Row(
                    children: [
                      Text('Date : ',style: TextStyle(fontWeight: FontWeight.bold),),
                      Text('$dateAndTime')
                      ],
                  ),
                  Row(
                    children: [
                      Text('Discription : ',style: TextStyle(fontWeight: FontWeight.bold),),
                      Text('$description')
                      ],
                  ),
                ],
              ),
            ),
          ),
    );
  }
}