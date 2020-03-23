import 'dart:convert';
import 'dart:ffi';
import 'location_detection.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:convert/convert.dart';

class SelfReport extends StatefulWidget {
  @override
  _SelfReportState createState() => _SelfReportState();
}

class _SelfReportState extends State<SelfReport> {
  final formKey = GlobalKey<FormState>();
  String _symptoms, _duration, _contact, _name, _age;
  Double longitude, latitude;
  Map<String, double> _location = {
    'latitude': 0.0,
    'longitude': 0.0,
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
      ),
      resizeToAvoidBottomPadding: false,
      body: Container(
          padding: EdgeInsets.all(10.0),
          child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(height: 24.0),
                  TextFormField(
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      filled: true,
                      hintText: "Your name",
                      labelText: "Name",
                    ),
                    onSaved: (val) {
                      _name = val;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      filled: true,
                      hintText: "your age",
                      labelText: "Age",
                    ),
                    onSaved: (val) {
                      _age = val;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      filled: true,
                      hintText: "(if any)",
                      labelText: "Symptoms",
                    ),
                    onSaved: (val) {
                      _symptoms = val;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      filled: true,
                      hintText: "how long you been there ",
                      labelText: "Duration",
                    ),
                    onSaved: (val) {
                      _duration = val;
                    },
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        'Latitude: ${_location['latitude']}, Longitude: ${_location['longitude']}',
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      RaisedButton(
                        textColor: Colors.white,
                        color: Colors.lightBlue,
                        padding: EdgeInsets.fromLTRB(9, 9, 9, 9),
                        splashColor: Colors.grey,
                        child: Text(
                          'Get location',
                        ),
                        onPressed: () {
                          FetchLocation().returnLocation().then((result) {
                            print(result);
                            setState(() {
                              _location = result;
                            });
                          });
                        },
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  RaisedButton(
                      textColor: Colors.white,
                      color: Colors.lightBlue,
                      padding: EdgeInsets.fromLTRB(9, 9, 9, 9),
                      splashColor: Colors.grey,
                      child: Text("Search"),
                      onPressed: () async {
                        formKey.currentState.save();
                        print(
                            'request generated, name= $_name, age= $_age, contact= $_contact, symptoms= $_symptoms, duration= $_duration , Latitude: ${_location['latitude']}, Longitude: ${_location['longitude']}');
                        Map requirementData = {
                          'name': _name,
                          'age': _age,
                          'contact': _contact,
                          'symptoms': _symptoms,
                          'duration': _duration,
                          'location': _location,
                        };
                        var jsonRequirementData = jsonEncode(requirementData);
                        print(jsonRequirementData);
                        Response response = await post(
                          "http://httpbin.org/post",
                          body: jsonRequirementData,
                        );
                        print(response.body);
                        print(response.statusCode);
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) =>
                        //             ResultDisplay(json.decode(response.body))));
                      })
                ],
              ))),
    );
  }
}
