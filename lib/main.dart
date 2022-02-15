import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:jasco/pages/home_page.dart';
import 'package:jasco/pages/write_page.dart';

void main() async{
  await Hive.initFlutter();
  await Hive.openBox("jasco");
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  CupertinoApp(
      title: 'Flutter Demo',
      theme: CupertinoThemeData(
        brightness: Brightness.dark,
        primaryColor: CupertinoColors.activeOrange,
        barBackgroundColor: CupertinoColors.black,
        textTheme: CupertinoTextThemeData(
            textStyle: TextStyle(
              color: CupertinoColors.activeOrange,
            ),
            primaryColor: CupertinoColors.activeOrange),
      ),
      home: HomePage(),
    );
  }
}
