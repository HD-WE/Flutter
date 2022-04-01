import 'package:flutter/material.dart';
import 'input_main_page.dart';
import 'package:http/http.dart' as http;
import 'first.dart';
import 'dart:convert';
import '../main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  final emailText = TextEditingController();
  final password = TextEditingController();

  bool _isLoading = false;

  send() {
    signIn(emailText.text, password.text);
  }

  signIn(String email, String password) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map data = {
      'email': email,
      'password': password,
    };
    var jsonResponse = null;
    var response =
        await http.post("http://~~~~~/user/match_authenticode", body: data);
    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      if (jsonResponse != null) {
        setState(() {
          _isLoading = false;
        });
        sharedPreferences.setString("token", jsonResponse['token']);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext context) => MainPage()),
            (Route<dynamic> route) => false);
      }
    } else {
      setState(() {
        _isLoading = false;
      });
      print(response.body);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            SizedBox(height: 80.0),
            Row(
              children: <Widget>[
                Text(
                  '로그인해주세요!',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  '''
                  안녕하세요.
                  로그인해주세요!
                  ''',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    children: <Widget>[
                      TextField(
                        controller: emailText,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: '이메일 주소',
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      TextField(
                        controller: password,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: '비밀번호',
                        ),
                        obscureText: true,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                ButtonTheme(
                  minWidth: 200,
                  height: 40,
                  child: FlatButton(
                    child: Text(
                      '로그인',
                      style: TextStyle(fontSize: 24),
                    ),
                    textColor: Colors.white,
                    color: Colors.blue,
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    //onPressed: send(), // TODO final code
                    onPressed: () async {
                      await Navigator.push(context,
                          MaterialPageRoute(builder: (context) => FirstPage()));
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
//postRequest('wadad', 'dawda')