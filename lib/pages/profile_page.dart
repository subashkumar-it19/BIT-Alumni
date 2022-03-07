import 'package:bit_alumni/HomeScreen.dart';
import 'package:bit_alumni/pages/help.dart';
import 'package:bit_alumni/pages/widgets/Jobadd.dart';
import 'package:bit_alumni/pages/widgets/Jobadd1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bit_alumni/pages/login_page.dart';
import 'package:bit_alumni/pages/splash_screen.dart';
import 'package:bit_alumni/pages/widgets/Jobadd.dart';
import 'Menu.dart';
import 'forgot_password_page.dart';
import 'forgot_password_verification_page.dart';
import 'registration_page.dart';
import 'alumni.dart';
import 'help.dart';
import 'jobs.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:bit_alumni/grid_search.dart';

import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentPage = 0;

  GlobalKey bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: mounted,
        title: Text("BIT Alumni"),
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Center(
          child: _getPage(currentPage),
        ),
      ),
      bottomNavigationBar: FancyBottomNavigation(
        tabs: [
          TabData(
              iconData: Icons.home,
              title: "Home",
              onclick: () {
                final FancyBottomNavigationState fState = bottomNavigationKey
                    .currentState as FancyBottomNavigationState;
                fState.setPage(2);
              }),
          TabData(
              iconData: Icons.work,
              title: "Job",
              onclick: () {
                final FancyBottomNavigationState fState = bottomNavigationKey
                    .currentState as FancyBottomNavigationState;
                fState.setPage(2);
              }),
          TabData(
              iconData: Icons.search,
              title: "Search",
              onclick: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ))),
          // TabData(
          //     iconData: Icons.notifications,
          //     title: "Notification",
          //     onclick: () {
          //       final FancyBottomNavigationState fState = bottomNavigationKey
          //           .currentState as FancyBottomNavigationState;
          //       fState.setPage(2);
          //     }),
          // TabData(iconData: Icons.help, title: "Help")
        ],
        initialSelection: 0,
        key: bottomNavigationKey,
        onTabChangedListener: (position) {
          setState(() {
            currentPage = position;
          });
        },
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[Text(""), Text("")],
        ),
      ),
    );
  }

  _getPage(int page) {
    switch (page) {
      case 0:
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Welcome Subashkumar',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey),
            ),
            SizedBox(height: 30.0),
            Container(
              padding: const EdgeInsets.only(left: 8.0, bottom: 4.0),
              alignment: Alignment.center,
              child: Text(
                "Profile",
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Card(
              child: Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.all(15),
                child: Column(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        ...ListTile.divideTiles(
                          color: Colors.grey,
                          tiles: [
                            ListTile(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 4),
                              leading: Icon(Icons.cast_for_education_rounded),
                              title: Text("Department"),
                              subtitle: Text("Information technology"),
                            ),
                            ListTile(
                              leading: Icon(Icons.email),
                              title: Text("Email"),
                              subtitle: Text("subashkumar1359@.com"),
                            ),
                            ListTile(
                              leading: Icon(Icons.date_range),
                              title: Text("Date of Birth"),
                              subtitle: Text("03/11/2001"),
                            ),
                            ListTile(
                              leading: Icon(Icons.phone),
                              title: Text("Phone"),
                              subtitle: Text("+917397433722"),
                            ),
                            ListTile(
                              leading: Icon(Icons.work_rounded),
                              title: Text("Job"),
                              subtitle: Text("Paypal"),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        );
      case 1:
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(""),
            RaisedButton(
              child: Text(
                "Create new job",
                style: TextStyle(color: Colors.white),
              ),
              color: Theme.of(context).primaryColor,
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Myjob1()));
              },
            )
          ],
        );
      case 2:
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("This is the search page"),
            RaisedButton(
                child: Text(
                  "Start",
                  style: TextStyle(color: Colors.white),
                ),
                color: Theme.of(context).primaryColor,
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => HomePage(),
                    )))
          ],
        );
      // case 3:
      //   return Column(
      //     mainAxisSize: MainAxisSize.min,
      //     children: <Widget>[
      //       Text("This is the notification page"),
      //       RaisedButton(
      //         child: Text(
      //           "Start new page",
      //           style: TextStyle(color: Colors.white),
      //         ),
      //         color: Theme.of(context).primaryColor,
      //         onPressed: () {},
      //       )
      //     ],
      //   );
      // case 4:
      //   return Column(
      //     mainAxisSize: MainAxisSize.min,
      //     children: <Widget>[
      //       Text("This is the help page"),
      //       RaisedButton(
      //         child: Text(
      //           "Start new page",
      //           style: TextStyle(color: Colors.white),
      //         ),
      //         color: Theme.of(context).primaryColor,
      //         onPressed: () {},
      //       )
      //     ],
      //   );
    }
  }
}
