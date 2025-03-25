import 'package:day_tracker/Screens/editProfile.dart';
import 'package:day_tracker/Screens/login.dart';
import 'package:day_tracker/functions/functions.dart';
import 'package:day_tracker/models/models.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

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
    getRegister();
    getWeeklyData();
  }

  Future<void> getRegister() async {
    final pref = await SharedPreferences.getInstance();
    setState(() {
      username = pref.getString('userid') ?? 'No User Found';
      email = pref.getString('email') ?? 'No email found';
    });
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
            Padding(
              padding: const EdgeInsets.only(left: 50, top: 30),
              child: Row(
                children: [
                  CircleAvatar(radius: 50),
                  Gap(20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(username,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                      Text(email,
                          style: TextStyle(fontWeight: FontWeight.w500)),
                    ],
                  ),
                ],
              ),
            ),
            Gap(20),
            TextButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (ctx) => Editprofile()));
              },
              child: Text(
                'Edit Profile',
                style: TextStyle(fontSize: 17),
              ),
            ),
           
          
         
            Expanded(
              child: weeklyData.isEmpty
                  ? Center(child: Text("No Data Available"))
                  : Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: PieChart(
                        PieChartData(
                          sections: getSections(),
                          borderData: FlBorderData(show: false),
                          sectionsSpace: 2,
                          centerSpaceRadius: 0,
                        ),
                      ),
                    ),
            ),
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
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx) => MyLogin()), (route) => false);
  }
}
