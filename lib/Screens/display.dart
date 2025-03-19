import 'package:day_tracker/Screens/addPage.dart';
import 'package:day_tracker/Screens/viewDisplay.dart';
import 'package:day_tracker/functions/functions.dart';
import 'package:day_tracker/models/models.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

class MyDisplay extends StatefulWidget {
  const MyDisplay({super.key});

  @override
  State<MyDisplay> createState() => _MyDisplayState();
}

class _MyDisplayState extends State<MyDisplay> {
  DateTime? selectDate;
  String formateddate = DateFormat('dd/M/yyyy').format(DateTime.now());

  double totalHourse = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    updateTime();
  }

  Future<void> updateTime() async {
    double time = await totalTime();
    setState(() {
      totalHourse = time;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 242, 248, 254),
        title: Padding(
          padding: const EdgeInsets.only(
            left: 70,
          ),
          child: Text(
            'Details',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 17),
            child: FloatingActionButton.small(
              hoverColor: Colors.blueAccent,
              backgroundColor: const Color.fromARGB(255, 187, 233, 255),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (ctx) => MyAdd(
                              date: formateddate,
                            )));
              },
              child: Icon(Icons.add),
            ),
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.white, Color.fromARGB(255, 144, 203, 255)])),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: const Color.fromARGB(255, 255, 251, 251),
                  ),
                  width: 180,
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                          onTap: () {
                            getdate(context);
                          },
                          child: Icon(Icons.calendar_month)),
                      Gap(10),
                      Text(
                        'Date : $formateddate ',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ),
              Gap(8),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: const Color.fromARGB(255, 255, 251, 251),
                ),
                width: 180,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Total Time : ${totalHourse.toStringAsFixed(2)} hrs',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: ValueListenableBuilder(
                valueListenable: myDatasNotifier,
                builder: (context, datas, Widget? child) {
                  List<MyDatas> formatedList = datas
                      .where(
                        (element) => element.dateAndTime == formateddate,
                      )
                      .toList();

                  return formatedList.isEmpty
                      ? Center(
                          child: Text('Add Fields'),
                        )
                      : ListView.builder(
                          itemCount: formatedList.length,
                          itemBuilder: (context, index) {
                            final val = formatedList[index];

                            return ListTile(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (ctx) => MyView(
                                            category: val.category.toString(),
                                            timeSpend: val.timeSpend.toString(),
                                            description:
                                                val.description.toString())));
                              },
                              title: Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: Text(
                                  ('${index + 1} .   ${val.category}'),
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18),
                                ),
                              ),
                              trailing: IconButton(
                                  onPressed: () {
                                    deleteData(index);
                                  },
                                  icon: Icon(Icons.delete)),
                            );
                          });
                },
              )),
              Padding(
                padding: const EdgeInsets.only(bottom: 80),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 255, 255, 255),
                        shadowColor: const Color.fromARGB(255, 76, 0, 255),
                        overlayColor: const Color.fromARGB(255, 255, 255, 255),
                        foregroundColor: Colors.black,
                        minimumSize: Size(40, 40),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5))),
                    onPressed: () {
                      totalTime();
                    },
                    child: Text(
                      'Save',
                      style: TextStyle(fontSize: 16),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> getdate(BuildContext context) async {
    DateTime? pickdate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));

    if (pickdate != null) {
      setState(() {
        selectDate = pickdate;
        formateddate = selectDate != null
            ? DateFormat('dd/M/yyyy').format(pickdate)
            : "No Date ";
      });
      updateTime();
    }
  }

  TextEditingController datecontroller = TextEditingController();

  Future<double> totalTime() async {
    var totalList = myDatasNotifier.value;

    if (totalList.isEmpty) {
      return 0;
    }
    List<MyDatas> newList = totalList
        .where((element) => element.dateAndTime == formateddate)
        .toList();

    if (newList.isEmpty) {
      return 0;
    }

    double totaltime = totalList.fold(0, (sum, element) {
      double time = double.tryParse(element.timeSpend) ?? 0;
      return sum + time;
    });

    double toHour = totaltime / 60;
    print("Total Time in Hours: $toHour");
    return toHour;
  }
}
