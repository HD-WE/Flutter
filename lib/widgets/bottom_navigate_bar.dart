import 'package:flutter/material.dart';
import 'package:mongsil/screen/navigator.dart';

class BottomNavigator extends StatefulWidget {
  const BottomNavigator({ Key key }) : super(key: key);

  @override
  State<BottomNavigator> createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  int _currentIndex = 0;
  final List<Widget> _children = [Main(), UnionPage(), ProfilePage()];
  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.white.withOpacity(.60),
        selectedFontSize: 14,
        unselectedFontSize: 14,
        onTap: _onTap,
        currentIndex: _currentIndex,
        items: [
          new BottomNavigationBarItem(
            icon: Icon(Icons.home),
            //title: Text('Home'),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.login),
            //title: Text('Login'),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.people),
            //title: Text('Profile'),
          )
        ],
      ),
    );
  }
}