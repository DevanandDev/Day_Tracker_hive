import 'dart:developer';

import 'package:day_tracker/models/models.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';


ValueNotifier<List<MyDatas>> myDatasNotifier=ValueNotifier([]);

Future<void> getData() async{
  final database= await Hive.openBox<MyDatas>('data');
  myDatasNotifier.value.clear();
  myDatasNotifier.value.addAll(database.values);
  myDatasNotifier.notifyListeners();
}

Future<void> addData(MyDatas value)async{
   final database = await Hive.openBox<MyDatas>('data');
   await database.add(value);
   getData();

}

Future<void> deleteData(int index)async{
  final database = await Hive.openBox<MyDatas>('data');
  database.deleteAt(index);
  getData();
}

Future<void> updateData(MyDatas value,int index)async{
  final database= await Hive.openBox<MyDatas>('data');
  await database.putAt(index, value);
  getData();
}