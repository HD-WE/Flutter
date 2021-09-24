import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'dart:convert';

import 'main.dart';
import 'ListView/API.dart';
import 'ListView/User.dart';

/*Future<Album> fetchAlbum() async {
  final response =
      await http.get(Uri.parse('https://~~~~~/parents/info'));

  if (response.statusCode == 200) {
    return Album.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load parents code');
  }
}

class Album {
  final String parents_code;

  Album({
    this.parents_code,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      parents_code: json['parents_code'],
    );
  }
}*/
Future<Album> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

  if (response.statusCode == 200) {
    return Album.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

class Album {
  final int userId;
  final int id;
  final String title;

  Album({
    this.userId,
    this.id,
    this.title,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}

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
            Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    children: <Widget>[
                      Text('부모코드'),
                      SizedBox(
                        height: 36,
                      ),
                    ],
                  ),
                ),
                FutureBuilder<Album>(
                    future: futureAlbum,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Text(snapshot.data.title);
                      } else if (snapshot.hasError) {
                        return Text('${snapshot.error}');
                      }

                      return const CircularProgressIndicator();
                    }),
              ],
            ),
            //SizedBox(height: 20),
            //Container(
            //  padding: EdgeInsets.all(12),
            //  child: Column(
            //    children: <Widget>[
            //      Text('부모코드'),
            //      SizedBox(
            //        height: 36,
            //      ),
            //    ],
            //  ),
            //),

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
                        //ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
