import 'package:flutter/material.dart';
import 'package:foresight/Pages/Home/index.dart';
import 'package:foresight/Pages/Splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Splash(),
        'HomePage': (context) => HomePage(),
      },
    );
  }
}
