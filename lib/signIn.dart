import 'package:ffalconsproject/drawer.dart';
import 'package:ffalconsproject/home.dart';
import 'package:flutter/material.dart';
import 'package:ffalconsproject/appColors.dart';

class SignIn extends StatelessWidget {

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
    SizedBox btnLogin(title,btnColor){
      return SizedBox(
        width: width * 0.77,
        child: ElevatedButton(
          onPressed: () {Navigator.of(context).pushReplacementNamed('homePage');},
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
    SizedBox btnCreateAccount(title,btnColor){
      return SizedBox(
        width: width * 0.77,
        child: ElevatedButton(
          onPressed: () {Navigator.of(context).pushReplacementNamed('signUp');},
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
                padding: EdgeInsets.only(top: height*0.07),
                child: Image.asset("Images/logo.png",width: width*0.2,height: height*0.2,),
              ),
              Container(
                child: Text("Sign in",
                  style: TextStyle(fontSize: height*0.07,fontWeight: FontWeight.w800,color: Colors.white),
                ),
              ),
              fillFunc(Icons.email, "Email"),
              fillFunc(Icons.lock, "Password"),
              //-----------------------------------------------btn--
              Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.only(right: height*0.08),
                child: TextButton(
                  onPressed: (){Navigator.of(context).pushReplacementNamed('resetPassword');},
                  child: Text("Forget Password?",style: TextStyle(color: Colors.white),),
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: width*0.1,top: height*0.009),
                child: ButtonBar(
                  children: [
                    btnLogin("Login", AppColors().myYellow),
                    SizedBox(height: height*0.03,),
                    btnCreateAccount("Create new account", Colors.white38),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: height*0.03),
                child: Text("Login With",style: TextStyle(fontSize: height*0.023,fontWeight: FontWeight.w800,color: Colors.white)),
              ),
              Container(
                padding: EdgeInsets.only(left: width*0.4),
                child: Row(
                  children: [
                    Image.asset("Images/facebook.png",height: height*0.09,width: width*0.09,color: Colors.grey,),
                    Container(
                      padding: EdgeInsets.only(left: width*0.02),
                      child: Image.asset("Images/google.png",height: height*0.09,width: width*0.09,color: Colors.grey,)
                    ),
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
