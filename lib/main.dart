
import 'package:day_tracker/Screens/splash.dart';
import 'package:day_tracker/models/modelProfile.dart';
import 'package:day_tracker/models/models.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(MyDatasAdapter());
  Hive.registerAdapter(UserDatasAdapter());


  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MySplash(),
    );
  }
}
