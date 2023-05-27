import 'package:flutter/material.dart';
import 'dart:async';
import 'package:light/light.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _lightString = 'Unknown';
  Color _backgroundColor = Colors.white;
  Color _textColor = Colors.black;
  late Light _light;
  late StreamSubscription _subscription;
  int _currentLightValue = 0;

  void onData(int lightvalue) {
    //print("Lux value: $lightvalue");
    setState(() {
      _currentLightValue = lightvalue;
      if (lightvalue <= 10) {
        // low light, use light text on dark background
        _backgroundColor = Colors.black;
        _textColor = Colors.white;
      } else {
        // high light, use dark text on light background
        _backgroundColor = Colors.white;
        _textColor = Colors.black;
      }
      _lightString = lightvalue.toString();
    });
  }

  void stopListening() {
    _subscription.cancel();
  }

  void startListening() {
    _light = Light();
    try {
      _subscription = _light.lightSensorStream.listen(onData);
    } on LightException catch (exception) {
      print(exception);
    }
  }

  @override
  void initState() {
    super.initState();
    initPlatformState();
    onData(_currentLightValue);
  }

  Future<void> initPlatformState() async {
    startListening();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'App Lighting ',
            style: TextStyle(
              color: _textColor, // set text colour
            ),
          ),
          backgroundColor: _backgroundColor, // set background colour
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Hello in our Application. This application that show some text over a certain plain coloured background. But the text cooler and background colour is adjusted by the level of light around. \n',
                  style: TextStyle(
                    color: _textColor,
                    backgroundColor: _backgroundColor, // set text colour
                  ),
                ),
              ),
              Container(
                child: Text(
                  'Light value: $_lightString\n',
                  style: TextStyle(
                    color: _textColor,
                    backgroundColor: _backgroundColor, // set text colour
                  ),
                ),
              ),
            ],
          ),
          // set background colour
        ),
      ),
    );
  }
}
