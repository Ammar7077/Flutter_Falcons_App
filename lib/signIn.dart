import 'dart:async';

import 'package:ffalconsproject/home.dart';
import 'package:flutter/material.dart';
import 'package:ffalconsproject/appColors.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:toast/toast.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignIn> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
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
                passwordController.text.isEmpty) {
              Toast.show("Invalid Data", context,
                  duration: 3, backgroundColor: Colors.white24);
              return;
            }
            if (!emailController.text.contains('@')) {
              Toast.show("Invalid Email", context,
                  duration: 3, backgroundColor: Colors.white24);
              return;
            }
            if (passwordController.text.length < 6) {
              Toast.show("Invalid Password", context,
                  duration: 3, backgroundColor: Colors.white24);
              return;
            } else {
              setState(() {
                circularProgress = true;
              });
              startTime();
              Navigator.of(context).pushReplacementNamed(page);
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
                      padding: EdgeInsets.only(top: height * 0.07),
                      child: Image.asset(
                        "Images/logo.png",
                        width: width * 0.2,
                        height: height * 0.2,
                      ),
                    ),
                    Container(
                      child: Text(
                        "Sign in",
                        style: TextStyle(
                            fontSize: height * 0.07,
                            fontWeight: FontWeight.w800,
                            color: Colors.white),
                      ),
                    ),
                    fillFunc(Icons.email, "Email", emailController),
                    fillFunc(Icons.lock, "Password", passwordController),
                    //-----------------------------------------------btn--
                    Container(
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.only(right: height * 0.08),
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacementNamed('resetPassword');
                        },
                        child: Text(
                          "Forget Password?",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          right: width * 0.1, top: height * 0.009),
                      child: ButtonBar(
                        children: [
                          btn("Login", AppColors().myYellow, 'homePage'),
                          SizedBox(
                            height: height * 0.03,
                          ),
                      SizedBox(
                        width: width * 0.77,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacementNamed('signUp');
                          },
                          child: Text(
                            "Create new account",
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
                    Container(
                      padding: EdgeInsets.only(top: height * 0.03),
                      child: Text("Login With",
                          style: TextStyle(
                              fontSize: height * 0.023,
                              fontWeight: FontWeight.w800,
                              color: Colors.white)),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: width * 0.4),
                      child: Row(
                        children: [
                          Image.asset(
                            "Images/facebook.png",
                            height: height * 0.09,
                            width: width * 0.09,
                            color: Colors.grey,
                          ),
                          Container(
                              padding: EdgeInsets.only(left: width * 0.02),
                              child: Image.asset(
                                "Images/google.png",
                                width: width * 0.09,
                                color: Colors.grey,
                              )),
                        ],
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
            ),
          ],
        ),
      ),
    );
  }

  State<StatefulWidget> createState() {
    throw UnimplementedError();
  }

  route() {}

  startTime() {
    var myDuration = new Duration(seconds: 5);
    return Timer(myDuration, route);
  }
}
