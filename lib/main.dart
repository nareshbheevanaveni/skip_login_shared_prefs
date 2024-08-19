import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skip_login_shared_pref/home_page.dart';
import 'package:skip_login_shared_pref/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});


  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  static const String KEYLOGIN = 'login';

  @override

  void initState() {
    // TODO: implement initState
    super.initState();
    whereToGo();

  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FlutterLogo(size: 100,),
      ),
    );
  }

  void whereToGo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var isLoggedIn =  prefs.getBool(KEYLOGIN);

   Timer(Duration(seconds: 4), (){
     if(isLoggedIn!= null){
       if(isLoggedIn){
         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),));
       }
       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage(),));
     }
     else{
       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage(),));
     }

   });



  }




}


