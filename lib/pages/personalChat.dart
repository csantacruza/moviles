import 'package:flutter/material.dart';
import 'package:moviles/bloc_navigation/navigation_bloc.dart';

class PersonalChat extends StatefulWidget with NavigationStates {
  PersonalChat({Key key}) : super(key: key);

  @override
  _PersonalChatState createState() => _PersonalChatState();
}

class _PersonalChatState extends State<PersonalChat> {
  @override
  Widget build(BuildContext context) {
    final screenHeigth = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Center(
      child: Container(
        height: screenHeigth,
        width: screenWidth,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: screenHeigth * 0.7,
            ),
            Expanded(
              flex: 3,
              child: TextField(
                  decoration: InputDecoration(
                    hintText: "Escribe un mensaje",
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 3.0)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.indigo, width: 3.0)),
                  ),
                ),
            ),
          ],
        ),
      ),
    );
  }
}
