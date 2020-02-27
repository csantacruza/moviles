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
    return Center(
      child: Container(
        child: Text("Personal Chat"),
      ),
    );
  }
}
