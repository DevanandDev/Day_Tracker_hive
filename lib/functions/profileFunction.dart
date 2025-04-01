import 'dart:developer';

import 'package:day_tracker/models/modelProfile.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

ValueNotifier <List<UserDatas>> myProfileNotifier= ValueNotifier([]);

Future<void> addUser(UserDatas value)async{
  final box= await Hive.openBox<UserDatas>('database');
 await box.add(value);
 log(value.username??'');
 log(box.values.first.username??'');
}

Future<void> getUser()async{
  log("getting user data");
  final box= await Hive.openBox<UserDatas>('database');
  myProfileNotifier.value.clear();
  myProfileNotifier.value.addAll(box.values);
  myProfileNotifier.notifyListeners();
}

Future<void> deleteUser(int index)async{
  final box= await Hive.openBox<UserDatas>('database');
  box.deleteAt(index);
  getUser();
}

Future<void> updateUser(UserDatas values)async{
  final box = await Hive.openBox<UserDatas>('database');
  await box.putAt(0,values);
   getUser();
}