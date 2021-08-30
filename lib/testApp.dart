import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert' as convert;

class TestApp extends StatefulWidget {
  const TestApp({Key? key}) : super(key: key);

  @override
  _TestAppState createState() => _TestAppState();
}

class _TestAppState extends State<TestApp> {
  var link = "https://jsonplaceholder.typicode.com/posts";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test"),
      ),
      body: Container(
        child: Container(child: Text("aaaaaaa"),  ),
      ),
    );
  }
}
