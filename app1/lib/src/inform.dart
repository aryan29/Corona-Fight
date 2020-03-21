import 'package:flutter/material.dart';

class Inform extends StatefulWidget {
  Inform({Key key}) : super(key: key);

  @override
  _InformState createState() => _InformState();
}

class _InformState extends State<Inform> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Inform About Corona Virus Suspects")),
      body:Container(
        padding: const EdgeInsets.all(15),
        color: Theme.of(context).primaryColor,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            FloatingActionButton(onPressed: (){
              //Request to Get a Person Checked Upon
            },),
            FloatingActionButton(onPressed: (){
              //Request a Distress Signal After taking Readings of Temperature and Other Things
            },),
            FloatingActionButton(onPressed: (){
              //View Heat Map of Correntine Peoples
              //Have to add a web view for a particular html file on our server
            },),
          ],
          )
      )
    );
  }
}
