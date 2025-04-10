import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MyView extends StatelessWidget {
  String? category;
  String? timeSpend;
  String? dateAndTime;
  String? description;

  MyView(
      {super.key,
      required this.category,
      required this.timeSpend,
      this.dateAndTime,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 242, 248, 254),
          title: Padding(
            padding: const EdgeInsets.only(
              left: 80,
            ),
            child: Text(
              'About',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
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
                    colors: [
                  Colors.white,
                  Color.fromARGB(255, 130, 190, 243)
                ])),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 190),
                  child: Text(
                    'Category : ',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                Gap(10),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 255, 251, 251),
                  ),
                  width: 300,
                  height: 40,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('$category',
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 15)),
                  ),
                ),
                Gap(10),
                Padding(
                  padding: const EdgeInsets.only(right: 190),
                  child: Text(
                    'Time Spend : ',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                Gap(10),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 255, 251, 251),
                  ),
                  width: 300,
                  height: 40,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('$timeSpend',
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 15)),
                  ),
                ),
                Gap(10),
                Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 190, top: 10),
                        child: Text(
                          'Discription : ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),
                      Gap(5),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: const Color.fromARGB(255, 255, 251, 251),
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
