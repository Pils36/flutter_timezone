// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clock',
      home: Home(),
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
      child: Container(
        margin: const EdgeInsets.all(10.0),
        color: Colors.blue[300],
        width: 48.0,
        height: 48.0,
      ),
    ),
    Center(
      child: Container(
        margin: const EdgeInsets.all(10.0),
        color: Colors.blue[300],
        width: 48.0,
        height: 48.0,
      ),
    ),
    Center(
      child: Container(
        margin: const EdgeInsets.all(10.0),
        color: Colors.blue[300],
        width: 48.0,
        height: 48.0,
      ),
    ),
    Center(
      child: Container(
        margin: const EdgeInsets.all(10.0),
        color: Colors.blue[300],
        width: 48.0,
        height: 48.0,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clock'),
        centerTitle: false,
        backgroundColor: Colors.blue[700],
      ),
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
              backgroundColor: Colors.blue[700]),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              title: Text('Search'),
              backgroundColor: Colors.blue[700]),
          BottomNavigationBarItem(
              icon: Icon(Icons.location_on),
              title: Text('Location'),
              backgroundColor: Colors.blue[700]),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text('Settings'),
              backgroundColor: Colors.blue[700]),
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
