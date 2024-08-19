import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:skip_login_shared_pref/login_page.dart';

import 'main.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [
         IconButton(onPressed: ()async {
           SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.remove(SplashScreenState.KEYLOGIN);
          
           Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage(),));

         }, icon: Icon(Icons.logout))
        ],
      ),
      body: Center(
        child: Text('Home Page'),
      ),
    );
  }
}
