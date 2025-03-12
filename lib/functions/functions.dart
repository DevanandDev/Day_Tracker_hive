import 'package:day_tracker/models/models.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

// ignore: non_constant_identifier_names
ValueNotifier<List<MyDatas>> MyDatasNotifier=ValueNotifier([]);

Future<void> getData() async{
  final database= await Hive.openBox<MyDatas>('data');
  MyDatasNotifier.value.clear();
  MyDatasNotifier.value.addAll(database.values);
  MyDatasNotifier.notifyListeners();
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