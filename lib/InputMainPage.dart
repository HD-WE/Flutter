import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'ProfilePage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InputMainPage extends StatefulWidget {
  @override
  _InputMainPage createState() => _InputMainPage();
}

class _InputMainPage extends State<InputMainPage> {
  bool _isLoading = false;

  final authenticode = TextEditingController();

  send() {
    signIn(authenticode.text);
  }

  signIn(String authenticode) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map data = {
      'authenticode': authenticode,
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
            MaterialPageRoute(builder: (BuildContext context) => ProfilePage()),
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
                  '인증코드를 입력해주세요!',
                  style: TextStyle(fontSize: 16),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Column(
              children: <Widget>[
                TextField(
                  controller: authenticode,
                  decoration: InputDecoration(
                    filled: true,
                    labelText: '인증코드',
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
                      '인증하기',
                      style: TextStyle(fontSize: 24),
                    ),
                    textColor: Colors.white,
                    color: Colors.blue,
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    //onPressed: send(),
                    onPressed: () async {
                      await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfilePage()));
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
