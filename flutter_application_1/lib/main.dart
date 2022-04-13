import 'package:flutter/material.dart';
void main(){
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
   int days =30;

    return MaterialApp(
      home: Material(
        child: Center(
          child: Container(
            child: Text("hello $days world"),
          ),
        ),
      ),
    );
  }
}
