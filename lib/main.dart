import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:moviles/sidebar/sidebar_layout.dart';

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
      home: SideBarLayout(),
    );
  }
}
