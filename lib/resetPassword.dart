import 'dart:async';

import 'package:ffalconsproject/drawer.dart';
import 'package:flutter/material.dart';
import 'package:ffalconsproject/appColors.dart';
import 'package:toast/toast.dart';


class ResetPassword extends StatefulWidget {
  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPassword> {
  final emailController = TextEditingController();
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

    Container fillFunc(iconType,title){
      return Container(
        padding: EdgeInsets.only(top: height*0.02),
        width: width * 0.77,
        child: TextField(
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white38,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(25),
            ),
            prefixIcon: Container(
              padding: EdgeInsets.only(left: width*0.03),child: Icon(iconType,color: Colors.white,),
            ),
            hintText: title,
            hintStyle: TextStyle(color: Colors.white60),
          ),
        ),
      );
    }
    SizedBox btn(title,btnColor){
      return SizedBox(
        width: width * 0.77,
        child: ElevatedButton(
          onPressed: () {
            if (emailController.text.isEmpty) {
              Toast.show("Invalid Data", context,
                  duration: 3, backgroundColor: Colors.white24);
              return;
            }
            if (!emailController.text.contains('@')) {
              Toast.show("Invalid Email", context,
                  duration: 3, backgroundColor: Colors.white24);
              return;
            }
            else {
              setState(() {
                circularProgress = true;
              });
              startTime();
              Navigator.of(context).pushReplacementNamed('signIn');
            }

          },
          child: Text(title,style: TextStyle(fontSize: height*0.023,fontWeight: FontWeight.w800),),
          style: ButtonStyle(
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            padding: MaterialStateProperty.all(EdgeInsets.all(height*0.02)),
            backgroundColor: MaterialStateProperty.all(btnColor),
          ),
        ),
      );
    }

    return Scaffold(
      body: Container(
        height: height,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            AppColors().backgroundFirst,
            AppColors().backgroundEnd,
          ]),
        ),
        child: 
            Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(top: height*0.1),
                        child: Text("Reset Password",
                          style: TextStyle(fontSize: height*0.05,fontWeight: FontWeight.w800,color: Colors.white),
                        ),
                      ),
                      fillFunc(Icons.email, "Email"),
                      //-----------------------------------------------btn--
                      Container(
                        padding: EdgeInsets.only(right: width*0.1,top: height*0.03),
                        child: ButtonBar(
                          children: [
                            btn("Send reset link", AppColors().myYellow),
                            SizedBox(height: height*0.01),
                            SizedBox(
                              width: width * 0.77,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pushReplacementNamed('signIn');
                                },
                                child: Text("Back",style: TextStyle(fontSize: height*0.023,fontWeight: FontWeight.w800),),
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  padding: MaterialStateProperty.all(EdgeInsets.all(height*0.02)),
                                  backgroundColor: MaterialStateProperty.all(Colors.white38),
                                ),
                              ),
                            ),
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
      ),
    );
  }
  route() {}

  startTime() {
    var myDuration = new Duration(seconds: 5);
    return Timer(myDuration, route);
  }

}
