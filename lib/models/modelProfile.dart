

import 'package:hive/hive.dart';
part 'modelProfile.g.dart';

@HiveType(typeId : 1)

class UserDatas {
  @HiveField(0)
  String? username;

  @HiveField(1)
  String? email;

  @HiveField(2)
  String? images;

  UserDatas({required this.username,required this.email,this.images});
}