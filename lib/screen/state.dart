import 'package:flutter/material.dart';
import 'package:mongsil/widgets/bottom_navigate_bar.dart';

class Main extends StatefulWidget {
  const Main({ Key key }) : super(key: key);
  
  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context,{
    String userName = "deft",
    userIcon = Icons.people,
    int stressData = 0,
    int movement = 0,
    int heartBeat = 0
  }) {
    return Scaffold(
      bottomNavigationBar: BottomNavigator(),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(userName),
              Icon(userIcon)
              ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                width: 300,
                height: 40,
                child: ListTile(
                  leading: Icon(Icons.favorite,color: Colors.red),
                  title: Text('Heart Beat'),
                  subtitle: Text('$heartBeat'),
                ),
              ),
              Container(
                width: 40,
                height: 40,
              )
            ]),
          ListTile(
            leading: Icon(Icons.warning_rounded),
            title: Text('Stress'),
            subtitle: Text('$stressData'),
          ),
          ListTile(
            leading: Icon(Icons.move_down),
            title: Text('Movement'),
            subtitle: Text('$movement'),
          )
        ],
      )
    );
  }
}