import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:http/http.dart' as http;
import 'package:location/location.dart' as loc;
import 'package:google_api_availability/google_api_availability.dart';
import 'package:geolocator/geolocator.dart';
import 'src/loginscreen.dart';
import 'src/signupscreen.dart';

String lat, lon;
Future<String> getpos() async {
  String _placeMark;
  print("Coming to Location Marker1");
  try {
    Geolocator geoLocator = Geolocator()..forceAndroidLocationManager = true;
    print(geoLocator
      ..isLocationServiceEnabled().then((val) {
        print(val);
      }));
    var _position = await geoLocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    print(_position.latitude);
    print("Going from loca marker");
    lat = "${_position.latitude}";
    lon = "${_position.longitude}";
    return _placeMark = "${_position.latitude}\n${_position.longitude}";
  } catch (e) {
    print("Some error is occuring");
  }
}

Future<dynamic> printHello() async {
  try {
    var x = await getpos();
    var url = 'http://192.168.0.107:5000/';
    Map<String, String> data = {"lat": lat, "lon": lon};
    var body = jsonEncode(data);
    var response = await http.post(url,
        headers: {
          "accept": "application/json",
          "content-type": "application/json"
        },
        body: body);
    print('Response status: ${response.statusCode}');
  } catch (e) {
    print("Error occuring again and again");
    print(e);
  }
  // print('Response body: ${response.body}');
}

Future<void> sendphoto() {
//Seding Photo to server
}

void main() {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    AndroidAlarmManager.initialize();
    runApp(MyApp());
    AndroidAlarmManager.periodic(const Duration(minutes: 1), 1, printHello);
  } catch (e) {
    print("Error Occuring at place 2");
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SignupScreen();
    // This trailing comma makes auto-formatting nicer for build methods
  }
}
