import 'package:day_tracker/Screens/display.dart';
import 'package:day_tracker/Screens/profile.dart';
import 'package:day_tracker/functions/functions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  String formateddate = DateFormat('dd/M/yyyy').format(DateTime.now());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
  @override
  
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.white, Color.fromARGB(255, 144, 203, 255)])),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Day Tracker',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 29, top: 10),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (ctx) => MyProfile()));
                          },
                          child: CircleAvatar(
                            radius: 30,
                            backgroundImage:
                                AssetImage('asset/images/person.webp'),
                          ),
                        ),
                        Gap(10),
                        Text(
                          'Profile',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 15),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'Search',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(
                        Icons.search,
                        size: 30,
                      )),
                ),
              ),
              Expanded(
                  child: ValueListenableBuilder(
                      valueListenable: myDatasNotifier,
                      builder: (context, datas, Widget? child) {

                        return datas.isEmpty
                            ? Center(
                                child: Text('No date Available'),
                              )
                            : ListView.builder(
                                itemCount: datas.length,
                                itemBuilder: (context, index) {
                                  final val = datas[index];

                                  return Padding(
                                    padding: const EdgeInsets.all(18.0),
                                    child: ListTile(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (ctx) => MyDisplay(selectDate: val,)));
                                      },
                                      title: Text(val.dateAndTime.toString()),
                                      trailing: IconButton(onPressed: (){
                                        deleteData(index);
                                      }, icon: Icon(Icons.delete)),
                                    ),
                                  );
                                });
                      }))
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (ctx) => MyDisplay()));
          },
          child: Icon(
            Icons.add,
            size: 30,
          ),
        ),
      ),
    );
  }
} 