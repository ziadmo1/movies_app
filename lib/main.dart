import 'package:flutter/material.dart';
import 'package:movies_app/screens/home_screen.dart';
import 'package:movies_app/themes/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        initialRoute: HomeScreen.routeName,
      routes: {
          HomeScreen.routeName:(_)=>HomeScreen()
      },
      theme: MyThemeData.appTheme,

    );
  }
}
