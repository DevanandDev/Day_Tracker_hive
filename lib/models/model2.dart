import 'package:hive/hive.dart';
part 'model2.g.dart';


@HiveType(typeId:1)

class Myprofile{
  @HiveField(0)
  String? name;

  @HiveField(1)
  String? phone;

  @HiveField(2)
  String? email;

  @HiveField(3)
  String? image;

  Myprofile({required this.name,required this.phone,required this.email,required this.image});
}
