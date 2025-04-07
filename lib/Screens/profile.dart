import 'dart:developer';
import 'dart:io';

import 'package:day_tracker/Screens/editProfile.dart';
import 'package:day_tracker/Screens/login.dart';
import 'package:day_tracker/functions/functions.dart';
import 'package:day_tracker/functions/profileFunction.dart';
import 'package:day_tracker/models/modelProfile.dart';
import 'package:day_tracker/models/models.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class MyProfile extends StatefulWidget {
  MyProfile({
    super.key,
  });

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  String username = "";
  String email = "";

  Map<String, double> weeklyData = {};

  @override
  void initState() {
    super.initState();
    getUser();
    getWeeklyData();
  }

  Future<void> getWeeklyData() async {
    final today = DateTime.now();
    final weekDays =
        List.generate(7, (index) => today.subtract(Duration(days: index)));

    Map<String, double> dataMap = {};

    for (var day in weekDays) {
      String formattedDate = DateFormat('dd/M/yyyy').format(day);
      String dayName = DateFormat('EEEE').format(day);

      List<MyDatas> dailyRecords = myDatasNotifier.value
          .where((e) => e.dateAndTime == formattedDate)
          .toList();

      double totalMinutes = dailyRecords.fold(
          0, (sum, e) => sum + (double.tryParse(e.timeSpend) ?? 0));
      double totalHours = totalMinutes / 60;

      if (totalHours > 0) {
        dataMap[dayName] = totalHours;
      }
    }

    setState(() {
      weeklyData = dataMap;
    });
  }

  @override
  Widget build(BuildContext context) {
    getUser();
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: const Color.fromARGB(255, 242, 248, 254),
        title: Center(
            child: Text(
          'My Profile',
          style: TextStyle(fontWeight: FontWeight.bold),
        )),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20, top: 10),
            child: IconButton(
              onPressed: () => signOut(context),
              icon: Icon(Icons.logout),
            ),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.white, Color.fromARGB(255, 144, 203, 255)],
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: ValueListenableBuilder<List<UserDatas>>(
                  valueListenable: myProfileNotifier,
                  builder: (context, value, child) {
                    if (value.isEmpty) {
                      return Center(
                        child: Text("no user data"),
                      );
                    }
                    log(value.first.username ?? '');
                    return Column(
                      children: [
                        CircleAvatar(
                          radius: 45,
                          backgroundImage: value.first.images != null
                              ? FileImage(File(value.first.images ?? ''))
                              : AssetImage('asset/images/person.webp'),
                        ),
                        Gap(20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Username :  ${value.first.username ?? ''}',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 15)),
                            Gap(4),
                            Text('Email :  ${value.first.email ?? ''}',
                                style: TextStyle(fontWeight: FontWeight.w500)),
                          ],
                        ),
                        Gap(10),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (ctx) => Editprofile(
                                      username: value.first.username.toString(),
                                      email: value.first.email.toString(),
                                      image: value.first.images.toString(),
                                    )));
                          },
                          child: Text(
                            'Edit Profile',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ],
                    );
                  }),
            ),
            Expanded(
              child: weeklyData.isEmpty
                  ? Center(child: Text("No Data Available"))
                  : Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: PieChart(
                        PieChartData(
                          sections: getSections(),
                          // borderData: FlBorderData(show: false),
                          sectionsSpace: 3,
                          centerSpaceRadius: 0,
                          
                        ),
                      ),
                    ),
            ),
            SizedBox(height:100)
          ],
        ),
        
      ),
    );
  }

  List<PieChartSectionData> getSections() {
    List<Color> colorList = [
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.purple,
      Colors.red,
      Colors.yellow,
      Colors.teal,
    ];
    int index = 0;
    return weeklyData.entries.map((entry) {
      final color = colorList[index % colorList.length];
      index++;
      return PieChartSectionData(
        color: color,
        value: entry.value,
        title: "${entry.key}\n${entry.value.toStringAsFixed(1)}h",
        radius: 140,
        titleStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      );
    }).toList();
  }

  signOut(BuildContext context) async {
    final pref = await SharedPreferences.getInstance();
    pref.clear();
    await Hive.box<UserDatas>('database').clear();
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx) => MyLogin()), (route) => false);
  }
}
