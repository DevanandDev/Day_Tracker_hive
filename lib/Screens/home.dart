import 'dart:io';

import 'package:day_tracker/Screens/display.dart';
import 'package:day_tracker/Screens/profile.dart';
import 'package:day_tracker/functions/functions.dart';
import 'package:day_tracker/functions/profileFunction.dart';
import 'package:day_tracker/models/models.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  TextEditingController searchController = TextEditingController();

  List<MyDatas> searchList = [];

  void getSearch(String searchVal) {
    setState(() {
      searchList = myDatasNotifier.value
          .where((data) => data.dateAndTime.toString().contains(searchVal)||data.category.toString().contains(searchVal))
          .toList();
    });
  }

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
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (ctx) => MyProfile()),
                              );
                            },
                            child: Column(
                              children: [
                                ValueListenableBuilder(
                                  valueListenable: myProfileNotifier,
                                  builder: (context, value, child) {
                                    if (value.isEmpty || value.first.images == null) {
                                      return const CircleAvatar(
                                        radius: 27,
                                        backgroundImage: AssetImage('asset/images/person.webp'),
                                      );
                                    }
                                    return CircleAvatar(
                                      radius: 27,
                                      backgroundImage:
                                          FileImage(File(value.first.images!)),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Profile',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 15),
                child: TextField(
                  controller: searchController,
                  onChanged: getSearch,
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
                    final showList =
                        (searchController.text.isEmpty ? datas : searchList)
                            .map((data) => data.dateAndTime)
                            .toSet()
                            .toList();

                    return showList.isEmpty
                        ? Center(child: Text('No date Available'))
                        : ListView.builder(
                            itemCount: showList.length,
                            itemBuilder: (context, index) {
                              final val = showList[index];

                              return Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: ListTile(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (ctx) =>
                                            MyDisplay(getDate: val!),
                                      ),
                                    );
                                  },
                                  title: Text(val.toString()),
                                  trailing: IconButton(
                                    onPressed: () {
                                      deleteData(index);
                                    },
                                    icon: Icon(Icons.delete),
                                  ),
                                ),
                              );
                            },
                          );
                  },
                ),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: () {
            String formateddate =
                DateFormat('dd/M/yyyy').format(DateTime.now());
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (ctx) => MyDisplay(
                          getDate: formateddate,
                        )));
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
