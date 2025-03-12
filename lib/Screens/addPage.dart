import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MyAdd extends StatefulWidget {
  const MyAdd({super.key});

  @override
  State<MyAdd> createState() => _MyAddState();
}

class _MyAddState extends State<MyAdd> {
Future<void> selectDate(BuildContext context) async {
  DateTime? getDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100));

      if(getDate != null){
      
      setState(() {
        datecontroller.text = "${getDate.day}/${getDate.month}/${getDate.year}"; 
      });
      }
}


  TextEditingController datecontroller=TextEditingController();
  String? selectedCategory;
  String? selectedTime;

  List<String> category = [
    'Meetings',
    'Communication',
    'Scrum',
    'Learning',
    'Review'
  ];
  List<String> time = ['15min', '30min', '1 hr', '2 hr', '3 hr'];
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
                      hintStyle:
                          TextStyle(fontWeight: FontWeight.bold,)),
                  value: selectedCategory,
                  items: category.map((String category) {
                    return DropdownMenuItem(
                        value: category, child: Text(category));
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      selectedCategory = newValue;
                    });
                  }),
              Gap(25),
              DropdownButtonFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Time Spent',
                    contentPadding: EdgeInsets.symmetric(horizontal: 15)
                  ),
                  items: time.map((String time) {
                    return DropdownMenuItem(value: time, child: Text(time));
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      selectedTime = newValue;
                    });
                  }),
              Gap(25),
              TextField(
                controller: datecontroller,
                decoration: InputDecoration(border: OutlineInputBorder(),
                labelText: 'Select Date',
                contentPadding: EdgeInsets.symmetric(horizontal: 40),
                prefixIcon: Icon(Icons.calendar_month_outlined,
                
                )
                ),
                onTap: () {
                  selectDate(context);
                },
              ),
              Gap(25),
              TextFormField(
                decoration: InputDecoration(border: OutlineInputBorder(),
                labelText: 'Enter Description',
                contentPadding: EdgeInsets.symmetric(vertical: 30
                ) 
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

