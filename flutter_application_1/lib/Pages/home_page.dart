// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/drawer.dart';


class Homepage extends StatelessWidget {
  const Homepage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int days =30;
    return Scaffold(
      appBar: AppBar(
        title: Text("First App"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
           child: Text("hello $days world"),
        ),
      ),
     drawer: MyDrawer(),
    );
  }
}