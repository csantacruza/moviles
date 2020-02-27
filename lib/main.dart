import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_inner_drawer/inner_drawer.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xff4D0084),
        accentColor: Color(0xff852EAD),
        buttonColor: Color(0xff7ACEEF),
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        appBarTheme: AppBarTheme(
          elevation: 5.0,
          color: Color(0xff4D0084),
        ),
        fontFamily: 'Roboto',
      ),
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
  bool micro = true;
  int _page = 0;
  GlobalKey _bottomNavKey = GlobalKey();
  bool _swipe = false;


  @override
  Widget build(BuildContext context) {

    TextStyle _textStyle = Theme.of(context).textTheme.display1; 
    
    return Scaffold(
        drawer: Drawer(child: Icon(Icons.person_pin,color: Colors.black,),elevation: 5.3,),
        appBar: AppBar(
          centerTitle: true,
            title: Text("Unilago",
            style: _textStyle,),
        ),
        body: Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                _page.toString(),
                textScaleFactor: 5.0,
                style: TextStyle(fontFamily: 'Ovo'),
              ),
              RaisedButton(
                child: Text(
                  "Go to page of index 1",
                ),
                onPressed: () {
                  final CurvedNavigationBarState navBarState =
                      _bottomNavKey.currentState;
                  navBarState.setPage(1);
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavKey,
          items: [
            Icon(Icons.favorite),
            Icon(
              Icons.mic,
              color: micro == true ? Theme.of(context).accentColor : Colors.white,
            ),
            Icon(Icons.keyboard),
          ],
          color: Theme.of(context).primaryColor,
          backgroundColor: Colors.white,
          buttonBackgroundColor:
              micro == true ? Theme.of(context).buttonColor : Theme.of(context).buttonColor,
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
