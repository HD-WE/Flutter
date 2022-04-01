import 'dart:html';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';

void main() {
  runApp(MainPage());
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Center(
          child: MyWidget(),
        ),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(children: <Widget>[
      Column(
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Expanded(
                  child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 16,
                  ),
                  Center(
                    child: Card(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      elevation: 20,
                      child: ListTile(
                        leading: Icon(
                          Icons.favorite,
                          color: Colors.red,
                          size: 25,
                        ),
                        title: Text(
                          'Pulse: 106',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                  )
                ],
              )),
              Expanded(
                  child: Column(
                children: <Widget>[
                  Center(
                    child: Card(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      elevation: 20,
                      child: ListTile(
                        leading: Icon(
                          Icons.thermostat_outlined,
                          color: Colors.red,
                          size: 25,
                        ),
                        title: Text(
                          'Temp: 37.2',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                  )
                ],
              ))
            ],
          ),
          Row(
            children: [
              Expanded(
                  child: Column(
                children: <Widget>[
                  Center(
                    child: Card(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      elevation: 20,
                      child: ListTile(
                        leading: Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 25,
                        ),
                        title: Text(
                          'Stress: good',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                  )
                ],
              )),
              Expanded(
                  child: Column(
                children: <Widget>[
                  Center(
                    child: Card(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      elevation: 20,
                      child: ListTile(
                        leading: Icon(
                          Icons.people,
                          color: Colors.black,
                          size: 25,
                        ),
                        title: Text(
                          'Movement: none',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                  )
                ],
              ))
            ],
          ),
        ],
      ),
      Column(
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Expanded(
                  child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 16,
                  ),
                  Center(
                    child: Card(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      elevation: 20,
                      child: ListTile(
                        leading: Icon(
                          Icons.favorite,
                          color: Colors.red,
                          size: 25,
                        ),
                        title: Text(
                          'Pulse: 98',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                  )
                ],
              )),
              Expanded(
                  child: Column(
                children: <Widget>[
                  Center(
                    child: Card(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      elevation: 20,
                      child: ListTile(
                        leading: Icon(
                          Icons.thermostat_outlined,
                          color: Colors.red,
                          size: 25,
                        ),
                        title: Text(
                          'Temp: 35.2',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                  )
                ],
              ))
            ],
          ),
          Row(
            children: [
              Expanded(
                  child: Column(
                children: <Widget>[
                  Center(
                    child: Card(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      elevation: 20,
                      child: ListTile(
                        leading: Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 25,
                        ),
                        title: Text(
                          'Stress: erorr',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                  )
                ],
              )),
              Expanded(
                  child: Column(
                children: <Widget>[
                  Center(
                    child: Card(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      elevation: 20,
                      child: ListTile(
                        leading: Icon(
                          Icons.people,
                          color: Colors.black,
                          size: 25,
                        ),
                        title: Text(
                          'Movement: strong',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                  )
                ],
              ))
            ],
          ),
        ],
      ),
      Column(
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Expanded(
                  child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 16,
                  ),
                  Center(
                    child: Card(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      elevation: 20,
                      child: ListTile(
                        leading: Icon(
                          Icons.favorite,
                          color: Colors.red,
                          size: 25,
                        ),
                        title: Text(
                          'Pulse: error',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                  )
                ],
              )),
              Expanded(
                  child: Column(
                children: <Widget>[
                  Center(
                    child: Card(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      elevation: 20,
                      child: ListTile(
                        leading: Icon(
                          Icons.thermostat_outlined,
                          color: Colors.red,
                          size: 25,
                        ),
                        title: Text(
                          'Temp: erorr',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                  )
                ],
              ))
            ],
          ),
          Row(
            children: [
              Expanded(
                  child: Column(
                children: <Widget>[
                  Center(
                    child: Card(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      elevation: 20,
                      child: ListTile(
                        leading: Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 25,
                        ),
                        title: Text(
                          'Stress: erorr',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                  )
                ],
              )),
              Expanded(
                  child: Column(
                children: <Widget>[
                  Center(
                    child: Card(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      elevation: 20,
                      child: ListTile(
                        leading: Icon(
                          Icons.people,
                          color: Colors.black,
                          size: 25,
                        ),
                        title: Text(
                          'Movement: erorr',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                  )
                ],
              ))
            ],
          ),
        ],
      ),
    ]));
  }
}
