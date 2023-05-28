import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int teamA = 0;
  int teamB = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Basketball points counter"),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 6,
            child: Row(
              children: [
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Team A",
                      style: TextStyle(fontSize: 25),
                    ),
                    Text(
                      "$teamA",
                      style: TextStyle(fontSize: 25),
                    ),
                    Container(
                      color: Colors.blue,
                      child: MaterialButton(
                          child: Text("+1 POINT"),
                          onPressed: () {
                            setState(() {
                              teamA += 1;
                            });
                          }),
                    ),
                    Container(
                      color: Colors.blue,
                      child: MaterialButton(
                          child: Text("+2 POINT"),
                          onPressed: () {
                            setState(() {
                              teamA += 2;
                            });
                          }),
                    ),
                    Container(
                      color: Colors.blue,
                      child: MaterialButton(
                          child: Text("+3 POINT"),
                          onPressed: () {
                            setState(() {
                              teamA += 3;
                            });
                          }),
                    )
                  ],
                )),
                VerticalDivider(
                  thickness: 7,
                  color: Colors.black,
                ),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Team B",
                      style: TextStyle(fontSize: 25),
                    ),
                    Text(
                      "$teamB",
                      style: TextStyle(fontSize: 25),
                    ),
                    Container(
                      color: Colors.blue,
                      child: MaterialButton(
                          child: Text("+1 POINT"),
                          onPressed: () {
                            setState(() {
                              teamB += 1;
                            });
                          }),
                    ),
                    Container(
                      color: Colors.blue,
                      child: MaterialButton(
                          child: Text("+2 POINT"),
                          onPressed: () {
                            setState(() {
                              teamB += 2;
                            });
                          }),
                    ),
                    Container(
                      color: Colors.blue,
                      child: MaterialButton(
                          child: Text("+3 POINT"),
                          onPressed: () {
                            setState(() {
                              teamB += 3;
                            });
                          }),
                    )
                  ],
                ))
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    color: Colors.blue,
                    child: MaterialButton(
                        child: Text("RESET"),
                        onPressed: () {
                          setState(() {
                            teamA = 0;
                            teamB = 0;
                          });
                        }),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
