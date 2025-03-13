import 'package:hive/hive.dart';
 part 'models.g.dart';
 
@HiveType(typeId: 0)
class MyDatas {
  @HiveField(0)
  String? category;

  @HiveField(1)
  String? timeSpend;

  @HiveField(2)
  String? dateAndTime;

  @HiveField(3)
  String? description;

  MyDatas(
      {required category,
      required timeSpend,
      required dateAndTime,
      required description});
}

@HiveType(typeId: 1)
class Profile {
  @HiveField(0)
  String? name;

  @HiveField(1)
  String? age;

  @HiveField(2)
  String? email;

  @HiveField(3)
  String? address;

  @HiveField(4)
  String? image;

  Profile({required name, required age, required email, required address,required image});
}
