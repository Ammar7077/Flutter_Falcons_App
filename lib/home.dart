import 'package:ffalconsproject/drawer.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    //-----------Fun 1 --------------//
    Container funHorizontal(img, title, price) {
      return Container(
        width: width * 0.4,
        child: Column(
          children: [
            ListTile(
              onTap: (){},
              title: Image.asset(
                img,
                height: height * 0.18,
                fit: BoxFit.fitHeight,
              ),
              subtitle: Container(
                padding: EdgeInsets.symmetric(vertical: height * 0.014),
                child: Text(
                  title,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(
              height: height * 0.008,
            ),
            Container(
              // height: height*0.02,
              width: width*0.2,
              padding: EdgeInsets.all(3),
              margin: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(11),
              ),
              child: Center(
                child: Text(
                  price+"\$",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      );
    }
    //-----------Fun 2 --------------//
    InkWell funGVInkWell(img, title, type, price) {
      return InkWell(
        onTap: (){},
        child: GridTile(
          child: Container(
            margin: EdgeInsets.all(5),
            child: Column(
              children: <Widget>[
                Container(
                  height: height * 0.2,
                  child: Image.asset(
                    img,
                    alignment: Alignment.center,
                    fit: BoxFit.scaleDown,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      title,
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    Text(
                      type,
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.015,
                ),
                Container(
                  width: width * 0.1,
                  padding: EdgeInsets.all(3),
                  margin: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(11),
                  ),
                  child: Text(
                    price+"\$",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    //######################################//
    return Scaffold(
      // AppBar
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.orange,
            ),
          ),
        ],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'Images/logo.png',
              fit: BoxFit.contain,
              height: height*0.05,
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: Text(
                'X Store',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
      // Drawer
      drawer: MyDrawer(),
      //-------------BODY--------------//
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: height * 0.02,
          ),
          Center(
            child: Container(
              width: width * 0.77,
              child: TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.black12,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white, width: 0.0),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  prefixIcon: Icon(Icons.search),
                  hintText: "Search for any product",
                  hintStyle: TextStyle(color: Colors.black38),
                ),
              ),
            ),
          ),
          SizedBox(height: height * 0.02),
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Electronics",
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.w800),
            ),
          ),
          SizedBox(
            height: height * 0.05,
          ),
          Container(
            height: height * 0.35,
            width: double.infinity,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                funHorizontal('Images/1.png', "IPhone 11 Pro", "99999"),
                funHorizontal('Images/2.png', "Airpods 2", "149"),
                funHorizontal('Images/3.png', "JBL Flip 4", "90"),
                funHorizontal('Images/4.png', "Swatch", "100"),
                funHorizontal('Images/5.png', "GPU RTX", "900"),
              ],
            ),
          ),
          SizedBox(
            height: height * 0.02,
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Women's Jewelry",
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.w800),
            ),
          ),
          Container(
            height: height * 0.6,
            child: GridView(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              children: <Widget>[
                //Necklace,Ring,
                funGVInkWell("Images/6.png", "ORRA Diamond", "Necklace", "150"),
                funGVInkWell(
                    "Images/7.png", "Marquise Gold", "Necklace", "300"),
                funGVInkWell("Images/8.png", "Gold", "Ring", "200"),
                funGVInkWell("Images/9.png", "Heart Silver", "Necklace", "140"),
                funGVInkWell("Images/10.png", "Silver", "Ring", "190"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ----------- for errors i think ------------ //
  State<StatefulWidget> createState() {
    throw UnimplementedError();
  }
}
