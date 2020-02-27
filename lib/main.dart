import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool micro = false;
  int _page = 0;
  GlobalKey _bottomNavKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("This is ${_page.toString()}",
              textScaleFactor: 10.0,
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              RaisedButton(
                  child:Text("Go to page of index 1"),
                  onPressed: (){
                    final CurvedNavigationBarState navBarState = _bottomNavKey.currentState;
                    navBarState.setPage(1);
                  },
                ),
            ],
          ),
        ),
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavKey,
          items: [
            Icon(Icons.menu),
            Icon(Icons.mic,color: micro==true ? Colors.white:Colors.black,),
            Icon(Icons.keyboard),
          ],
          color: Colors.deepPurpleAccent,
          backgroundColor: Colors.white,
          buttonBackgroundColor: micro==true 
          ? Colors.blue[900]
          : Colors.blue[100],
          height: 47.0,
          animationDuration: Duration(
            milliseconds: 300,
          ),
          animationCurve: Curves.fastLinearToSlowEaseIn,
          index: 1,
          onTap: (index) {
            if (index == 1) {
              setState((){micro = true;});
            } else {
              setState((){micro = false;});
            }

            setState(() {
              _page = index;
            });

          },
        ),
      ),
    );
  }
}
