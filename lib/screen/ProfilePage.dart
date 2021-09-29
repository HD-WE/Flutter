import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import '../main.dart';
import '../ListView/API.dart';
import '../ListView/User.dart';
import '../Api/GetParentsCode.dart';
import '../Api/PostRemoveChild.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePage createState() => _ProfilePage();
}

class _ProfilePage extends State<ProfilePage> {
  Future<Album> futureAlbum;
  var users = new List<User>();

  @override
  void initState() {
    super.initState();
    _getUsers();
    futureAlbum = fetchAlbum();
  }

  _getUsers() {
    API.getUsers().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        users = list.map((model) => User.fromJson(model)).toList();
      });
    });
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
            SizedBox(height: 15.0),
            Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text('부모코드'),
                      )
                    ],
                  ),
                ),
                FutureBuilder<Album>(
                    future: futureAlbum,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Center(
                            child: Text(
                              "Moon2304",
                              //snapshot.data.title,
                              //snapshot.data.parents_code // TODO final code
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return Text('${snapshot.error}');
                      }
                      return const CircularProgressIndicator();
                    }),
              ],
            ),
            SizedBox(height: 30.0),
            ListView.separated(
              padding: const EdgeInsets.all(8),
              itemCount: users.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  color: Color(0xeee0e0e0),
                  child: ListTile(
                    contentPadding: EdgeInsets.all(10),
                    title: Text(users[index].name),
                    trailing: IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        //postRemoveChild(users[index].name); // TODO final code
                        SnackBar snackBar = SnackBar(
                          content: Text("Color Removed :  $users[index].name}"),
                          backgroundColor: Colors.blueGrey,
                        );
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
