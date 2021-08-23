import 'dart:async';

import 'package:ffalconsproject/drawer.dart';
import 'package:flutter/material.dart';
import 'package:ffalconsproject/appColors.dart';
import 'package:toast/toast.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUp> {
  final emailController = TextEditingController();
  final reEnterEmailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  late bool circularProgress;

  @override
  void initState() {
    super.initState();
    startTime();
    setState(() {
      circularProgress = false;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    Container fillFunc(iconType, title, controlling) {
      return Container(
        padding: EdgeInsets.only(top: height * 0.02),
        width: width * 0.77,
        child: TextField(
          controller: controlling,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white38,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(25),
            ),
            prefixIcon: Icon(
              iconType,
              color: Colors.white,
            ),
            hintText: title,
            hintStyle: TextStyle(color: Colors.white60),
          ),
        ),
      );
    }

    SizedBox btn(title, btnColor, page) {
      return SizedBox(
        width: width * 0.77,
        child: ElevatedButton(
          onPressed: () {
            if (emailController.text.isEmpty ||
                passwordController.text.isEmpty ||
                nameController.text.isEmpty||
                reEnterEmailController.text.isEmpty) {
              Toast.show("Invalid Data", context,
                  duration: 3, backgroundColor: Colors.white24);
              return;
            }
            if (!emailController.text.contains('@') || !reEnterEmailController.text.contains('@')) {
              Toast.show("Invalid Email", context,
                  duration: 3, backgroundColor: Colors.white24);
              return;
            }
            if (passwordController.text.length < 6) {
              Toast.show("Invalid Password", context, duration: 3, backgroundColor: Colors.white24);
              return;
            } else {
              setState(() {
                circularProgress = true;
              });
              startTime();
              Navigator.of(context).pushReplacementNamed(page);
              Toast.show("Account Successfully Created", context, duration: 3, backgroundColor: Colors.white24);
            }

          },
          child: Text(
            title,
            style: TextStyle(
                fontSize: height * 0.023, fontWeight: FontWeight.w800),
          ),
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            padding: MaterialStateProperty.all(EdgeInsets.all(height * 0.02)),
            backgroundColor: MaterialStateProperty.all(btnColor),
          ),
        ),
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: height,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  AppColors().backgroundFirst,
                  AppColors().backgroundEnd,
                ]),
              ),
              child: Center(
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(top: height * 0.2),
                      child: Text(
                        "Sign up",
                        style: TextStyle(
                            fontSize: height * 0.07,
                            fontWeight: FontWeight.w800,
                            color: Colors.white),
                      ),
                    ),
                    fillFunc(Icons.person, "Full Name", nameController),
                    fillFunc(Icons.email, "Email", emailController),
                    fillFunc(Icons.email, "Re-enter your email", reEnterEmailController),
                    fillFunc(Icons.lock, "Password", passwordController),
                    //-----------------------------------------------btn--
                    Container(
                      padding:
                          EdgeInsets.only(right: width * 0.1, top: height * 0.03),
                      child: ButtonBar(
                        children: [
                          btn("Create", AppColors().myYellow, 'signIn'),
                          SizedBox(height: height * 0.03),
                          SizedBox(
                            width: width * 0.77,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pushReplacementNamed('signIn');
                              },
                              child: Text(
                                "Back",
                                style: TextStyle(
                                    fontSize: height * 0.023, fontWeight: FontWeight.w800),
                              ),
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                ),
                                padding: MaterialStateProperty.all(EdgeInsets.all(height * 0.02)),
                                backgroundColor: MaterialStateProperty.all(Colors.white38),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Visibility(
                visible: circularProgress,
                child: CircularProgressIndicator(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  route() {}

  startTime() {
    var myDuration = new Duration(seconds: 5);
    return Timer(myDuration, route);
  }
}
