import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import 'LoginPage.dart';
import 'MakingAccountPage.dart';
import 'InputMainPage.dart';

dynamic postRequest(String email, String password) async {
  String url = 'http://~~~~~/user/login_parents';

  http.Response response = await http.post(
    url,
    headers: <String, String>{
      'email': email,
      'password': password,
    },
  );
}

void main() {
  runApp(MaterialApp(
    home: UnionPage(),
  ));
}

class UnionPage extends StatefulWidget {
  @override
  _UnionPageState createState() => _UnionPageState();
}

class _UnionPageState extends State<UnionPage> {
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
                    await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => InputMainPage()));
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
