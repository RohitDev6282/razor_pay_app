import 'package:flutter/material.dart';
import 'package:razor_pay_app/homepage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: RaisedButton(
      color: Colors.red,
      child:
          Text("Login", style: TextStyle(fontSize: 18, color: Colors.white54)),
      onPressed: () {
        Navigator.push(
            context, new MaterialPageRoute(builder: (context) => HomePage()));
      },
    )));
  }
}
