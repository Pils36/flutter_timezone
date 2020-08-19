// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:myapp/page_one.dart';
import 'package:myapp/page_two.dart';
import 'package:myapp/page_three.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cuppy Kart',
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

// Run splash screen
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 5), () => Home());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.purpleAccent),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 50.0,
                        child: Icon(
                          Icons.shopping_basket,
                          color: Colors.purple,
                          size: 50.0,
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 10.0)),
                      Text(
                        "Cuppy Kart",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(
                      backgroundColor: Colors.white,
                    ),
                    Padding(padding: EdgeInsets.only(top: 20.0)),
                    Text(
                      "Shopping made Easy!",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
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
      child: Text('Shop'),
    ),
    Center(
      child: Text('Products'),
    ),
    Center(
      child: Text('Profile'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cuppy Kart'),
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
        child: Icon(Icons.add_shopping_cart),
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
              icon: Icon(Icons.shopping_basket),
              title: Text('Shop'),
              backgroundColor: Colors.deepPurple),
          BottomNavigationBarItem(
              icon: Icon(Icons.card_giftcard),
              title: Text('Products'),
              backgroundColor: Colors.deepPurple),
          BottomNavigationBarItem(
              icon: Icon(Icons.perm_identity),
              title: Text('Profile'),
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
