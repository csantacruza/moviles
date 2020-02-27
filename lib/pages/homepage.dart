import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:moviles/pages/chats.dart';
import 'package:moviles/pages/favorites.dart';
import 'package:moviles/pages/personalChat.dart';

import '../bloc_navigation/navigation_bloc.dart';

class Home extends StatefulWidget with NavigationStates {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool micro = true;
  bool chats = false;
  int _page = 0;
  GlobalKey _bottomNavKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    TextStyle _textStyle = Theme.of(context).textTheme.display1;
    final CurvedNavigationBarState navBarState = _bottomNavKey.currentState;
    Widget _chooseLash(int page) {
      switch (page) {
        case 0:
          return Favorites();
          break;
        case 1:
          return PersonalChat();
          break;
        case 2:
          return Chats();
          break;
      }

    }

    return Scaffold(
      // drawer: Drawer(child: Icon(Icons.person_pin,color: Colors.black,),elevation: 5.3,),
      // appBar: AppBar(
      //   centerTitle: true,
      //     title: Text("Unilago",
      //     style: _textStyle,),
      // ),
      body: _chooseLash(_page),
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavKey,
        items: [
          Icon(Icons.favorite),
          Icon(
            Icons.mic,
            color: micro == true ? Theme.of(context).accentColor : Colors.white,
          ),
          Icon(Icons.chat),
        ],
        color: Theme.of(context).primaryColor,
        backgroundColor: Colors.white,
        buttonBackgroundColor: micro == true
            ? Theme.of(context).buttonColor
            : Theme.of(context).buttonColor,
        height: 47.0,
        animationDuration: Duration(
          milliseconds: 300,
        ),
        animationCurve: Curves.fastLinearToSlowEaseIn,
        index: 1,
        onTap: (index) {
          if (index == 1) {
            setState(() {
              micro = true;
            });
          } else {
            setState(() {
              micro = false;
            });
          }
          setState(() {
            _page = index;
          });
        },
      ),
    );
  }
}
