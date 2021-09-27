import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import 'MakingAccountPage.dart';
import 'LoginPage.dart';
import 'ChildPage/ChildLogin.dart';

void main() {
  runApp(MaterialApp(
    home: FirstPage(),
  ));
}

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        children: <Widget>[
          SizedBox(height: 40.0),
          Column(
            children: <Widget>[
              SizedBox(
                height: 80,
              ),
              //FlutterLogo(),
              Image.asset(
                'images/mongsil.png',
                width: 200,
                height: 100,
              ),
              SizedBox(
                height: 16.0,
              ),
              Text('뭉실구름'),
              SizedBox(
                height: 120.0,
              ),
              // 로그인 버튼
              ButtonTheme(
                minWidth: 400,
                height: 30,
                child: FlatButton(
                  child: Text(
                    '로그인',
                    style: TextStyle(fontSize: 24),
                  ),
                  textColor: Colors.white,
                  color: Colors.blue,
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0)),
                  onPressed: () async {
                    await Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                ),
              ),
              SizedBox(
                height: 18,
              ),
              // 새로운 계정 만들기 버튼
              ButtonTheme(
                minWidth: 400,
                height: 30,
                child: FlatButton(
                  onPressed: () async {
                    await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MakingAccountPage()));
                  },
                  child: Text('새로운 계정 만들기',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                      )),
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: Colors.blue,
                          width: 1,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(50)),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              // 자녀 로그인 버튼
              ButtonTheme(
                minWidth: 400,
                height: 30,
                child: FlatButton(
                  onPressed: () async {
                    await Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Childlogin()));
                  },
                  child: Text('자녀 로그인',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                      )),
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                          color: Colors.blue,
                          width: 1,
                          style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(50)),
                ),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
