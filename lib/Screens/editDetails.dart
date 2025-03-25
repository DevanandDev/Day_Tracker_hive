import 'package:day_tracker/functions/functions.dart';
import 'package:day_tracker/models/models.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

class MyEditDetail extends StatefulWidget {
  MyEditDetail(
      {super.key,
      required this.index,
      required this.category,
      required this.timeSpend,
      required this.description,
       required String dateAndTime
      
      });

  final int index;
  final String category;
  final String timeSpend;
  final String description;
  

  @override
  State<MyEditDetail> createState() => _MyEditDetailState();
}

class _MyEditDetailState extends State<MyEditDetail> {
  TextEditingController categoryController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController discriptionController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categoryController.text = widget.category;
    timeController.text = widget.timeSpend;
    discriptionController.text = widget.description;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 242, 248, 254),
          title: Padding(
            padding: const EdgeInsets.only(left: 70),
            child: Text('Edit Details',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.white, Color.fromARGB(255, 144, 203, 255)])),
          child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Category',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                TextField(
                  controller: categoryController,
                  decoration: InputDecoration(border: OutlineInputBorder()),
                ),
                Gap(29),
                Text('TimeSpend',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                TextField(
                  controller: timeController,
                  decoration: InputDecoration(border: OutlineInputBorder()),
                ),
                Gap(29),
                Text('Description',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
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
                      updateBtn();
                    },
                    child: Text(
                      'Edit',
                      style: TextStyle(fontSize: 16),
                    ))
              ],
            ),
          ),
        ));
  }

  void updateBtn() {
    final eCategory = categoryController.text.trim();
    final eTime = timeController.text.trim();
    final eDescription = discriptionController.text.trim();
    final String nowDate= DateFormat('dd/M/yyyy').format(DateTime.now());
    if (eCategory.isEmpty || eTime.isEmpty || eDescription.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Fill All Fields')));
      
    }
    final editedDatas = MyDatas(
        category: eCategory, timeSpend: eTime, description: eDescription,dateAndTime: nowDate);

        updateData(editedDatas, widget.index);
        Navigator.of(context).pop();
        
  }
}
