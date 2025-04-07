

import 'package:day_tracker/functions/functions.dart';
import 'package:day_tracker/models/models.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MyAdd extends StatefulWidget {
  final String date;
  const MyAdd({super.key, required this.date});

  @override
  State<MyAdd> createState() => _MyAddState();
}

class _MyAddState extends State<MyAdd> {
  TextEditingController discriptionController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController categoryController = TextEditingController();

  // String? selectedCategory;

  List<String> category = [
    'Meetings',
    'Communication',
    'Scrum',
    'Learning',
    'Review'
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 242, 248, 254),
          title: Padding(
            padding: const EdgeInsets.only(
              left: 60,
            ),
            child: Text(
              'Add Details',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.white, Color.fromARGB(255, 144, 203, 255)])),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 150,left: 30,right: 30),
              child: Column(
                mainAxisSize: MainAxisSize.min,
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
                        addBtn();
                      },
                      child: Text(
                        'Add',
                        style: TextStyle(fontSize: 16),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> addBtn() async {
    final category = categoryController.text.trim();
    final timespent = timeController.text.trim();
    final discription = discriptionController.text.trim();

    if (category.isEmpty || timespent.isEmpty || discription.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Please Fill All Fields')));
    } else {
      final datas = MyDatas(
          dateAndTime: widget.date,
          category: category,
          timeSpend: timespent,
          description: discription);

      addData(datas);
      Navigator.of(context).pop();
    }
  }
}
