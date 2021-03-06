import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:leo_app_uom/auth.dart';
import 'forgetPwd.dart';
import 'eventForm.dart';
import 'headHome.dart';
import 'package:url_launcher/url_launcher.dart';

class Admin extends StatefulWidget {
  @override
  _AdminState createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  final firestoreInstance = Firestore.instance;

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String error = "";

  final String phone = 'tel:';

  _callPhone() async {
    if (await canLaunch(phone)) {
      await launch(phone);
    } else {
      throw 'Could not Call Phone';
    }
  }

  void _launchMapsUrl() async {
    final url = 'https://maps.google.lk/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Leo Store'),
        backgroundColor: Colors.indigo[900],
      ),
      body: Container(
          padding: EdgeInsets.all(10),
          child: Form(
              key: _formKey,
              child: ListView(
                children: <Widget>[
                   SizedBox(height: 30),
                  Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(30.0),
                      child: Text(
                        'Admin Login',
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w500,
                            fontSize: 30),
                      )),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: TextFormField(
                      controller: nameController,
                      validator: (val) => val.isEmpty ? 'Enter an email' : null,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email Address',
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: TextFormField(
                      obscureText: true,
                      controller: passwordController,
                      validator: (val) => val.length < 6
                          ? 'Enter a password 6+ chars long'
                          : null,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                      ),
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ForgetPwd()),
                      );
                    },
                    textColor: Colors.blue,
                    child: Text('Forgot Password'),
                  ),
                  Container(
                      height: 50,
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: RaisedButton(
                        textColor: Colors.white,
                        color: Colors.blue,
                        child: Text('Login'),
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            dynamic result =
                                await _auth.signInWithEmailAndPassword(
                                    nameController.text,
                                    passwordController.text);
                            if (result == null) {
                              setState(() {
                                error =
                                    'Could not sign in with those credentials';
                              });
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Event()),
                              );
                            }
                          }
                        },
                      )),
                  SizedBox(height: 12.0),
                  Text(
                    error,
                    style: TextStyle(color: Colors.red, fontSize: 14.0),
                  ),
                ],
              ))),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: SizedBox(
                height: 60,
                child: Material(
                  type: MaterialType.transparency,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NavHome()),
                      );
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.home, color: Colors.black),
                        Text(
                          "Home",
                          style: TextStyle(color: Colors.black54),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                height: 60,
                child: Material(
                  type: MaterialType.transparency,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NavHome()),
                      );
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.people, color: Colors.black),
                        Text(
                          "Admin",
                          style: TextStyle(color: Colors.black54),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                height: 60,
                child: Material(
                  type: MaterialType.transparency,
                  child: InkWell(
                    onTap: _callPhone,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.phone, color: Colors.black),
                        Text(
                          "Call",
                          style: TextStyle(color: Colors.black54),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                height: 60,
                child: Material(
                  type: MaterialType.transparency,
                  child: InkWell(
                    onTap: _launchMapsUrl,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.map, color: Colors.black),
                        Text(
                          "Map",
                          style: TextStyle(color: Colors.black54),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        shape: CircularNotchedRectangle(),
        color: Colors.white,
      ),
    );
  }
}
