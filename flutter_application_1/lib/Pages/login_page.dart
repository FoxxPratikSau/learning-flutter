// ignore_for_file: prefer_const_constructors
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/routes.dart';
// ctrl+space to see properties

class LoginPage extends StatefulWidget  {
  const LoginPage({ Key? key }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
//String name="";
bool changeButton = false;
final _formKey = GlobalKey<FormState>();
moveToHome(BuildContext context)async{
   // if (_formKey.currentState!.validate()){
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
                          //async.....await
                          //to delay for animation to complete
      await Navigator.pushNamed(context, MyRoutes.homeRoute); 
                          //used await here to make ux better then 
                          //comming back from home screen make the button loginable again
      setState(() {
        changeButton=false;
      });
   // }
 
}

  @override
  Widget build(BuildContext context) {
    return Material(  
      
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          child: Column(
            children: [
              Image.asset("assets/images/undraw_heavy_box_agqi.png",
              fit: BoxFit.fill,
              ),
              SizedBox(height: 20.0,  //sized box for giving gaps
              ),
              
              Text("Welcome ",
               style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                ),
              ),
              
              SizedBox(height: 20.0,  //sized box for giving gaps
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 50.0,),//use .all for all direction
                child: Column(children: [
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter Email id",
                      labelText: "email",
                    ),
                    //  validator: (email) {
                    //   if (isEmailValid(email)) return null;
                    //   else
                    //     return 'Enter a valid email address';
                    // },
                    onChanged: (value){
                      //name = value;
                      setState(() {
                        //calls build method as usually, while converting from stateless 
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
                    maxLength: 6,
                    // validator: (password) {
                    //     if (isPasswordValid(password)) return null;
                    //     else
                    //       return 'Enter a valid password';
                    //   },
                  ),
                  SizedBox(
                    height: 40.0,
                  ),

                  //BUtton
                  Material( //gave ancestor of material, while giving ancestor avoid giving decoration side child
                    color: Colors.deepPurple,
                          //shape: changeButton ? BoxShape.circle : BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(changeButton?50:8), //to get ripple effect in material
                    child: InkWell(
                      onTap: ()=>moveToHome(context),
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
                        // decoration: BoxDecoration(
                          // color: Colors.deepPurple,
                          // //shape: changeButton ? BoxShape.circle : BoxShape.rectangle,
                          // borderRadius: BorderRadius.circular(changeButton?50:8),
                        // ),
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
        ),
      )
    );
  }
}
// mixin InputValidationMixin {
//   bool isPasswordValid(String password) => password.length == 6;

//   bool isEmailValid(String email) {
//     Pattern pattern =
//       r '^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
//     RegExp regex = new RegExp(pattern);
//     return regex.hasMatch(email);
//   }
// }