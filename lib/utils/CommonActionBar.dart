import 'package:flutter/material.dart';

class ActionBar extends StatelessWidget {
  final String title;
  ActionBar({this.title, bool shoBack});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      color: Color(0xff1C202C),
      child: Row(
        children: <Widget>[
          IconButton(icon:Icon(Icons.arrow_back, color: Colors.white,),
            onPressed:() => Navigator.pop(context, false),
          ),
          SizedBox(
            width: 20,
          ),
          Text("${title}", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),)
        ],

      ),
    );
  }
}
