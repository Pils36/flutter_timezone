// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:myapp/page_one.dart';
import 'package:myapp/page_two.dart';
import 'package:myapp/page_three.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clock',
      home: Home(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      routes: <String, WidgetBuilder>{
        "/a": (BuildContext context) => new PageOne("Page One"),
        "/b": (BuildContext context) => new PageTwo("Page Two"),
        "/c": (BuildContext context) => new PageThree("Page Three"),
      },
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  final tabs = [
    Center(
      child: Text('Home'),
    ),
    Center(
      child: Text('Search'),
    ),
    Center(
      child: Text('Location'),
    ),
    Center(
      child: Text('Settings'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter UI'),
        elevation: defaultTargetPlatform == TargetPlatform.android ? 5.0 : 0.0,
        centerTitle: false,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Adebambo Pils"),
              accountEmail: Text("pils36@flutter.dev"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text("A"),
              ),
            ),
            ListTile(
              title: Text("Page One"),
              trailing: Icon(Icons.arrow_drop_up),
              onTap: () => Navigator.of(context).pushNamed("/a"),
            ),
            Divider(),
            ListTile(
              title: Text("Page Two"),
              trailing: Icon(Icons.arrow_drop_up),
              onTap: () => Navigator.of(context).pushNamed("/b"),
            ),
            Divider(),
            ListTile(
              title: Text("Page Three"),
              trailing: Icon(Icons.arrow_drop_up),
              onTap: () => Navigator.of(context).pushNamed("/c"),
            ),
            Divider(),
            ListTile(
              title: Text("Close"),
              trailing: Icon(Icons.close),
              onTap: () => {Navigator.of(context).pop()},
            ),
          ],
        ),
      ),
      body: SafeArea(child: tabs[_currentIndex]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.access_time),
        backgroundColor: Colors.deepPurple,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
              backgroundColor: Colors.deepPurple),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              title: Text('Search'),
              backgroundColor: Colors.deepPurple),
          BottomNavigationBarItem(
              icon: Icon(Icons.location_on),
              title: Text('Location'),
              backgroundColor: Colors.deepPurple),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text('Settings'),
              backgroundColor: Colors.deepPurple),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
