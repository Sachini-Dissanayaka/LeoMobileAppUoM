import 'package:flutter/material.dart';
import 'signIn.dart';
import 'home.dart';
import 'Dashboard.dart';
import 'signUp.dart';
import 'adminLogin.dart';
import 'register.dart';

class NavHome extends StatefulWidget {
  @override
  _NavHomeState createState() => _NavHomeState();
}

class _NavHomeState extends State<NavHome> with SingleTickerProviderStateMixin {
  TabController _tabController;
  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Are you an admin?"),
          content: new Text("Only admins can create events"),
          actions: <Widget>[
            Row(
              children: <Widget>[
                FlatButton(
                  child: new Text("No", style: TextStyle(color: Colors.red,fontSize: 20)),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                SizedBox(width: 20),
                FlatButton(
                  child: new Text("Yes", style: TextStyle(color: Colors.green,fontSize: 20)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Reg()),
                    );
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (BuildContext context, bool boxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              title: Text('Leo Store'),
              pinned: true,
              floating: true,
              actions: <Widget>[
                PopupMenuButton<int>(
                  color: Colors.white,
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 1,
                      child: Text(name,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    PopupMenuItem(
                      value: 2,
                      child: Text(email,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    PopupMenuItem(
                      value: 3,
                      child: Row(children: <Widget>[
                        Icon(Icons.info, color: Colors.indigo),
                        SizedBox(width: 10),
                        Text(
                          "About Us",
                          style: TextStyle(
                              color: Colors.indigo,
                              fontWeight: FontWeight.bold),
                        )
                      ]),
                    ),
                    PopupMenuItem(
                      value: 4,
                      child: Row(children: <Widget>[
                        Icon(Icons.exit_to_app, color: Colors.red),
                        SizedBox(width: 10),
                        Text(
                          "Sign Out",
                          style: TextStyle(
                              color: Colors.red, fontWeight: FontWeight.bold),
                        )
                      ]),
                    ),
                  ],
                  initialValue: 1,
                  onCanceled: () {},
                  onSelected: (value) {
                    if (value == 4) {
                      signOutGoogle();
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) {
                        return LoginPage();
                      }), ModalRoute.withName('/'));
                    }
                  },
                  icon: Icon(Icons.list, size: 30),
                ),
              ],
              forceElevated: boxIsScrolled,
              bottom: TabBar(
                tabs: <Widget>[
                  Tab(
                    text: "Home",
                    icon: Icon(Icons.home),
                  ),
                  Tab(
                    text: "Dashboard",
                    icon: Icon(Icons.dashboard),
                  )
                ],
                controller: _tabController,
              ),
              backgroundColor: Colors.indigo[900],
            )
          ];
        },
        body: TabBarView(
          children: <Widget>[Home(), Dashboard()],
          controller: _tabController,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo[700],
        onPressed: () {
          _showDialog();
        },
        child: Icon(Icons.add),
        elevation: 2.0,
      ),
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
                        Icon(Icons.calendar_today, color: Colors.black),
                        Text(
                          "Calendar",
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
