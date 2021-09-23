import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'main.dart';
import 'ListView/API.dart';
import 'ListView/User.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePage createState() => _ProfilePage();
}

class _ProfilePage extends State<ProfilePage> {
  var users = new List<User>();

  _getUsers() {
    API.getUsers().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        users = list.map((model) => User.fromJson(model)).toList();
      });
    });
  }

  initState() {
    super.initState();
    _getUsers();
  }

  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            SizedBox(height: 40.0),
            Row(
              children: <Widget>[
                ButtonTheme(
                  minWidth: 150,
                  height: 40,
                  child: FlatButton(
                    child: Text(
                      '로그아웃',
                      style: TextStyle(fontSize: 24),
                    ),
                    textColor: Colors.white,
                    color: Colors.red,
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    onPressed: () async {
                      await Navigator.push(context,
                          MaterialPageRoute(builder: (context) => FirstPage()));
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(12),
              child: Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '부모 코드',
                    ),
                  ),
                  SizedBox(
                    height: 36,
                  ),
                ],
              ),
            ),
            ListView.separated(
              padding: const EdgeInsets.all(8),
              itemCount: users.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  color: Color(0xeee0e0e0),
                  child: ListTile(
                    contentPadding: EdgeInsets.all(10),
                    //title: Text(entries[index]),
                    title: Text(users[index].name),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        SnackBar snackBar = SnackBar(
                          //content: Text("Color Removed :  ${entries[index]}"),
                          content: Text("Color Removed :  $users[index].name}"),
                          backgroundColor: Colors.blueGrey,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        setState(() {
                          users.removeAt(index);
                        });
                      },
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
            ),
            ButtonTheme(
              minWidth: 200,
              height: 40,
              child: FlatButton(
                child: Text(
                  '변경하기',
                  style: TextStyle(fontSize: 24),
                ),
                textColor: Colors.white,
                color: Colors.blue,
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(30.0)),
                onPressed: () async {
                  await Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ProfilePage()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
