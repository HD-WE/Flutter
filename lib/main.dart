import 'package:flutter/material.dart';
import 'package:mongsil/screen/state.dart';
//import 'package:mongsil/widgets/bottom_navigate_bar.dart';
void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({ Key key }) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Main()
    );
  }
}
