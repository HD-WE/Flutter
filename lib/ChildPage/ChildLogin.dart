import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../screen/ProfilePage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Bluetooth/main_2.dart';

class Childlogin extends StatefulWidget {
  @override
  _Childlogin createState() => _Childlogin();
}

class _Childlogin extends State<Childlogin> {
  bool _isLoading = false;

  final parents_code = TextEditingController();

  send() {
    signIn(parents_code.text);
  }

  signIn(String parents_code) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map data = {
      'parents_code': parents_code,
    };
    var jsonResponse = null;
    var response = await http.post("http://~~~~~/user/login_child", body: data);
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
                  '부모코드를 입력해주세요!',
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
                  controller: parents_code,
                  decoration: InputDecoration(
                    filled: true,
                    labelText: '부모코드',
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
                      '연결하기',
                      style: TextStyle(fontSize: 24),
                    ),
                    textColor: Colors.white,
                    color: Colors.blue,
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    //onPressed: send(), // TODO final code
                    onPressed: () async {
                      await Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MyApp()));
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
