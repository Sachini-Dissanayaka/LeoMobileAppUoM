import 'dart:ui';
import 'package:flutter/material.dart';
import 'signUp.dart';
import 'signIn.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('TravelME'),
        backgroundColor: Colors.green[900],
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              new Text(
                'My Profile',
                style: new TextStyle(
                    color: Colors.green,
                    fontSize: 35.0,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 40),
              CircleAvatar(
                backgroundImage: NetworkImage(
                  imageUrl,
                ),
                radius: 50,
                backgroundColor: Colors.transparent,
              ),
              SizedBox(height: 30),
              Text(
                'NAME',
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54),
              ),
              SizedBox(height: 5),
              Text(
                name,
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 25),
              Text(
                'EMAIL',
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54),
              ),
              SizedBox(height: 5),
              Text(
                email,
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 30),
              RaisedButton(
                onPressed: () {
                  signOutGoogle();
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) {
                    return LoginPage();
                  }), ModalRoute.withName('/'));
                },
                color: Colors.grey,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Sign Out',
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ),
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
