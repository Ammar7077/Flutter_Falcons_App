import 'package:ffalconsproject/drawer.dart';
import 'package:flutter/material.dart';
import 'package:ffalconsproject/appColors.dart';

class SignUp extends StatelessWidget {

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
            prefixIcon: Icon(iconType,color: Colors.white,),
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
          onPressed: () {Navigator.of(context).pushReplacementNamed('signIn');},
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
                padding: EdgeInsets.only(top: height*0.2),
                child: Text("Sign up",
                  style: TextStyle(fontSize: height*0.07,fontWeight: FontWeight.w800,color: Colors.white),
                ),
              ),
              fillFunc(Icons.person, "Full Name"),
              fillFunc(Icons.email, "Email"),
              fillFunc(Icons.email, "Re-enter your email"),
              fillFunc(Icons.lock, "Password"),
              //-----------------------------------------------btn--
              Container(
                padding: EdgeInsets.only(right: width*0.1,top: height*0.03),
                child: ButtonBar(
                  children: [
                    btn("Create", AppColors().myYellow),
                    SizedBox(height: height*0.03),
                    btn("Back",Colors.white38),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
