//ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/home_page.dart';
import 'package:flutter_application_1/Pages/login_page.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'package:flutter_application_1/widgets/themes.dart';
import 'package:google_fonts/google_fonts.dart';


void main(){
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
   

    return MaterialApp(
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context) ,
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false, //to remove debug banner
      initialRoute: "/login",
      routes: {
        "/":(context) => LoginPage(),
         MyRoutes.homeRoute:(context) => Homepage(),
         MyRoutes.loginRoute:(context) => LoginPage(),
      },
    );
  }
}
