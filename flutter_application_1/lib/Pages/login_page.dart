// ignore_for_file: prefer_const_constructors
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/routes.dart';
// ctrl+space to see properties
class LoginPage extends StatefulWidget {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
String name="";
bool changeButton = false;

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
      
            Text("Welcome $name",
             style: TextStyle(
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
                  onChanged: (value){
                    name = value;
                    setState(() {
                      //calls build method as usually while converting from stateless 
                      //to stateful widget 
                      //it does not calls build method but all the ui is in build method
                    });
                  },
                ),
                TextFormField(
                  obscureText: true, // to make * in pass word field
                  decoration: InputDecoration(
                    hintText: "Enter Password",
                    labelText: "Password",
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                InkWell(
                  onTap: ()async{
                    setState(() {
                      changeButton = true;
                    });
                    await Future.delayed(Duration(seconds: 1));
                    //async.....await
                    //to delay for animation to complete
                    Navigator.pushNamed(context, MyRoutes.homeRoute);
                  },
                  child: AnimatedContainer(
                    duration: Duration(seconds: 1 ),
                    width: changeButton ? 50:150,
                    height: 50,
                    alignment:Alignment.center ,
                    child: changeButton 
                      ? Icon(
                        Icons.done,
                        color: Colors.white,
                      ) 
                      :Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                          
                      ),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      //shape: changeButton ? BoxShape.circle : BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(changeButton?50:8),
                    ),
                  ),
                )


              // ElevatedButton(
              //   child: Text("   Login    "),
                
              //   style: TextButton.styleFrom(minimumSize: Size(140, 40)),
              //   onPressed: (){
              //       Navigator.pushNamed(context, MyRoutes.homeRoute);
              //   },
              //   ),
              ],),
            )
          ],
        ),
      )
    );
  }
}