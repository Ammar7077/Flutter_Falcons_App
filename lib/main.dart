import 'dart:async';

import 'package:ffalconsproject/resetPassword.dart';
import 'package:ffalconsproject/signIn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ffalconsproject/home.dart';
import 'package:ffalconsproject/signUp.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome to Flutter',
      home: Home(),
      routes: {
        'homePage':(context)=>Home(),
        'signIn': (context) =>SignIn(),
        'signUp':(context)=>SignUp(),
        'resetPassword':(context)=>ResetPassword(),
      },
    );
  }

  route(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
  }

  startTime(){
    var myDuration = new Duration(seconds: 2);
    return Timer(myDuration, route);
  }
}
