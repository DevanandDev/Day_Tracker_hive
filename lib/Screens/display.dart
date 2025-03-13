import 'package:day_tracker/Screens/addPage.dart';
import 'package:day_tracker/Screens/viewDisplay.dart';
import 'package:day_tracker/functions/functions.dart';
import 'package:day_tracker/models/models.dart';
import 'package:day_tracker/widgets/widget.dart';
import 'package:flutter/material.dart';

class MyDisplay extends StatefulWidget {
  const MyDisplay({super.key});

  @override
  State<MyDisplay> createState() => _MyDisplayState();
}

class _MyDisplayState extends State<MyDisplay> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.white, Color.fromARGB(255, 144, 203, 255)])),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 60,
                        height: 30,
                        child: FloatingActionButton(
                            hoverColor: Colors.blueAccent,
                            backgroundColor:
                                const Color.fromARGB(255, 187, 233, 255),
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (ctx) => MyAdd()));
                            },
                            child: Text('New',style: TextStyle(color: Colors.black),),
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: ValueListenableBuilder(
                valueListenable: MyDatasNotifier,
                // ignore: non_constant_identifier_names
                builder: (BuildContext, List<MyDatas> datas, Widget? child) {
                  return datas.isEmpty
                      ? Center(
                          child: Text('Add New Fields'),
                        )
                      : ListView.builder(
                          itemCount: datas.length,
                          itemBuilder: (context, index) {
                            final val = datas[index];

                            return ListTile(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (ctx) => MyView(
                                            category: val.category.toString(),
                                            timeSpend: val.timeSpend.toString(),
                                            dateAndTime:
                                                val.dateAndTime.toString(),
                                            description:
                                                val.description.toString())));
                              },
                              title: Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: Text(
                                  ('${index + 1} .   ${val.category}'),
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
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
              ))
            ],
          ),
        ),
      ),
    );
  }
}
