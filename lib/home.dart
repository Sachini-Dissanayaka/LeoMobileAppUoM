import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.all(30.0),
          color: Colors.white,
          child: SingleChildScrollView(
            child:Center(
              child: Column(children: [
            new Padding(padding: EdgeInsets.only(top: 25.0)),
            new Text(
              'All Events..',
              style: new TextStyle(
                  color: Colors.blue[900],
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold),
            ),
            new Padding(padding: EdgeInsets.only(top: 30.0)),
            
          ])))),
    );
  }
}

