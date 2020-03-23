import 'package:cma/self_report.dart';
import 'package:flutter/material.dart';
import 'self_report.dart';
import 'package:convert/convert.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
            child: Text('Home',
                style: TextStyle(fontSize: 25, color: Colors.white))),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SelfReport()),
                );
              }),
        ],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Card(
              color: Color.fromARGB(250, 252, 108, 35),
              margin: EdgeInsets.all(20.0),
              elevation: 0.0,
              child: Container(
                height: 100.0,
                width: 500,
                child: InkWell(
                  splashColor: Colors.black45,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SelfReport()),
                    );
                  },
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          'Self-Report',
                          style: TextStyle(fontSize: 40, color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      // SizedBox(height:10.0),
                      SizedBox(
                        child: Text(
                          "Request for a check-up if you were present in dense area",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // RaisedButton(onPressed:(){
            //    Navigator.push(
            //           context,
            //           MaterialPageRoute(
            //               builder: (context) => GetUpdate()),
            //         );
            // }
          ],
        ),
      ),
    );
  }
}
