import 'dart:developer';

import 'package:day_tracker/functions/functions.dart';
import 'package:day_tracker/models/models.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MyAdd extends StatefulWidget {
  const MyAdd({super.key});

  @override
  State<MyAdd> createState() => _MyAddState();
}

class _MyAddState extends State<MyAdd> {
  TextEditingController discriptionController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController categoryController = TextEditingController();

  Future<void> selectDate(BuildContext context) async {
    DateTime? getDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));

    if (getDate != null) {
      setState(() {
        datecontroller.text = "${getDate.day}/${getDate.month}/${getDate.year}";
      });
    }
  }

  TextEditingController datecontroller = TextEditingController();
  String? selectedCategory;

  List<String> category = [
    'Meetings',
    'Communication',
    'Scrum',
    'Learning',
    'Review'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.white, Color.fromARGB(255, 144, 203, 255)])),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DropdownButtonFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Category',
                      contentPadding: EdgeInsets.symmetric(horizontal: 15),
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                      )),
                  value: categoryController.text.isNotEmpty
                      ? categoryController.text
                      : null,
                  items: category.map((String category) {
                    return DropdownMenuItem(
                        value: category, child: Text(category));
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      categoryController.text = newValue!;
                    });
                  }),
              Gap(25),
              TextField(
                controller: timeController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Time Spent',
                  contentPadding: EdgeInsets.symmetric(horizontal: 15),
                ),
              ),
              Gap(25),
              TextField(
                controller: datecontroller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Select Date',
                    contentPadding: EdgeInsets.symmetric(horizontal: 40),
                    prefixIcon: Icon(
                      Icons.calendar_month_outlined,
                    )),
                onTap: () {
                  selectDate(context);
                },
              ),
              Gap(25),
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Discription',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Gap(5),
                  TextFormField(
                    controller: discriptionController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                    ),
                    maxLines: 4,
                    keyboardType: TextInputType.multiline,
                  ),
                ],
              ),
              Gap(50),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 146, 208, 255),
                      shadowColor: const Color.fromARGB(255, 76, 0, 255),
                      overlayColor: const Color.fromARGB(255, 255, 255, 255),
                      foregroundColor: Colors.black,
                      minimumSize: Size(50, 40),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5))),
                  onPressed: () {
                    saveBtn();
                  },
                  child: Text(
                    'Save',
                    style: TextStyle(fontSize: 16),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Future<void> saveBtn() async {
    final category = categoryController.text.trim();
    final timespent = timeController.text.trim();
    final date = datecontroller.text.trim();
    final discription = discriptionController.text.trim();
    log(date);
    log(discription);
    
    if (category.isEmpty ||
        timespent.isEmpty ||
        date.isEmpty ||
        discription.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Please Fill All Fields')));
    } else {
      final datas = MyDatas(
          category: category,
          timeSpend: timespent,
          dateAndTime: date,
          description: discription);
                addData(datas);
      Navigator.of(context).pop();
    }
  }
}
