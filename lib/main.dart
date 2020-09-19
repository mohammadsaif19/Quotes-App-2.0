import 'package:flutter/material.dart';
import './screen/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        accentColor: Colors.teal,
        primaryColor: Colors.teal,
        primarySwatch: Colors.teal,
      ),
      title: "Quotes App",
      home: QuotesScreen(),
    );
  }
}
