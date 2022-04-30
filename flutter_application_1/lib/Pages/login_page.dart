// ignore_for_file: prefer_const_constructors
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/routes.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("assets/images/undraw_heavy_box_agqi.png",
            fit: BoxFit.fill,
            ),
            SizedBox(height: 20.0,
            ),
      
            Text("Welcome",style: TextStyle(
             fontSize: 24,
             fontWeight: FontWeight.bold,
            ),
            ),
            
            SizedBox(height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 40.0,),//use .all for all direction
              child: Column(children: [
                TextFormField(
                decoration: InputDecoration(
                  hintText: "Enter Username",
                  labelText: "Username",
                ),
              ),
              TextFormField(
                obscureText: true, // to make * in pass word field
                decoration: InputDecoration(
                  hintText: "Enter Password",
                  labelText: "Password",
                ),
              ),
              SizedBox(height: 40.0,
              ),
              ElevatedButton(
                child: Text("   Login    "),
                
                style: TextButton.styleFrom(minimumSize: Size(140, 40)),
                onPressed: (){
                    Navigator.pushNamed(context, MyRoutes.homeRoute);
                },
                ),
              ],),
            )
          ],
        ),
      )
    );
  }
}