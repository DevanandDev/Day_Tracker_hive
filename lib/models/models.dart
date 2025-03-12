import 'package:hive/hive.dart';

@HiveType(typeId:0)

class MyDatas {
  @HiveField(0)
  String? category;

  @HiveField(1)
  String? timeSpend;

  @HiveField(2)
  String? dateAndTime;

  @HiveField(3)
  String? description;
}

@HiveType(typeId:1)

class profile {
  @HiveField(0)
  String? name;

  @HiveField(1)
  String? age;

  @HiveField(2)
  String? address;
  
  
}