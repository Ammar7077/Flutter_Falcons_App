import 'dart:async';

import 'package:ffalconsproject/appProvider.dart';
import 'package:ffalconsproject/resetPassword.dart';
import 'package:ffalconsproject/signIn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ffalconsproject/home.dart';
import 'package:ffalconsproject/signUp.dart';
import 'package:provider/provider.dart';
import 'appProvider.dart';

import 'testApp.dart';

// Ammar Omari 20180877

void main() => MyApp();

class MyApp extends StatelessWidget {
  // const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: ChangeNotifierProvider<MyProvider>(
        create: (_)=> MyProvider(),
        child: MainPage(),
      ),
      routes: {
        'homePage':(context)=>Home(),
        'signIn': (context) =>SignIn(),
        'signUp':(context)=>SignUp(),
        'resetPassword':(context)=>ResetPassword(),
      },

    );
  }

}


class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final emailController =TextEditingController();
  final passwordController = TextEditingController();


  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Container(
          child: Image.asset("Images/logo.png",width: 80,height: 80,),
        ),
      ),
    );
  }

  route(){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>SignIn()));
  }

  startTime(){
    var myDuration = new Duration(seconds: 2);
    return Timer(myDuration, route);
  }
}
