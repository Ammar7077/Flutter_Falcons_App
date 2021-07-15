import 'package:ffalconsproject/appColors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    String personLogo =
        "https://mk0anatomieunes58h83.kinstacdn.com/wp-content/themes/cera/assets/images/avatars/user-avatar.png";
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            AppColors().backgroundFirst,
            AppColors().backgroundEnd,
          ]),
        ),
        // width: width*0.65,
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              margin: EdgeInsets.zero,
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
              accountName: Container(
                margin: EdgeInsets.only(left: 90, bottom: 30),
                alignment: Alignment.centerLeft,
                child: Text(
                  "Ammar Omari",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              accountEmail: Container(
                margin: EdgeInsets.only(right: 50, bottom: 30),
                alignment: Alignment.centerRight,
                child: Text(
                  "Cridit: 300\$",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(personLogo),
              ),
            ),
            Divider(
              color: Colors.white,
              height: 0,
            ),
            ListTile(
              leading: Icon(Icons.person, size: 32),
              title: Text(
                "Profile",
                style: TextStyle(color: Colors.white),
              ),
              onTap: (){},
            ),
            Divider(
              color: Colors.white,
              height: height*0.02,
            ),
            ListTile(
              leading: Icon(Icons.label_important),
              title: Text(
                "My Products",
                style: TextStyle(color: Colors.white),
              ),
              onTap: (){},
            ),
            Divider(
              color: Colors.white,
              height: height*0.02,
            ),
            ListTile(
              leading: Icon(Icons.account_balance_wallet_outlined),
              title: Text(
                "Wallet",
                style: TextStyle(color: Colors.white),
              ),
              onTap: (){},
            ),
            Divider(
              color: Colors.white,
              height: height*0.02,
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text(
                "Settings",
                style: TextStyle(color: Colors.white),
              ),
              onTap: (){},
            ),
            //------Log Out ----//
            Divider(
              color: Colors.white,
              height: height*0.02,
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text(
                "Log Out",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.of(context).pushReplacementNamed('signIn');
              },
            ),
            //------Log In ----//
          ],
        ),
      ),
    );
  }
}
