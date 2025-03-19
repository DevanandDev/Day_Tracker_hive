import 'dart:io';

import 'package:day_tracker/Screens/editProfile.dart';
import 'package:day_tracker/Screens/login.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
 
  String username = "";
  String email = "";

  @override
  void initState() {
    super.initState();
    getRegister();
  }

  Future<void> getRegister() async {
    final pref = await SharedPreferences.getInstance();

    setState(() {
      username = pref.getString('userid') ?? 'No User Found';
      email = pref.getString('email') ?? 'No email get';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: const Color.fromARGB(255, 242, 248, 254),
        title: Center(
            child: Text('My Profile',
                style: TextStyle(fontWeight: FontWeight.bold))),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20, top: 10),
            child: Column(
              children: [
                IconButton(
                    onPressed: () {
                      signOut(context);
                    },
                    icon: Icon(Icons.logout)),
              ],
            ),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.white, Color.fromARGB(255, 144, 203, 255)])),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 50, top: 30),
              child: Row(
                children: [
                  CircleAvatar(
                  
                    radius: 50,
                  ),
                  Gap(20),
                  Column(
                    children: [
                      Text(
                        username,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text(
                        email,
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                 
                ],
              ),
            ),
            Gap(20),
                       TextButton(onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>Editprofile()));
                       }, child: Text('Edit Profile',style: TextStyle(fontSize: 17),))

          ],
        ),
      ),
    );
  }

  signOut(BuildContext context) async {
    final pref = await SharedPreferences.getInstance();
    pref.clear();

    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx) => MyLogin()), (route) => false);
  }

 
}
