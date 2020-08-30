import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:leo_app_uom/auth.dart';
import 'forgetPwd.dart';
import 'eventForm.dart';
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
                        validator: (val) =>
                            val.isEmpty ? 'Enter an email' : null,
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
                              }
                              else {
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
                ))));
  }
}
