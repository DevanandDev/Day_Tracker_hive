import 'package:hive/hive.dart';
 part 'models.g.dart';
 
@HiveType(typeId: 0)
class MyDatas {
  @HiveField(0)
  String category;

  @HiveField(1)
  String timeSpend;

  @HiveField(2)
  String dateAndTime;

  @HiveField(3)
  String description;

   MyDatas(
      {required this.category,
      required this.timeSpend,
      required this.dateAndTime,
      required this.description});
}

