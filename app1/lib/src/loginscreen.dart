import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
final myController_name = TextEditingController();
final myController_pass = TextEditingController();

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  dologin(String a, String b) async {
    Map<String, String> mp = {
      "email": a,
      "pass": b,
    };
    var body = jsonEncode(mp);
    var res = await http.post("http://192.168.0.107:5000/login",
        headers: {
          "accept": "application/json",
          "content-type": "application/json"
        },
        body: body);
    print(res.statusCode);
    Map<String, dynamic> fl;
    fl = jsonDecode(res.body);
    fl = fl["loggedin"];
    if (fl == 1) {
      print("Logged in Successfully");
      //Dispay You are Successfully Registered
    } else {
      print("Not Logged in Successfully");
      //You are not registered successfully
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        color: Theme.of(context).primaryColor,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            //Here Add Our Logo Image
            Image.asset(
              'assets/images.jpeg',
              height: 130,
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: myController_name,
              style: TextStyle(fontSize: 18, color: Colors.black54),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Email',
                contentPadding: const EdgeInsets.all(15),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(5),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: myController_pass,
              obscureText: true,
              style: TextStyle(fontSize: 18, color: Colors.black54),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Password',
                contentPadding: const EdgeInsets.all(15),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(5),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            FlatButton(
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                shape: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 2),
                  borderRadius: BorderRadius.circular(5),
                ),
                padding: const EdgeInsets.all(15),
                textColor: Colors.white,
                onPressed: () {
                  return dologin(
                      myController_name.text, myController_pass.text);
                }),
          ],
        ),
      ),
    );
  }
}
